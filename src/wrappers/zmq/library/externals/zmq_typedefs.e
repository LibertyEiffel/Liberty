-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ZMQ_TYPEDEFS


inherit ANY undefine is_equal, copy end

feature -- C type definitions (typedefs)
	ptrdiff_t: INTEGER_32 is
		-- typedef ptrdiff_t
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

	error_t: INTEGER_32 is
		-- typedef error_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
