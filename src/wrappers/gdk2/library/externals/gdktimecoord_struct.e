-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKTIMECOORD_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdktimecoord_struct_set_time (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for time field of GDKTIMECOORD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdktimecoord_struct_set_time"
		}"
		end

	gdktimecoord_struct_set_axes (a_structure: POINTER; a_value: POINTER) is
			-- Setter for axes field of GDKTIMECOORD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdktimecoord_struct_set_axes"
		}"
		end

feature {} -- Low-level queries

	gdktimecoord_struct_get_time (a_structure: POINTER): NATURAL_32 is
			-- Query for time field of GDKTIMECOORD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdktimecoord_struct_get_time"
		}"
		end

	gdktimecoord_struct_get_axes (a_structure: POINTER): POINTER is
			-- Query for axes field of GDKTIMECOORD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdktimecoord_struct_get_axes"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkTimeCoord"
		}"
		end

end -- class GDKTIMECOORD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

