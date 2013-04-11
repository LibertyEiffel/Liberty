-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_EXPANDER_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = collapsed_low_level)  or else
				(a_value = semi_collapsed_low_level)  or else
				(a_value = semi_expanded_low_level)  or else
				(a_value = expanded_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_collapsed is
		do
			value := collapsed_low_level
		end

	set_semi_collapsed is
		do
			value := semi_collapsed_low_level
		end

	set_semi_expanded is
		do
			value := semi_expanded_low_level
		end

	set_expanded_external is
		do
			value := expanded_external_low_level
		end

feature {ANY} -- Queries
	collapsed: BOOLEAN is
		do
			Result := (value=collapsed_low_level)
		end

	semi_collapsed: BOOLEAN is
		do
			Result := (value=semi_collapsed_low_level)
		end

	semi_expanded: BOOLEAN is
		do
			Result := (value=semi_expanded_low_level)
		end

	expanded_external: BOOLEAN is
		do
			Result := (value=expanded_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	collapsed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_COLLAPSED"
 			}"
 		end

	semi_collapsed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_SEMI_COLLAPSED"
 			}"
 		end

	semi_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_SEMI_EXPANDED"
 			}"
 		end

	expanded_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_EXPANDER_EXPANDED"
 			}"
 		end


end -- class GTK_EXPANDER_STYLE_ENUM
