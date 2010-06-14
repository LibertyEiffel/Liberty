-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVIEWPORT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_viewport_get_type: NATURAL_32 is
 		-- gtk_viewport_get_type (node at line 10620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_get_type()"
		}"
		end

	gtk_viewport_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_viewport_new (node at line 12450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_new"
		}"
		end

	gtk_viewport_set_shadow_type (a_viewport: POINTER; a_type: INTEGER) is
 		-- gtk_viewport_set_shadow_type (node at line 16797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_set_shadow_type"
		}"
		end

	gtk_viewport_set_hadjustment (a_viewport: POINTER; an_adjustment: POINTER) is
 		-- gtk_viewport_set_hadjustment (node at line 18593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_set_hadjustment"
		}"
		end

	gtk_viewport_set_vadjustment (a_viewport: POINTER; an_adjustment: POINTER) is
 		-- gtk_viewport_set_vadjustment (node at line 19473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_set_vadjustment"
		}"
		end

	gtk_viewport_get_bin_window (a_viewport: POINTER): POINTER is
 		-- gtk_viewport_get_bin_window (node at line 23904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_get_bin_window"
		}"
		end

	gtk_viewport_get_shadow_type (a_viewport: POINTER): INTEGER is
 		-- gtk_viewport_get_shadow_type (node at line 29511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_get_shadow_type"
		}"
		end

	gtk_viewport_get_hadjustment (a_viewport: POINTER): POINTER is
 		-- gtk_viewport_get_hadjustment (node at line 31321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_get_hadjustment"
		}"
		end

	gtk_viewport_get_vadjustment (a_viewport: POINTER): POINTER is
 		-- gtk_viewport_get_vadjustment (node at line 32079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_get_vadjustment"
		}"
		end


end -- class GTKVIEWPORT_EXTERNALS
