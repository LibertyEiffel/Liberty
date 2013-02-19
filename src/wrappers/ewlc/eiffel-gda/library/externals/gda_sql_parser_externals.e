-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SQL_PARSER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_sql_parser_set_overflow_error (a_parser: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_set_syntax_error (a_parser: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_parse_file_as_batch (a_parser: POINTER; a_filename: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_parse_string_as_batch (a_parser: POINTER; a_sql: POINTER; a_remain: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_parse_string (a_parser: POINTER; a_sql: POINTER; a_remain: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_new: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_sql_parser_error_quark: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
