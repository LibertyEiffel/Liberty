-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class READLINE_TYPES


inherit ANY undefine is_equal, copy end

feature -- C type definitions (typedefs)
	keymap: POINTER is
		-- typedef Keymap
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	pid_t: INTEGER_32 is
		-- typedef pid_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	time_t: INTEGER_32 is
		-- typedef time_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	locale_t: POINTER is
		-- typedef locale_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	size_t: NATURAL_32 is
		-- typedef size_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	clock_t: INTEGER_32 is
		-- typedef clock_t
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

	histdata_t: POINTER is
		-- typedef histdata_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	va_list: POINTER is
		-- typedef va_list
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	timer_t: POINTER is
		-- typedef timer_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
