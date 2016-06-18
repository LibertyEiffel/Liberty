-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_HOLDER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_holder_get_bind (a_holder: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_bind (a_holder: POINTER; a_bind_to: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_source_model (a_holder: POINTER; a_col: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_source_model (a_holder: POINTER; a_model: POINTER; a_col: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_not_null (a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_not_null (a_holder: POINTER; a_not_null: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_is_valid (a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_force_invalid (a_holder: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_value_is_default (a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_value_to_default (a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_default_value (a_holder: POINTER; a_value: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_default_value (a_holder: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_value_str (a_holder: POINTER; a_dh: POINTER; a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_take_value (a_holder: POINTER; a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_set_value (a_holder: POINTER; a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_value_str (a_holder: POINTER; a_dh: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_value (a_holder: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_id (a_holder: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_g_type (a_holder: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_copy (an_orig: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_new_inline (a_type: INTEGER_32; an_id: POINTER; ): POINTER
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_new (a_type: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_holder_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
