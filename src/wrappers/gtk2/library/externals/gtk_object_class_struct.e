-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_OBJECT_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_object_class_struct_set_set_arg (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set_arg field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_set_set_arg"
		}"
		end

	gtk_object_class_struct_set_get_arg (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_arg field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_set_get_arg"
		}"
		end

	gtk_object_class_struct_set_destroy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for destroy field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_set_destroy"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_object_class_struct_get_set_arg (a_structure: POINTER): POINTER is
			-- Query for set_arg field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_get_set_arg"
		}"
		end

	gtk_object_class_struct_get_get_arg (a_structure: POINTER): POINTER is
			-- Query for get_arg field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_get_get_arg"
		}"
		end

	gtk_object_class_struct_get_destroy (a_structure: POINTER): POINTER is
			-- Query for destroy field of GTK_OBJECT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_class_struct_get_destroy"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkObjectClass"
		}"
		end

end -- class GTK_OBJECT_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

