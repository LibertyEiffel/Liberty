-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

feature -- C type definitions (typedefs)
	in_port_t: like uint16_t is
		-- typedef in_port_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	in_addr_t: like uint32_t is
		-- typedef in_addr_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
