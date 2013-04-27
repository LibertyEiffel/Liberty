-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class POSIX_TYPES


insert ANY undefine is_equal, copy end

<<<<<<< HEAD
feature -- C type definitions (typedefs)
	in_port_t: like uint16_t is
=======
feature {ANY} -- C type definitions (typedefs)
	in_port_t: NATURAL_16 is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
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
