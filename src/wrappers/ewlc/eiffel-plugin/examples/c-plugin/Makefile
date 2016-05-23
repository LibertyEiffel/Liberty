## It's an ugly makefile

test: test.e cplugin.so
	compile test.e -o test

cplugin.so:  c-plugin.o
	gcc -shared -Wl,-soname,cplugin.so -o cplugin.so c-plugin.o

c-plugin.o: c-plugin.c
	 gcc -c c-plugin.c -o c-plugin.o

.PHONY: clean 
clean:
	rm c-plugin.o cplugin.so test
