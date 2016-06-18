note
	description: "External calls for GTS_SURFACE_TRAVERSE"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SURFACE_TRAVERSE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gts_surface_traverse_new (a_s, a_f: POINTER): POINTER
			-- GtsSurfaceTraverse* gts_surface_traverse_new (GtsSurface *s, GtsFace *f);
		external "C use <gts.h>"
		end
	
	gts_surface_traverse_next (a_t, a_level: POINTER): POINTER
			-- GtsFace* gts_surface_traverse_next (GtsSurfaceTraverse *t, guint *level);
		external "C use <gts.h>"
		end

	gts_surface_traverse_destroy (a_t: POINTER)
			-- void gts_surface_traverse_destroy (GtsSurfaceTraverse *t);
		external "C use <gts.h>"
		end
	
feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurfaceTraverse)"
		end
end
