# Beginning of parallelizable section
gcc -pipe -O2 -fno-gcse -c -x c compile_to_c.c
# End of parallelizable section
gcc -pipe -O2 -fno-gcse compile_to_c.o -x none
strip a.out
