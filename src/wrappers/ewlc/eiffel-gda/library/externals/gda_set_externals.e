-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_SET_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_set_get_group (a_set: POINTER; a_param: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_source (a_set: POINTER; a_param: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_source_for_model (a_set: POINTER; a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_node (a_set: POINTER; a_param: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_is_valid (a_set: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_merge_with_set (a_set: POINTER; a_set_to_merge: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_remove_holder (a_set: POINTER; a_holder: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_add_holder (a_set: POINTER; a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_holder (a_set: POINTER; a_holder_id: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_holder_value (a_set: POINTER; a_holder_id: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_set_holder_value (a_set: POINTER; a_holder_id: POINTER; ): INTEGER_32
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_spec (a_set: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_new_from_spec_node (a_xml_spec: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_new_from_spec_string (a_xml_spec: POINTER; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_new_inline (a_nb: INTEGER_32; ): POINTER
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_copy (a_set: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_new (a_holders: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_set_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
