-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTOPERATIONPREVIEW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_print_operation_preview_end_preview (a_preview: POINTER) is
 		-- gtk_print_operation_preview_end_preview
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_preview_end_preview"
		}"
		end

	gtk_print_operation_preview_get_type: like long_unsigned is
 		-- gtk_print_operation_preview_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_preview_get_type()"
		}"
		end

	gtk_print_operation_preview_is_selected (a_preview: POINTER; a_page_nr: INTEGER): INTEGER is
 		-- gtk_print_operation_preview_is_selected
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_preview_is_selected"
		}"
		end

	gtk_print_operation_preview_render_page (a_preview: POINTER; a_page_nr: INTEGER) is
 		-- gtk_print_operation_preview_render_page
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_print_operation_preview_render_page"
		}"
		end


end -- class GTKPRINTOPERATIONPREVIEW_EXTERNALS
