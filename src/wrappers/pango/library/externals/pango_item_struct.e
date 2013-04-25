-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_item_struct_set_offset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for offset field of PANGO_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_set_offset"
		}"
		end

	pango_item_struct_set_length (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for length field of PANGO_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_set_length"
		}"
		end

	pango_item_struct_set_num_chars (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for num_chars field of PANGO_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_set_num_chars"
		}"
		end

feature {} -- Low-level queries

	pango_item_struct_get_offset (a_structure: POINTER): INTEGER_32 is
			-- Query for offset field of PANGO_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_get_offset"
		}"
		end

	pango_item_struct_get_length (a_structure: POINTER): INTEGER_32 is
			-- Query for length field of PANGO_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_get_length"
		}"
		end

	pango_item_struct_get_num_chars (a_structure: POINTER): INTEGER_32 is
			-- Query for num_chars field of PANGO_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_item_struct_get_num_chars"
		}"
		end

	-- Unwrappable field analysis.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoItem"
		}"
		end

end -- class PANGO_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

