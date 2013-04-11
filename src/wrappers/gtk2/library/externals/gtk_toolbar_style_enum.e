-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOLBAR_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = icons_low_level)  or else
				(a_value = text_low_level)  or else
				(a_value = both_low_level)  or else
				(a_value = both_horiz_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_icons is
		do
			value := icons_low_level
		end

	set_text is
		do
			value := text_low_level
		end

	set_both is
		do
			value := both_low_level
		end

	set_both_horiz is
		do
			value := both_horiz_low_level
		end

feature {ANY} -- Queries
	icons: BOOLEAN is
		do
			Result := (value=icons_low_level)
		end

	text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	both: BOOLEAN is
		do
			Result := (value=both_low_level)
		end

	both_horiz: BOOLEAN is
		do
			Result := (value=both_horiz_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	icons_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_ICONS"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_TEXT"
 			}"
 		end

	both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_BOTH"
 			}"
 		end

	both_horiz_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_BOTH_HORIZ"
 			}"
 		end


end -- class GTK_TOOLBAR_STYLE_ENUM
