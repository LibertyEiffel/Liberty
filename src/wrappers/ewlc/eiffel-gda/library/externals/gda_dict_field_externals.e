-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_FIELD_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_field_get_attributes (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_attributes (a_field: POINTER; an_attributes: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_fkey_alone (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_fkey_part (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_pkey_alone (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_pkey_part (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_null_allowed (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_default_value (a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_default_value (a_field: POINTER; a_value: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_constraints (a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_scale (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_scale (a_field: POINTER; a_length: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_length (a_field: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_length (a_field: POINTER; a_length: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_new (a_dict: POINTER; a_type: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
