-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONFIG_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_config_list_providers: POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_provider_object (a_provider_name: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_provider_info (a_provider_name: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_dsn_at_index (an_index: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_dsn_index (a_dsn_name: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_nb_dsn: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_can_modify_system_config: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_list_dsn: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_dsn_needs_authentication (a_dsn_name: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_remove_dsn (a_dsn_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_define_dsn (an_info: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_dsn (a_dsn_name: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_config_error_quark: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
