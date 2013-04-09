#include <stdio.h>

/* Emits the text of an Eiffel class with some anchored declarations useful to deal with C code.
**
** Currently: long 
*/

int main (int argc, char **argv) {
printf( "deferred class C_TYPES\n"
"	-- Anchored declaration of fundamental C types that vary in size changing architecture.\n"
" \n"
"	-- The C programming language is a portable Assembler. Therefore it's\n"
"	-- fundamental types are bounded to the design of the underlying hardware. \n"
" \n"
"	-- In the previous century (oh, how old I feel being able to truefully write such a thing)\n"
"	-- Quite luckily most currently widespread architectures share the size size for most of the types. \n"
"\n"
"	-- When dealing with C libraries and their bindings/wrappers those \n"
"\n"
"feature \n"
"	long: INTEGER_%d is\n"
"		-- A query with the same type of C 'long int'. Useful when dealing with\n"
"		-- code that uses long int variable: just insert this class and mark\n"
"		-- the type as 'like long'\n"
"	do\n"
"		-- Empty by design\n"
"	end\n"
"end\n", sizeof(long)*8);
}	
