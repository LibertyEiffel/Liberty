indexing
	description: "Surface object."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTS_SURFACE
	-- A GtsSurface is defined as a collection of GtsFace. No
	-- topological constraint is imposed: the surface may or may not be
	-- manifold, closed or orientable.
	
	-- When destroying a GtsSurface, all the faces not used by another
	-- surface are also destroyed. This default behaviour can be
	-- changed punctually by setting the global variable
	-- gts_allow_floating_faces to TRUE. You must not forget to set
	-- this variable back to FALSE as all the algorithms of GTS assume
	-- the default behaviour.

inherit C_STRUCT

creation make, from_external_pointer

feature {} -- Creation
-- Details

--   GTS_SURFACE_CLASS()

--  #define     GTS_SURFACE_CLASS(klass)

--    Casts klass to GtsSurfaceClass.

--     klass :  a descendant of GtsSurfaceClass.

--    -----------------------------------------------------------------------------------------------------------

--   GTS_SURFACE()

--  #define     GTS_SURFACE(obj)

--    Casts obj to GtsSurface.

--     obj :  a descendant of GtsSurface.

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_SURFACE()

--  #define     GTS_IS_SURFACE(obj)

--    Evaluates to TRUE if obj is a GtsSurface, FALSE otherwise.

--     obj :  a pointer to test.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSurfaceClass

--  typedef struct {
--    GtsObjectClass parent_class;

--    void (* add_face)    (GtsSurface *, GtsFace *);
--    void (* remove_face) (GtsSurface *, GtsFace *);
--  } GtsSurfaceClass;

--    The surface class. No virtual function is defined.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSurface

--  typedef struct {
--    GtsObject object;

--  #ifdef USE_SURFACE_BTREE
--    GTree * faces;
--  #else /* not USE_SURFACE_BTREE */
--    GHashTable * faces;
--  #endif /* not USE_SURFACE_BTREE */
--    GtsFaceClass * face_class;
--    GtsEdgeClass * edge_class;
--    GtsVertexClass * vertex_class;
--    gboolean keep_faces;
--  } GtsSurface;

--    The surface structure derived from GtsObject. This structure should only be accessed through the following
--    functions.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_class ()

--  GtsSurfaceClass* gts_surface_class          (void);

--     Returns :  the GtsSurfaceClass.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_new ()

--  GtsSurface* gts_surface_new                 (GtsSurfaceClass *klass,
--                                               GtsFaceClass *face_class,
--                                               GtsEdgeClass *edge_class,
--                                               GtsVertexClass *vertex_class);

--     klass :         a GtsSurfaceClass.
--     face_class :    a GtsFaceClass.
--     edge_class :    a GtsEdgeClass.
--     vertex_class :  a GtsVertexClass.
--     Returns :       a new empty GtsSurface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_add_face ()

--  void        gts_surface_add_face            (GtsSurface *s,
--                                               GtsFace *f);

--    Adds face f to surface s.

--     s :  a GtsSurface.
--     f :  a GtsFace.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_remove_face ()

--  void        gts_surface_remove_face         (GtsSurface *s,
--                                               GtsFace *f);

--    Removes face f from surface s.

--     s :  a GtsSurface.
--     f :  a GtsFace.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_copy ()

--  GtsSurface* gts_surface_copy                (GtsSurface *s1,
--                                               GtsSurface *s2);

--    Add a copy of all the faces, edges and vertices of s2 to s1.

--     s1 :       a GtsSurface.
--     s2 :       a GtsSurface.
--     Returns :  s1.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_merge ()

--  void        gts_surface_merge               (GtsSurface *s,
--                                               GtsSurface *with);

--    Adds all the faces of with which do not already belong to s to s.

--     s :     a GtsSurface.
--     with :  another GtsSurface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_read ()

--  guint       gts_surface_read                (GtsSurface *surface,
--                                               GtsFile *f);

--    Add to surface the data read from f. The format of the file pointed to by f is as described in
--    gts_surface_write().

