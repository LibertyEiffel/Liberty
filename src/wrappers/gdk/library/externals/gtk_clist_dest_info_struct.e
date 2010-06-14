-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CLIST_DEST_INFO_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_clist_dest_info_struct_set_insert_pos (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for insert_pos field of GTK_CLIST_DEST_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_dest_info_struct_set_insert_pos"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field cell.
	gtk_clist_dest_info_struct_get_insert_pos (a_structure: POINTER): INTEGER is
			-- Query for insert_pos field of GTK_CLIST_DEST_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_dest_info_struct_get_insert_pos"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCListDestInfo"
		}"
		end

end -- class GTK_CLIST_DEST_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

