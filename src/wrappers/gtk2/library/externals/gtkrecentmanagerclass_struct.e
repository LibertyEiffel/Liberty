-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTMANAGERCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrecentmanagerclass_struct_set_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for changed field of GTKRECENTMANAGERCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentmanagerclass_struct_set_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkrecentmanagerclass_struct_get_changed (a_structure: POINTER): POINTER is
			-- Query for changed field of GTKRECENTMANAGERCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentmanagerclass_struct_get_changed"
		}"
		end

	-- Unwrappable field _gtk_recent1.
	-- Unwrappable field _gtk_recent2.
	-- Unwrappable field _gtk_recent3.
	-- Unwrappable field _gtk_recent4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentManagerClass"
		}"
		end

end -- class GTKRECENTMANAGERCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

