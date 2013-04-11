-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
	ffi_sarg: INTEGER_64 is
		-- typedef ffi_sarg
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ffi_arg: NATURAL_64 is
		-- typedef ffi_arg
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	ffi_type: NATURAL_32 is
		-- typedef FFI_TYPE
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
