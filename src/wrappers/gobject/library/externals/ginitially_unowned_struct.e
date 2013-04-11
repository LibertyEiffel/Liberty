-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GINITIALLY_UNOWNED_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	ginitially_unowned_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GINITIALLY_UNOWNED_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginitially_unowned_struct_set_ref_count"
		}"
		end

	ginitially_unowned_struct_set_qdata (a_structure: POINTER; a_value: POINTER) is
			-- Setter for qdata field of GINITIALLY_UNOWNED_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginitially_unowned_struct_set_qdata"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_type_instance.
	ginitially_unowned_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GINITIALLY_UNOWNED_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginitially_unowned_struct_get_ref_count"
		}"
		end

	ginitially_unowned_struct_get_qdata (a_structure: POINTER): POINTER is
			-- Query for qdata field of GINITIALLY_UNOWNED_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ginitially_unowned_struct_get_qdata"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GObject"
		}"
		end

end -- class GINITIALLY_UNOWNED_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

