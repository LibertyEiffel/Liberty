-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_ENTITY_FIELD_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_entity_field_get_description (an_iface: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_get_name (an_iface: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_get_dict_type (an_iface: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_set_dict_type (an_iface: POINTER; a_type: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_get_g_type (an_iface: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_get_entity (an_iface: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_entity_field_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
