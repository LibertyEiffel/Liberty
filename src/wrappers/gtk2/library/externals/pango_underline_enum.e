-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_UNDERLINE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_underline_double_low_level)  or else
				(a_value = pango_underline_error_low_level)  or else
				(a_value = pango_underline_low_low_level)  or else
				(a_value = pango_underline_none_low_level)  or else
				(a_value = pango_underline_single_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_underline_double is
		do
			value := pango_underline_double_low_level
		end

	set_pango_underline_error is
		do
			value := pango_underline_error_low_level
		end

	set_pango_underline_low is
		do
			value := pango_underline_low_low_level
		end

	set_pango_underline_none is
		do
			value := pango_underline_none_low_level
		end

	set_pango_underline_single is
		do
			value := pango_underline_single_low_level
		end

feature -- Queries
	is_pango_underline_double: BOOLEAN is
		do
			Result := (value=pango_underline_double_low_level)
		end

	is_pango_underline_error: BOOLEAN is
		do
			Result := (value=pango_underline_error_low_level)
		end

	is_pango_underline_low: BOOLEAN is
		do
			Result := (value=pango_underline_low_low_level)
		end

	is_pango_underline_none: BOOLEAN is
		do
			Result := (value=pango_underline_none_low_level)
		end

	is_pango_underline_single: BOOLEAN is
		do
			Result := (value=pango_underline_single_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_underline_double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_UNDERLINE_DOUBLE"
 			}"
 		end

	pango_underline_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_UNDERLINE_ERROR"
 			}"
 		end

	pango_underline_low_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_UNDERLINE_LOW"
 			}"
 		end

	pango_underline_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_UNDERLINE_NONE"
 			}"
 		end

	pango_underline_single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_UNDERLINE_SINGLE"
 			}"
 		end


end -- class PANGO_UNDERLINE_ENUM
