# Beginning of parallelizable section
g++ -pipe -Os -c -x c test_overload01.c
# End of parallelizable section
g++ -pipe -Os -o test_overload01.exe test_overload01.o -x "c++" test_overload01_external_cpp.cpp -x none
strip test_overload01.exe
