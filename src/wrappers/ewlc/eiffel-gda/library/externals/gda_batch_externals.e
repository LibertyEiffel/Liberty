-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_BATCH_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_batch_get_parameters (a_batch: POINTER; an_out_params: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_get_statements (a_batch: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_serialize (a_batch: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_remove_statement (a_batch: POINTER; a_stmt: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_add_statement (a_batch: POINTER; a_stmt: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_copy (an_orig: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_new: POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_batch_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
