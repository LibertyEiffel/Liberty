-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ARG_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_arg_struct_set_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for type field of GTK_ARG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arg_struct_set_type"
		}"
		end

	gtk_arg_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GTK_ARG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arg_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	gtk_arg_struct_get_type (a_structure: POINTER): NATURAL_32 is
			-- Query for type field of GTK_ARG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arg_struct_get_type"
		}"
		end

	gtk_arg_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GTK_ARG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arg_struct_get_name"
		}"
		end

	-- Unwrappable field d.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkArg"
		}"
		end

end -- class GTK_ARG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

