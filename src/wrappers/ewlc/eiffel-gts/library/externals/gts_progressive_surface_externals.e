note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_PROGRESSIVE_SURFACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gts_is_psurface (a_pointer: POINTER): INTEGER
		external "C macro use <gts.h>"
		alias "GTS_IS_PSURFACE"
		end

	gts_psurface_is_closed (a_pointer: POINTER): INTEGER
		external "C macro use <gts.h>"
		alias "GTS_PSURFACE_IS_CLOSED"
		end


	gts_psurface_class: POINTER
			-- GtsPSurfaceClass* gts_psurface_class (void);
		external "C use <gts.h>"
		end

	gts_psurface_new (a_klass, a_surface, a_split_class, a_const_func, some_cost_data, a_coarsen_func, some_coarsen_data, a_stop_func, some_stop_data: POINTER; a_min_angle: REAL): POINTER
			-- GtsPSurface* gts_psurface_new (GtsPSurfaceClass *klass,
			-- GtsSurface *surface, GtsSplitClass *split_class,
			-- GtsKeyFunc cost_func, gpointer cost_data, GtsCoarsenFunc
			-- coarsen_func, gpointer coarsen_data, GtsStopFunc
			-- stop_func, gpointer stop_data, gdouble minangle);
		external "C use <gts.h>"
		end

	gts_psurface_add_vertex (a_ps: POINTER): POINTER
			-- GtsSplit* gts_psurface_add_vertex (GtsPSurface *ps);
		external "C use <gts.h>"
		end

	gts_psurface_remove_vertex (a_ps: POINTER): POINTER
			-- GtsSplit* gts_psurface_remove_vertex (GtsPSurface *ps);
		external "C use <gts.h>"
		end

	gts_psurface_set_vertex_number (a_ps: POINTER; an_n: INTEGER)
			-- void gts_psurface_set_vertex_number (GtsPSurface *ps,
			-- guint n);
		
			-- TODO: an_n should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_psurface_get_vertex_number (a_ps: POINTER): INTEGER
			-- guint gts_psurface_get_vertex_number (GtsPSurface *ps);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_psurface_min_vertex_number (a_ps: POINTER): INTEGER
			-- guint gts_psurface_min_vertex_number (GtsPSurface *ps);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_psurface_max_vertex_number (a_ps: POINTER): INTEGER
			-- guint gts_psurface_max_vertex_number (GtsPSurface *ps);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_psurface_foreach_vertex (a_ps, a_func, some_data: POINTER)
			-- void gts_psurface_foreach_vertex (GtsPSurface *ps, GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_psurface_open (a_klass, an_s, a_split_class, a_f: POINTER): POINTER
			-- GtsPSurface* gts_psurface_open (GtsPSurfaceClass *klass,
			-- GtsSurface *s, GtsSplitClass *split_class, GtsFile *f);
		external "C use <gts.h>"
		end

	gts_psurface_read_vertex (a_ps, a_fp: POINTER): POINTER
			-- GtsSplit* gts_psurface_read_vertex (GtsPSurface *ps,
			-- GtsFile *fp);
		external "C use <gts.h>"
		end

	gts_psurface_close (a_ps: POINTER)
			-- void gts_psurface_close (GtsPSurface *ps);
		external "C use <gts.h>"
		end

	gts_psurface_write (a_ps, a_fptr: POINTER)
			-- void gts_psurface_write (GtsPSurface *ps, FILE *fptr);
		external "C use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsPSurface)"
		end
end
