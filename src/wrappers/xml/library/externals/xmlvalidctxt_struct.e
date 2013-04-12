-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLVALIDCTXT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xmlvalidctxt_struct_set_userdata (a_structure: POINTER; a_value: POINTER) is
			-- Setter for userData field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_userdata"
		}"
		end

	xmlvalidctxt_struct_set_error (a_structure: POINTER; a_value: POINTER) is
			-- Setter for error field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_error"
		}"
		end

	xmlvalidctxt_struct_set_warning (a_structure: POINTER; a_value: POINTER) is
			-- Setter for warning field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_warning"
		}"
		end

	xmlvalidctxt_struct_set_node (a_structure: POINTER; a_value: POINTER) is
			-- Setter for node field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_node"
		}"
		end

	xmlvalidctxt_struct_set_nodenr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeNr field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_nodenr"
		}"
		end

	xmlvalidctxt_struct_set_nodemax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for nodeMax field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_nodemax"
		}"
		end

	xmlvalidctxt_struct_set_nodetab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nodeTab field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_nodetab"
		}"
		end

	xmlvalidctxt_struct_set_finishdtd (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for finishDtd field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_finishdtd"
		}"
		end

	xmlvalidctxt_struct_set_doc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for doc field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_doc"
		}"
		end

	xmlvalidctxt_struct_set_valid (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for valid field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_valid"
		}"
		end

	xmlvalidctxt_struct_set_vstate (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vstate field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_vstate"
		}"
		end

	xmlvalidctxt_struct_set_vstatenr (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for vstateNr field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_vstatenr"
		}"
		end

	xmlvalidctxt_struct_set_vstatemax (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for vstateMax field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_vstatemax"
		}"
		end

	xmlvalidctxt_struct_set_vstatetab (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vstateTab field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_vstatetab"
		}"
		end

	xmlvalidctxt_struct_set_am (a_structure: POINTER; a_value: POINTER) is
			-- Setter for am field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_am"
		}"
		end

	xmlvalidctxt_struct_set_state (a_structure: POINTER; a_value: POINTER) is
			-- Setter for state field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_set_state"
		}"
		end

feature {} -- Low-level queries

	xmlvalidctxt_struct_get_userdata (a_structure: POINTER): POINTER is
			-- Query for userData field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_userdata"
		}"
		end

	xmlvalidctxt_struct_get_error (a_structure: POINTER): POINTER is
			-- Query for error field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_error"
		}"
		end

	xmlvalidctxt_struct_get_warning (a_structure: POINTER): POINTER is
			-- Query for warning field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_warning"
		}"
		end

	xmlvalidctxt_struct_get_node (a_structure: POINTER): POINTER is
			-- Query for node field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_node"
		}"
		end

	xmlvalidctxt_struct_get_nodenr (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeNr field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_nodenr"
		}"
		end

	xmlvalidctxt_struct_get_nodemax (a_structure: POINTER): INTEGER_32 is
			-- Query for nodeMax field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_nodemax"
		}"
		end

	xmlvalidctxt_struct_get_nodetab (a_structure: POINTER): POINTER is
			-- Query for nodeTab field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_nodetab"
		}"
		end

	xmlvalidctxt_struct_get_finishdtd (a_structure: POINTER): NATURAL_32 is
			-- Query for finishDtd field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_finishdtd"
		}"
		end

	xmlvalidctxt_struct_get_doc (a_structure: POINTER): POINTER is
			-- Query for doc field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_doc"
		}"
		end

	xmlvalidctxt_struct_get_valid (a_structure: POINTER): INTEGER_32 is
			-- Query for valid field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_valid"
		}"
		end

	xmlvalidctxt_struct_get_vstate (a_structure: POINTER): POINTER is
			-- Query for vstate field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_vstate"
		}"
		end

	xmlvalidctxt_struct_get_vstatenr (a_structure: POINTER): INTEGER_32 is
			-- Query for vstateNr field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_vstatenr"
		}"
		end

	xmlvalidctxt_struct_get_vstatemax (a_structure: POINTER): INTEGER_32 is
			-- Query for vstateMax field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_vstatemax"
		}"
		end

	xmlvalidctxt_struct_get_vstatetab (a_structure: POINTER): POINTER is
			-- Query for vstateTab field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_vstatetab"
		}"
		end

	xmlvalidctxt_struct_get_am (a_structure: POINTER): POINTER is
			-- Query for am field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_am"
		}"
		end

	xmlvalidctxt_struct_get_state (a_structure: POINTER): POINTER is
			-- Query for state field of XMLVALIDCTXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlvalidctxt_struct_get_state"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xmlValidCtxt"
		}"
		end

end -- class XMLVALIDCTXT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

