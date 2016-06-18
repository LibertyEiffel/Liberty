-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_STATEMENT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_statement_normalize (a_stmt: POINTER; a_cnc: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_check_validity (a_stmt: POINTER; a_cnc: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_check_structure (a_stmt: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_is_useless (a_stmt: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_get_statement_type (a_stmt: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_to_sql_extended (a_stmt: POINTER; a_cnc: POINTER; a_params: POINTER; a_flags: INTEGER_32; a_params_used: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_get_parameters (a_stmt: POINTER; an_out_params: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_deserialize (a_str: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_serialize (a_stmt: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_copy (an_orig: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_new: POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_statement_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
