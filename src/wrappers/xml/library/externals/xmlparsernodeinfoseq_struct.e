-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLPARSERNODEINFOSEQ_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlparsernodeinfoseq_struct_set_maximum (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for maximum field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_set_maximum"
		}"
		end

	xmlparsernodeinfoseq_struct_set_length (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for length field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_set_length"
		}"
		end

	xmlparsernodeinfoseq_struct_set_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffer field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_set_buffer"
		}"
		end

feature {} -- Low-level queries

	xmlparsernodeinfoseq_struct_get_maximum (a_structure: POINTER): NATURAL_32 is
			-- Query for maximum field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_get_maximum"
		}"
		end

	xmlparsernodeinfoseq_struct_get_length (a_structure: POINTER): NATURAL_32 is
			-- Query for length field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_get_length"
		}"
		end

	xmlparsernodeinfoseq_struct_get_buffer (a_structure: POINTER): POINTER is
			-- Query for buffer field of XMLPARSERNODEINFOSEQ_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparsernodeinfoseq_struct_get_buffer"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlParserNodeInfoSeq"
		}"
		end

end -- class XMLPARSERNODEINFOSEQ_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

