-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPLUGCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkplugclass_struct_set_embedded (a_structure: POINTER; a_value: POINTER) is
			-- Setter for embedded field of GTKPLUGCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplugclass_struct_set_embedded"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkplugclass_struct_get_embedded (a_structure: POINTER): POINTER is
			-- Query for embedded field of GTKPLUGCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplugclass_struct_get_embedded"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPlugClass"
		}"
		end

end -- class GTKPLUGCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

