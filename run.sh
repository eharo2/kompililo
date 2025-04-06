./build/kompililo ./dosiero.pk
nasm -f macho64 ./out.asm
ld out.o -o out -demangle -dynamic -macos_version_min 11.0 -L/usr/local/lib -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -lSystem -no_pie
./out
echo $?
