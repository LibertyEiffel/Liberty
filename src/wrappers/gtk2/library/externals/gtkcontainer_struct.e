-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCONTAINER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcontainer_struct_set_focus_child (a_structure: POINTER; a_value: POINTER) is
			-- Setter for focus_child field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_focus_child"
		}"
		end

	gtkcontainer_struct_set_border_width (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for border_width field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_border_width"
		}"
		end

	gtkcontainer_struct_set_need_resize (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for need_resize field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_need_resize"
		}"
		end

	gtkcontainer_struct_set_resize_mode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for resize_mode field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_resize_mode"
		}"
		end

	gtkcontainer_struct_set_reallocate_redraws (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for reallocate_redraws field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_reallocate_redraws"
		}"
		end

	gtkcontainer_struct_set_has_focus_chain (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for has_focus_chain field of GTKCONTAINER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_set_has_focus_chain"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtkcontainer_struct_get_focus_child (a_structure: POINTER): POINTER is
			-- Query for focus_child field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_focus_child"
		}"
		end

	gtkcontainer_struct_get_border_width (a_structure: POINTER): NATURAL_32 is
			-- Query for border_width field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_border_width"
		}"
		end

	gtkcontainer_struct_get_need_resize (a_structure: POINTER): NATURAL_32 is
			-- Query for need_resize field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_need_resize"
		}"
		end

	gtkcontainer_struct_get_resize_mode (a_structure: POINTER): NATURAL_32 is
			-- Query for resize_mode field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_resize_mode"
		}"
		end

	gtkcontainer_struct_get_reallocate_redraws (a_structure: POINTER): NATURAL_32 is
			-- Query for reallocate_redraws field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_reallocate_redraws"
		}"
		end

	gtkcontainer_struct_get_has_focus_chain (a_structure: POINTER): NATURAL_32 is
			-- Query for has_focus_chain field of GTKCONTAINER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcontainer_struct_get_has_focus_chain"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkContainer"
		}"
		end

end -- class GTKCONTAINER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

