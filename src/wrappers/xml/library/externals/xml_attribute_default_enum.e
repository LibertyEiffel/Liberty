-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ATTRIBUTE_DEFAULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = required_low_level)  or else
				(a_value = implied_low_level)  or else
				(a_value = fixed_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_required is
		do
			value := required_low_level
		end

	set_implied is
		do
			value := implied_low_level
		end

	set_fixed is
		do
			value := fixed_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	required: BOOLEAN is
		do
			Result := (value=required_low_level)
		end

	implied: BOOLEAN is
		do
			Result := (value=implied_low_level)
		end

	fixed: BOOLEAN is
		do
			Result := (value=fixed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_NONE"
 			}"
 		end

	required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_REQUIRED"
 			}"
 		end

	implied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_IMPLIED"
 			}"
 		end

	fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ATTRIBUTE_FIXED"
 			}"
 		end


end -- class XML_ATTRIBUTE_DEFAULT_ENUM
