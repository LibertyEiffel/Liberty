-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALEBUTTON_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkscalebutton_struct_set_plus_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for plus_button field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_set_plus_button"
		}"
		end

	gtkscalebutton_struct_set_minus_button (a_structure: POINTER; a_value: POINTER) is
			-- Setter for minus_button field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_set_minus_button"
		}"
		end

	gtkscalebutton_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkscalebutton_struct_get_plus_button (a_structure: POINTER): POINTER is
			-- Query for plus_button field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_get_plus_button"
		}"
		end

	gtkscalebutton_struct_get_minus_button (a_structure: POINTER): POINTER is
			-- Query for minus_button field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_get_minus_button"
		}"
		end

	gtkscalebutton_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTKSCALEBUTTON_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscalebutton_struct_get_priv"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkScaleButton"
		}"
		end

end -- class GTKSCALEBUTTON_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

