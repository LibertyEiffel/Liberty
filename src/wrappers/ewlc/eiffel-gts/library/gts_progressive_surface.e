note
	description: "Progressive surfaces -- continuous level-of-detail for surfaces."
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

class GTS_PROGRESSIVE_SURFACE
	-- Progressive surfaces allow you to control precisely and
	-- continuously the level of detail of a GtsSurface.  They are
	-- built off-line by storing the sequence of edge collapses
	-- performed during surface simplification (see `make'). Fast
	-- traversal of the pre-built sequence allow on-line selection of
	-- the required level of detail.

	-- Using the `write' function a text representation of a
	-- progressive surface can be written to a file, pipe or
	-- socket. This text representation allows the progressive
	-- transmission of a surface, starting with the coarsest
	-- representation and progressively refining it as data is read or
	-- received (see `open', `read_vertex' and `close' for details).

inherit SHARED_C_STRUCT

insert
	GTS_PROGRESSIVE_SURFACE_EXTERNALS
	GTS_PSURFACE_STRUCT
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make is
		do
			--  GtsPSurface* gts_psurface_new (GtsPSurfaceClass *klass, GtsSurface
			--  *surface, GtsSplitClass *split_class, GtsKeyFunc cost_func,
			--  gpointer cost_data, GtsCoarsenFunc coarsen_func, gpointer
			--  coarsen_data, GtsStopFunc stop_func, gpointer stop_data, gdouble
			--  minangle);
			
			-- This function works in exactly the same way as the
			-- gts_surface_coarsen() function, except that the history of edge
			-- collapse is saved in an array of GtsSplit objects. This allows for
			-- dynamic continuous multiresolution control of the input surface.

			--     klass :         a GtsPSurfaceClass.
			--     surface :       a GtsSurface.
			--     split_class :   a GtsSplitClass to use for the new progressive surface.
			--     cost_func :     cost function for the edge collapse algorithm.
			--     cost_data :     data to pass to cost_func.
--     coarsen_func :  the function returning the vertex replacement for the edge collapse.
			--     coarsen_data :  data to pass to coarsen_func.
			--     stop_func :     the function to call to decide whether to stop the coarsening process.
			--     stop_data :     data to pass to stop_func.
			--     minangle :      the minimum angle allowable between two neighboring triangles. This is used to avoid
			--                     introducing folds in the mesh during simplification.
			--     Returns :       a new progressive surface.
		end
	
	--   gts_psurface_add_vertex ()
	
	--  GtsSplit*   gts_psurface_add_vertex         (GtsPSurface *ps);
	
	--    Adds a vertex to the progressive surface ps by expanding the next available GtsSplit.
	
	--     ps :       a GtsPSurface.
	--     Returns :  the expanded GtsSplit or NULL if all the GtsSplit have already been expanded.
	
	--    -----------------------------------------------------------------------------------------------------------
	
	--   gts_psurface_remove_vertex ()
	
	--  GtsSplit*   gts_psurface_remove_vertex      (GtsPSurface *ps);
	
	--    Removes one vertex from the progressive surface ps by collapsing the first available GtsSplit.
	
--     ps :       a GtsPSurface.
	--     Returns :  the collapsed GtsSplit or NULL if all the GtsSplit have already been collapsed.
	
	--    -----------------------------------------------------------------------------------------------------------
	
	--   gts_psurface_set_vertex_number ()
	
	--  void        gts_psurface_set_vertex_number  (GtsPSurface *ps,
	--                                               guint n);
	
	--    Performs the required number of collapses or expansions to set the number of vertices of ps to n.
	
	--     ps :  a GtsPSurface.
	--     n :   a number of vertices.
	
	--    -----------------------------------------------------------------------------------------------------------
	
	--   gts_psurface_get_vertex_number ()
	
	--  guint       gts_psurface_get_vertex_number  (GtsPSurface *ps);
	
	--     ps :       a GtsPSurface.
	--     Returns :  the current number of vertices of ps.

	--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_min_vertex_number ()

--  guint       gts_psurface_min_vertex_number  (GtsPSurface *ps);

--     ps :       a GtsPSurface.
--     Returns :  the minimum number of vertices of ps i.e. the number of vertices if all the GtsSplit were
--                collapsed.

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_max_vertex_number ()

--  guint       gts_psurface_max_vertex_number  (GtsPSurface *ps);

--     ps :       a GtsPSurface.
--     Returns :  the maximum number of vertices of ps i.e. the number of vertices if all the GtsSplit were
--                expanded.

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_foreach_vertex ()

--  void        gts_psurface_foreach_vertex     (GtsPSurface *ps,
--                                               GtsFunc func,
--                                               gpointer data);

--    Calls func for each (potential) vertex of ps, whether actually used or not. The vertices are called in the
--    order they were created during the edge collapse operation.

--     ps :    a GtsPSurface.
--     func :  a function to call for each vertex of ps.
--     data :  data to be passed to func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_open ()

--  GtsPSurface* gts_psurface_open              (GtsPSurfaceClass *klass,
--                                               GtsSurface *s,
--                                               GtsSplitClass *split_class,
--                                               GtsFile *f);

--    Creates a new GtsPSurface prepared for input from the file f containing a valid GTS representation of a
--    progressive surface. The initial shape of the progressive surface is loaded into s.

--    Before being usable as such this progressive surface must be closed using gts_psurface_close(). While open
--    however, the functions gts_psurface_get_vertex_number(), gts_psurface_min_vertex_number() and
--    gts_psurface_max_vertex_number() can still be used.

--     klass :        a GtsPSurfaceClass.
--     s :            a GtsSurface.
--     split_class :  a GtsSplitClass to use for the GtsSplit.
--     f :            a GtsFile.
--     Returns :      a new GtsPSurface or NULL if there was a format error while reading the file, in which
--                    case f contains information about the error.

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_read_vertex ()

--  GtsSplit*   gts_psurface_read_vertex        (GtsPSurface *ps,
--                                               GtsFile *fp);

--    Reads in one vertex split operation from fp and performs the expansion.

--    If an error occurs while reading the file, the error field of fp is set.

--     ps :       a GtsPSurface prealably created with gts_psurface_open().
--     fp :       a GtsFile.
--     Returns :  the newly created GtsSplit or NULL if no vertex split could be read from fp.

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_close ()

--  void        gts_psurface_close              (GtsPSurface *ps);

--    Closes a progressive surface.

--     ps :  a GtsPSurface prealably created with gts_psurface_open().

--    -----------------------------------------------------------------------------------------------------------

--   gts_psurface_write ()

--  void        gts_psurface_write              (GtsPSurface *ps,
--                                               FILE *fptr);

--    Writes to fptr a GTS progressive surface description.

--     ps :    a GtsPSurface.
--     fptr :  a file pointer.
feature {} -- TODO: structure access
-- 	   The progressive surface object. derived from GtsObject. The field s is the GtsSurface being refined or
--    coarsened by operations on the progressive surface. All the other fields must be considered private and
--    accessed only through the following functions.

--     GtsObject object;            The parent object.
--     GtsSurface *s;               The GtsSurface being refined or coarsened by operations on the progressive
--                                  surface.
--     GPtrArray *split;
--     GtsSplitClass *split_class;
--     guint pos;
--     guint min;
--     GPtrArray *vertices;
--     GPtrArray *faces;
end -- class GTS_PROGRESSIVE_SURFACE
