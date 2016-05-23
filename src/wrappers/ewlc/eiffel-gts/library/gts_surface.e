note
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
	-- surface are also destroyed.

	-- TODO: translate this note - relevant for C - into something that fits
	-- Eiffel better: "This default behaviour can be changed punctually by
	-- setting the global variable gts_allow_floating_faces to TRUE. You must not
	-- forget to set this variable back to FALSE as all the algorithms of GTS
	-- assume the default behaviour."

	-- TODO: make it a generic class GTS_SURFACE [FACE->GTS_FACE, EDGE->GTS_EDGE,
	-- VERTEX->GTS_VERTEX]

inherit
	GTS_OBJECT redefine copy, struct_size end
	STREAM_HANDLER undefine is_equal redefine copy end
	
insert
	GTS_SURFACE_EXTERNALS
	GTS_FACE_EXTERNALS
	GTS_EDGE_EXTERNALS
	GTS_VERTEX_EXTERNALS
	GTS_DELAUNAY_EXTERNALS
	GTS_SURFACE_STRUCT
	GTS_SURFACE_SIMPLIFICATION_AND_REFINEMENT_EXTERNALS

create {ANY}  make, copy, from_external_pointer

feature {} -- Creation
	make is
		do
			from_external_pointer (gts_surface_new (gts_surface_class,
																 gts_face_class,
																 gts_edge_class,
																 gts_vertex_class))
		end

feature {ANY}
	copy (another: GTS_SURFACE) is
			-- Add a copy of all the faces, edges and vertices of s2 to s1.
		do
			allocate
			gts_surface_copy(handle,another.handle)
		end

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

