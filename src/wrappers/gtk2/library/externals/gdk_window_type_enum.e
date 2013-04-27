-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_window_child_low_level)  or else
				(a_value = gdk_window_dialog_low_level)  or else
				(a_value = gdk_window_foreign_low_level)  or else
				(a_value = gdk_window_offscreen_low_level)  or else
				(a_value = gdk_window_root_low_level)  or else
				(a_value = gdk_window_temp_low_level)  or else
				(a_value = gdk_window_toplevel_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_window_child is
		do
			value := gdk_window_child_low_level
		end

	set_gdk_window_dialog is
		do
			value := gdk_window_dialog_low_level
		end

	set_gdk_window_foreign is
		do
			value := gdk_window_foreign_low_level
		end

	set_gdk_window_offscreen is
		do
			value := gdk_window_offscreen_low_level
		end

	set_gdk_window_root is
		do
			value := gdk_window_root_low_level
		end

	set_gdk_window_temp is
		do
			value := gdk_window_temp_low_level
		end

	set_gdk_window_toplevel is
		do
			value := gdk_window_toplevel_low_level
		end

feature -- Queries
	is_gdk_window_child: BOOLEAN is
		do
			Result := (value=gdk_window_child_low_level)
		end

	is_gdk_window_dialog: BOOLEAN is
		do
			Result := (value=gdk_window_dialog_low_level)
		end

	is_gdk_window_foreign: BOOLEAN is
		do
			Result := (value=gdk_window_foreign_low_level)
		end

	is_gdk_window_offscreen: BOOLEAN is
		do
			Result := (value=gdk_window_offscreen_low_level)
		end

	is_gdk_window_root: BOOLEAN is
		do
			Result := (value=gdk_window_root_low_level)
		end

	is_gdk_window_temp: BOOLEAN is
		do
			Result := (value=gdk_window_temp_low_level)
		end

	is_gdk_window_toplevel: BOOLEAN is
		do
			Result := (value=gdk_window_toplevel_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_window_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_CHILD"
 			}"
 		end

	gdk_window_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_DIALOG"
 			}"
 		end

	gdk_window_foreign_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_FOREIGN"
 			}"
 		end

	gdk_window_offscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_OFFSCREEN"
 			}"
 		end

	gdk_window_root_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_ROOT"
 			}"
 		end

	gdk_window_temp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TEMP"
 			}"
 		end

	gdk_window_toplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TOPLEVEL"
 			}"
 		end


end -- class GDK_WINDOW_TYPE_ENUM
