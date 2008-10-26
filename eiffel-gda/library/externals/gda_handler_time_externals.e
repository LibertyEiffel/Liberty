-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_HANDLER_TIME_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_handler_time_get_format (a_dh: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_time_get_no_locale_str_from_value (a_dh: POINTER; a_value: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_time_set_sql_spec (a_dh: POINTER; a_first: INTEGER_32; a_sec: INTEGER_32; a_third: INTEGER_32; a_separator: CHARACTER; a_twodigits_years: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_time_new_no_locale: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_time_new: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_time_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
