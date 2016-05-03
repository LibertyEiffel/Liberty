-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_PARAMETER_LIST_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_parameter_list_get_param_default_value (a_paramlist: POINTER; a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_set_param_default_alias (a_paramlist: POINTER; a_param: POINTER; an_alias: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_set_param_default_value (a_paramlist: POINTER; a_param: POINTER; a_value: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_group_for_param (a_paramlist: POINTER; a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_source_for_param (a_paramlist: POINTER; a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_source (a_paramlist: POINTER; a_model: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_node_for_param (a_paramlist: POINTER; a_param: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_param (a_paramlist: POINTER; a_param_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_is_valid (a_paramlist: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_is_coherent (a_paramlist: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_merge (a_paramlist: POINTER; a_paramlist_to_merge: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_add_param_from_value (a_paramlist: POINTER; a_name: POINTER; a_value: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_add_param_from_string (a_paramlist: POINTER; a_name: POINTER; a_type: INTEGER_32; a_str: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_add_param (a_paramlist: POINTER; a_param: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_get_length (a_paramlist: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_get_spec (a_paramlist: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_new_from_spec_node (a_dict: POINTER; a_xml_spec: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_new_from_spec_string (a_dict: POINTER; a_xml_spec: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_new_inline (a_dict: POINTER; ): POINTER is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_new (a_params: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
