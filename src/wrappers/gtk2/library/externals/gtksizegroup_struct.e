-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSIZEGROUP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtksizegroup_struct_set_widgets (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widgets field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_set_widgets"
		}"
		end

	gtksizegroup_struct_set_mode (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for mode field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_set_mode"
		}"
		end

	gtksizegroup_struct_set_have_width (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for have_width field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_set_have_width"
		}"
		end

	gtksizegroup_struct_set_have_height (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for have_height field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_set_have_height"
		}"
		end

	gtksizegroup_struct_set_ignore_hidden (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ignore_hidden field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_set_ignore_hidden"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtksizegroup_struct_get_widgets (a_structure: POINTER): POINTER is
			-- Query for widgets field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_get_widgets"
		}"
		end

	gtksizegroup_struct_get_mode (a_structure: POINTER): CHARACTER is
			-- Query for mode field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_get_mode"
		}"
		end

	gtksizegroup_struct_get_have_width (a_structure: POINTER): NATURAL_32 is
			-- Query for have_width field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_get_have_width"
		}"
		end

	gtksizegroup_struct_get_have_height (a_structure: POINTER): NATURAL_32 is
			-- Query for have_height field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_get_have_height"
		}"
		end

	gtksizegroup_struct_get_ignore_hidden (a_structure: POINTER): NATURAL_32 is
			-- Query for ignore_hidden field of GTKSIZEGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksizegroup_struct_get_ignore_hidden"
		}"
		end

	-- Unwrappable field requisition.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSizeGroup"
		}"
		end

end -- class GTKSIZEGROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

