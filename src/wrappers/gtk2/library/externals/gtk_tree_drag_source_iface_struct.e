-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TREE_DRAG_SOURCE_IFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_tree_drag_source_iface_struct_set_row_draggable (a_structure: POINTER; a_value: POINTER) is
			-- Setter for row_draggable field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_set_row_draggable"
		}"
		end

	gtk_tree_drag_source_iface_struct_set_drag_data_get (a_structure: POINTER; a_value: POINTER) is
			-- Setter for drag_data_get field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_set_drag_data_get"
		}"
		end

	gtk_tree_drag_source_iface_struct_set_drag_data_delete (a_structure: POINTER; a_value: POINTER) is
			-- Setter for drag_data_delete field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_set_drag_data_delete"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtk_tree_drag_source_iface_struct_get_row_draggable (a_structure: POINTER): POINTER is
			-- Query for row_draggable field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_get_row_draggable"
		}"
		end

	gtk_tree_drag_source_iface_struct_get_drag_data_get (a_structure: POINTER): POINTER is
			-- Query for drag_data_get field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_get_drag_data_get"
		}"
		end

	gtk_tree_drag_source_iface_struct_get_drag_data_delete (a_structure: POINTER): POINTER is
			-- Query for drag_data_delete field of GTK_TREE_DRAG_SOURCE_IFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_drag_source_iface_struct_get_drag_data_delete"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeDragSourceIface"
		}"
		end

end -- class GTK_TREE_DRAG_SOURCE_IFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

