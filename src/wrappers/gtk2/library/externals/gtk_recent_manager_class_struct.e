-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_RECENT_MANAGER_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_recent_manager_class_struct_set_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for changed field of GTK_RECENT_MANAGER_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_class_struct_set_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_recent_manager_class_struct_get_changed (a_structure: POINTER): POINTER is
			-- Query for changed field of GTK_RECENT_MANAGER_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_class_struct_get_changed"
		}"
		end

	-- Unwrappable field _gtk_recent1.
	-- Unwrappable field _gtk_recent2.
	-- Unwrappable field _gtk_recent3.
	-- Unwrappable field _gtk_recent4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentManagerClass"
		}"
		end

end -- class GTK_RECENT_MANAGER_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

