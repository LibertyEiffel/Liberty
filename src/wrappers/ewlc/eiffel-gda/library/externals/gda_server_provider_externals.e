-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SERVER_PROVIDER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_server_provider_create_parser (a_provider: POINTER; a_cnc: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_perform_operation (a_provider: POINTER; a_cnc: POINTER; an_op: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_render_operation (a_provider: POINTER; a_cnc: POINTER; an_op: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_create_operation (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32; an_options: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_supports_operation (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32; an_options: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_unescape_string (a_provider: POINTER; a_cnc: POINTER; a_str: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_escape_string (a_provider: POINTER; a_cnc: POINTER; a_str: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_default_dbms_type (a_provider: POINTER; a_cnc: POINTER; a_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_value_to_sql_string (a_provider: POINTER; a_cnc: POINTER; a_from: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_string_to_value (a_provider: POINTER; a_cnc: POINTER; a_string: POINTER; a_prefered_type: INTEGER_32; a_dbms_type: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_data_handler_dbms (a_provider: POINTER; a_cnc: POINTER; a_for_type: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_data_handler_gtype (a_provider: POINTER; a_cnc: POINTER; a_for_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_supports_feature (a_provider: POINTER; a_cnc: POINTER; a_feature: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_server_version (a_provider: POINTER; a_cnc: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_version (a_provider: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_name (a_provider: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_server_provider_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
