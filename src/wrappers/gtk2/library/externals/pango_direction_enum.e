-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_DIRECTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_direction_ltr_low_level)  or else
				(a_value = pango_direction_neutral_low_level)  or else
				(a_value = pango_direction_rtl_low_level)  or else
				(a_value = pango_direction_ttb_ltr_low_level)  or else
				(a_value = pango_direction_ttb_rtl_low_level)  or else
				(a_value = pango_direction_weak_ltr_low_level)  or else
				(a_value = pango_direction_weak_rtl_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_direction_ltr is
		do
			value := pango_direction_ltr_low_level
		end

	set_pango_direction_neutral is
		do
			value := pango_direction_neutral_low_level
		end

	set_pango_direction_rtl is
		do
			value := pango_direction_rtl_low_level
		end

	set_pango_direction_ttb_ltr is
		do
			value := pango_direction_ttb_ltr_low_level
		end

	set_pango_direction_ttb_rtl is
		do
			value := pango_direction_ttb_rtl_low_level
		end

	set_pango_direction_weak_ltr is
		do
			value := pango_direction_weak_ltr_low_level
		end

	set_pango_direction_weak_rtl is
		do
			value := pango_direction_weak_rtl_low_level
		end

feature -- Queries
	is_pango_direction_ltr: BOOLEAN is
		do
			Result := (value=pango_direction_ltr_low_level)
		end

	is_pango_direction_neutral: BOOLEAN is
		do
			Result := (value=pango_direction_neutral_low_level)
		end

	is_pango_direction_rtl: BOOLEAN is
		do
			Result := (value=pango_direction_rtl_low_level)
		end

	is_pango_direction_ttb_ltr: BOOLEAN is
		do
			Result := (value=pango_direction_ttb_ltr_low_level)
		end

	is_pango_direction_ttb_rtl: BOOLEAN is
		do
			Result := (value=pango_direction_ttb_rtl_low_level)
		end

	is_pango_direction_weak_ltr: BOOLEAN is
		do
			Result := (value=pango_direction_weak_ltr_low_level)
		end

	is_pango_direction_weak_rtl: BOOLEAN is
		do
			Result := (value=pango_direction_weak_rtl_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_direction_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_LTR"
 			}"
 		end

	pango_direction_neutral_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_NEUTRAL"
 			}"
 		end

	pango_direction_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_RTL"
 			}"
 		end

	pango_direction_ttb_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_TTB_LTR"
 			}"
 		end

	pango_direction_ttb_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_TTB_RTL"
 			}"
 		end

	pango_direction_weak_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_WEAK_LTR"
 			}"
 		end

	pango_direction_weak_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_WEAK_RTL"
 			}"
 		end


end -- class PANGO_DIRECTION_ENUM
