-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUARK_LIST_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_quark_list_foreach (a_qlist: POINTER; a_func: POINTER; an_user_data: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_clear (a_qlist: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_remove (a_qlist: POINTER; a_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_find (a_qlist: POINTER; a_name: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_add_from_string (a_qlist: POINTER; a_string: POINTER; a_cleanup: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_free (a_qlist: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_copy (a_qlist: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_new_from_string (a_string: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_new: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_quark_list_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