feature {ANY} -- Input
	read (a_file: GTS_FILE) is
			-- Add to surface the data read from `a_file'. The format of the file
			-- pointed to by `a_file' is as described in `write'.

			-- If no faces are defined in `a_file' nothing is imported.
		require
			file_not_void: a_file/=Void
			file_not_void: a_file/=Void
		local got_errors: INTEGER
		do
			got_errors:=gts_surface_read(handle, a_file.handle)
			debug
				if got_errors/=0 then
					print ("GTS_SURFACE.read error at line "+got_errors.out+"%N")
				end
			end
			
			-- got_errors is 0 if successful or the line number at which the
			-- parsing stopped in case of error (in which case the error field of f
			-- is set to a description of the error which occured).
		end

	-- 	read_contours (a_file: GTS_FILE) is
	-- 			-- Add to surface the data read from `a_file'. The format of the file
	-- 			-- pointed to by `a_file' is mostly the one described in `write'.

	-- 			-- The differences are:

	-- 			-- This feature does not stop if no faces are defined in `a_file'.

	-- 			-- This feature creates only GTS_VERTEXs, GTS_EDGEs and GTS_FACEs.

	-- 			-- In case of error during input, `current_line' feature of
	-- 			-- `a_file' will contain the line number at which the parsing
	-- 			-- stopped in case of error; the `error' field is set to a
	-- 			-- description of the error which occured.
	-- 		local nv,ne,nf: INTEGER; got_error: BOOLEAN
	-- 			a_vertex: GTS_VERTEX; an_edge: GTS_EDGE; a_face: GTS_FACE
	-- 		do
	-- 			-- This feature is the direct translation of gts_surface_read
	-- 			-- C function. We use raise_exception(Routine_failure) as a
	-- 			-- quick exit route in case of error, even if AFAIK this is
	-- 			-- not nice Eiffel.
	-- 			if not got_error then -- First try
	-- 				if a_file.type/=a_file.gts_int then
	-- 					a_file.error ("expecting an integer (number of vertices)")
	-- 					got_error:=True; raise_exception(Routine_failure)
	-- 				else nv := a_file.token.as_string.to_integer
	-- 				end
	-- 				a_file.next_token
	-- 				if a_file.type/=a_file.gts_int then
	-- 					a_file.error ("expecting an integer (number of edges)")
	-- 					got_error:=True; raise_exception(Routine_failure)
	-- 				else ne := a_file.token.as_string.to_integer
	-- 				end
	-- 				a_file.next_token
	-- 				if a_file.type/=a_file.gts_int then
	-- 					a_file.error ("expecting an integer (number of faces)")
	-- 					got_error:=True; raise_exception(Routine_failure)
	-- 				else nf := a_file.token.as_string.to_integer
	-- 				end
				
	-- 				from n:=nv until got_error or else n=0 loop
	-- 					n:=n-1
	-- 					--     GtsObject * new_vertex =
	-- 					--       gts_object_new (GTS_OBJECT_CLASS (surface->vertex_class));

	-- 					--     (* GTS_OBJECT_CLASS (surface->vertex_class)->read) (&new_vertex, f);
	-- 					--     if (f->type != GTS_ERROR) {
	-- 					--       if (!GTS_POINT_CLASS (surface->vertex_class)->binary)
	-- 					-- 	gts_file_first_token_after (f, '\n');
	-- 					--       vertices[n++] = GTS_VERTEX (new_vertex);
	-- 					--     }
	-- 					--     else
	-- 					--       gts_object_destroy (new_vertex);
	-- 					--   }
	-- 				end
	-- 				--   if (f->type == GTS_ERROR)
	-- 				--     nv = n;
	-- 				--   if (GTS_POINT_CLASS (surface->vertex_class)->binary)
	-- 				--     gts_file_first_token_after (f, '\n');

	-- 				--   n = 0;
	-- 				--   while (n < ne && f->type != GTS_ERROR) {
	-- 				--     guint p1, p2;

	-- 				--     if (f->type != GTS_INT)
	-- 				--       gts_file_error (f, "expecting an integer (first vertex index)");
	-- 				--     else {
	-- 				--       p1 = atoi (f->token->str);
	-- 				--       if (p1 == 0 || p1 > nv)
	-- 				-- 	gts_file_error (f, "vertex index `%d' is out of range `[1,%d]'", 
	-- 				-- 			p1, nv);
	-- 				--       else {
	-- 				-- 	gts_file_next_token (f);
	-- 				-- 	if (f->type != GTS_INT)
	-- 				-- 	  gts_file_error (f, "expecting an integer (second vertex index)");
	-- 				-- 	else {
	-- 				-- 	  p2 = atoi (f->token->str);
	-- 				-- 	  if (p2 == 0 || p2 > nv)
	-- 				-- 	    gts_file_error (f, "vertex index `%d' is out of range `[1,%d]'", 
	-- 				-- 			    p2, nv);
	-- 				-- 	  else {
	-- 				-- 	    GtsEdge * new_edge =
	-- 				-- 	      gts_edge_new (surface->edge_class,
	-- 				-- 			    vertices[p1 - 1], vertices[p2 - 1]);

	-- 				-- 	    gts_file_next_token (f);
	-- 				-- 	    if (f->type != '\n')
	-- 				-- 	      if (GTS_OBJECT_CLASS (surface->edge_class)->read)
	-- 				-- 		(*GTS_OBJECT_CLASS (surface->edge_class)->read)
	-- 				-- 		  ((GtsObject **) &new_edge, f);
	-- 				-- 	    gts_file_first_token_after (f, '\n');
	-- 				-- 	    edges[n++] = new_edge;
	-- 				-- 	  }
	-- 				-- 	}
	-- 				--       }
	-- 				--     }
	-- 				--   }
	-- 				--   if (f->type == GTS_ERROR)
	-- 				--     ne = n;

	-- 				--   n = 0;
	-- 				--   while (n < nf && f->type != GTS_ERROR) {
	-- 				--     guint s1, s2, s3;

	-- 				--     if (f->type != GTS_INT)
	-- 				--       gts_file_error (f, "expecting an integer (first edge index)");
	-- 				--     else {
	-- 				--       s1 = atoi (f->token->str);
	-- 				--       if (s1 == 0 || s1 > ne)
	-- 				-- 	gts_file_error (f, "edge index `%d' is out of range `[1,%d]'", 
	-- 				-- 			s1, ne);
	-- 				--       else {
	-- 				-- 	gts_file_next_token (f);
	-- 				-- 	if (f->type != GTS_INT)
	-- 				-- 	  gts_file_error (f, "expecting an integer (second edge index)");
	-- 				-- 	else {
	-- 				-- 	  s2 = atoi (f->token->str);
	-- 				-- 	  if (s2 == 0 || s2 > ne)
	-- 				-- 	    gts_file_error (f, "edge index `%d' is out of range `[1,%d]'", 
	-- 				-- 			    s2, ne);
	-- 				-- 	  else {
	-- 				-- 	    gts_file_next_token (f);
	-- 				-- 	    if (f->type != GTS_INT)
	-- 				-- 	      gts_file_error (f, "expecting an integer (third edge index)");
	-- 				-- 	    else {
	-- 				-- 	      s3 = atoi (f->token->str);
	-- 				-- 	      if (s3 == 0 || s3 > ne)
	-- 				-- 		gts_file_error (f, "edge index `%d' is out of range `[1,%d]'", 
	-- 				-- 				s3, ne);
	-- 				-- 	      else {
	-- 				-- 		GtsFace * new_face = gts_face_new (surface->face_class,
	-- 				-- 						   edges[s1 - 1],
	-- 				-- 						   edges[s2 - 1],
	-- 				-- 						   edges[s3 - 1]);

	-- 				-- 		gts_file_next_token (f);
	-- 				-- 		if (f->type != '\n')
	-- 				-- 		  if (GTS_OBJECT_CLASS (surface->face_class)->read)
	-- 				-- 		    (*GTS_OBJECT_CLASS (surface->face_class)->read)
	-- 				-- 		      ((GtsObject **) &new_face, f);
	-- 				-- 		gts_file_first_token_after (f, '\n');
	-- 				-- 		gts_surface_add_face (surface, new_face);
	-- 				-- 		n++;
	-- 				-- 	      }
	-- 				-- 	    }
	-- 				-- 	  }
	-- 				-- 	}
	-- 				--       }
	-- 				--     }
	-- 				--   }

	-- 				--   if (f->type == GTS_ERROR) {
	-- 				--     gts_allow_floating_vertices = TRUE;
	-- 				--     while (nv)
	-- 				--       gts_object_destroy (GTS_OBJECT (vertices[nv-- - 1]));
	-- 				--     gts_allow_floating_vertices = FALSE;
	-- 				--   }

	-- 				--   g_free (vertices);
	-- 				--   g_free (edges);

	-- 				--   if (f->type == GTS_ERROR)
	-- 				--     return f->line;
	-- 				--   return 0;
	-- 				-- }
	-- 			else
	-- 				-- got an error during input
	-- 			end
	-- 		rescue
	-- 			if is_developer_exception then retry end
	-- 			-- In all other case Huston has some serious problem.
	-- 		end

