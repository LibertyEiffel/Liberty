-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
	in_port_t: NATURAL_16 is
		-- typedef in_port_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	in_addr_t: NATURAL_32 is
		-- typedef in_addr_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
