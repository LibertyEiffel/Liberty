-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_QUERY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_query_compute_modification_queries (a_model: POINTER; a_target: POINTER; an_options: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_set_modification_query (a_model: POINTER; a_mod_stmt: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_refresh (a_model: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_get_parameter_list (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_new (a_cnc: POINTER; a_select_stmt: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_query_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
