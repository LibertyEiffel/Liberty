-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_STATE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = active_low_level)  or else
				(a_value = prelight_low_level)  or else
				(a_value = selected_low_level)  or else
				(a_value = insensitive_low_level) )
		end

feature -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_active is
		do
			value := active_low_level
		end

	set_prelight is
		do
			value := prelight_low_level
		end

	set_selected is
		do
			value := selected_low_level
		end

	set_insensitive is
		do
			value := insensitive_low_level
		end

feature -- Queries
	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_active: BOOLEAN is
		do
			Result := (value=active_low_level)
		end

	is_prelight: BOOLEAN is
		do
			Result := (value=prelight_low_level)
		end

	is_selected: BOOLEAN is
		do
			Result := (value=selected_low_level)
		end

	is_insensitive: BOOLEAN is
		do
			Result := (value=insensitive_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_NORMAL"
 			}"
 		end

	active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_ACTIVE"
 			}"
 		end

	prelight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_PRELIGHT"
 			}"
 		end

	selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_SELECTED"
 			}"
 		end

	insensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_INSENSITIVE"
 			}"
 		end


end -- class GTK_STATE_TYPE_ENUM
