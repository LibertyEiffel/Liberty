-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FFI_ABI_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = default_abi_low_level)  or else
				(a_value = first_abi_low_level)  or else
				(a_value = last_abi_low_level)  or else
				(a_value = sysv_low_level)  or else
				(a_value = unix64_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_abi is
		do
			value := default_abi_low_level
		end

	set_first_abi is
		do
			value := first_abi_low_level
		end

	set_last_abi is
		do
			value := last_abi_low_level
		end

	set_sysv is
		do
			value := sysv_low_level
		end

	set_unix64 is
		do
			value := unix64_low_level
		end

feature {ANY} -- Queries
	is_default_abi: BOOLEAN is
		do
			Result := (value=default_abi_low_level)
		end

	is_first_abi: BOOLEAN is
		do
			Result := (value=first_abi_low_level)
		end

	is_last_abi: BOOLEAN is
		do
			Result := (value=last_abi_low_level)
		end

	is_sysv: BOOLEAN is
		do
			Result := (value=sysv_low_level)
		end

	is_unix64: BOOLEAN is
		do
			Result := (value=unix64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_DEFAULT_ABI"
 			}"
 		end

	first_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_FIRST_ABI"
 			}"
 		end

	last_abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_LAST_ABI"
 			}"
 		end

	sysv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_SYSV"
 			}"
 		end

	unix64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_UNIX64"
 			}"
 		end


end -- class FFI_ABI_ENUM
