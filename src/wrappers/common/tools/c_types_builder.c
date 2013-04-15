#include <stdio.h>
#include <stdint.h>

/* Emits the text of an Eiffel class with some anchored declarations useful to deal with C code.
 **
 ** Currently: long 
 */

void emit_header() {
	printf( "deferred class C_TYPES\n"
			"	-- Anchored declaration of fundamental C types that vary in size changing architecture and for standardized typedefs.\n"
			" \n"
			"	-- The C programming language is almost a portable Assembler. Therefore it's\n"
			"	-- fundamental types are bounded to the design of the underlying hardware. \n"
			" \n"
			"	-- Quite luckily most currently widespread architectures share the size size for most of the types. \n"
			"   -- There are some notable exceptions thought; considering x86, x64 and ARM32 the following types\n"
			"   -- have different lengths:\n"
			"   --\n"
			"   -- - long int (also known as long),\n"
			"   -- - unsigned long int, (shortable to unsigned long),\n"
			"\n");
}

void emit_variable_sized_typedefs() {
	printf(
			"feature -- variable-size types\n"
			"	long: INTEGER_%u is\n"
			"		-- a query with the same type of c 'long int'. useful when dealing with\n"
			"		-- code that uses long int variable: just insert this class and mark\n"
			"		-- the type as 'like long'\n"
			"	do\n"
			"		-- empty by design\n"
			"	end\n"
			"\n"
			"   long_unsigned: NATURAL_%u is\n"
			"		-- a query with the same type of c 'long unsigned'. useful when dealing with\n"
			"		-- code that uses long int variable: just insert this class and mark\n"
			"		-- the type as 'like long_unsigned'\n"
			"	do\n"
			"		-- empty by design\n"
			"	end\n",
			/* the result of sizeof is cast into an unsigned. this is a no-op on 32 bit
			 * machines but is required on 64 bit cpus to avoid a warning that may stop
			 * the building process */
			(unsigned) sizeof(long)*8, (unsigned) sizeof(long unsigned)*8);
}

void emit_standard_typedefs() {
	printf("feature -- Standard C type definitions\n"
			"	-- Exact-width integer types\n"
			"	-- Integer types having exactly the specified width \n"
			"\n	int8_t: INTEGER_%d	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint8_t: NATURAL_%d is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int16_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint16_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int32_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint32_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int64_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint64_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n"
			"\n	-- Integer types capable of holding object pointers\n"
			"\n	-- These allow you to declare variables of the same size as a pointer.\n"
			"\n	intptr_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uintptr_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n"
			"\n	-- Minimum-width integer types\n"
			"\n	-- Integer types having at least the specified width\n"
			"\n	int_least8_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_least8_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_least16_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_least16_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_least32_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_least32_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_least64_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_least64_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n"
			"\n	-- Fastest minimum-width integer types\n"
			"\n	-- Integer types being usually fastest having at least the specified width\n"
			"\n	int_fast8_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_fast8_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_fast16_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_fast16_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_fast32_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_fast32_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	int_fast64_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uint_fast64_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n"
			"\n	-- Greatest-width integer types\n"
			"\n	-- Types designating integer data capable of representing any value of any integer type in the corresponding signed or unsigned category\n"
			"\n	intmax_t: INTEGER_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n"
			"\n	uintmax_t: NATURAL_%u	is\n		do \n		-- Empty by design, useful for anchored declarations\n	end\n",
		(unsigned) sizeof(int8_t)*8,
		(unsigned) sizeof(uint8_t)*8,
		(unsigned) sizeof(int16_t)*8,
		(unsigned) sizeof(uint16_t)*8,
		(unsigned) sizeof(int32_t)*8,
		(unsigned) sizeof(uint32_t)*8,
		(unsigned) sizeof(int64_t)*8,
		(unsigned) sizeof(uint64_t)*8,
		(unsigned) sizeof(intptr_t)*8,
		(unsigned) sizeof(uintptr_t)*8,
		(unsigned) sizeof(int_least8_t)*8,
		(unsigned) sizeof(uint_least8_t)*8,
		(unsigned) sizeof(int_least16_t)*8,
		(unsigned) sizeof(uint_least16_t)*8,
		(unsigned) sizeof(int_least32_t)*8,
		(unsigned) sizeof(uint_least32_t)*8,
		(unsigned) sizeof(int_least64_t)*8,
		(unsigned) sizeof(uint_least64_t)*8,
		(unsigned) sizeof(int_fast8_t)*8,
		(unsigned) sizeof(uint_fast8_t)*8,
		(unsigned) sizeof(int_fast16_t)*8,
		(unsigned) sizeof(uint_fast16_t)*8,
		(unsigned) sizeof(int_fast32_t)*8,
		(unsigned) sizeof(uint_fast32_t)*8,
		(unsigned) sizeof(int_fast64_t)*8,
		(unsigned) sizeof(uint_fast64_t)*8,
		(unsigned) sizeof(intmax_t)*8,
		(unsigned) sizeof(uintmax_t)*8
			);
}

void emit_footer() {
	printf("end -- class C_TYPES\n");
}
int main (int argc, char **argv) {
	emit_header();
	emit_variable_sized_typedefs();
	emit_standard_typedefs();
	emit_footer();
	return 0;
}	
