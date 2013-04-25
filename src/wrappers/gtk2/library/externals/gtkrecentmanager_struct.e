-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTMANAGER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrecentmanager_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTKRECENTMANAGER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentmanager_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkrecentmanager_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTKRECENTMANAGER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentmanager_struct_get_priv"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentManager"
		}"
		end

end -- class GTKRECENTMANAGER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

