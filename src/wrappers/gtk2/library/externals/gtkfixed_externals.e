-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFIXED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_fixed_put (a_fixed: POINTER; a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_fixed_put (node at line 10502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_put"
		}"
		end

	gtk_fixed_move (a_fixed: POINTER; a_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_fixed_move (node at line 13618)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_move"
		}"
		end

	gtk_fixed_new: POINTER is
 		-- gtk_fixed_new (node at line 17691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_new()"
		}"
		end

	gtk_fixed_get_type: NATURAL_64 is
 		-- gtk_fixed_get_type (node at line 36718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_get_type()"
		}"
		end


end -- class GTKFIXED_EXTERNALS
