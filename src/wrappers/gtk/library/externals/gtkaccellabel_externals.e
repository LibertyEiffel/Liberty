-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELLABEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_label_set_accel_widget (an_accel_label: POINTER; an_accel_widget: POINTER) is
 		-- gtk_accel_label_set_accel_widget (node at line 5905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_widget"
		}"
		end

	gtk_accel_label_set_accel_closure (an_accel_label: POINTER; an_accel_closure: POINTER) is
 		-- gtk_accel_label_set_accel_closure (node at line 7375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_set_accel_closure"
		}"
		end

	gtk_accel_label_get_accel_width (an_accel_label: POINTER): NATURAL_32 is
 		-- gtk_accel_label_get_accel_width (node at line 8770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_width"
		}"
		end

	gtk_accel_label_get_accel_widget (an_accel_label: POINTER): POINTER is
 		-- gtk_accel_label_get_accel_widget (node at line 10659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_accel_widget"
		}"
		end

	gtk_accel_label_new (a_string: POINTER): POINTER is
 		-- gtk_accel_label_new (node at line 13714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_new"
		}"
		end

	gtk_accel_label_get_type: NATURAL_32 is
 		-- gtk_accel_label_get_type (node at line 27122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_get_type()"
		}"
		end

	-- `hidden' function _gtk_accel_label_class_get_accelerator_label skipped.
	gtk_accel_label_refetch (an_accel_label: POINTER): INTEGER_32 is
 		-- gtk_accel_label_refetch (node at line 36489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_label_refetch"
		}"
		end


end -- class GTKACCELLABEL_EXTERNALS
