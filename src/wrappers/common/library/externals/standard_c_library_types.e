-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STANDARD_C_LIBRARY_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
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

	off64_t: INTEGER_64 is
		-- typedef off64_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	error_t: INTEGER_32 is
		-- typedef error_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	size_t: NATURAL_64 is
		-- typedef size_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ssize_t: INTEGER_64 is
		-- typedef ssize_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clock_t: INTEGER_64 is
		-- typedef clock_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	time_t: INTEGER_64 is
		-- typedef time_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	off_t: INTEGER_64 is
		-- typedef off_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clockid_t: INTEGER_32 is
		-- typedef clockid_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
