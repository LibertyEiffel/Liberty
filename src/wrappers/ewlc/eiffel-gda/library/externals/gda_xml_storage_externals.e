-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_XML_STORAGE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_xml_storage_load_from_xml (an_iface: POINTER; a_node: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_xml_storage_save_to_xml (an_iface: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_xml_storage_get_xml_id (an_iface: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_xml_storage_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
