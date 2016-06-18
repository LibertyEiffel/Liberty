-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_VALUE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_ushort_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_short_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_list_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_blob_set_op (a_blob: POINTER; an_op: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_blob_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_blob_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_blob_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_binary_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_binary_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_binary_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_geometricpoint_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_geometricpoint_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_geometricpoint_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_timestamp_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_timestamp_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_timestamp_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_time_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_time_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_time_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_numeric_free (a_boxed: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_numeric_copy (a_boxed: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_numeric_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_string_to_blob (a_str: POINTER; a_blob: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_blob_to_string (a_blob: POINTER; a_maxlen: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_string_to_binary (a_str: POINTER; a_bin: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_binary_to_string (a_bin: POINTER; a_maxlen: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_to_xml (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_stringify (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_compare_ext (a_value1: POINTER; a_value2: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_compare (a_value1: POINTER; a_value2: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_bcompare (a_value1: POINTER; a_value2: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_from_value (a_value: POINTER; a_from: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_from_string (a_value: POINTER; an_as_string: POINTER; a_type: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_timestamp (a_value: POINTER; a_val: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_timestamp (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_time (a_value: POINTER; a_val: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_time (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_ushort (a_value: POINTER; a_val: INTEGER_16)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_ushort (a_value: POINTER): INTEGER_16
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_short (a_value: POINTER; a_val: INTEGER_16)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_short (a_value: POINTER): INTEGER_16
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_numeric (a_value: POINTER; a_val: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_numeric (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_null (a_value: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_list (a_value: POINTER; a_val: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_list (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_geometric_point (a_value: POINTER; a_val: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_geometric_point (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_take_blob (a_value: POINTER; a_blob: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_blob (a_value: POINTER; a_blob: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_blob (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_take_binary (a_value: POINTER; a_binary: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_set_binary (a_value: POINTER; a_binary: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_get_binary (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_copy (a_value: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_is_number (a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_is_null (a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_reset_with_type (a_value: POINTER; a_type: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_free (a_value: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new_from_xml (a_node: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new_from_string (an_as_string: POINTER; a_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new_timestamp_from_timet (a_val: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new_blob (a_val: POINTER; a_size: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new_binary (a_val: POINTER; a_size: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_value_new (a_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

end
