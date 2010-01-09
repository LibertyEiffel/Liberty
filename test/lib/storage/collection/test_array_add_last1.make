# Beginning of parallelizable section
gcc -pipe -c -x c test_array_add_last1.c
# End of parallelizable section
gcc -pipe -o test_array_add_last1.exe test_array_add_last1.o -x none
strip test_array_add_last1.exe
