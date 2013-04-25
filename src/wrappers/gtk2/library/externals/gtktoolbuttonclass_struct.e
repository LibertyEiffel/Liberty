-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktoolbuttonclass_struct_set_button_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for button_type field of GTKTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbuttonclass_struct_set_button_type"
		}"
		end

	gtktoolbuttonclass_struct_set_clicked (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clicked field of GTKTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbuttonclass_struct_set_clicked"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtktoolbuttonclass_struct_get_button_type (a_structure: POINTER): NATURAL_64 is
			-- Query for button_type field of GTKTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbuttonclass_struct_get_button_type"
		}"
		end

	gtktoolbuttonclass_struct_get_clicked (a_structure: POINTER): POINTER is
			-- Query for clicked field of GTKTOOLBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktoolbuttonclass_struct_get_clicked"
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
			feature_name: "sizeof__GtkToolButtonClass"
		}"
		end

end -- class GTKTOOLBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

