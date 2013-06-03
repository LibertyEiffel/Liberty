-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_TYPES


insert ANY undefine is_equal, copy end

	STANDARD_C_LIBRARY_TYPES

feature -- C type definitions (typedefs)
	ffi_sarg: like long is
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
