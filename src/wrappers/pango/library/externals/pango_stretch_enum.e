-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_STRETCH_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ultra_condensed_low_level)  or else
				(a_value = extra_condensed_low_level)  or else
				(a_value = condensed_low_level)  or else
				(a_value = semi_condensed_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = semi_expanded_low_level)  or else
				(a_value = expanded_external_low_level)  or else
				(a_value = extra_expanded_low_level)  or else
				(a_value = ultra_expanded_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ultra_condensed is
		do
			value := ultra_condensed_low_level
		end

	set_extra_condensed is
		do
			value := extra_condensed_low_level
		end

	set_condensed is
		do
			value := condensed_low_level
		end

	set_semi_condensed is
		do
			value := semi_condensed_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_semi_expanded is
		do
			value := semi_expanded_low_level
		end

	set_expanded_external is
		do
			value := expanded_external_low_level
		end

	set_extra_expanded is
		do
			value := extra_expanded_low_level
		end

	set_ultra_expanded is
		do
			value := ultra_expanded_low_level
		end

feature {ANY} -- Queries
	is_ultra_condensed: BOOLEAN is
		do
			Result := (value=ultra_condensed_low_level)
		end

	is_extra_condensed: BOOLEAN is
		do
			Result := (value=extra_condensed_low_level)
		end

	is_condensed: BOOLEAN is
		do
			Result := (value=condensed_low_level)
		end

	is_semi_condensed: BOOLEAN is
		do
			Result := (value=semi_condensed_low_level)
		end

	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_semi_expanded: BOOLEAN is
		do
			Result := (value=semi_expanded_low_level)
		end

	is_expanded_external: BOOLEAN is
		do
			Result := (value=expanded_external_low_level)
		end

	is_extra_expanded: BOOLEAN is
		do
			Result := (value=extra_expanded_low_level)
		end

	is_ultra_expanded: BOOLEAN is
		do
			Result := (value=ultra_expanded_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ultra_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_ULTRA_CONDENSED"
 			}"
 		end

	extra_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXTRA_CONDENSED"
 			}"
 		end

	condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_CONDENSED"
 			}"
 		end

	semi_condensed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_SEMI_CONDENSED"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_NORMAL"
 			}"
 		end

	semi_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_SEMI_EXPANDED"
 			}"
 		end

	expanded_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXPANDED"
 			}"
 		end

	extra_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_EXTRA_EXPANDED"
 			}"
 		end

	ultra_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STRETCH_ULTRA_EXPANDED"
 			}"
 		end


end -- class PANGO_STRETCH_ENUM
