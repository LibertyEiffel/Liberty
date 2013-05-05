-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FFI_ABI_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = ffi_default_abi_low_level)  or else
				(a_value = ffi_first_abi_low_level)  or else
				(a_value = ffi_last_abi_low_level)  or else
				(a_value = ffi_sysv_low_level)  or else
				(a_value = ffi_unix64_low_level) )
		end

feature -- Setters
	default_create,
	set_ffi_default_abi is
		do
			value := ffi_default_abi_low_level
		end

	set_ffi_first_abi is
		do
			value := ffi_first_abi_low_level
		end

	set_ffi_last_abi is
		do
			value := ffi_last_abi_low_level
		end

	set_ffi_sysv is
		do
			value := ffi_sysv_low_level
		end

	set_ffi_unix64 is
		do
			value := ffi_unix64_low_level
		end

feature -- Queries
	is_ffi_default_abi: BOOLEAN is
		do
			Result := (value=ffi_default_abi_low_level)
		end

	is_ffi_first_abi: BOOLEAN is
		do
			Result := (value=ffi_first_abi_low_level)
		end

	is_ffi_last_abi: BOOLEAN is
		do
			Result := (value=ffi_last_abi_low_level)
		end

	is_ffi_sysv: BOOLEAN is
		do
			Result := (value=ffi_sysv_low_level)
		end

	is_ffi_unix64: BOOLEAN is
		do
			Result := (value=ffi_unix64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ffi_default_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_DEFAULT_ABI"
 			}"
 		end

	ffi_first_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_FIRST_ABI"
 			}"
 		end

	ffi_last_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_LAST_ABI"
 			}"
 		end

	ffi_sysv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_SYSV"
 			}"
 		end

	ffi_unix64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_UNIX64"
 			}"
 		end


end -- class FFI_ABI_ENUM
