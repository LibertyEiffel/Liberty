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
	-- A GtsSurface is defined as a collection of GtsFace. No topological
	-- constraint is imposed: the surface may or may not be manifold, closed or
	-- orientable.
	
	-- When destroying a GtsSurface, all the faces not used by another surface
	-- are also destroyed. This default behaviour can be changed punctually by
	-- setting the global variable gts_allow_floating_faces to TRUE. You must not
	-- forget to set this variable back to FALSE as all the algorithms of GTS
	-- assume the default behaviour.

	-- TODO: make it a generic class GTS_SURFACE [FACE->GTS_FACE, EDGE->GTS_EDGE,
	-- VERTEX->GTS_VERTEX]

	-- TODO: make it a COLLECTION[FACE]
	
inherit
	C_STRUCT
		redefine
			copy 
		end

insert
	GTS_SURFACE_EXTERNALS
	GTS_FACE_EXTERNALS
	GTS_EDGE_EXTERNALS
	
creation make, copy, from_external_pointer

feature {} -- Creation
	make is
		do
			from_external_pointer (gts_surface_new (gts_surface_class,
																 gts_face_class,
																 gts_edge_class,
																 gts_vertex_class))
		end

		copy (another: GTS_SURFACE) is
			-- Add a copy of all the faces, edges and vertices of s2 to s1.
		do
			allocate
			gts_surface_copy(handle,another.handle)
		end