feature {ANY} -- Output
	print_stats_on (a_file: OUTPUT_STREAM) is
			-- Writes the statistics for surface to `a_file'
		require file_not_void: a_file /= Void
		do
			gts_surface_print_stats(handle, a_file.stream_pointer)
		end

	write (a_file: OUTPUT_STREAM) is
			-- Writes in `a_file' an ASCII representation of surface. The file
			-- format is as follows.
		
			-- All the lines beginning with GTS_COMMENTS are ignored. The first
			-- line contains three unsigned integers separated by spaces. The first
			-- integer is the number of vertices, nv, the second is the number of
			-- edges, ne and the third is the number of faces, nf.

			-- Follows nv lines containing the x, y and z coordinates of the
			-- vertices. Follows ne lines containing the two indices (starting from
			-- one) of the vertices of each edge. Follows nf lines containing the
			-- three ordered indices (also starting from one) of the edges of each
			-- face.

			-- The format described above is the least common denominator to all
			-- GTS files. Consistent with an object-oriented approach, the GTS file
			-- format is extensible. Each of the lines of the file can be extended
			-- with user-specific attributes accessible through the read() and
			-- write() virtual methods of each of the objects written (surface,
			-- vertices, edges or faces). When read with different object classes,
			-- these extra attributes are just ignored.
		require file_not_void: a_file /= Void
		do
			gts_surface_write(handle, a_file.stream_pointer)
		end

	write_oogl (a_file: OUTPUT_STREAM) is
			-- Writes in the file fptr an OOGL (Geomview) representation of s.
		require file_not_void: a_file /= Void
		do
			gts_surface_write_oogl(handle,a_file.stream_pointer)
		end
	
	write_oogl_boundary (a_file: OUTPUT_STREAM) is
			-- Writes in the file fptr an OOGL (Geomview) representation of the
			-- boundary of surface.
		require file_not_void: a_file /= Void
		do
			gts_surface_write_oogl_boundary (handle,a_file.stream_pointer)
		end

  write_vtk (a_file: OUTPUT_STREAM) is
			--    Writes in the file fptr a VTK representation of s.
		require file_not_void: a_file /= Void
		do
			gts_surface_write_vtk(handle,a_file.stream_pointer)
		end

feature {ANY} -- Boolean queries
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

feature {ANY} -- Element number queries
	vertices_count: INTEGER is
			-- the number of vertices in the surface.
		
			-- TODO: should be NATURAL
		do
			Result:=gts_surface_vertex_number(handle)
		end

	edges_count: INTEGER is 
			-- The number of edges in the surface.
		do
			Result:=gts_surface_edge_number(handle)
		ensure natural: Result>=0
		end

	faces_count: INTEGER is
			-- the number of faces in the surface.
		do
			Result:=gts_surface_face_number(handle)
		ensure natural: Result>=0
		end

feature {ANY}
	faces: DICTIONARY[GTS_FACE,GTS_FACE] is
		do
			if cached_faces = Void then
				-- Note: the following if tense will be eliminated by the 
				-- optimizer since 
				if use_surface_btree = 0 then
					create {G_TREE[GTS_FACE,GTS_FACE]} cached_faces.from_external_pointer(get_faces_internal(handle))
				else
					create {G_HASH_TABLE[GTS_FACE,GTS_FACE]} cached_faces.from_external_pointer(get_faces_internal(handle))
				end
			end
			check cached_faces/=Void end
			Result:=cached_faces
		end
feature {ANY}
	boundary: G_SLIST[GTS_EDGE] is
			-- the boundary edges of surface.
		local p: POINTER
		do
			p:=gts_surface_boundary(handle)
			check p.is_not_null end
			create Result.from_external_pointer(p)
		ensure not_void: Result /= Void
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
			create Result.allocate
			returned:=gts_surface_center_of_mass(handle,Result.handle)
			-- gts_surface_center_of_mass returns the signed volume of the domain
			-- bounded by the surface.
		end

	volume_and_center_of_mass: TUPLE[REAL,GTS_VECTOR] is
			-- The signed volume of the domain bounded by the surface and
			-- the center of mass of surface (as a newly created vector).
		local a_vol: REAL; a_vector: GTS_VECTOR
		do
			create a_vector.allocate
			a_vol:=gts_surface_center_of_mass(handle,a_vector.handle)
			create Result.make_2(a_vol,a_vector)
		end

	center_of_area: GTS_VECTOR is
			-- the center of area of surface (a new vector is created).
		local returned: REAL
		do
			create Result.allocate
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
		obsolete "Unimplemented!"
		--local callback: GTS_FUNCTION
		do
			--create callback.make(a_function)
			--gts_surface_foreach_vertex(handle,callback.callback_pointer,to_pointer)
		end
	
	foreach_edge (a_function: PREDICATE[TUPLE[GTS_EDGE]]) is
			-- Calls `a_function' once for each edge of surface. When `a_function'
			-- returns False the calling sequence continues, otherwise it stops.
			--		local callback: GTS_FUNCTION
		do
			--create callback.make(a_function)
			--gts_surface_foreach_edge (handle,callback.low_level_callback,callback.to_pointer)
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

	triangles_strip: G_SLIST[GTS_TRIANGLE] is
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

feature {ANY} -- Boolean operations 

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
	
