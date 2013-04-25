-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEDRAGDESTIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreedragdestiface_struct_set_drag_data_received (a_structure: POINTER; a_value: POINTER) is
			-- Setter for drag_data_received field of GTKTREEDRAGDESTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragdestiface_struct_set_drag_data_received"
		}"
		end

	gtktreedragdestiface_struct_set_row_drop_possible (a_structure: POINTER; a_value: POINTER) is
			-- Setter for row_drop_possible field of GTKTREEDRAGDESTIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragdestiface_struct_set_row_drop_possible"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtktreedragdestiface_struct_get_drag_data_received (a_structure: POINTER): POINTER is
			-- Query for drag_data_received field of GTKTREEDRAGDESTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragdestiface_struct_get_drag_data_received"
		}"
		end

	gtktreedragdestiface_struct_get_row_drop_possible (a_structure: POINTER): POINTER is
			-- Query for row_drop_possible field of GTKTREEDRAGDESTIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreedragdestiface_struct_get_row_drop_possible"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeDragDestIface"
		}"
		end

end -- class GTKTREEDRAGDESTIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

