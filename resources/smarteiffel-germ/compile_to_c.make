# Beginning of parallelizable section
gcc -pipe -Os -c -x c compile_to_c.c
# End of parallelizable section
gcc -pipe -Os -o compile_to_c compile_to_c.o -x none
strip compile_to_c
