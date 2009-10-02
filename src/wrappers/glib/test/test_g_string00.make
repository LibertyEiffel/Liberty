# Beginning of parallelizable section
gcc -pipe -Os -c -x c test_g_string00.c
# End of parallelizable section
gcc -pipe -Os -o test_g_string00.exe test_g_string00.o -x none
strip test_g_string00.exe
