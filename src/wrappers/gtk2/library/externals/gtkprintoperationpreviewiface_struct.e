-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPRINTOPERATIONPREVIEWIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkprintoperationpreviewiface_struct_set_ready (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ready field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_set_ready"
		}"
		end

	gtkprintoperationpreviewiface_struct_set_got_page_size (a_structure: POINTER; a_value: POINTER) is
			-- Setter for got_page_size field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_set_got_page_size"
		}"
		end

	gtkprintoperationpreviewiface_struct_set_render_page (a_structure: POINTER; a_value: POINTER) is
			-- Setter for render_page field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_set_render_page"
		}"
		end

	gtkprintoperationpreviewiface_struct_set_is_selected (a_structure: POINTER; a_value: POINTER) is
			-- Setter for is_selected field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_set_is_selected"
		}"
		end

	gtkprintoperationpreviewiface_struct_set_end_preview (a_structure: POINTER; a_value: POINTER) is
			-- Setter for end_preview field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_set_end_preview"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtkprintoperationpreviewiface_struct_get_ready (a_structure: POINTER): POINTER is
			-- Query for ready field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_get_ready"
		}"
		end

	gtkprintoperationpreviewiface_struct_get_got_page_size (a_structure: POINTER): POINTER is
			-- Query for got_page_size field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_get_got_page_size"
		}"
		end

	gtkprintoperationpreviewiface_struct_get_render_page (a_structure: POINTER): POINTER is
			-- Query for render_page field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_get_render_page"
		}"
		end

	gtkprintoperationpreviewiface_struct_get_is_selected (a_structure: POINTER): POINTER is
			-- Query for is_selected field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_get_is_selected"
		}"
		end

	gtkprintoperationpreviewiface_struct_get_end_preview (a_structure: POINTER): POINTER is
			-- Query for end_preview field of GTKPRINTOPERATIONPREVIEWIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprintoperationpreviewiface_struct_get_end_preview"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
	-- Unwrappable field _gtk_reserved5.
	-- Unwrappable field _gtk_reserved6.
	-- Unwrappable field _gtk_reserved7.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPrintOperationPreviewIface"
		}"
		end

end -- class GTKPRINTOPERATIONPREVIEWIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

