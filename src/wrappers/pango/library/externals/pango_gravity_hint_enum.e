-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_GRAVITY_HINT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = natural_low_level)  or else
				(a_value = strong_low_level)  or else
				(a_value = line_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_natural is
		do
			value := natural_low_level
		end

	set_strong is
		do
			value := strong_low_level
		end

	set_line is
		do
			value := line_low_level
		end

feature {ANY} -- Queries
	is_natural: BOOLEAN is
		do
			Result := (value=natural_low_level)
		end

	is_strong: BOOLEAN is
		do
			Result := (value=strong_low_level)
		end

	is_line: BOOLEAN is
		do
			Result := (value=line_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	natural_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_NATURAL"
 			}"
 		end

	strong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_STRONG"
 			}"
 		end

	line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_LINE"
 			}"
 		end


end -- class PANGO_GRAVITY_HINT_ENUM
