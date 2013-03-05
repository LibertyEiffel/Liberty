-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLPARSERINPUTBUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlparserinputbuffer_struct_set_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for context field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_context"
		}"
		end

	xmlparserinputbuffer_struct_set_readcallback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for readcallback field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_readcallback"
		}"
		end

	xmlparserinputbuffer_struct_set_closecallback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closecallback field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_closecallback"
		}"
		end

	xmlparserinputbuffer_struct_set_encoder (a_structure: POINTER; a_value: POINTER) is
			-- Setter for encoder field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_encoder"
		}"
		end

	xmlparserinputbuffer_struct_set_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffer field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_buffer"
		}"
		end

	xmlparserinputbuffer_struct_set_raw (a_structure: POINTER; a_value: POINTER) is
			-- Setter for raw field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_raw"
		}"
		end

	xmlparserinputbuffer_struct_set_compressed (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for compressed field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_compressed"
		}"
		end

	xmlparserinputbuffer_struct_set_error (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for error field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_error"
		}"
		end

	xmlparserinputbuffer_struct_set_rawconsumed (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for rawconsumed field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_set_rawconsumed"
		}"
		end

feature {} -- Low-level queries

	xmlparserinputbuffer_struct_get_context (a_structure: POINTER): POINTER is
			-- Query for context field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_context"
		}"
		end

	xmlparserinputbuffer_struct_get_readcallback (a_structure: POINTER): POINTER is
			-- Query for readcallback field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_readcallback"
		}"
		end

	xmlparserinputbuffer_struct_get_closecallback (a_structure: POINTER): POINTER is
			-- Query for closecallback field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_closecallback"
		}"
		end

	xmlparserinputbuffer_struct_get_encoder (a_structure: POINTER): POINTER is
			-- Query for encoder field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_encoder"
		}"
		end

	xmlparserinputbuffer_struct_get_buffer (a_structure: POINTER): POINTER is
			-- Query for buffer field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_buffer"
		}"
		end

	xmlparserinputbuffer_struct_get_raw (a_structure: POINTER): POINTER is
			-- Query for raw field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_raw"
		}"
		end

	xmlparserinputbuffer_struct_get_compressed (a_structure: POINTER): INTEGER_32 is
			-- Query for compressed field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_compressed"
		}"
		end

	xmlparserinputbuffer_struct_get_error (a_structure: POINTER): INTEGER_32 is
			-- Query for error field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_error"
		}"
		end

	xmlparserinputbuffer_struct_get_rawconsumed (a_structure: POINTER): NATURAL_32 is
			-- Query for rawconsumed field of XMLPARSERINPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlparserinputbuffer_struct_get_rawconsumed"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlParserInputBuffer"
		}"
		end

end -- class XMLPARSERINPUTBUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