--     surface :  a GtsSurface.
--     f :        a GtsFile.
--     Returns :  0 if successful or the line number at which the parsing stopped in case of error (in which
--                case the error field of f is set to a description of the error which occured).

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_is_manifold ()

--  gboolean    gts_surface_is_manifold         (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  TRUE if the surface is a manifold, FALSE otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_is_orientable ()

--  gboolean    gts_surface_is_orientable       (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  TRUE if all the faces of s have compatible orientation as checked by
--                gts_faces_are_compatible(), FALSE otherwise. Note that an orientable surface is also a
--                manifold.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_is_closed ()

--  gboolean    gts_surface_is_closed           (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  TRUE if s is a closed surface, FALSE otherwise. Note that a closed surface is also a manifold.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_vertex_number ()

--  guint       gts_surface_vertex_number       (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  the number of vertices of s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_edge_number ()

--  guint       gts_surface_edge_number         (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  the number of edges of s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_face_number ()

--  guint       gts_surface_face_number         (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  the number of faces of s

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_boundary ()

--  GSList*     gts_surface_boundary            (GtsSurface *surface);

--     surface :  a GtsSurface.
--     Returns :  a list of GtsEdge boundary of surface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_area ()

--  gdouble     gts_surface_area                (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  the area of s obtained as the sum of the signed areas of its faces.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_volume ()

--  gdouble     gts_surface_volume              (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  the signed volume of the domain bounded by the surface s. It makes sense only if s is a closed
--                and orientable manifold.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_center_of_mass ()

--  gdouble     gts_surface_center_of_mass      (GtsSurface *s,
--                                               GtsVector cm);

--    Fills cm with the coordinates of the center of mass of s.

--     s :        a GtsSurface.
--     cm :       a GtsVector.
--     Returns :  the signed volume of the domain bounded by the surface s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_center_of_area ()

--  gdouble     gts_surface_center_of_area      (GtsSurface *s,
--                                               GtsVector cm);

--    Fills cm with the coordinates of the center of area of s.

--     s :        a GtsSurface.
--     cm :       a GtsVector.
--     Returns :  the area of surface s.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSurfaceStats

--  typedef struct {
--    guint n_faces;
--    guint n_incompatible_faces;
--    guint n_duplicate_faces;
--    guint n_duplicate_edges;
--    guint n_boundary_edges;
--    guint n_non_manifold_edges;
--    GtsRange edges_per_vertex, faces_per_edge;
--    GtsSurface * parent;
--  } GtsSurfaceStats;

--    Connectivity statistics.

--     guint n_faces;               Number of faces.
--     guint n_incompatible_faces;  Number of incompatible faces (see gts_triangles_are_compatible() for
--                                  details).
--     guint n_duplicate_faces;     Number of duplicate faces (see gts_triangle_is_duplicate() for details).
--     guint n_duplicate_edges;     Number of duplicate edges (see gts_segment_is_duplicate() for details).
--     guint n_boundary_edges;      Number of boundary edges.
--     guint n_non_manifold_edges;  Number of non-manifold edges.
--     GtsRange edges_per_vertex;   Statistics on the number of edges per vertex.
--     GtsRange faces_per_edge;     Statistics on the number of faces per vertex.
--     GtsSurface *parent;          Surface from which these statistics have been obtained.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSurfaceQualityStats

--  typedef struct {
--    GtsRange face_quality;
--    GtsRange face_area;
--    GtsRange edge_length;
--    GtsRange edge_angle;
--    GtsSurface * parent;
--  } GtsSurfaceQualityStats;

--    Quality and geometry statistics.

--     GtsRange face_quality;  Statistics for face quality (see gts_triangle_quality() for details).
--     GtsRange face_area;     Statistics for the face area.
--     GtsRange edge_length;   Statistics for the edge length.
--     GtsRange edge_angle;    Statistics for the edge angles.
--     GtsSurface *parent;     Surface from which these statistics have been obtained.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_stats ()

--  void        gts_surface_stats               (GtsSurface *s,
--                                               GtsSurfaceStats *stats);

--    Fills stats with the statistics relevant to surface s.

--     s :      a GtsSurface.
--     stats :  a GtsSurfaceStats.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_quality_stats ()

--  void        gts_surface_quality_stats       (GtsSurface *s,
--                                               GtsSurfaceQualityStats *stats);

--    Fills stats with quality statistics relevant to surface s.

--     s :      a GtsSurface.
--     stats :  a GtsSurfaceQualityStats.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_print_stats ()

--  void        gts_surface_print_stats         (GtsSurface *s,
--                                               FILE *fptr);

--    Writes in the file pointed to by fptr the statistics for surface s.

--     s :     a GtsSurface.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_write ()

--  void        gts_surface_write               (GtsSurface *s,
--                                               FILE *fptr);

--    Writes in the file fptr an ASCII representation of s. The file format is as follows.

--    All the lines beginning with GTS_COMMENTS are ignored. The first line contains three unsigned integers
--    separated by spaces. The first integer is the number of vertices, nv, the second is the number of edges, ne
--    and the third is the number of faces, nf.

--    Follows nv lines containing the x, y and z coordinates of the vertices. Follows ne lines containing the two
--    indices (starting from one) of the vertices of each edge. Follows nf lines containing the three ordered
--    indices (also starting from one) of the edges of each face.

--    The format described above is the least common denominator to all GTS files. Consistent with an
--    object-oriented approach, the GTS file format is extensible. Each of the lines of the file can be extended
--    with user-specific attributes accessible through the read() and write() virtual methods of each of the
--    objects written (surface, vertices, edges or faces). When read with different object classes, these extra
--    attributes are just ignored.

--     s :     a GtsSurface.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_write_oogl ()

--  void        gts_surface_write_oogl          (GtsSurface *s,
--                                               FILE *fptr);

--    Writes in the file fptr an OOGL (Geomview) representation of s.

--     s :     a GtsSurface.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_write_oogl_boundary ()

--  void        gts_surface_write_oogl_boundary (GtsSurface *s,
--                                               FILE *fptr);

--    Writes in the file fptr an OOGL (Geomview) representation of the boundary of s.

--     s :     a GtsSurface.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_write_vtk ()

--  void        gts_surface_write_vtk           (GtsSurface *s,
--                                               FILE *fptr);

--    Writes in the file fptr a VTK representation of s.

--     s :     a GtsSurface.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   GtsFunc ()

--  gint        (*GtsFunc)                      (gpointer item,
--                                               gpointer data);

--    A user function called for each item of a collection.

--     item :     a pointer this function is called for.
--     data :     user data passed to the function.
--     Returns :  if 0 the calling sequence continues, otherwise it stops.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_foreach_vertex ()

--  void        gts_surface_foreach_vertex      (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);

--    Calls func once for each vertex of s.

--     s :     a GtsSurface.
--     func :  a GtsFunc.
--     data :  user data to be passed to func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_foreach_edge ()

--  void        gts_surface_foreach_edge        (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);

--    Calls func once for each edge of s.

--     s :     a GtsSurface.
--     func :  a GtsFunc.
--     data :  user data to be passed to func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_foreach_face ()

--  void        gts_surface_foreach_face        (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);

--    Calls func once for each face of s.

--     s :     a GtsSurface.
--     func :  a GtsFunc.
--     data :  user data to be passed to func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_foreach_face_remove ()

--  guint       gts_surface_foreach_face_remove (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);

--    Calls func once for each face of s. If func returns TRUE the corresponding face is removed from s (and
--    destroyed if it does not belong to any other surface and gts_allow_floating_faces is set to FALSE).

--     s :        a GtsSurface.
--     func :     a GtsFunc.
--     data :     user data to be passed to func.
--     Returns :  the number of faces removed from s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_foreach_intersecting_face ()

--  gboolean    gts_surface_foreach_intersecting_face
--                                              (GtsSurface *s,
--                                               GtsBBTreeTraverseFunc func,
--                                               gpointer data);

--    Calls func for each intersecting pair of faces of s.

--     s :        a GtsSurface.
--     func :     a GtsBBTreeTraverseFunc.
--     data :     user data to pass to func.
--     Returns :  TRUE if func was called at least once, FALSE otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSurfaceTraverse

--  typedef struct _GtsSurfaceTraverse GtsSurfaceTraverse;

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_traverse_new ()

--  GtsSurfaceTraverse* gts_surface_traverse_new
--                                              (GtsSurface *s,
--                                               GtsFace *f);

--     s :        a GtsSurface.
--     f :        a GtsFace belonging to s.
--     Returns :  a new GtsSurfaceTraverse, initialized to start traversing from face f of surface s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_traverse_next ()

--  GtsFace*    gts_surface_traverse_next       (GtsSurfaceTraverse *t,
--                                               guint *level);

--     t :        a GtsSurfaceTraverse.
--     level :    a pointer to a guint or NULL.
--     Returns :  the next face of the traversal in breadth-first order or NULL if no faces are left. If level
--                if not NULL, it is filled with the level of the returned face (0 for the initial face, 1 for
--                its neighbors and so on).

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_traverse_destroy ()

--  void        gts_surface_traverse_destroy    (GtsSurfaceTraverse *t);

--    Frees all the memory allocated for t.

--     t :  a GtsSurfaceTraverse.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_distance ()

--  void        gts_surface_distance            (GtsSurface *s1,
--                                               GtsSurface *s2,
--                                               gdouble delta,
--                                               GtsRange *face_range,
--                                               GtsRange *boundary_range);

--    Using the gts_bb_tree_surface_distance() and gts_bb_tree_surface_boundary_distance() functions fills
--    face_range and boundary_range with the min, max and average Euclidean (minimum) distances between the faces
--    of s1 and the faces of s2 and between the boundary edges of s1 and s2.

--     s1 :              a GtsSurface.
--     s2 :              a GtsSurface.
--     delta :           a spatial increment defined as the percentage of the diagonal of the bounding box of
--                       s2.
--     face_range :      a GtsRange.
--     boundary_range :  a GtsRange.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_strip ()

--  GSList*     gts_surface_strip               (GtsSurface *s);

--    Decompose s into triangle strips for fast-rendering.

--     s :        a GtsSurface.
--     Returns :  a list of triangle strips containing all the triangles of s. A triangle strip is itself a list
--                of successive triangles having one edge in common.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_tessellate ()

--  void        gts_surface_tessellate          (GtsSurface *s,
--                                               GtsRefineFunc refine_func,
--                                               gpointer refine_data);

--    Tessellate each triangle of s with 4 triangles: the number of triangles is increased by a factor of 4.
--    http://mathworld.wolfram.com/GeodesicDome.html

--    If refine_func is set to NULL a mid arc function is used: if the surface is a polyhedron with the unit
--    sphere as circum sphere, then gts_surface_tessellate() corresponds to a geodesation step (see
--    gts_surface_generate_sphere()).

--     s :            a GtsSurface.
--     refine_func :  a GtsRefineFunc.
--     refine_data :  user data to be passed to refine_func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_generate_sphere ()

--  GtsSurface* gts_surface_generate_sphere     (GtsSurface *s,
--                                               guint geodesation_order);

--    Add a triangulated unit sphere generated by recursive subdivision to s. First approximation is an
--    isocahedron; each level of refinement (geodesation_order) increases the number of triangles by a factor of
--    4. http://mathworld.wolfram.com/GeodesicDome.html

--     s :                  a GtsSurface.
--     geodesation_order :  a guint.
--     Returns :            s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_split ()

--  GSList*     gts_surface_split               (GtsSurface *s);

--    Splits a surface into connected and manifold components.

--     s :        a GtsSurface.
--     Returns :  a list of new GtsSurface.
feature {} -- External calls
--  #include <gts.h>

--  #define     GTS_SURFACE_CLASS               (klass)
--  #define     GTS_SURFACE                     (obj)
--  #define     GTS_IS_SURFACE                  (obj)
--              GtsSurfaceClass;
--              GtsSurface;

--  GtsSurfaceClass* gts_surface_class          (void);
--  GtsSurface* gts_surface_new                 (GtsSurfaceClass *klass,
--                                               GtsFaceClass *face_class,
--                                               GtsEdgeClass *edge_class,
--                                               GtsVertexClass *vertex_class);
--  void        gts_surface_add_face            (GtsSurface *s,
--                                               GtsFace *f);
--  void        gts_surface_remove_face         (GtsSurface *s,
--                                               GtsFace *f);
--  GtsSurface* gts_surface_copy                (GtsSurface *s1,
--                                               GtsSurface *s2);
--  void        gts_surface_merge               (GtsSurface *s,
--                                               GtsSurface *with);
--  guint       gts_surface_read                (GtsSurface *surface,
--                                               GtsFile *f);
--  gboolean    gts_surface_is_manifold         (GtsSurface *s);
--  gboolean    gts_surface_is_orientable       (GtsSurface *s);
--  gboolean    gts_surface_is_closed           (GtsSurface *s);
--  guint       gts_surface_vertex_number       (GtsSurface *s);
--  guint       gts_surface_edge_number         (GtsSurface *s);
--  guint       gts_surface_face_number         (GtsSurface *s);
--  GSList*     gts_surface_boundary            (GtsSurface *surface);
--  gdouble     gts_surface_area                (GtsSurface *s);
--  gdouble     gts_surface_volume              (GtsSurface *s);
--  gdouble     gts_surface_center_of_mass      (GtsSurface *s,
--                                               GtsVector cm);
--  gdouble     gts_surface_center_of_area      (GtsSurface *s,
--                                               GtsVector cm);
--              GtsSurfaceStats;
--              GtsSurfaceQualityStats;
--  void        gts_surface_stats               (GtsSurface *s,
--                                               GtsSurfaceStats *stats);
--  void        gts_surface_quality_stats       (GtsSurface *s,
--                                               GtsSurfaceQualityStats *stats);
--  void        gts_surface_print_stats         (GtsSurface *s,
--                                               FILE *fptr);
--  void        gts_surface_write               (GtsSurface *s,
--                                               FILE *fptr);
--  void        gts_surface_write_oogl          (GtsSurface *s,
--                                               FILE *fptr);
--  void        gts_surface_write_oogl_boundary (GtsSurface *s,
--                                               FILE *fptr);
--  void        gts_surface_write_vtk           (GtsSurface *s,
--                                               FILE *fptr);
--  gint        (*GtsFunc)                      (gpointer item,
--                                               gpointer data);
--  void        gts_surface_foreach_vertex      (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);
--  void        gts_surface_foreach_edge        (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);
--  void        gts_surface_foreach_face        (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);
--  guint       gts_surface_foreach_face_remove (GtsSurface *s,
--                                               GtsFunc func,
--                                               gpointer data);
--  gboolean    gts_surface_foreach_intersecting_face
--                                              (GtsSurface *s,
--                                               GtsBBTreeTraverseFunc func,
--                                               gpointer data);
--              GtsSurfaceTraverse;
--  GtsSurfaceTraverse* gts_surface_traverse_new
--                                              (GtsSurface *s,
--                                               GtsFace *f);
--  GtsFace*    gts_surface_traverse_next       (GtsSurfaceTraverse *t,
--                                               guint *level);
--  void        gts_surface_traverse_destroy    (GtsSurfaceTraverse *t);
--  void        gts_surface_distance            (GtsSurface *s1,
--                                               GtsSurface *s2,
--                                               gdouble delta,
--                                               GtsRange *face_range,
--                                               GtsRange *boundary_range);
--  GSList*     gts_surface_strip               (GtsSurface *s);
--  void        gts_surface_tessellate          (GtsSurface *s,
--                                               GtsRefineFunc refine_func,
--                                               gpointer refine_data);
--  GtsSurface* gts_surface_generate_sphere     (GtsSurface *s,
--                                               guint geodesation_order);
--  GSList*     gts_surface_split               (GtsSurface *s);
	
end -- class GTS_SURFACE
