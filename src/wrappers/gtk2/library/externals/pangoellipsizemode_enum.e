-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOELLIPSIZEMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_ellipsize_end_low_level)  or else
				(a_value = pango_ellipsize_middle_low_level)  or else
				(a_value = pango_ellipsize_none_low_level)  or else
				(a_value = pango_ellipsize_start_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_ellipsize_end is
		do
			value := pango_ellipsize_end_low_level
		end

	set_pango_ellipsize_middle is
		do
			value := pango_ellipsize_middle_low_level
		end

	set_pango_ellipsize_none is
		do
			value := pango_ellipsize_none_low_level
		end

	set_pango_ellipsize_start is
		do
			value := pango_ellipsize_start_low_level
		end

feature {ANY} -- Queries
	is_pango_ellipsize_end: BOOLEAN is
		do
			Result := (value=pango_ellipsize_end_low_level)
		end

	is_pango_ellipsize_middle: BOOLEAN is
		do
			Result := (value=pango_ellipsize_middle_low_level)
		end

	is_pango_ellipsize_none: BOOLEAN is
		do
			Result := (value=pango_ellipsize_none_low_level)
		end

	is_pango_ellipsize_start: BOOLEAN is
		do
			Result := (value=pango_ellipsize_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_ellipsize_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ELLIPSIZE_END"
 			}"
 		end

	pango_ellipsize_middle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ELLIPSIZE_MIDDLE"
 			}"
 		end

	pango_ellipsize_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ELLIPSIZE_NONE"
 			}"
 		end

	pango_ellipsize_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ELLIPSIZE_START"
 			}"
 		end


end -- class PANGOELLIPSIZEMODE_ENUM
