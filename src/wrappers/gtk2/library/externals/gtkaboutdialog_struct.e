-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKABOUTDIALOG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkaboutdialog_struct_set_private_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for private_data field of GTKABOUTDIALOG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaboutdialog_struct_set_private_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkaboutdialog_struct_get_private_data (a_structure: POINTER): POINTER is
			-- Query for private_data field of GTKABOUTDIALOG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaboutdialog_struct_get_private_data"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAboutDialog"
		}"
		end

end -- class GTKABOUTDIALOG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

