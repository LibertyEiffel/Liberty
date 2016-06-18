-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_REFERER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_referer_replace_refs (an_iface: POINTER; a_replacements: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_referer_get_ref_objects (an_iface: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_referer_is_active (an_iface: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_referer_deactivate (an_iface: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_referer_activate (an_iface: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_referer_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
