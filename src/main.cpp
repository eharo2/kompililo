#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <unistd.h>
#include <optional>
#include <vector>
#include <cstdlib>

#include "./generator.hpp"

using namespace std;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Malĝusta uzo... $ paskualo <dosiero.pk>" << std::endl;
        return 1; // EXIT_FAILURE;
    }
    char cwd[PATH_MAX];
    if (getcwd(cwd, sizeof(cwd)) == nullptr) {
        std::cerr << "getcwd() eraro" << std::endl;
        return 1;
    }
    // std::cout << "cwd: " << cwd << std::endl;

    std::string contents; {
        std::stringstream contents_stream;
        std:fstream input(argv[1], std::ios::in);
        contents_stream << input.rdbuf();
        contents = contents_stream.str();
    }
    // std::cout << "Kontenido: " << contents << std::endl;

    Tokenizer tokenizer(std::move(contents));
    std::vector<Token> tokens = tokenizer.tokenize();

    Parser parser(std::move(tokens));
    std::optional<node::NodeProg> prog = parser.parse_prog();

    if (!prog.has_value()) {
        std::cout << "Nevalida programo" << std::endl;
        exit(EXIT_FAILURE);
    }
    Generator generator(prog.value());
    {
        std::fstream file("./out.asm", std::ios::out);
        file << generator.gen_prog();
    }

    // system(nasm -f macho64 ./out.asm)
    // system(ld out.o -o out -demangle -dynamic -macos_version_min 11.0 -L/usr/local/lib -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -lSystem -no_pie)
    // system(rm out.o)
    return EXIT_SUCCESS;
}

// Compile with:
// cmake --build build ; cmake -S . -B build/