feature
	add (a_face: GTS_FACE) is
			--  Adds `a_face' to Current surface.
		require face_not_void: a_face /= Void
		do
			gts_surface_add_face(handle, a_face.handle)
		end

	remove (a_face: GTS_FACE) is
			-- Removes `a_face' from Current surface.
		require face_not_void: a_face /= Void
		do
			gts_surface_remove_face(handle, a_face.handle)
		end

	merge (another: GTS_SURFACE) is
			-- Adds to Current all the faces of `another' which do not
			-- already belong to Current.
		require another_not_void: another /= Void
		do
			gts_surface_merge (handle, another.handle)
		end

feature -- Input output
	--	read (a_file: GTS_FILE) is

	--  guint       gts_surface_read                (GtsSurface *surface,
	--                                               GtsFile *f);

	--    Add to surface the data read from f. The format of the file pointed to by f is as described in
	--    gts_surface_write().

	--     surface :  a GtsSurface.
	--     f :        a GtsFile.
	--     Returns :  0 if successful or the line number at which the parsing stopped in case of error (in which
	--                case the error field of f is set to a description of the error which occured).

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

feature -- Boolean queries
	is_manifold: BOOLEAN is
			-- Is the surface a manifold?
		do
			Result:=(gts_surface_is_manifold(handle)).to_boolean
		end

	is_orientable: BOOLEAN is
			-- Do all the faces of Current surface have compatible orientation as
			-- checked by gts_faces_are_compatible()?

			-- Note that an orientable surface is also a manifold.
		do
			Result:=(gts_surface_is_orientable(handle)).to_boolean
		end
			
	is_closed: BOOLEAN is
			-- Is Current a closed surface?  Note that a closed surface is also a
			-- manifold.
		do
			Result:=gts_surface_is_closed(handle).to_boolean
		end

feature -- Element number queries
	vertex_count: INTEGER is
			-- the number of vertices in the surface.
		
			-- TODO: should be NATURAL
		do
			Result:=gts_surface_vertex_number(handle)
		end

	edge_count: INTEGER is 
			-- The number of edges in the surface.
		
			-- TODO: should be NATURAL
		do
			Result:=gts_surface_edge_number(handle)
		end


	face_count: INTEGER is
			-- the number of faces in the surface.
		
			-- TODO: should be NATURAL
		do
			Result:=gts_surface_face_number(handle)
		end


feature
	boundary: G_SLIST[GTS_EDGE] is
			-- a list of GtsEdge boundary of surface.
		local p: POINTER
		do
			p:=gts_surface_boundary(handle)
			check p.is_not_null end
			create Result.from_external_pointer(p)
		ensure not_void: result /= Void
		end
	
	area: REAL is
			-- the area of surface obtained as the sum of the signed areas of its
			-- faces.
		do
			Result:=gts_surface_area(handle)
		end

	volume: REAL is
			-- The signed volume of the domain bounded by the surface s. It makes
			-- sense only if s is a closed and orientable manifold.
		do
			Result:=gts_surface_volume(handle)
		end

	center_of_mass: GTS_VECTOR is
			-- The center of mass of surface (a new vector is created).
		local returned: REAL
		do
			create Result.make
			returned:=gts_surface_center_of_mass(handle,Result.handle)
			-- gts_surface_center_of_mass returns the signed volume of the domain
			-- bounded by the surface.
		end

	center_of_area: GTS_VECTOR is
			-- the center of area of surface (a new vector is created).
		local returned: REAL
		do
			create Result.make
			returned:=gts_surface_center_of_area(handle,Result.handle)
			-- gts_surface_center_of_area returns : the area of surface s.
		end

	statistics: GTS_SURFACE_STATS is
			-- the statistics relevant to surface.
		do
			if cached_statistics=Void then create Result.make end
			gts_surface_stats(handle, cached_statistics.handle)
			Result:=cached_statistics
		end

	quality_statistics: GTS_SURFACE_QUALITY_STATS is
			-- Quality statistics relevant to Current surface. Note: 
			-- GTS_SURFACE_QUALITY_STATS is almost empty and unusable.
		do
			if cached_quality_statistics=Void then create Result.make end
			gts_surface_quality_stats(handle,cached_quality_statistics.handle)
		end


	foreach_vertex (a_function: PREDICATE[TUPLE[GTS_VERTEX]]) is
			-- Calls `a_function' once for each vertex of surface. When `a_function'
			-- returns False the calling sequence continues, otherwise it stops.
		local callback: GTS_FUNCTION
		do
			create callback.make(a_function)
			gts_surface_foreach_vertex(handle,
												callback.low_level_callback,
												callback.to_pointer
												)
		end
	
	foreach_edge (a_function: PREDICATE[TUPLE[GTS_EDGE]]) is
			-- Calls `a_function' once for each edge of surface. When `a_function'
			-- returns False the calling sequence continues, otherwise it stops.
		do
			create callback.make(a_function)
			gts_surface_foreach_edge (handle,
												callback.low_level_callback,
												callback.to_pointer
												)
		end

	-- TODO: gts_surface_foreach_face ()

	-- void gts_surface_foreach_face (GtsSurface *s, GtsFunc func, gpointer
	-- data);
	
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


	distance (another: GTS_SURFACE; a_delta: REAL): TUPLE[GTS_RANGE,GTS_RANGE] is
			-- Using the gts_bb_tree_surface_distance() and
			-- gts_bb_tree_surface_boundary_distance() functions returns a face
			-- range and a boundary range with the min, max and average Euclidean
			-- (minimum) distances between the faces of Current and the faces of
			-- `another' and between the boundary edges of Current and `another'.
		
			-- `a_delta': a spatial increment defined as the percentage of the
			-- diagonal of the bounding box of `another'.
		local a_face_range, a_boundary_range: GTS_RANGE
		do
			create a_face_range.make
			create a_boundary_range.make
			gts_surface_distance(handle, another.handle,
										a_delta,
										a_face_range.handle,
										a_boundary_range.handle)
		end

	strip: G_SLIST[GTS_TRIANGLE] is
			-- a list of triangle strips containing all the triangles of surface. A
			-- triangle strip is itself a list of successive triangles having one
			-- edge in common.
		do
			create Result.from_external_pointer(gts_surface_strip(handle))
		end
	
		
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


	add_sphere (a_geodesation_order: INTEGER) is
			-- Add a triangulated unit sphere generated by recursive subdivision to
			-- surface. First approximation is an isocahedron; each level of
			-- refinement (geodesation_order) increases the number of triangles by
			-- a factor of 4. http://mathworld.wolfram.com/GeodesicDome.html
		
			-- TODO: `a_geodesation_order' should be a NATURAL since it is a guint.
		local ptr: POINTER
		do
			ptr:=gts_surface_generate_sphere(handle, a_geodesation_order);
		end

	split: G_SLIST[GTS_SURFACE] is
			-- surface splitted into connected and manifold components.
		do
			create Result.from_external_pointer(gts_surface_split(handle))
		end
feature {} -- Unwrapped code
	--   GTS_SURFACE_CLASS()
	
	--  #define     GTS_SURFACE_CLASS(klass)
	
	--    Casts klass to GtsSurfaceClass.
	
	--     klass :  a descendant of GtsSurfaceClass.
	
	--   GTS_SURFACE()
	
	--  #define     GTS_SURFACE(obj)

	--    Casts obj to GtsSurface.

	--     obj :  a descendant of GtsSurface.


	--   GTS_IS_SURFACE()
	
	--  #define     GTS_IS_SURFACE(obj)
	
	--    Evaluates to TRUE if obj is a GtsSurface, FALSE otherwise.

	--     obj :  a pointer to test.

	--   GtsSurfaceClass
	
	--  typedef struct {
	--    GtsObjectClass parent_class;

	--    void (* add_face)    (GtsSurface *, GtsFace *);
	--    void (* remove_face) (GtsSurface *, GtsFace *);
	--  } GtsSurfaceClass;

	--    The surface class. No virtual function is defined.


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
	
	-- The surface structure derived from GtsObject. This structure should only
	-- be accessed through the following functions.

feature -- Boolean operations 

	intersection (another: GTS_SURFACE) is
		do
			--  GSList* gts_surface_intersection (GtsSurface *s1, GtsSurface *s2,
			--  GNode *faces_tree1, GNode *faces_tree2);

			--     s1 :           a GtsSurface.
			--     s2 :           a GtsSurface.
			--     faces_tree1 :  a bounding box tree (see gts_bb_tree_new()) for the faces of s1.
			--     faces_tree2 :  a bounding box tree for the faces of s2.
			--     Returns :      a list of GtsEdge defining the curve intersection of the two surfaces.
		end
	
feature {} -- Implementation
	cached_statistics: GTS_SURFACE_STATS
	cached_quality_statistics: GTS_SURFACE_QUALITY_STATS
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurface)"
		end
end -- class GTS_SURFACE
