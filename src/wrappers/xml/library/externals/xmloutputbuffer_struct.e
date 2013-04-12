-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLOUTPUTBUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmloutputbuffer_struct_set_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for context field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_context"
		}"
		end

	xmloutputbuffer_struct_set_writecallback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for writecallback field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_writecallback"
		}"
		end

	xmloutputbuffer_struct_set_closecallback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closecallback field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_closecallback"
		}"
		end

	xmloutputbuffer_struct_set_encoder (a_structure: POINTER; a_value: POINTER) is
			-- Setter for encoder field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_encoder"
		}"
		end

	xmloutputbuffer_struct_set_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffer field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_buffer"
		}"
		end

	xmloutputbuffer_struct_set_conv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for conv field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_conv"
		}"
		end

	xmloutputbuffer_struct_set_written (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for written field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_written"
		}"
		end

	xmloutputbuffer_struct_set_error (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for error field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_set_error"
		}"
		end

feature {} -- Low-level queries

	xmloutputbuffer_struct_get_context (a_structure: POINTER): POINTER is
			-- Query for context field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_context"
		}"
		end

	xmloutputbuffer_struct_get_writecallback (a_structure: POINTER): POINTER is
			-- Query for writecallback field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_writecallback"
		}"
		end

	xmloutputbuffer_struct_get_closecallback (a_structure: POINTER): POINTER is
			-- Query for closecallback field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_closecallback"
		}"
		end

	xmloutputbuffer_struct_get_encoder (a_structure: POINTER): POINTER is
			-- Query for encoder field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_encoder"
		}"
		end

	xmloutputbuffer_struct_get_buffer (a_structure: POINTER): POINTER is
			-- Query for buffer field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_buffer"
		}"
		end

	xmloutputbuffer_struct_get_conv (a_structure: POINTER): POINTER is
			-- Query for conv field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_conv"
		}"
		end

	xmloutputbuffer_struct_get_written (a_structure: POINTER): INTEGER_32 is
			-- Query for written field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_written"
		}"
		end

	xmloutputbuffer_struct_get_error (a_structure: POINTER): INTEGER_32 is
			-- Query for error field of XMLOUTPUTBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmloutputbuffer_struct_get_error"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlOutputBuffer"
		}"
		end

end -- class XMLOUTPUTBUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

