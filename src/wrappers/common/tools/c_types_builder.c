#include <stdio.h>

/* Emits the text of an Eiffel class with some anchored declarations useful to deal with C code.
**
** Currently: long 
*/

int main (int argc, char **argv) {
printf( "deferred class C_TYPES\n"
"	-- Anchored declaration of fundamental C types that vary in size changing architecture.\n"
" \n"
"	-- The C programming language is almost a portable Assembler. Therefore it's\n"
"	-- fundamental types are bounded to the design of the underlying hardware. \n"
" \n"
"	-- In the previous century (oh, how old I feel being able to truefully write such a thing)\n"
"	-- Quite luckily most currently widespread architectures share the size size for most of the types. \n"
"   -- There are some notable exceptions thought; considering x86, x64 and ARM32 the following types\n"
"   -- have different lengths:\n"
"   --\n"
"   -- - long int (also known as long),\n"
"   -- - unsigned long int, (shortable to unsigned long),\n"
"   -- "
"\n"
"	-- When dealing with C libraries and their bindings/wrappers those \n"
"\n"
"feature -- Variable-size types\n"
"	long: INTEGER_%u is\n"
"		-- A query with the same type of C 'long int'. Useful when dealing with\n"
"		-- code that uses long int variable: just insert this class and mark\n"
"		-- the type as 'like long'\n"
"	do\n"
"		-- Empty by design\n"
"	end\n"
"\n"
"   long_unsigned: NATURAL_%u is\n"
"		-- A query with the same type of C 'long unsigned'. Useful when dealing with\n"
"		-- code that uses long int variable: just insert this class and mark\n"
"		-- the type as 'like long_unsigned'\n"
"	do\n"
"		-- Empty by design\n"
"	end\n"
"end\n",
    /* The result of sizeof is cast into an unsigned. This is a no-op on 32 bit
     * machines but is required on 64 bit CPUs to avoid a warning that may stop
     * the building */
    (unsigned) sizeof(long)*8, (unsigned) sizeof(long unsigned)*8);
    return 0;
}	