feature {ANY} -- Delaunay and constrained Delaunay triangulations
	-- Delaunay and constrained Delaunay triangulations implementation
	-- of a dynamic Delaunay triangulation algorithm.

	-- The features described in this section are useful to build
	-- two-dimensional Delaunay and constrained Delaunay
	-- triangulations. Only the x and y coordinates of the points are
	-- taken into account.
	
	-- The algorithm is fully dynamic (insertion and deletion) for
	-- Delaunay triangulation and semi-dynamic (insertion only of
	-- vertices and constraints) for constrained Delaunay
	-- triangulation.
	
	-- The insertion part uses a very simple jump-and-walk location
	-- algorithm which can be used on any (even non-Delaunay) 2D
	-- triangulation as long as its boundary is convex.

	-- The functions `conform' and `refine' can be used to build
	-- Delaunay conforming constrained triangulations and to refine
	-- them.

	is_triangulated: BOOLEAN is
		do
			Result := ((faces_count = 0) and
						  (vertices_count >= 3) and
						  (edges_count >= 3))
		end
						  
	is_successful: BOOLEAN
			-- Is the last `add_vertex' call been successful?
	
	duplicate_vertex: GTS_VERTEX
			-- A vertex with the same coordinates of the vertex used as 
			-- argument of the last call to `add_vertex'
	
	add_vertex (a_vertex: GTS_VERTEX; a_guess: GTS_FACE) is
			-- Adds `a_vertex' to the Delaunay triangulation defined by
			-- Current surface. If `a_vertex' is not contained in the
			-- convex hull bounding surface, it is not added to the
			-- triangulation.

			-- `a_guess' is a GtsFace belonging to surface to be used as
			-- an initial guess for point location; can be Void.

			-- `is_successful' will be True if `a_vertex' have been
			-- actually added, False otherwise. In this case
			-- `duplicate_vertex' will be Void if `a_vertex' is not
			-- contained in the convex hull bounding surface, otherwise
			-- it will contain the vertex having the same x and y
			-- coordinates of `vertex'
		require vertex_not_void: a_vertex/=Void
		local ptr: POINTER
		do
			ptr := gts_delaunay_add_vertex(handle, a_vertex.handle, null_or(a_guess))
			-- gts_delaunay_add_vertex returns NULL is v has been
			-- successfully added to surface or was already contained
			-- in surface, v if v is not contained in the convex hull
			-- bounding surface or a GtsVertex having the same x and y
			-- coordinates as v.
			if ptr.is_null then is_successful:=True
			else
				is_successful:=False
				if ptr=a_vertex.handle then -- vertex not contained in the convex hull of bounding surface
					duplicate_vertex:=Void
				else -- there is a vertex with the same coordinates
					duplicate_vertex::=wrappers.reference_at(ptr)
					if duplicate_vertex=Void then
						create duplicate_vertex.from_external_pointer(ptr)
					end
				end
			end
		end
	
	add_vertex_to_face (a_vertex: GTS_VERTEX; a_face: GTS_FACE) is
			-- Adds `a_vertex' to `a_face' of the Delaunay triangulation
			-- defined by Current surface.
		require
			vertex_not_void: a_vertex/=Void
			face_not_void: a_face/=Void
			-- TODO: face_belongs_to_current
		do		
			is_successful:=(gts_delaunay_add_vertex_to_face
								 (handle, a_vertex.handle, a_face.handle)
								 ).is_null
			-- gts_delaunay_add_vertex_to_face returns NULL is v has been
			-- successfully added to surface or was already contained in
			-- surface or a GtsVertex having the same x and y coordinates
			-- as v.
		end
	
	remove_vertex (a_vertex: GTS_VERTEX) is
			-- Removes a_vertex from the Delaunay triangulation defined
			-- by surface and restores the Delaunay property.

			-- `a_vertex' must not be used by any constrained edge
			-- otherwise the triangulation is not guaranteed to be
			-- Delaunay.

			-- TODO: translate the above precondition into a proper
			-- require/ensure clause.
		require vertex_not_void: a_vertex/=Void
		do
			gts_delaunay_remove_vertex(handle,a_vertex.handle)
		end

	
	add_constraint (a_constraint: GTS_CONSTRAINT) is
			--  Add `a_constraint' to the constrained Delaunay
			--  triangulation defined by surface.
		
			-- `intersecting_constraints' will be updated to contain a
			-- list of GtsConstraint conflicting (i.e. intersecting) with
			-- `a_constraint' which were removed from surface.
			-- `intersecting_constraints' will be Void if there was none.
		require constraint_not_void: a_constraint /= Void
		local constraints_ptr: POINTER
		do
			constraints_ptr:=gts_delaunay_add_constraint(handle, a_constraint.handle)
			if constraints_ptr.is_null then
				intersecting_constraints := Void
			else
				create intersecting_constraints.from_external_pointer(constraints_ptr)
			end
		end

	intersecting_constraints: G_SLIST [GTS_CONSTRAINT]
			-- a list of GtsConstraint intersecting with which were
			-- removed from surface (NULL if there was none).
	
	violating_face: GTS_FACE
			-- A face that violates the Delaunay property. This feature
			-- is updated by the `is_delaunay' query.
	
	is_delaunay: BOOLEAN is
			-- Is the planar projection of surface an (unconstrained)
			-- Delaunay triangulation?
		
			-- If False `violating_face' will be the GtsFace violating
			-- the Delaunay property.
		local face_ptr: POINTER
		do
			face_ptr:=gts_delaunay_check(handle)
			-- gts_delaunay_check returns NULL if the planar projection
			-- of surface is a Delaunay triangulation (unconstrained), a
			-- GtsFace violating the Delaunay property otherwise.
			if face_ptr.is_null then
				Result:=True
			else
				create violating_face.from_external_pointer(face_ptr)
			end
		ensure Result=False implies violating_face/=Void
		end

	remove_hull is
			-- Removes all the edges of the boundary of surface which are
			-- not constraints.
		do
			gts_delaunay_remove_hull(handle)
		end

	encroaching_edges_count: INTEGER 
			-- the number of remaining encroached edges left by the last 
			-- call to `conform'.

	conform (a_steiner_max: INTEGER) is
			-- Recursively split constraints of surface which are
			-- encroached by vertices of surface (see Shewchuk 96 for
			-- details). The split constraints are destroyed and replaced
			-- by a set of new constraints of the same
			-- class. 

			-- If `a_steiner_max' is positive or nul, the recursive
			-- splitting procedure will stop when this maximum number of
			-- Steiner points is reached. In that case the resulting
			-- surface will not necessarily be Delaunay conforming. In
			-- that case `encroaching_edges_count' will be updated to the
			-- number of remaining encroached edges. 

			-- TODO: GTS_VERTEX.encroaches is used to discover
			-- encroaching vertices, so the resulting surface will be
			-- Delaunay conforming. GTS allows to provide a generic 
			-- encroaching function that could be wrapped by a agent 
			-- using version of conform.
		do
			encroaching_edges_count := (gts_delaunay_conform
												 (handle, a_steiner_max,
												  $gts_vertex_encroaches_edge, default_pointer))
			-- gts_delaunay_conform recursively split constraints of
			-- surface which are encroached by vertices of surface (see
			-- Shewchuk 96 for details). The split constraints are
			-- destroyed and replaced by a set of new constraints of the
			-- same class.  If gts_vertex_encroaches_edge() is used for
			-- encroaches, the resulting surface will be Delaunay
			-- conforming.
			
			-- If steiner_max is positive or nul, the recursive splitting
			-- procedure will stop when this maximum number of Steiner
			-- points is reached. In that case the resulting surface will
			-- not necessarily be Delaunay conforming.
			
			-- surface: a GtsSurface describing a constrained Delaunay 
			-- triangulation.

			-- steiner_max : maximum number of Steiner points.

			-- encroaches : a GtsEncroachFunc.

			-- data : user-data to pass to encroaches.

			-- Returns : the number of remaining encroached edges. If
			-- steiner_max is set to a negative value and
			-- gts_vertex_encroaches_edge() is used for encroaches this
			-- should always be zero.
		ensure a_steiner_max<0 implies encroaching_edges_count=0			
		end

	unrefined_faces_count: INTEGER
			-- the number of unrefined faces of surface left after
			-- invoking `delaunay_refine'. It should be zero if
			-- `a_steiner_max' is set to a negative value.

	delaunay_refine (a_steiner_max: INTEGER) is
			-- An implementation of the refinement algorithm described in Ruppert
			-- (1995) and Shewchuk (1996).

			-- `a_steiner_max':    maximum number of Steiner points.

		
			--     encroaches :     a GtsEncroachFunc.
			--     encroach_data :  user-data to pass to encroaches.
			--     cost :           a GtsKeyFunc used to sort the faces during refinement.
			--     cost_data :      user-data to pass to cost.
			--     Returns :        
		require 
			is_delaunay: is_delaunay
		do
			unrefined_faces_count := (gts_delaunay_refine 
											  (handle, a_steiner_max,
												default_pointer, -- GtsEncroachFunc encroaches,
												default_pointer, -- gpointer encroach_data,
												default_pointer, -- GtsKeyFunc cost,
												default_pointer -- gpointer cost_data);
												))
			-- surface :        a GtsSurface describing a conforming Delaunay triangulation.
			-- steiner_max :    maximum number of Steiner points.
			-- encroaches :     a GtsEncroachFunc.
			-- encroach_data :  user-data to pass to encroaches.
			-- cost :           a GtsKeyFunc used to sort the faces during refinement.
			-- cost_data :      user-data to pass to cost.
		ensure a_steiner_max<0 implies unrefined_faces_count=0
		end

	-- static guint delaunay_remove_holes (GtsSurface * surface) {
	-- g_return_val_if_fail (surface != NULL, 0);
	
	--   return gts_surface_foreach_face_remove (surface, (GtsFunc)
	--   triangle_is_hole, NULL); }

	-- static void gts_constraint_split (GtsConstraint * c, 
	-- 				  GtsSurface * s,
	-- 				  GtsFifo * fifo)
	-- {
	--   GSList * i;
	--   GtsVertex * v1, * v2;
	--   GtsEdge * e;

	--   g_return_if_fail (c != NULL);
	--   g_return_if_fail (s != NULL);

	--   v1 = GTS_SEGMENT (c)->v1;
	--   v2 = GTS_SEGMENT (c)->v2;
	--   e = GTS_EDGE (c);

	--   i = e->triangles;
	--   while (i) {
	--     GtsFace * f = i->data;
	--     if (GTS_IS_FACE (f) && gts_face_has_parent_surface (f, s)) {
	--       GtsVertex * v = gts_triangle_vertex_opposite (GTS_TRIANGLE (f), e);
	--       if (gts_point_orientation (GTS_POINT (v1), 
	-- 				 GTS_POINT (v2), 
	-- 				 GTS_POINT (v)) == 0.) {
	-- 	GSList * j = e->triangles;
	-- 	GtsFace * f1 = NULL;
	-- 	GtsEdge * e1, * e2;

	-- 	/* replaces edges with constraints */
	-- 	gts_triangle_vertices_edges (GTS_TRIANGLE (f), e,
	-- 				     &v1, &v2, &v, &e, &e1, &e2);
	-- 	if (!GTS_IS_CONSTRAINT (e1)) {
	-- 	  GtsEdge * ne1 = 
	-- 	    gts_edge_new (GTS_EDGE_CLASS (GTS_OBJECT (c)->klass), v2, v);
	-- 	  gts_edge_replace (e1, ne1);
	-- 	  gts_object_destroy (GTS_OBJECT (e1));
	-- 	  e1 = ne1;
	-- 	  if (fifo) gts_fifo_push (fifo, e1);
	-- 	}
	-- 	if (!GTS_IS_CONSTRAINT (e2)) {
	-- 	  GtsEdge * ne2 = 
	-- 	    gts_edge_new (GTS_EDGE_CLASS (GTS_OBJECT (c)->klass), v, v1);
	-- 	  gts_edge_replace (e2, ne2);
	-- 	  gts_object_destroy (GTS_OBJECT (e2));
	-- 	  e2 = ne2;
	-- 	  if (fifo) gts_fifo_push (fifo, e2);
	-- 	}

	-- 	/* look for face opposite */
	-- 	while (j && !f1) {
	-- 	  if (GTS_IS_FACE (j->data) && 
	-- 	      gts_face_has_parent_surface (j->data, s))
	-- 	    f1 = j->data;
	-- 	  j = j->next;
	-- 	}
	-- 	if (f1) { /* c is not a boundary of s */
	-- 	  GtsEdge * e3, * e4, * e5;
	-- 	  GtsVertex * v3;
	-- 	  gts_triangle_vertices_edges (GTS_TRIANGLE (f1), e,
	-- 				       &v1, &v2, &v3, &e, &e3, &e4);
	-- 	  e5 = gts_edge_new (s->edge_class, v, v3);
	-- 	  gts_surface_add_face (s, gts_face_new (s->face_class, e5, e2, e3));
	-- 	  gts_surface_add_face (s, gts_face_new (s->face_class, e5, e4, e1));
	-- 	  gts_object_destroy (GTS_OBJECT (f1));
	-- 	}
	-- 	gts_object_destroy (GTS_OBJECT (f));
	-- 	return;
	--       }
	--     }
	--     i = i->next;
	--   }
	-- }

	-- static void add_constraint (GtsConstraint * c, GtsSurface * s)
	-- {
	--   g_assert (gts_delaunay_add_constraint (s, c) == NULL);
	-- }

	-- static void split_constraint (GtsConstraint * c, gpointer * data)
	-- {
	--   GtsSurface * s = data[0];
	--   GtsFifo * fifo = data[1];

	--   gts_constraint_split (c, s, fifo);
	-- }

	-- static void shuffle_array (GPtrArray * a)
	-- {
	--   guint i;

	--   for (i = 0; i < a->len; i++) {
	--     guint j = (gdouble) rand ()*(a->len - 1)/(gdouble) RAND_MAX;
	--     guint k = (gdouble) rand ()*(a->len - 1)/(gdouble) RAND_MAX;
	--     gpointer tmp;

	--     if (j >= a->len) j = a->len - 1;
	--     if (k >= a->len) k = a->len - 1;
	
	--     tmp = g_ptr_array_index (a, j);
	--     g_ptr_array_index (a, j) = g_ptr_array_index (a, k);
	--     g_ptr_array_index (a, k) = tmp;
	--   }
	-- }

	triangulate is
		require
			not_triangulated: not is_triangulated
		local big: GTS_TRIANGLE
		do
			-- create triangle enclosing all the vertices
			-- create big.enclosing()
			
			--   {
			--     GSList * list = NULL;
			--     for (i = 0; i < vertices->len; i++)
			--       list = g_slist_prepend (list, g_ptr_array_index (vertices, i));
			--     t = gts_triangle_enclosing (gts_triangle_class (), list, 100.);
			--     g_slist_free (list);
			--   }
			--   gts_triangle_vertices (t, &v1, &v2, &v3);

			add (create {GTS_FACE}.from_triangle(big))

			--   /* add vertices */
			--   for (i = 0; i < vertices->len; i++) {
			--     GtsVertex * v1 = g_ptr_array_index (vertices, i);
			--     GtsVertex * v = gts_delaunay_add_vertex (surface, v1, NULL);

			--     g_assert (v != v1);
			--     if (v != NULL) {
			--       if (!remove_duplicates) {
			-- 	fprintf (stderr, "delaunay: duplicate vertex (%g,%g) in input file\n",
			-- 		 GTS_POINT (v)->x, GTS_POINT (v)->y);
			-- 	return 1; /* Failure */
			--       }
			--       else
			-- 	gts_vertex_replace (v1, v);
			--     }
			--     if (fname) {
			--       static guint nf = 1;
			--       char s[80];
			--       FILE * fp;

			--       g_snprintf (s, 80, "%s.%u", fname, nf++);
			--       fp = fopen (s, "wt");
			--       gts_surface_write_oogl (surface, fp);
			--       fclose (fp);

			--       if (check_delaunay && gts_delaunay_check (surface)) {
			-- 	fprintf (stderr, "delaunay: triangulation is not Delaunay\n");
			-- 	return 1;
			--       }
			--     }
			--   }
			--   g_ptr_array_free (vertices, TRUE);

			--   /* add remaining constraints */
			--   if (add_constraints)
			--     gts_fifo_foreach (edges, (GtsFunc) add_constraint, surface);

			--   /* destroy enclosing triangle */
			--   gts_allow_floating_vertices = TRUE;
			--   gts_object_destroy (GTS_OBJECT (v1));
			--   gts_object_destroy (GTS_OBJECT (v2));
			--   gts_object_destroy (GTS_OBJECT (v3));
			--   gts_allow_floating_vertices = FALSE;

			--   if (!keep_hull)
			--     gts_delaunay_remove_hull (surface);

			--   if (remove_holes)
			--     delaunay_remove_holes (surface);

			--   if (split_constraints) {
			--     gpointer data[2];

			--     data[0] = surface;
			--     data[1] = edges;
			--     gts_fifo_foreach (edges, (GtsFunc) split_constraint, data);
			--   }

			--   if (conform) {
			--     guint encroached_number = 
			--       gts_delaunay_conform (surface, 
			-- 			    steiner_max,
			-- 			    (GtsEncroachFunc) gts_vertex_encroaches_edge,
			-- 			    NULL);
			--     if (encroached_number == 0 && refine) {
			--       guint unrefined_number;
			--       gpointer data[2];
		
			--       data[0] = &quality;
			--       data[1] = &area;
			--       unrefined_number = 
			-- 	gts_delaunay_refine (surface, 
			-- 			     steiner_max,
			-- 			     (GtsEncroachFunc) gts_vertex_encroaches_edge,
			-- 			     NULL,
			-- 			     (GtsKeyFunc) triangle_cost,
			-- 			     data);
			--       if (verbose && unrefined_number > 0)
			-- 	fprintf (stderr, 
			-- 		 "delaunay: ran out of Steiner points (max: %d) during refinement\n"
			-- 		 "%d unrefined faces left\n",
			-- 		 steiner_max, unrefined_number);
			--     }
			--     else if (verbose && encroached_number > 0)
			--       fprintf (stderr, 
			-- 	       "delaunay: ran out of Steiner points (max: %d) during conforming\n"
			-- 	       "Delaunay triangulation: %d encroached constraints left\n",
			-- 	       steiner_max, encroached_number);
			--   }
			--   g_timer_stop (timer);

			--   if (verbose) {
			--     gts_surface_print_stats (surface, stderr);
			--     fprintf (stderr, "# Triangulation time: %g s speed: %.0f vertex/s\n", 
			-- 	  g_timer_elapsed (timer, NULL),
			-- 	  gts_surface_vertex_number (surface)/g_timer_elapsed (timer, NULL));
			--   }

			--   if (check_delaunay && gts_delaunay_check (surface)) {
			--     fprintf (stderr, "delaunay: triangulation is not Delaunay\n");
			--     status = 1; /* failure */
			--   }

			--   /* write triangulation */
			--   gts_surface_write (surface, stdout);

			--   return status;
			-- }
			
		ensure
			triangulated: faces_count > 0
			delaunay_property: is_delaunay
			no_vertices_added: vertices_count = old vertices_count
			no_edges_added: edges_count = old edges_count
		end

feature {ANY} -- Simplification and refinement: reducing or increasing the number of edges of a triangulated surface (not Delaunay)

	-- `coarsen' function allows to reduce the number of edges (and of course
