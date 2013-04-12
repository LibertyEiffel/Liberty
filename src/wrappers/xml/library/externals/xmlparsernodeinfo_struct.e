-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLPARSERNODEINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlparsernodeinfo_struct_set_node (a_structure: POINTER; a_value: POINTER) is
			-- Setter for node field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_set_node"
		}"
		end

	xmlparsernodeinfo_struct_set_begin_pos (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for begin_pos field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_set_begin_pos"
		}"
		end

	xmlparsernodeinfo_struct_set_begin_line (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for begin_line field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_set_begin_line"
		}"
		end

	xmlparsernodeinfo_struct_set_end_pos (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for end_pos field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_set_end_pos"
		}"
		end

	xmlparsernodeinfo_struct_set_end_line (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for end_line field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_set_end_line"
		}"
		end

feature {} -- Low-level queries

	xmlparsernodeinfo_struct_get_node (a_structure: POINTER): POINTER is
			-- Query for node field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_get_node"
		}"
		end

	xmlparsernodeinfo_struct_get_begin_pos (a_structure: POINTER): NATURAL_32 is
			-- Query for begin_pos field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_get_begin_pos"
		}"
		end

	xmlparsernodeinfo_struct_get_begin_line (a_structure: POINTER): NATURAL_32 is
			-- Query for begin_line field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_get_begin_line"
		}"
		end

	xmlparsernodeinfo_struct_get_end_pos (a_structure: POINTER): NATURAL_32 is
			-- Query for end_pos field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_get_end_pos"
		}"
		end

	xmlparsernodeinfo_struct_get_end_line (a_structure: POINTER): NATURAL_32 is
			-- Query for end_line field of XMLPARSERNODEINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfo_struct_get_end_line"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlParserNodeInfo"
		}"
		end

end -- class XMLPARSERNODEINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

