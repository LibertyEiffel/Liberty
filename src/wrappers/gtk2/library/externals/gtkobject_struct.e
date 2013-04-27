-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOBJECT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkobject_struct_set_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for flags field of GTKOBJECT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkobject_struct_set_flags"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkobject_struct_get_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for flags field of GTKOBJECT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkobject_struct_get_flags"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkObject"
		}"
		end

end -- class GTKOBJECT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

