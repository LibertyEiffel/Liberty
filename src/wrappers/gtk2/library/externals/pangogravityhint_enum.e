-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOGRAVITYHINT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_gravity_hint_line_low_level)  or else
				(a_value = pango_gravity_hint_natural_low_level)  or else
				(a_value = pango_gravity_hint_strong_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_gravity_hint_line is
		do
			value := pango_gravity_hint_line_low_level
		end

	set_pango_gravity_hint_natural is
		do
			value := pango_gravity_hint_natural_low_level
		end

	set_pango_gravity_hint_strong is
		do
			value := pango_gravity_hint_strong_low_level
		end

feature {ANY} -- Queries
	is_pango_gravity_hint_line: BOOLEAN is
		do
			Result := (value=pango_gravity_hint_line_low_level)
		end

	is_pango_gravity_hint_natural: BOOLEAN is
		do
			Result := (value=pango_gravity_hint_natural_low_level)
		end

	is_pango_gravity_hint_strong: BOOLEAN is
		do
			Result := (value=pango_gravity_hint_strong_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_gravity_hint_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_LINE"
 			}"
 		end

	pango_gravity_hint_natural_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_NATURAL"
 			}"
 		end

	pango_gravity_hint_strong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_HINT_STRONG"
 			}"
 		end


end -- class PANGOGRAVITYHINT_ENUM
