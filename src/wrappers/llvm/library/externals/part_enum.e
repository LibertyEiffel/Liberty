-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PART_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = space_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = sign_low_level)  or else
				(a_value = value_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_space is
		do
			value := space_low_level
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

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	space: BOOLEAN is
		do
			Result := (value=space_low_level)
		end

	symbol: BOOLEAN is
		do
			Result := (value=symbol_low_level)
		end

	sign: BOOLEAN is
		do
			Result := (value=sign_low_level)
		end

	value: BOOLEAN is
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

	space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "space"
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


end -- class PART_ENUM
