-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_TYPE_VAL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = undefined_low_level)  or else
				(a_value = empty_low_level)  or else
				(a_value = any_low_level)  or else
				(a_value = mixed_low_level)  or else
				(a_value = element_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_undefined is
		do
			value := undefined_low_level
		end

	set_empty is
		do
			value := empty_low_level
		end

	set_any is
		do
			value := any_low_level
		end

	set_mixed is
		do
			value := mixed_low_level
		end

	set_element is
		do
			value := element_low_level
		end

feature {ANY} -- Queries
	undefined: BOOLEAN is
		do
			Result := (value=undefined_low_level)
		end

	empty: BOOLEAN is
		do
			Result := (value=empty_low_level)
		end

	any: BOOLEAN is
		do
			Result := (value=any_low_level)
		end

	mixed: BOOLEAN is
		do
			Result := (value=mixed_low_level)
		end

	element: BOOLEAN is
		do
			Result := (value=element_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	undefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_UNDEFINED"
 			}"
 		end

	empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_EMPTY"
 			}"
 		end

	any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_ANY"
 			}"
 		end

	mixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_MIXED"
 			}"
 		end

	element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_TYPE_ELEMENT"
 			}"
 		end


end -- class XML_ELEMENT_TYPE_VAL_ENUM
