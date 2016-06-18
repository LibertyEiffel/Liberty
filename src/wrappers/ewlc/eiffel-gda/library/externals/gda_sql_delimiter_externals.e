-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SQL_DELIMITER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_delimiter_parse_copy_statement (a_statement: POINTER; a_repl: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_concat_list (a_statements: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_free_list (a_statements: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_split_sql (a_sql_text: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_parse_with_error (a_sql_text: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_parse (a_sql_text: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_destroy (a_statement: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_to_string (a_statement: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_delimiter_display (a_statement: POINTER)
		external "C use <libgda/libgda.h>"
		end

end
