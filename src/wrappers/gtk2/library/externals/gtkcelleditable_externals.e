-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLEDITABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_editable_editing_done (a_cell_editable: POINTER) is
 		-- gtk_cell_editable_editing_done
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_editing_done"
		}"
		end

	gtk_cell_editable_get_type: like long_unsigned is
 		-- gtk_cell_editable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_get_type()"
		}"
		end

	gtk_cell_editable_remove_widget (a_cell_editable: POINTER) is
 		-- gtk_cell_editable_remove_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_remove_widget"
		}"
		end

	gtk_cell_editable_start_editing (a_cell_editable: POINTER; an_event: POINTER) is
 		-- gtk_cell_editable_start_editing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_editable_start_editing"
		}"
		end


end -- class GTKCELLEDITABLE_EXTERNALS
