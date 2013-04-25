-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONTHEMECLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkiconthemeclass_struct_set_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for changed field of GTKICONTHEMECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkiconthemeclass_struct_set_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkiconthemeclass_struct_get_changed (a_structure: POINTER): POINTER is
			-- Query for changed field of GTKICONTHEMECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkiconthemeclass_struct_get_changed"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIconThemeClass"
		}"
		end

end -- class GTKICONTHEMECLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

