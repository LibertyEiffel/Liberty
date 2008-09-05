-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_HANDLER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_handler_get_descr (a_dh: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_accepts_g_type (a_dh: POINTER; a_type: INTEGER_32): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_g_type_index (a_dh: POINTER; an_index: INTEGER_32): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_nb_g_types (a_dh: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_sane_init_value (a_dh: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_value_from_str (a_dh: POINTER; a_str: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_value_from_sql (a_dh: POINTER; a_sql: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_str_from_value (a_dh: POINTER; a_value: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_sql_from_value (a_dh: POINTER; a_value: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_handler_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
