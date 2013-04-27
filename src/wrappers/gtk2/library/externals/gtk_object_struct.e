-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_OBJECT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_object_struct_set_flags (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for flags field of GTK_OBJECT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_struct_set_flags"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_object_struct_get_flags (a_structure: POINTER): NATURAL is
			-- Query for flags field of GTK_OBJECT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_struct_get_flags"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkObject"
		}"
		end

end -- class GTK_OBJECT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

