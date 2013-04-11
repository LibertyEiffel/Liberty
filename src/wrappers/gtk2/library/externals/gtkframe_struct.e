-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFRAME_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkframe_struct_set_label_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label_widget field of GTKFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_set_label_widget"
		}"
		end

	gtkframe_struct_set_shadow_type (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for shadow_type field of GTKFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_set_shadow_type"
		}"
		end

	gtkframe_struct_set_label_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for label_xalign field of GTKFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_set_label_xalign"
		}"
		end

	gtkframe_struct_set_label_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for label_yalign field of GTKFRAME_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_set_label_yalign"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field bin.
	gtkframe_struct_get_label_widget (a_structure: POINTER): POINTER is
			-- Query for label_widget field of GTKFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_get_label_widget"
		}"
		end

	gtkframe_struct_get_shadow_type (a_structure: POINTER): INTEGER_16 is
			-- Query for shadow_type field of GTKFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_get_shadow_type"
		}"
		end

	gtkframe_struct_get_label_xalign (a_structure: POINTER): REAL_32 is
			-- Query for label_xalign field of GTKFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_get_label_xalign"
		}"
		end

	gtkframe_struct_get_label_yalign (a_structure: POINTER): REAL_32 is
			-- Query for label_yalign field of GTKFRAME_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkframe_struct_get_label_yalign"
		}"
		end

	-- Unwrappable field child_allocation.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFrame"
		}"
		end

end -- class GTKFRAME_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

