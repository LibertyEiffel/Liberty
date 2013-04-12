-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKCURSOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkcursor_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKCURSOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcursor_struct_set_type"
		}"
		end

	gdkcursor_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GDKCURSOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcursor_struct_set_ref_count"
		}"
		end

feature {} -- Low-level queries

	gdkcursor_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKCURSOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcursor_struct_get_type"
		}"
		end

	gdkcursor_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GDKCURSOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcursor_struct_get_ref_count"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkCursor"
		}"
		end

end -- class GDKCURSOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

