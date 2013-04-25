-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKITEMCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkitemclass_struct_set_select_field (a_structure: POINTER; a_value: POINTER) is
			-- Setter for select field of GTKITEMCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_set_select_field"
		}"
		end

	gtkitemclass_struct_set_deselect (a_structure: POINTER; a_value: POINTER) is
			-- Setter for deselect field of GTKITEMCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_set_deselect"
		}"
		end

	gtkitemclass_struct_set_toggle (a_structure: POINTER; a_value: POINTER) is
			-- Setter for toggle field of GTKITEMCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_set_toggle"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkitemclass_struct_get_select_field (a_structure: POINTER): POINTER is
			-- Query for select field of GTKITEMCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_get_select_field"
		}"
		end

	gtkitemclass_struct_get_deselect (a_structure: POINTER): POINTER is
			-- Query for deselect field of GTKITEMCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_get_deselect"
		}"
		end

	gtkitemclass_struct_get_toggle (a_structure: POINTER): POINTER is
			-- Query for toggle field of GTKITEMCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkitemclass_struct_get_toggle"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkItemClass"
		}"
		end

end -- class GTKITEMCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

