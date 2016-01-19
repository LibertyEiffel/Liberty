-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLEDITABLEIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcelleditableiface_struct_set_editing_done (a_structure: POINTER; a_value: POINTER) is
			-- Setter for editing_done field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_set_editing_done"
		}"
		end

	gtkcelleditableiface_struct_set_remove_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for remove_widget field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_set_remove_widget"
		}"
		end

	gtkcelleditableiface_struct_set_start_editing (a_structure: POINTER; a_value: POINTER) is
			-- Setter for start_editing field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_set_start_editing"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtkcelleditableiface_struct_get_editing_done (a_structure: POINTER): POINTER is
			-- Query for editing_done field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_get_editing_done"
		}"
		end

	gtkcelleditableiface_struct_get_remove_widget (a_structure: POINTER): POINTER is
			-- Query for remove_widget field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_get_remove_widget"
		}"
		end

	gtkcelleditableiface_struct_get_start_editing (a_structure: POINTER): POINTER is
			-- Query for start_editing field of GTKCELLEDITABLEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelleditableiface_struct_get_start_editing"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellEditableIface"
		}"
		end

end -- class GTKCELLEDITABLEIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

