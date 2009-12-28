-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PARTENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = sign_low_level)  or else
				(a_value = value_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_symbol is
		do
			value := symbol_low_level
		end

	set_sign is
		do
			value := sign_low_level
		end

	set_value is
		do
			value := value_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_symbol: BOOLEAN is
		do
			Result := (value=symbol_low_level)
		end

	is_sign: BOOLEAN is
		do
			Result := (value=sign_low_level)
		end

	is_value: BOOLEAN is
		do
			Result := (value=value_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "none"
 			}"
 		end

	symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "symbol"
 			}"
 		end

	sign_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "sign"
 			}"
 		end

	value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "value"
 			}"
 		end


end -- class PARTENUM
