-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_OBJECT_REF_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_object_ref_is_active (a_ref: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_deactivate (a_ref: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_activate (a_ref: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_get_ref_object (a_ref: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_replace_ref_object (a_ref: POINTER; a_replacements: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_set_ref_object_type (a_ref: POINTER; an_object: POINTER; a_type: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_set_ref_object (a_ref: POINTER; an_object: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_get_ref_type (a_ref: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_get_ref_object_name (a_ref: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_get_ref_name (a_ref: POINTER; a_ref_type: POINTER; a_type: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_set_ref_name (a_ref: POINTER; a_ref_type: INTEGER_32; a_type: INTEGER_32; a_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_new_copy (an_orig: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_new_no_ref_count (a_dict: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_new (a_dict: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_object_ref_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
