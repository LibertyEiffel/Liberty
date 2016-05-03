note
	description: "External calls for GTS_CONSTRAINT"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_CONSTRAINT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	--  #define GTS_CONSTRAINT_CLASS (klass)
	--  #define GTS_CONSTRAINT (obj)
	--  #define GTS_IS_CONSTRAINT (obj)
	--  GtsConstraintClass;

	gts_constraint_class: POINTER is
			--  GtsConstraintClass* gts_constraint_class (void);
		external "C use <gts.h>"
		end
	
	gts_point_locate (a_point, a_surface, a_guess_face: POINTER): POINTER is
			-- GtsFace* gts_point_locate (GtsPoint *p, GtsSurface
			-- *surface, GtsFace *guess);
		external "C use <gts.h>"
		end

	gts_delaunay_add_vertex (a_surface, a_vertex, a_guess_face: POINTER): POINTER is
			-- GtsVertex* gts_delaunay_add_vertex (GtsSurface *surface, GtsVertex
			-- *v, GtsFace *guess);
		external "C use <gts.h>"
		end
	
	gts_delaunay_add_vertex_to_face (surface, v, f: POINTER): POINTER is
			-- GtsVertex* gts_delaunay_add_vertex_to_face (GtsSurface *surface,
			-- GtsVertex *v, GtsFace *f);
		external "C use <gts.h>"
		end
	
	gts_delaunay_remove_vertex (surface, v: POINTER) is
			--  void gts_delaunay_remove_vertex (GtsSurface *surface, GtsVertex *v);
		external "C use <gts.h>"
		end

  gts_delaunay_add_constraint (surface, c: POINTER): POINTER is
			-- GSList* gts_delaunay_add_constraint (GtsSurface *surface,
			-- GtsConstraint *c);
		external "C use <gts.h>"
		end

	gts_delaunay_check (surface: POINTER): POINTER is
			-- GtsFace* gts_delaunay_check (GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_delaunay_remove_hull (surface: POINTER) is
			--  void gts_delaunay_remove_hull (GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_delaunay_conform (surface: POINTER; a_steiner_max: INTEGER; a_gtsencroachfunc, some_data: POINTER): INTEGER is
			-- guint gts_delaunay_conform (GtsSurface *surface, gint steiner_max,
			-- GtsEncroachFunc encroaches, gpointer data);

			-- TODO: should be NATURAL since it is a guint
		external "C use <gts.h>"
		end
	
	gts_delaunay_refine (surface: POINTER; a_steiner_max: INTEGER; a_gtsencroachfunc, some_encroach_data, a_gtskeyfunc, some_cost_data: POINTER): INTEGER is
			-- guint gts_delaunay_refine (GtsSurface *surface, gint steiner_max,
			-- GtsEncroachFunc encroaches, gpointer encroach_data, GtsKeyFunc cost,
			-- gpointer cost_data);

			-- TODO: should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsConstraint)"
		end
end
