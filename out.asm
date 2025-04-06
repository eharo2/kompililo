; NASM output
bits 64
section .text
    global _main
_main:
    mov rax, 11
    push rax
    mov rax, 12
    push rax
    mov rax, 13
    push rax
    push QWORD [rsp + 0]

    mov rax, 0x2000001
    pop rdi
    syscall


; nasm -f macho64 ./out.asm
; ld out.o -o out -demangle -dynamic -macos_version_min 11.0 -L/usr/local/lib -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -lSystem -no_pie