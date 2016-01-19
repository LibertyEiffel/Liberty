-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_CROSSING_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_crossing_grab_low_level)  or else
				(a_value = gdk_crossing_gtk_grab_low_level)  or else
				(a_value = gdk_crossing_gtk_ungrab_low_level)  or else
				(a_value = gdk_crossing_normal_low_level)  or else
				(a_value = gdk_crossing_state_changed_low_level)  or else
				(a_value = gdk_crossing_ungrab_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_crossing_grab is
		do
			value := gdk_crossing_grab_low_level
		end

	set_gdk_crossing_gtk_grab is
		do
			value := gdk_crossing_gtk_grab_low_level
		end

	set_gdk_crossing_gtk_ungrab is
		do
			value := gdk_crossing_gtk_ungrab_low_level
		end

	set_gdk_crossing_normal is
		do
			value := gdk_crossing_normal_low_level
		end

	set_gdk_crossing_state_changed is
		do
			value := gdk_crossing_state_changed_low_level
		end

	set_gdk_crossing_ungrab is
		do
			value := gdk_crossing_ungrab_low_level
		end

feature -- Queries
	is_gdk_crossing_grab: BOOLEAN is
		do
			Result := (value=gdk_crossing_grab_low_level)
		end

	is_gdk_crossing_gtk_grab: BOOLEAN is
		do
			Result := (value=gdk_crossing_gtk_grab_low_level)
		end

	is_gdk_crossing_gtk_ungrab: BOOLEAN is
		do
			Result := (value=gdk_crossing_gtk_ungrab_low_level)
		end

	is_gdk_crossing_normal: BOOLEAN is
		do
			Result := (value=gdk_crossing_normal_low_level)
		end

	is_gdk_crossing_state_changed: BOOLEAN is
		do
			Result := (value=gdk_crossing_state_changed_low_level)
		end

	is_gdk_crossing_ungrab: BOOLEAN is
		do
			Result := (value=gdk_crossing_ungrab_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_crossing_grab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_GRAB"
 			}"
 		end

	gdk_crossing_gtk_grab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_GTK_GRAB"
 			}"
 		end

	gdk_crossing_gtk_ungrab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_GTK_UNGRAB"
 			}"
 		end

	gdk_crossing_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_NORMAL"
 			}"
 		end

	gdk_crossing_state_changed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_STATE_CHANGED"
 			}"
 		end

	gdk_crossing_ungrab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSING_UNGRAB"
 			}"
 		end


end -- class GDK_CROSSING_MODE_ENUM
