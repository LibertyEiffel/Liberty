-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class SQL_PARSER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	sql_statement_get_wherejoin_components (a_wherejoin: POINTER; a_table: POINTER; a_field: POINTER; a_leftside: CHARACTER) is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_test_wherejoin: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_free_wherejoin (a_wherelist: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_get_wherejoin (a_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_get_first_table (a_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_free_fields (a_fields: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_free_tables (a_tables: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_get_tables (a_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_get_fields (a_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_append_where (a_statement: POINTER; a_leftfield: POINTER; a_rightfield: POINTER; a_logicopr: INTEGER_32; a_condopr: INTEGER_32): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_append_tablejoin (a_statement: POINTER; a_lefttable: POINTER; a_righttable: POINTER; a_leftfield: POINTER; a_rightfield: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	sql_statement_append_field (a_statement: POINTER; a_tablename: POINTER; a_fieldname: POINTER; an_as: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	sql_parse_with_error (a_sql_statement: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_parse (a_sql_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_stringify (a_statement: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	sql_destroy (a_statement: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	sql_display (a_statement: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
