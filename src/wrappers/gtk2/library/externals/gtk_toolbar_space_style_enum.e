-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOLBAR_SPACE_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = empty_low_level)  or else
				(a_value = line_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_empty is
		do
			value := empty_low_level
		end

	set_line is
		do
			value := line_low_level
		end

feature {ANY} -- Queries
	empty: BOOLEAN is
		do
			Result := (value=empty_low_level)
		end

	line: BOOLEAN is
		do
			Result := (value=line_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_SPACE_EMPTY"
 			}"
 		end

	line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_SPACE_LINE"
 			}"
 		end


end -- class GTK_TOOLBAR_SPACE_STYLE_ENUM
