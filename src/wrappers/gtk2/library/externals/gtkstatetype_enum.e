-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKSTATETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_state_active_low_level)  or else
				(a_value = gtk_state_insensitive_low_level)  or else
				(a_value = gtk_state_normal_low_level)  or else
				(a_value = gtk_state_prelight_low_level)  or else
				(a_value = gtk_state_selected_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_state_active is
		do
			value := gtk_state_active_low_level
		end

	set_gtk_state_insensitive is
		do
			value := gtk_state_insensitive_low_level
		end

	set_gtk_state_normal is
		do
			value := gtk_state_normal_low_level
		end

	set_gtk_state_prelight is
		do
			value := gtk_state_prelight_low_level
		end

	set_gtk_state_selected is
		do
			value := gtk_state_selected_low_level
		end

feature {ANY} -- Queries
	is_gtk_state_active: BOOLEAN is
		do
			Result := (value=gtk_state_active_low_level)
		end

	is_gtk_state_insensitive: BOOLEAN is
		do
			Result := (value=gtk_state_insensitive_low_level)
		end

	is_gtk_state_normal: BOOLEAN is
		do
			Result := (value=gtk_state_normal_low_level)
		end

	is_gtk_state_prelight: BOOLEAN is
		do
			Result := (value=gtk_state_prelight_low_level)
		end

	is_gtk_state_selected: BOOLEAN is
		do
			Result := (value=gtk_state_selected_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_state_active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_ACTIVE"
 			}"
 		end

	gtk_state_insensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_INSENSITIVE"
 			}"
 		end

	gtk_state_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_NORMAL"
 			}"
 		end

	gtk_state_prelight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_PRELIGHT"
 			}"
 		end

	gtk_state_selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_STATE_SELECTED"
 			}"
 		end


end -- class GTKSTATETYPE_ENUM
