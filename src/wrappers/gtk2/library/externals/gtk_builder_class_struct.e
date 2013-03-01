-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_BUILDER_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_builder_class_struct_set_get_type_from_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_type_from_name field of GTK_BUILDER_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_class_struct_set_get_type_from_name"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_builder_class_struct_get_get_type_from_name (a_structure: POINTER): POINTER is
			-- Query for get_type_from_name field of GTK_BUILDER_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_class_struct_get_get_type_from_name"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
	-- Unwrappable field _gtk_reserved5.
	-- Unwrappable field _gtk_reserved6.
	-- Unwrappable field _gtk_reserved7.
	-- Unwrappable field _gtk_reserved8.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBuilderClass"
		}"
		end

end -- class GTK_BUILDER_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

