-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_OBJECT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_object_unblock_changed (a_gdaobj: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_block_changed (a_gdaobj: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_signal_emit_changed (an_object: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_connect_destroy (a_gdaobj: POINTER; a_callback: POINTER; a_data: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_object_destroy_check (a_gdaobj: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_destroy (a_gdaobj: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_owner (a_gdaobj: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_description (a_gdaobj: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_name (a_gdaobj: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_id (a_gdaobj: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_owner (a_gdaobj: POINTER; an_owner: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_description (a_gdaobj: POINTER; a_descr: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_name (a_gdaobj: POINTER; a_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_set_id (a_gdaobj: POINTER; a_strid: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_dict (a_gdaobj: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_object_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
