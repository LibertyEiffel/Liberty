-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBARCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktoolbarclass_struct_set_orientation_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for orientation_changed field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_set_orientation_changed"
		}"
		end

	gtktoolbarclass_struct_set_style_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for style_changed field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_set_style_changed"
		}"
		end

	gtktoolbarclass_struct_set_popup_context_menu (a_structure: POINTER; a_value: POINTER) is
			-- Setter for popup_context_menu field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_set_popup_context_menu"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtktoolbarclass_struct_get_orientation_changed (a_structure: POINTER): POINTER is
			-- Query for orientation_changed field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_get_orientation_changed"
		}"
		end

	gtktoolbarclass_struct_get_style_changed (a_structure: POINTER): POINTER is
			-- Query for style_changed field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_get_style_changed"
		}"
		end

	gtktoolbarclass_struct_get_popup_context_menu (a_structure: POINTER): POINTER is
			-- Query for popup_context_menu field of GTKTOOLBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbarclass_struct_get_popup_context_menu"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolbarClass"
		}"
		end

end -- class GTKTOOLBARCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

