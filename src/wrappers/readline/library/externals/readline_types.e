-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class READLINE_TYPES


insert ANY undefine is_equal, copy end

<<<<<<< HEAD
feature -- C type definitions (typedefs)
	histdata_t: POINTER is
		-- typedef histdata_t
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	keymap: POINTER is
		-- typedef Keymap
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

=======
feature {ANY} -- C type definitions (typedefs)
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
end
