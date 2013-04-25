-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_DIRECTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ltr_low_level)  or else
				(a_value = rtl_low_level)  or else
				(a_value = ttb_ltr_low_level)  or else
				(a_value = ttb_rtl_low_level)  or else
				(a_value = weak_ltr_low_level)  or else
				(a_value = weak_rtl_low_level)  or else
				(a_value = neutral_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ltr is
		do
			value := ltr_low_level
		end

	set_rtl is
		do
			value := rtl_low_level
		end

	set_ttb_ltr is
		do
			value := ttb_ltr_low_level
		end

	set_ttb_rtl is
		do
			value := ttb_rtl_low_level
		end

	set_weak_ltr is
		do
			value := weak_ltr_low_level
		end

	set_weak_rtl is
		do
			value := weak_rtl_low_level
		end

	set_neutral is
		do
			value := neutral_low_level
		end

feature {ANY} -- Queries
	is_ltr: BOOLEAN is
		do
			Result := (value=ltr_low_level)
		end

	is_rtl: BOOLEAN is
		do
			Result := (value=rtl_low_level)
		end

	is_ttb_ltr: BOOLEAN is
		do
			Result := (value=ttb_ltr_low_level)
		end

	is_ttb_rtl: BOOLEAN is
		do
			Result := (value=ttb_rtl_low_level)
		end

	is_weak_ltr: BOOLEAN is
		do
			Result := (value=weak_ltr_low_level)
		end

	is_weak_rtl: BOOLEAN is
		do
			Result := (value=weak_rtl_low_level)
		end

	is_neutral: BOOLEAN is
		do
			Result := (value=neutral_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_LTR"
 			}"
 		end

	rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_RTL"
 			}"
 		end

	ttb_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_TTB_LTR"
 			}"
 		end

	ttb_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_TTB_RTL"
 			}"
 		end

	weak_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_WEAK_LTR"
 			}"
 		end

	weak_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_WEAK_RTL"
 			}"
 		end

	neutral_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_DIRECTION_NEUTRAL"
 			}"
 		end


end -- class PANGO_DIRECTION_ENUM
