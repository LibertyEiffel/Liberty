-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIONENTRY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkactionentry_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_name"
		}"
		end

	gtkactionentry_struct_set_stock_id (a_structure: POINTER; a_value: POINTER) is
			-- Setter for stock_id field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_stock_id"
		}"
		end

	gtkactionentry_struct_set_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_label"
		}"
		end

	gtkactionentry_struct_set_accelerator (a_structure: POINTER; a_value: POINTER) is
			-- Setter for accelerator field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_accelerator"
		}"
		end

	gtkactionentry_struct_set_tooltip (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tooltip field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_tooltip"
		}"
		end

	gtkactionentry_struct_set_callback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for callback field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_set_callback"
		}"
		end

feature {} -- Low-level queries

	gtkactionentry_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_name"
		}"
		end

	gtkactionentry_struct_get_stock_id (a_structure: POINTER): POINTER is
			-- Query for stock_id field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_stock_id"
		}"
		end

	gtkactionentry_struct_get_label (a_structure: POINTER): POINTER is
			-- Query for label field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_label"
		}"
		end

	gtkactionentry_struct_get_accelerator (a_structure: POINTER): POINTER is
			-- Query for accelerator field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_accelerator"
		}"
		end

	gtkactionentry_struct_get_tooltip (a_structure: POINTER): POINTER is
			-- Query for tooltip field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_tooltip"
		}"
		end

	gtkactionentry_struct_get_callback (a_structure: POINTER): POINTER is
			-- Query for callback field of GTKACTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactionentry_struct_get_callback"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkActionEntry"
		}"
		end

end -- class GTKACTIONENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

