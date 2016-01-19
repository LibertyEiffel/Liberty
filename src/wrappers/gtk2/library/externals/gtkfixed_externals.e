-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFIXED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_fixed_get_type: like long_unsigned is
 		-- gtk_fixed_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_get_type()"
		}"
		end

	gtk_fixed_move (a_fixed: POINTER; a_widget: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_fixed_move
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_move"
		}"
		end

	gtk_fixed_new: POINTER is
 		-- gtk_fixed_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_new()"
		}"
		end

	gtk_fixed_put (a_fixed: POINTER; a_widget: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_fixed_put
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_put"
		}"
		end


end -- class GTKFIXED_EXTERNALS
