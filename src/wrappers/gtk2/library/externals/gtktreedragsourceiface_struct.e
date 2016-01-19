-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEDRAGSOURCEIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreedragsourceiface_struct_set_row_draggable (a_structure: POINTER; a_value: POINTER) is
			-- Setter for row_draggable field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_set_row_draggable"
		}"
		end

	gtktreedragsourceiface_struct_set_drag_data_get (a_structure: POINTER; a_value: POINTER) is
			-- Setter for drag_data_get field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_set_drag_data_get"
		}"
		end

	gtktreedragsourceiface_struct_set_drag_data_delete (a_structure: POINTER; a_value: POINTER) is
			-- Setter for drag_data_delete field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_set_drag_data_delete"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtktreedragsourceiface_struct_get_row_draggable (a_structure: POINTER): POINTER is
			-- Query for row_draggable field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_get_row_draggable"
		}"
		end

	gtktreedragsourceiface_struct_get_drag_data_get (a_structure: POINTER): POINTER is
			-- Query for drag_data_get field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_get_drag_data_get"
		}"
		end

	gtktreedragsourceiface_struct_get_drag_data_delete (a_structure: POINTER): POINTER is
			-- Query for drag_data_delete field of GTKTREEDRAGSOURCEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragsourceiface_struct_get_drag_data_delete"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeDragSourceIface"
		}"
		end

end -- class GTKTREEDRAGSOURCEIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

