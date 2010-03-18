-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FFI_ABIENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = first__abi_low_level)  or else
				(a_value = unix_64_low_level)  or else
				(a_value = default__abi_low_level)  or else
				(a_value = last__abi_low_level) )
		end

feature -- Setters
	default_create,
	set_first__abi is
		do
			value := first__abi_low_level
		end

	set_unix_64 is
		do
			value := unix_64_low_level
		end

	set_default__abi is
		do
			value := default__abi_low_level
		end

	set_last__abi is
		do
			value := last__abi_low_level
		end

feature -- Queries
	is_first__abi: BOOLEAN is
		do
			Result := (value=first__abi_low_level)
		end

	is_unix_64: BOOLEAN is
		do
			Result := (value=unix_64_low_level)
		end

	is_default__abi: BOOLEAN is
		do
			Result := (value=default__abi_low_level)
		end

	is_last__abi: BOOLEAN is
		do
			Result := (value=last__abi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	first__abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_FIRST_ABI"
 			}"
 		end

	unix_64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_UNIX64"
 			}"
 		end

	default__abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_DEFAULT_ABI"
 			}"
 		end

	last__abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_LAST_ABI"
 			}"
 		end


end -- class FFI_ABIENUM
