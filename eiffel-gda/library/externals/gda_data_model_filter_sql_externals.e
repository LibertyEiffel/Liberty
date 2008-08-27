-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_FILTER_SQL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_filter_sql_run (a_sel: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_set_sql (a_sel: POINTER; a_sql: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_add_source (a_sel: POINTER; a_name: POINTER; a_source: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_new: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
