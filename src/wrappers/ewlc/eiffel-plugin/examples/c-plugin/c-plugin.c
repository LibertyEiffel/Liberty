#include <stdio.h>

do_stuff () {
	printf("c-plugin doing stuff.\n");
}

put_string (char *a_string) {
	printf("C-plugin put string %s\n",a_string);
}

add (int m) {
	printf("C plugin adding %d\n",m);
}

procedure (void *current, void (*symbol) (void *)) {
	printf("Current is %x, symbol %x\n",current,symbol);
}
