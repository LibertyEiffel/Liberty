-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKWIDGET_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkwidget_struct_set_private_flags (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for private_flags field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_private_flags"
		}"
		end

	gtkwidget_struct_set_state (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for state field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_state"
		}"
		end

	gtkwidget_struct_set_saved_state (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for saved_state field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_saved_state"
		}"
		end

	gtkwidget_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_name"
		}"
		end

	gtkwidget_struct_set_style (a_structure: POINTER; a_value: POINTER) is
			-- Setter for style field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_style"
		}"
		end

	gtkwidget_struct_set_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for window field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_window"
		}"
		end

	gtkwidget_struct_set_parent (a_structure: POINTER; a_value: POINTER) is
			-- Setter for parent field of GTKWIDGET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_set_parent"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field object.
	gtkwidget_struct_get_private_flags (a_structure: POINTER): NATURAL_16 is
			-- Query for private_flags field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_private_flags"
		}"
		end

	gtkwidget_struct_get_state (a_structure: POINTER): CHARACTER is
			-- Query for state field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_state"
		}"
		end

	gtkwidget_struct_get_saved_state (a_structure: POINTER): CHARACTER is
			-- Query for saved_state field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_saved_state"
		}"
		end

	gtkwidget_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_name"
		}"
		end

	gtkwidget_struct_get_style (a_structure: POINTER): POINTER is
			-- Query for style field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_style"
		}"
		end

	-- Unwrappable field requisition.
	-- Unwrappable field allocation.
	gtkwidget_struct_get_window (a_structure: POINTER): POINTER is
			-- Query for window field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_window"
		}"
		end

	gtkwidget_struct_get_parent (a_structure: POINTER): POINTER is
			-- Query for parent field of GTKWIDGET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkwidget_struct_get_parent"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkWidget"
		}"
		end

end -- class GTKWIDGET_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

