-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONNECTION_EVENT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_event_set_sqlstate (an_event: POINTER; a_sqlstate: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_sqlstate (an_event: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_set_source (an_event: POINTER; a_source: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_source (an_event: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_set_gda_code (an_event: POINTER; a_code: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_gda_code (an_event: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_set_code (an_event: POINTER; a_code: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_code (an_event: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_set_description (an_event: POINTER; a_description: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_description (an_event: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_event_type (an_event: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_set_event_type (an_event: POINTER; a_type: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_new (a_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_event_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
