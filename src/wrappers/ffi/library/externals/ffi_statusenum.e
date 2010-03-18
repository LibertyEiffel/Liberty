-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FFI_STATUSENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ok_low_level)  or else
				(a_value = bad__abi_low_level) )
		end

feature -- Setters
	default_create,
	set_ok is
		do
			value := ok_low_level
		end

	set_bad__abi is
		do
			value := bad__abi_low_level
		end

feature -- Queries
	is_ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	is_bad__abi: BOOLEAN is
		do
			Result := (value=bad__abi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_OK"
 			}"
 		end

	bad__abi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FFI_BAD_ABI"
 			}"
 		end


end -- class FFI_STATUSENUM