-- faces and vertices) of a given surface.

	-- TODO: The original C implementation allows to provide the
	-- algorithm a cost function. Current wrappers allow only to use
	-- standard C-library-provided cost functions.
	
	-- Each edge is collapsed according to an order described by the
	-- cost function.  It is then replaced by a single vertex given by
	-- another user-defined function (TODO: like cost function).

	-- Two sets of cost and replacement functions are provided with the
	-- library. The default uses the squared length of the segment as
	-- cost and replaces the segment with its midpoint.

	-- The functions gts_volume_optimized_cost() and
	-- gts_volume_optimized_vertex() are an implementation of an
	-- algorithm proposed by Lindstrom and Turk called "memoryless
	-- simplification". This algorithm has been shown to be both
	-- computationally efficient and very accurate in terms of error
	-- between the simplified surface and the original one. It also
	-- preserves the volume enclosed by the surface both globally and
	-- locally.

	-- Surface refinement is obtained by splitting the edges in two
	-- equal parts according to an order described by a user-defined
	-- cost function. The default is to use the squared length of the
	-- segments as cost.
	
	-- The coarsening or refinement processes are stopped using a
	-- user-defined stop function. Two functions are provided stopping
	-- either when the cost of collapsing an edge is too large
	-- (`gts_coarsen_stop_cost') or when the number of edges is too
	-- small (`gts_coarsen_stop_number').


	refine is
			-- require stop_function_set: is_stop_function_set
		do
			gts_surface_refine
			(handle,
			 cost_function, -- if NULL use square length of the edge
			 default_pointer, -- unnecessary gpointer cost_data,
			 refine_function, -- if NULL use gts_segment_midvertex
			 default_pointer, -- unnecessary gpointer refine_data,
			 stop_function,
			 default_pointer -- gpointer stop_data
			 );
		end

	--   GtsCoarsenFunc ()

	--  GtsVertex* (*GtsCoarsenFunc) (GtsEdge *e, GtsVertexClass
	--  *klass, gpointer data);

	--    User-defined function taking an edge e and returning a
	--    replacement vertex of class klass.

	--     e :        a GtsEdge.
	--     klass :    the GtsVertexClass of the replacement vertex.
	--     data :     user data passed to the function.
	--     Returns :  a replacement vertex of class klass.

	--   GtsRefineFunc ()

	--  GtsVertex* (*GtsRefineFunc) (GtsEdge *e, GtsVertexClass *klass,
	--  gpointer data);

	--     e :
	--     klass :
	--     data :
	--     Returns :

	--   GtsStopFunc ()

	--  gboolean    (*GtsStopFunc)                  (gdouble cost,
	--                                               guint nedge,
	--                                               gpointer data);

	--    User-defined function used to stop the coarsening process.

	--     cost :     the cost of collapse of the current edge.
	--     nedge :    the number of edges of the surface after collapse of the current edge.
	--     data :     user data passed to the function.
	--     Returns :  TRUE if the collapse of the current edge is not to take place, FALSE otherwise.



	--   gts_surface_coarsen ()

	--  void        gts_surface_coarsen             (GtsSurface *surface,
	--                                               GtsKeyFunc cost_func,
	--                                               gpointer cost_data,
	--                                               GtsCoarsenFunc coarsen_func,
	--                                               gpointer coarsen_data,
	--                                               GtsStopFunc stop_func,
	--                                               gpointer stop_data,
	--                                               gdouble minangle);

	--    The edges of surface are sorted according to cost_func to create a priority heap (a GtsEHeap). The edges
	--    are extracted in turn from the top of the heap and collapsed (i.e. the vertices are replaced by the vertex
	--    returned by the coarsen_func function) until the stop_func functions returns TRUE.

	--    If cost_func is set to NULL, the edges are sorted according to their length squared (the shortest is on
	--    top).

	--    If coarsen_func is set to NULL gts_segment_midvertex() is used.

	--    The minimum angle is used to avoid introducing faces which would be folded.

	--     surface :       a GtsSurface.
	--     cost_func :     a function returning the cost for a given edge.
	--     cost_data :     user data to be passed to cost_func.
	--     coarsen_func :  a GtsCoarsenVertexFunc.
	--     coarsen_data :  user data to be passed to coarsen_func.
	--     stop_func :     a GtsStopFunc.
	--     stop_data :     user data to be passed to stop_func.
	--     minangle :      minimum angle between two neighboring triangles.

feature {ANY} -- Stop functions (used in refining and coarsing)
	
	--   gts_coarsen_stop_number ()

	--  gboolean    gts_coarsen_stop_number         (gdouble cost,
	--                                               guint nedge,
	--                                               guint *min_number);

	--    This function is to be used as the stop_func argument of gts_surface_coarsen() or gts_psurface_new().

	--     cost :        the cost of the edge collapse considered.
	--     nedge :       the current number of edges of the surface being simplified.
	--     min_number :  a pointer to the minimum number of edges desired for the surface being simplified.
	--     Returns :     TRUE if the edge collapse would create a surface with a smaller number of edges than given
	--                   by min_number, FALSE otherwise.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_coarsen_stop_cost ()

	--  gboolean    gts_coarsen_stop_cost           (gdouble cost,
	--                                               guint nedge,
	--                                               gdouble *max_cost);

	--    This function is to be used as the stop_func argument of gts_surface_coarsen() or gts_psurface_new().

	--     cost :      the cost of the edge collapse considered.
	--     nedge :     the current number of edges of the surface being simplified.
	--     max_cost :  a pointer to the maximum cost allowed for an edge collapse.
	--     Returns :   TRUE if the cost of the edge collapse considered is larger than given by max_cost, FALSE
	--                 otherwise.

	--    -----------------------------------------------------------------------------------------------------------

	--   GtsVolumeOptimizedParams

	--  typedef struct {
	--    gdouble volume_weight;
	--    gdouble boundary_weight;
	--    gdouble shape_weight;
	--  } GtsVolumeOptimizedParams;

	--    The parameters for the volume optimization algorithm of Lindstrom and Turk. THey define the relative weight
	--    of the volume, boundary and shape optimization part of the algorithm. Lindstrom and Turk advice is to set
	--    them to 0.5, 0.5 and 0. You may want to experiment depending on your problem. Setting shape_weight to a
	--    very small value (1e-10) for example might help improve the quality of the resulting triangulation.

	--     gdouble volume_weight;    Weight of the volume optimization.
	--     gdouble boundary_weight;  Weight of the boundary optimization.
	--     gdouble shape_weight;     Weight of the shape optimization.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_volume_optimized_vertex ()

	--  GtsVertex*  gts_volume_optimized_vertex     (GtsEdge *edge,
	--                                               GtsVertexClass *klass,
	--                                               GtsVolumeOptimizedParams *params);

	--     edge :     a GtsEdge.
	--     klass :    a GtsVertexClass to be used for the new vertex.
	--     params :   a GtsVolumeOptimizedParms.
	--     Returns :  a GtsVertex which can be used to replace edge for an edge collapse operation. The position of
	--                the vertex is optimized in order to minimize the changes in area and volume for the surface
	--                using edge. The volume enclosed by the surface is locally preserved. For more details see
	--                "Fast and memory efficient polygonal simplification" (1998) and "Evaluation of memoryless
	--                simplification" (1999) by Lindstrom and Turk.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_volume_optimized_cost ()

	--  gdouble     gts_volume_optimized_cost       (GtsEdge *e,
	--                                               GtsVolumeOptimizedParams *params);

	--     e :        a GtsEdge.
	--     params :   a GtsVolumeOptimizedParams.
	--     Returns :  the cost for the collapse of e as minimized by the function gts_volume_optimized_vertex().

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_edge_collapse_is_valid ()

	--  gboolean    gts_edge_collapse_is_valid      (GtsEdge *e);

	--    An implementation of the topological constraints described in the "Mesh Optimization" article of Hoppe et
	--    al (1993).

	--     e :        a GtsEdge.
	--     Returns :  TRUE if e can be collapsed without violation of the topological constraints, FALSE otherwise.

	--    -----------------------------------------------------------------------------------------------------------

	--   gts_edge_collapse_creates_fold ()

	--  gboolean    gts_edge_collapse_creates_fold  (GtsEdge *e,
	--                                               GtsVertex *v,
	--                                               gdouble max);

	--     e :        a GtsEdge.
	--     v :        a GtsVertex.
	--     max :      the maximum value of the square of the cosine of the angle between two triangles.
	--     Returns :  TRUE if collapsing edge e to vertex v would create faces making an angle the cosine squared of
	--                which would be larger than max, FALSE otherwise.

feature {} -- Implementation
	cached_statistics: GTS_SURFACE_STATS
	cached_quality_statistics: GTS_SURFACE_QUALITY_STATS

	cost_function: POINTER
			-- Pointer to the C function used as cost function in refine

	refine_function: POINTER
			-- Pointer to the C function used as refine function in refine

	stop_function: POINTER
			-- Pointer to the C function used as stop function in refine

	cached_faces: DICTIONARY[GTS_FACE,GTS_FACE]

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurface)"
		end

end -- class GTS_SURFACE
