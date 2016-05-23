-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SERVER_OPERATION_NODE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_server_operation_node_paramlist) or else 
				(a_value = gda_server_operation_node_data_model) or else 
				(a_value = gda_server_operation_node_param) or else 
				(a_value = gda_server_operation_node_sequence) or else 
				(a_value = gda_server_operation_node_sequence_item) or else 
				(a_value = gda_server_operation_node_data_model_column) or else 
				(a_value = gda_server_operation_node_unknown))
		end


feature {ANY} -- Setters
	default_create, set_paramlist is
		do
			value := gda_server_operation_node_paramlist
		end

	set_data_model is
		do
			value := gda_server_operation_node_data_model
		end

	set_param is
		do
			value := gda_server_operation_node_param
		end

	set_sequence is
		do
			value := gda_server_operation_node_sequence
		end

	set_sequence_item is
		do
			value := gda_server_operation_node_sequence_item
		end

	set_data_model_column is
		do
			value := gda_server_operation_node_data_model_column
		end

	set_unknown is
		do
			value := gda_server_operation_node_unknown
		end


feature {ANY} -- Queries
	is_paramlist: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_paramlist)
		end

	is_data_model: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_data_model)
		end

	is_param: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_param)
		end

	is_sequence: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_sequence)
		end

	is_sequence_item: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_sequence_item)
		end

	is_data_model_column: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_data_model_column)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=gda_server_operation_node_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_server_operation_node_paramlist: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_PARAMLIST"
		end

	gda_server_operation_node_data_model: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_DATA_MODEL"
		end

	gda_server_operation_node_param: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_PARAM"
		end

	gda_server_operation_node_sequence: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_SEQUENCE"
		end

	gda_server_operation_node_sequence_item: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_SEQUENCE_ITEM"
		end

	gda_server_operation_node_data_model_column: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_DATA_MODEL_COLUMN"
		end

	gda_server_operation_node_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_NODE_UNKNOWN"
		end


end

