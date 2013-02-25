-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELLABEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_label_set_accel_widget (an_accel_label: POINTER; an_accel_widget: POINTER) is
 		-- gtk_accel_label_set_accel_widget (node at line 6212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_widget"
		}"
		end

	gtk_accel_label_set_accel_closure (an_accel_label: POINTER; an_accel_closure: POINTER) is
 		-- gtk_accel_label_set_accel_closure (node at line 8053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_closure"
		}"
		end

	gtk_accel_label_get_accel_widget (an_accel_label: POINTER): POINTER is
 		-- gtk_accel_label_get_accel_widget (node at line 11590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_widget"
		}"
		end

	gtk_accel_label_get_accel_width (an_accel_label: POINTER): NATURAL_32 is
 		-- gtk_accel_label_get_accel_width (node at line 14642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_width"
		}"
		end

	gtk_accel_label_new (a_string: POINTER): POINTER is
 		-- gtk_accel_label_new (node at line 14776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_new"
		}"
		end

	gtk_accel_label_get_type: NATURAL_64 is
 		-- gtk_accel_label_get_type (node at line 29923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_type()"
		}"
		end

	-- `hidden' function _gtk_accel_label_class_get_accelerator_label skipped.
	gtk_accel_label_refetch (an_accel_label: POINTER): INTEGER_32 is
 		-- gtk_accel_label_refetch (node at line 40146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_refetch"
		}"
		end


end -- class GTKACCELLABEL_EXTERNALS
