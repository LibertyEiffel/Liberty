-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_RENDERER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_renderer_is_valid (an_iface: POINTER; a_context: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_renderer_render_as_str (an_iface: POINTER; a_context: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_renderer_render_as_sql (an_iface: POINTER; a_context: POINTER; an_out_params_used: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_renderer_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
