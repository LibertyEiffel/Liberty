-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STANDARD_C_LIBRARY_TYPES


insert ANY undefine is_equal, copy end

<<<<<<< HEAD
feature -- C type definitions (typedefs)
feature -- variable-size types
	long: INTEGER_64 is
		-- a query with the same type of c 'long int'. useful when dealing with
		-- code that uses long int variable: just insert this class and mark
		-- the type as 'like long'
	do
		-- empty by design
	end

   long_unsigned: NATURAL_64 is
		-- a query with the same type of c 'long unsigned int'. useful when dealing with
		-- code that uses long int variable: just insert this class and mark
		-- the type as 'like long_unsigned'
	do
		-- empty by design
	end

feature -- Memory related type definitions
	size_t: NATURAL_64 is do end

   ssize_t: INTEGER_64 is do end

	ptrdiff_t: INTEGER_64 is do end

feature -- Standard C type definitions
	-- All those queries are empty by design, meant to be used as anchored declarations

	-- Exact-width integer types
	-- Integer types having exactly the specified width 
	int8_t: INTEGER_8 is do end
	uint8_t: NATURAL_8 is do end
	int16_t: INTEGER_16 is do end
	uint16_t: NATURAL_16 is do end
	int32_t: INTEGER_32 is do end
	uint32_t: NATURAL_32 is do end
	int64_t: INTEGER_64 is do end
	uint64_t: NATURAL_64 is do end

	-- Integer types capable of holding object pointers
	-- These allow you to declare variables of the same size as a pointer.
	intptr_t: INTEGER_64 is do end
	uintptr_t: NATURAL_64 is do end

	-- Minimum-width integer types
	-- Integer types having at least the specified width
	int_least8_t: INTEGER_8 is do end
	uint_least8_t: NATURAL_8 is do end
	int_least16_t: INTEGER_16 is do end
	uint_least16_t: NATURAL_16 is do end
	int_least32_t: INTEGER_32 is do end
	uint_least32_t: NATURAL_32 is do end
	int_least64_t: INTEGER_64 is do end
	uint_least64_t: NATURAL_64 is do end

	-- Fastest minimum-width integer types
	-- Integer types being usually fastest having at least the specified width
	int_fast8_t: INTEGER_8 is do end
	uint_fast8_t: NATURAL_8 is do end
	int_fast16_t: INTEGER_64 is do end
	uint_fast16_t: NATURAL_64 is do end
	int_fast32_t: INTEGER_64 is do end
	uint_fast32_t: NATURAL_64 is do end
	int_fast64_t: INTEGER_64 is do end
	uint_fast64_t: NATURAL_64 is do end

	-- Greatest-width integer types
	-- Types designating integer data capable of representing any value of any integer type in the corresponding signed or unsigned category
	intmax_t: INTEGER_64 is do end
	uintmax_t: NATURAL_64 is do end

feature -- C type definitions (typedefs)
=======
feature {ANY} -- C type definitions (typedefs)
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
	timer_t: POINTER is
		-- typedef timer_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	comparison_fn_t: POINTER is
		-- typedef comparison_fn_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	off64_t: like long is
		-- typedef off64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	error_t: INTEGER is
		-- typedef error_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	size_t: like size_t is
		-- typedef size_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ssize_t: like ssize_t is
		-- typedef ssize_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clock_t: like long is
		-- typedef clock_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	time_t: like long is
		-- typedef time_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	off_t: like long is
		-- typedef off_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clockid_t: INTEGER is
		-- typedef clockid_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
