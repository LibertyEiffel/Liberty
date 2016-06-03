note
	description: "Surface simplification and refinement -- reducing or increasing the number of edges of a triangulated."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTS team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class GTS_SURFACE_SIMPLIFICATION_AND_REFINEMENT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gts_surface_refine (a_surface, a_cost_func, a_cost_data, a_refine_func, a_refine_data, a_stop_func, a_stop_data: POINTER) is
			-- void gts_surface_refine (GtsSurface *surface, GtsKeyFunc cost_func,
			-- gpointer cost_data, GtsRefineFunc refine_func, gpointer refine_data,
			-- GtsStopFunc stop_func, gpointer stop_data);
		external "C use <gts.h>"
		end


	-- GtsVertex* (*GtsCoarsenFunc) (GtsEdge *e, GtsVertexClass *klass, gpointer
	-- data);
	
	-- GtsVertex* (*GtsRefineFunc) (GtsEdge *e, GtsVertexClass *klass, gpointer
	-- data);

	--  gboolean (*GtsStopFunc) (gdouble cost, guint nedge, gpointer data);

	gts_surface_coarsen (a_surface, a_cost_func, a_cost_data, a_coarsen_func, a_coarsen_data, a_stop_func, a_stop_data: POINTER; a_min_angle: REAL) is
			-- void gts_surface_coarsen (GtsSurface *surface, GtsKeyFunc cost_func,
			-- gpointer cost_data, GtsCoarsenFunc coarsen_func, gpointer
			-- coarsen_data, GtsStopFunc stop_func, gpointer stop_data, gdouble
			-- minangle);
		external "C use <gts.h>"
		end

	gts_coarsen_stop_number (a_cost: REAL; a_nedge: INTEGER; a_min_number: POINTER): INTEGER is
			-- gboolean gts_coarsen_stop_number (gdouble cost, guint nedge, guint
			-- *min_number);

			-- TODO: a_nedge should be NATURAL since it's a guint
		external "C use <gts.h>"
		end

	 gts_coarsen_stop_cost (a_cost: REAL; a_nedge: INTEGER; a_max_cost: POINTER): INTEGER is
			-- gboolean gts_coarsen_stop_cost (gdouble cost, guint nedge, gdouble
			-- *max_cost);

			-- TODO: a_nedge should be NATURAL since it's a guint
		external "C use <gts.h>"
		end


	--  GtsVolumeOptimizedParams;

	 gts_volume_optimized_vertex (a_edge, a_klass, a_params: POINTER): POINTER is
			-- GtsVertex* gts_volume_optimized_vertex (GtsEdge *edge,
			-- GtsVertexClass *klass, GtsVolumeOptimizedParams *params);
		external "C use <gts.h>"
		end

	 gts_volume_optimized_cost (an_edge, a_volumeoptimizedparams: POINTER): REAL is
			--  gdouble gts_volume_optimized_cost (GtsEdge *e,
			--  GtsVolumeOptimizedParams *params);
		external "C use <gts.h>"
		end

	gts_edge_collapse_is_valid (an_edge: POINTER): INTEGER is
			--  gboolean gts_edge_collapse_is_valid (GtsEdge *e);
		external "C use <gts.h>"
		end

	gts_edge_collapse_creates_fold (an_edge, a_vertex: POINTER; a_max: REAL): INTEGER  is
			--  gboolean gts_edge_collapse_creates_fold (GtsEdge *e,
			--  GtsVertex *v, gdouble max);
		external "C use <gts.h>"
		end

end -- class GTS_SURFACE_SIMPLIFICATION_AND_REFINEMENT_EXTERNALS

