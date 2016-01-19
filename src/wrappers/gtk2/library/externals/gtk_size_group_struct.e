-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SIZE_GROUP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_size_group_struct_set_widgets (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widgets field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_set_widgets"
		}"
		end

	gtk_size_group_struct_set_mode (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for mode field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_set_mode"
		}"
		end

	gtk_size_group_struct_set_have_width (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for have_width field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_set_have_width"
		}"
		end

	gtk_size_group_struct_set_have_height (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for have_height field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_set_have_height"
		}"
		end

	gtk_size_group_struct_set_ignore_hidden (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for ignore_hidden field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_set_ignore_hidden"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_size_group_struct_get_widgets (a_structure: POINTER): POINTER is
			-- Query for widgets field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_get_widgets"
		}"
		end

	gtk_size_group_struct_get_mode (a_structure: POINTER): CHARACTER is
			-- Query for mode field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_get_mode"
		}"
		end

	gtk_size_group_struct_get_have_width (a_structure: POINTER): NATURAL is
			-- Query for have_width field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_get_have_width"
		}"
		end

	gtk_size_group_struct_get_have_height (a_structure: POINTER): NATURAL is
			-- Query for have_height field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_get_have_height"
		}"
		end

	gtk_size_group_struct_get_ignore_hidden (a_structure: POINTER): NATURAL is
			-- Query for ignore_hidden field of GTK_SIZE_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_size_group_struct_get_ignore_hidden"
		}"
		end

	-- Unwrappable field requisition.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSizeGroup"
		}"
		end

end -- class GTK_SIZE_GROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

