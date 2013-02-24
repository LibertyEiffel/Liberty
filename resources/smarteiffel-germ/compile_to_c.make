# Beginning of parallelizable section
gcc -pipe -Os -c -x c compile_to_c.c
# End of parallelizable section
gcc -pipe -Os compile_to_c.o -x none
strip a.out
