-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_OBJECT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_object_get_int_id (a_qobj: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_object_set_int_id (a_qobj: POINTER; an_id: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_object_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
