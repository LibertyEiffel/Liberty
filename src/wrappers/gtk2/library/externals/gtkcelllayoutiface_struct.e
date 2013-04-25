-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLLAYOUTIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcelllayoutiface_struct_set_pack_start (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pack_start field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_pack_start"
		}"
		end

	gtkcelllayoutiface_struct_set_pack_end (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pack_end field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_pack_end"
		}"
		end

	gtkcelllayoutiface_struct_set_clear (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clear field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_clear"
		}"
		end

	gtkcelllayoutiface_struct_set_add_attribute (a_structure: POINTER; a_value: POINTER) is
			-- Setter for add_attribute field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_add_attribute"
		}"
		end

	gtkcelllayoutiface_struct_set_set_cell_data_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_cell_data_func field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_set_cell_data_func"
		}"
		end

	gtkcelllayoutiface_struct_set_clear_attributes (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clear_attributes field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_clear_attributes"
		}"
		end

	gtkcelllayoutiface_struct_set_reorder (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reorder field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_reorder"
		}"
		end

	gtkcelllayoutiface_struct_set_get_cells (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_cells field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_set_get_cells"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtkcelllayoutiface_struct_get_pack_start (a_structure: POINTER): POINTER is
			-- Query for pack_start field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_pack_start"
		}"
		end

	gtkcelllayoutiface_struct_get_pack_end (a_structure: POINTER): POINTER is
			-- Query for pack_end field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_pack_end"
		}"
		end

	gtkcelllayoutiface_struct_get_clear (a_structure: POINTER): POINTER is
			-- Query for clear field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_clear"
		}"
		end

	gtkcelllayoutiface_struct_get_add_attribute (a_structure: POINTER): POINTER is
			-- Query for add_attribute field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_add_attribute"
		}"
		end

	gtkcelllayoutiface_struct_get_set_cell_data_func (a_structure: POINTER): POINTER is
			-- Query for set_cell_data_func field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_set_cell_data_func"
		}"
		end

	gtkcelllayoutiface_struct_get_clear_attributes (a_structure: POINTER): POINTER is
			-- Query for clear_attributes field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_clear_attributes"
		}"
		end

	gtkcelllayoutiface_struct_get_reorder (a_structure: POINTER): POINTER is
			-- Query for reorder field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_reorder"
		}"
		end

	gtkcelllayoutiface_struct_get_get_cells (a_structure: POINTER): POINTER is
			-- Query for get_cells field of GTKCELLLAYOUTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcelllayoutiface_struct_get_get_cells"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellLayoutIface"
		}"
		end

end -- class GTKCELLLAYOUTIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

