-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLEDITABLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_editable_editing_done (a_cell_editable: POINTER) is
 		-- gtk_cell_editable_editing_done (node at line 1669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_editing_done"
		}"
		end

	gtk_cell_editable_remove_widget (a_cell_editable: POINTER) is
 		-- gtk_cell_editable_remove_widget (node at line 33077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_remove_widget"
		}"
		end

	gtk_cell_editable_get_type: NATURAL_32 is
 		-- gtk_cell_editable_get_type (node at line 33449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_get_type()"
		}"
		end

	gtk_cell_editable_start_editing (a_cell_editable: POINTER; an_event: POINTER) is
 		-- gtk_cell_editable_start_editing (node at line 37327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_start_editing"
		}"
		end


end -- class GTKCELLEDITABLE_EXTERNALS
