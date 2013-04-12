-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKKEYMAP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkkeymap_struct_set_display (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display field of GDKKEYMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymap_struct_set_display"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkkeymap_struct_get_display (a_structure: POINTER): POINTER is
			-- Query for display field of GDKKEYMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkkeymap_struct_get_display"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkKeymap"
		}"
		end

end -- class GDKKEYMAP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

