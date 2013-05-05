-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FFI_STATUS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = ffi_bad_abi_low_level)  or else
				(a_value = ffi_bad_typedef_low_level)  or else
				(a_value = ffi_ok_low_level) )
		end

feature -- Setters
	default_create,
	set_ffi_bad_abi is
		do
			value := ffi_bad_abi_low_level
		end

	set_ffi_bad_typedef is
		do
			value := ffi_bad_typedef_low_level
		end

	set_ffi_ok is
		do
			value := ffi_ok_low_level
		end

feature -- Queries
	is_ffi_bad_abi: BOOLEAN is
		do
			Result := (value=ffi_bad_abi_low_level)
		end

	is_ffi_bad_typedef: BOOLEAN is
		do
			Result := (value=ffi_bad_typedef_low_level)
		end

	is_ffi_ok: BOOLEAN is
		do
			Result := (value=ffi_ok_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ffi_bad_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_BAD_ABI"
 			}"
 		end

	ffi_bad_typedef_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_BAD_TYPEDEF"
 			}"
 		end

	ffi_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_OK"
 			}"
 		end


end -- class FFI_STATUS_ENUM
