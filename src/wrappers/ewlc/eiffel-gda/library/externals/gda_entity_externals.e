-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_ENTITY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_entity_is_writable (an_iface: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_entity_remove_field (an_iface: POINTER; a_field: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_entity_swap_fields (an_iface: POINTER; a_field1: POINTER; a_field2: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_entity_add_field_before (an_iface: POINTER; a_field: POINTER; a_field_before: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_entity_add_field (an_iface: POINTER; a_field: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_field_index (an_iface: POINTER; a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_field_by_index (an_iface: POINTER; an_index: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_field_by_xml_id (an_iface: POINTER; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_field_by_name (an_iface: POINTER; a_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_n_fields (an_iface: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_fields (an_iface: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_entity_has_field (an_iface: POINTER; a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_entity_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
