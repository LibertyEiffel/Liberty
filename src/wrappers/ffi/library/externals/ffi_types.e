-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_TYPES


insert ANY undefine is_equal, copy end

<<<<<<< HEAD
feature -- C type definitions (typedefs)
	ffi_sarg: like long is
=======
feature {ANY} -- C type definitions (typedefs)
	ffi_sarg: INTEGER_64 is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		-- typedef ffi_sarg
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ffi_arg: like long_unsigned is
		-- typedef ffi_arg
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ffi_type: NATURAL is
		-- typedef FFI_TYPE
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
