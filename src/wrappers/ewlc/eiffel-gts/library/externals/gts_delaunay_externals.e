note
	description: "External calls for GTS Delaunay triangulations"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_DELAUNAY_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- #include <gts.h>

	-- #define GTS_CONSTRAINT_CLASS (klass)
	-- #define GTS_CONSTRAINT (obj)
	-- #define GTS_IS_CONSTRAINT (obj)
	
	-- GtsConstraintClass;
	-- GtsConstraint;

	gts_constraint_class: POINTER is
			-- GtsConstraintClass* gts_constraint_class (void);
		external "C use <gts.h>"
		end
	
	gts_delaunay_add_vertex (a_surface, a_vertex, a_guess_face: POINTER): POINTER is
			-- GtsVertex* gts_delaunay_add_vertex (GtsSurface *surface,
			-- GtsVertex *v, GtsFace *guess);
		external "C use <gts.h>"
		end

	gts_delaunay_add_vertex_to_face (a_surface, a_vertex, a_face: POINTER): POINTER is
			-- GtsVertex* gts_delaunay_add_vertex_to_face (GtsSurface
			-- *surface, GtsVertex *v, GtsFace *f);
		external "C use <gts.h>"
		end
	
	gts_delaunay_remove_vertex (a_surface, a_vertex: POINTER) is
			-- void gts_delaunay_remove_vertex (GtsSurface *surface,
			-- GtsVertex *v);
		external "C use <gts.h>"
		end
	
	gts_delaunay_add_constraint (a_surface, a_constraint: POINTER): POINTER is
			-- GSList* gts_delaunay_add_constraint (GtsSurface *surface,
			-- GtsConstraint *c);
		external "C use <gts.h>"
		end
	
	gts_delaunay_check (a_surface: POINTER): POINTER is
			-- GtsFace* gts_delaunay_check (GtsSurface *surface);
		external "C use <gts.h>"
		end
	
	gts_delaunay_remove_hull (a_surface: POINTER) is
			-- void gts_delaunay_remove_hull (GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_delaunay_conform (a_surface: POINTER; steiner_max: INTEGER;  an_encroach_func, some_data: POINTER): INTEGER is
			-- guint gts_delaunay_conform (GtsSurface *surface, gint
			-- steiner_max, GtsEncroachFunc encroaches, gpointer data);

			-- TODO: Result should be guint
		external "C use <gts.h>"
		end
	
	gts_delaunay_refine (a_surface: POINTER; a_steiner_max: INTEGER; an_encroach_func, encroach_data, a_key_func, some_cost_data: POINTER): INTEGER is
			-- guint gts_delaunay_refine (GtsSurface *surface, gint
			-- steiner_max, GtsEncroachFunc encroaches, gpointer
			-- encroach_data, GtsKeyFunc cost, gpointer cost_data);

			-- TODO: Result should be a guint
	external "C use <gts.h>"
	end
end -- GTS_DELAUNAY_EXTERNALS
