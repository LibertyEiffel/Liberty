-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SERVER_OPERATION_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_server_operation_is_valid (an_op: POINTER; a_xml_file: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_del_item_from_sequence (an_op: POINTER; an_item_path: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_add_item_to_sequence (an_op: POINTER; a_path: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_sequence_item_names (an_op: POINTER; a_path: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_sequence_min_size (an_op: POINTER; a_path: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_sequence_max_size (an_op: POINTER; a_path: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_sequence_size (an_op: POINTER; a_path: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_sequence_name (an_op: POINTER; a_path: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_node_path_portion (an_op: POINTER; a_path: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_node_parent (an_op: POINTER; a_path: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_node_type (an_op: POINTER; a_path: POINTER; a_status: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_root_nodes (an_op: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_load_data_from_xml (an_op: POINTER; a_node: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_save_data_to_xml (an_op: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_set_value_at (an_op: POINTER; a_value: POINTER; an_error: POINTER; a_path_format: POINTER; ): INTEGER_32 is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_value_at (an_op: POINTER; a_path_format: POINTER; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_node_info (an_op: POINTER; a_path_format: POINTER; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_op_type_to_string (a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_op_type (an_op: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_new (an_op_type: INTEGER_32; a_xml_file: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_operation_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
