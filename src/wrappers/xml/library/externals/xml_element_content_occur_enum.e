-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_CONTENT_OCCUR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = once_external_low_level)  or else
				(a_value = opt_low_level)  or else
				(a_value = mult_low_level)  or else
				(a_value = plus_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_once_external is
		do
			value := once_external_low_level
		end

	set_opt is
		do
			value := opt_low_level
		end

	set_mult is
		do
			value := mult_low_level
		end

	set_plus is
		do
			value := plus_low_level
		end

feature {ANY} -- Queries
	once_external: BOOLEAN is
		do
			Result := (value=once_external_low_level)
		end

	opt: BOOLEAN is
		do
			Result := (value=opt_low_level)
		end

	mult: BOOLEAN is
		do
			Result := (value=mult_low_level)
		end

	plus: BOOLEAN is
		do
			Result := (value=plus_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	once_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ONCE"
 			}"
 		end

	opt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OPT"
 			}"
 		end

	mult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_MULT"
 			}"
 		end

	plus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PLUS"
 			}"
 		end


end -- class XML_ELEMENT_CONTENT_OCCUR_ENUM
