-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_WINDOW_GROUP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_window_group_struct_set_grabs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grabs field of GTK_WINDOW_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_struct_set_grabs"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_window_group_struct_get_grabs (a_structure: POINTER): POINTER is
			-- Query for grabs field of GTK_WINDOW_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_window_group_struct_get_grabs"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkWindowGroup"
		}"
		end

end -- class GTK_WINDOW_GROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

