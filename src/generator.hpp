#pragma once

#include "parser.hpp"

class Generator {
public:
    inline Generator(node::NodeProg prog)
        : m_prog(std::move(prog)) {
    }
    
    void gen_expr(const node::NodeExpr& expr) {
        struct ExprVisitor {
            Generator* gen;
            ExprVisitor(Generator* gen)
                : gen(gen) {
                }
            void operator()(const node::NodeExprIntLit& expr_int_lit) {
                gen->m_output << "    mov rax, " << expr_int_lit.int_lit.value.value() << "\n";
                gen->push("rax");
            }
            void operator()(const node::NodeExprIdent& expr_ident) const {
                if(!gen->m_vars.contains(expr_ident.ident.value.value())) {
                    std::cerr << "Undeclared identifier: " << expr_ident.ident.value.value() << std::endl;
                    exit(EXIT_FAILURE);
                }
                const auto& var = gen->m_vars.at(expr_ident.ident.value.value());
                std::stringstream offset;
                offset << "QWORD [rsp + " << (gen->m_stack_size - var.stack_loc - 1) * 8 << "]\n";
                gen->push(offset.str());
            }
        };
        ExprVisitor visitor(this);
        std::visit(visitor, expr.var);
    }

    void gen_stmt(const node::NodeStmt& stmt) {
        struct StmtVisitor {
            Generator* gen;
            StmtVisitor(Generator* gen)
                : gen(gen) {
                }
            void operator()(const node::NodeStmtExit stmt_exit) const {
                gen->gen_expr(stmt_exit.expr);
                gen->m_output << "    mov rax, 0x2000001\n";
                gen->pop("rdi");
                gen->m_output << "    syscall\n";
                gen->didCallSyscall = true;
            }
            void operator()(const node::NodeStmtLet stmt_let) const {
                if (gen->m_vars.contains(stmt_let.ident.value.value())) {
                    std::cerr << "Identifier " << stmt_let.ident.value.value() << " already used" << std::endl;
                    exit(EXIT_FAILURE);
                }
                gen->m_vars.insert({ stmt_let.ident.value.value(), Var {.stack_loc = gen->m_stack_size }});
                gen->gen_expr(stmt_let.expr);
            }
        };
        StmtVisitor visitor(this);
        std::visit(visitor, stmt.var);
    }

    [[nodiscard]] std::string gen_prog() {
        m_output << "; NASM output\nbits 64\nsection .text\n    global _main\n_main:\n";

        for (const node::NodeStmt& stmt : m_prog.stmts) {
            gen_stmt(stmt);
        }

        if (!didCallSyscall) {
            m_output << "    mov rax, 0x2000001\n";
            m_output << "    mov rdi, 0\n";
            m_output << "    syscall";
            didCallSyscall = false;
        }

        m_output << "\n\n; nasm -f macho64 ./out.asm\n";
        m_output << "; ld out.o -o out -demangle -dynamic -macos_version_min 11.0 -L/usr/local/lib -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -lSystem -no_pie";
        return m_output.str();
    }
    
private:

    void push(const std::string& reg) {
        m_output << "    push " << reg << "\n";
        m_stack_size++;
    }

    void pop(const std::string& reg) {
        m_output << "    pop " << reg << "\n";
        m_stack_size--;
    }

    const node::NodeProg m_prog;
    std::stringstream m_output;
    bool didCallSyscall = false;
    size_t m_stack_size = 0;

    struct Var {
        size_t stack_loc;
    };

    std::unordered_map<std::string, Var> m_vars {};
};
