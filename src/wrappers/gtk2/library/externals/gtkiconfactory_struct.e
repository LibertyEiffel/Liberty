-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKICONFACTORY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkiconfactory_struct_set_icons (a_structure: POINTER; a_value: POINTER) is
			-- Setter for icons field of GTKICONFACTORY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkiconfactory_struct_set_icons"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkiconfactory_struct_get_icons (a_structure: POINTER): POINTER is
			-- Query for icons field of GTKICONFACTORY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkiconfactory_struct_get_icons"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIconFactory"
		}"
		end

end -- class GTKICONFACTORY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

