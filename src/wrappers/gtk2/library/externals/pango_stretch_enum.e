-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_STRETCH_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_stretch_condensed_low_level)  or else
				(a_value = pango_stretch_expanded_low_level)  or else
				(a_value = pango_stretch_extra_condensed_low_level)  or else
				(a_value = pango_stretch_extra_expanded_low_level)  or else
				(a_value = pango_stretch_normal_low_level)  or else
				(a_value = pango_stretch_semi_condensed_low_level)  or else
				(a_value = pango_stretch_semi_expanded_low_level)  or else
				(a_value = pango_stretch_ultra_condensed_low_level)  or else
				(a_value = pango_stretch_ultra_expanded_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_stretch_condensed is
		do
			value := pango_stretch_condensed_low_level
		end

	set_pango_stretch_expanded is
		do
			value := pango_stretch_expanded_low_level
		end

	set_pango_stretch_extra_condensed is
		do
			value := pango_stretch_extra_condensed_low_level
		end

	set_pango_stretch_extra_expanded is
		do
			value := pango_stretch_extra_expanded_low_level
		end

	set_pango_stretch_normal is
		do
			value := pango_stretch_normal_low_level
		end

	set_pango_stretch_semi_condensed is
		do
			value := pango_stretch_semi_condensed_low_level
		end

	set_pango_stretch_semi_expanded is
		do
			value := pango_stretch_semi_expanded_low_level
		end

	set_pango_stretch_ultra_condensed is
		do
			value := pango_stretch_ultra_condensed_low_level
		end

	set_pango_stretch_ultra_expanded is
		do
			value := pango_stretch_ultra_expanded_low_level
		end

feature -- Queries
	is_pango_stretch_condensed: BOOLEAN is
		do
			Result := (value=pango_stretch_condensed_low_level)
		end

	is_pango_stretch_expanded: BOOLEAN is
		do
			Result := (value=pango_stretch_expanded_low_level)
		end

	is_pango_stretch_extra_condensed: BOOLEAN is
		do
			Result := (value=pango_stretch_extra_condensed_low_level)
		end

	is_pango_stretch_extra_expanded: BOOLEAN is
		do
			Result := (value=pango_stretch_extra_expanded_low_level)
		end

	is_pango_stretch_normal: BOOLEAN is
		do
			Result := (value=pango_stretch_normal_low_level)
		end

	is_pango_stretch_semi_condensed: BOOLEAN is
		do
			Result := (value=pango_stretch_semi_condensed_low_level)
		end

	is_pango_stretch_semi_expanded: BOOLEAN is
		do
			Result := (value=pango_stretch_semi_expanded_low_level)
		end

	is_pango_stretch_ultra_condensed: BOOLEAN is
		do
			Result := (value=pango_stretch_ultra_condensed_low_level)
		end

	is_pango_stretch_ultra_expanded: BOOLEAN is
		do
			Result := (value=pango_stretch_ultra_expanded_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_stretch_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_CONDENSED"
 			}"
 		end

	pango_stretch_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXPANDED"
 			}"
 		end

	pango_stretch_extra_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXTRA_CONDENSED"
 			}"
 		end

	pango_stretch_extra_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXTRA_EXPANDED"
 			}"
 		end

	pango_stretch_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_NORMAL"
 			}"
 		end

	pango_stretch_semi_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_SEMI_CONDENSED"
 			}"
 		end

	pango_stretch_semi_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_SEMI_EXPANDED"
 			}"
 		end

	pango_stretch_ultra_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_ULTRA_CONDENSED"
 			}"
 		end

	pango_stretch_ultra_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_ULTRA_EXPANDED"
 			}"
 		end


end -- class PANGO_STRETCH_ENUM
