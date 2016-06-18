-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_THREADER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_threader_cancel (a_thread: POINTER; a_job_id: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_threader_start_thread (a_thread: POINTER; a_func: POINTER; a_func_arg: POINTER; an_ok_callback: POINTER; a_cancel_callback: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_threader_new: POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_threader_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
