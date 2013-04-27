-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELLABEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_accel_label_class_get_accelerator_label skipped.
	gtk_accel_label_get_accel_widget (an_accel_label: POINTER): POINTER is
 		-- gtk_accel_label_get_accel_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_widget"
		}"
		end

	gtk_accel_label_get_accel_width (an_accel_label: POINTER): NATURAL is
 		-- gtk_accel_label_get_accel_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_width"
		}"
		end

	gtk_accel_label_get_type: like long_unsigned is
 		-- gtk_accel_label_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_type()"
		}"
		end

	gtk_accel_label_new (a_string: POINTER): POINTER is
 		-- gtk_accel_label_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_new"
		}"
		end

	gtk_accel_label_refetch (an_accel_label: POINTER): INTEGER is
 		-- gtk_accel_label_refetch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_refetch"
		}"
		end

	gtk_accel_label_set_accel_closure (an_accel_label: POINTER; an_accel_closure: POINTER) is
 		-- gtk_accel_label_set_accel_closure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_closure"
		}"
		end

	gtk_accel_label_set_accel_widget (an_accel_label: POINTER; an_accel_widget: POINTER) is
 		-- gtk_accel_label_set_accel_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_widget"
		}"
		end


end -- class GTKACCELLABEL_EXTERNALS
