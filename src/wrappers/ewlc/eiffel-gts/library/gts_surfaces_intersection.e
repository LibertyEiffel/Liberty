note
	description: "Intersection of surface."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
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

class GTS_SURFACES_INTERSECTION

inherit C_STRUCT

insert GTS_BOOLEAN_OPERATIONS_ENUM

create {ANY}  from_external_pointer

feature {} -- Creation
--	make (s1,s2: GTS_SURFACE; 
--   gts_surface_inter_new ()

	--  GtsSurfaceInter* gts_surface_inter_new      (GtsSurfaceInterClass *klass,
--                                               GtsSurface *s1,
--                                               GtsSurface *s2,
--                                               GNode *faces_tree1,
--                                               GNode *faces_tree2,
--                                               gboolean is_open1,
--                                               gboolean is_open2);

--    When triangulating the cut faces, the new faces inherit the attributes of these original faces through
--    their attributes() method.

--     klass :        a GtsSurfaceInterClass.
--     s1 :           a GtsSurface.
--     s2 :           a GtsSurface.
--     faces_tree1 :  a bounding box tree (see gts_bb_tree_new()) for the faces of s1.
--     faces_tree2 :  a bounding box tree for the faces of s2.
--     is_open1 :     whether s1 is an "open" surface.
--     is_open2 :     whether s2 is an "open" surface.
--     Returns :      a new GtsSurfaceInter describing the intersection of s1 and s2.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_inter_check ()

--  gboolean    gts_surface_inter_check         (GtsSurfaceInter *si,
--                                               gboolean *closed);

--     si :       a GtsSurfaceInter.
--     closed :   is set to TRUE if si->edges is a closed curve, FALSE otherwise.
--     Returns :  TRUE if the curve described by si is an orientable manifold, FALSE otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   enum GtsBooleanOperation

--  typedef enum { GTS_1_OUT_2,
--                 GTS_1_IN_2,
--                 GTS_2_OUT_1,
--                 GTS_2_IN_1 }             GtsBooleanOperation;

--    GTS_1_OUT_2 identifies the part of the first surface which lies outside the second surface.

--    GTS_1_IN_2 identifies the part of the first surface which lies inside the second surface.

--    GTS_2_OUT_1 identifies the part of the second surface which lies outside the first surface.

--    GTS_2_IN_1 identifies the part of the second surface which lies inside the first surface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_inter_boolean ()

--  void        gts_surface_inter_boolean       (GtsSurfaceInter *si,
--                                               GtsSurface *surface,
--                                               GtsBooleanOperation op);

--    Adds to surface the part of the surface described by si and op.

--     si :       a GtsSurfaceInter.
--     surface :  a GtsSurface.
--     op :       a GtsBooleanOperation.

--    -----------------------------------------------------------------------------------------------------------

feature {} -- Unwrapped 
--   GTS_SURFACE_INTER_CLASS()

--  #define     GTS_SURFACE_INTER_CLASS(klass)

--    Casts klass to GtsSurfaceInterClass.

--     klass :  a descendant of GtsSurfaceInterClass.

--    -----------------------------------------------------------------------------------------------------------

--   GTS_SURFACE_INTER()

--  #define     GTS_SURFACE_INTER(obj)

--    Casts obj to GtsSurfaceInter.

--     obj :  a descendant of GtsSurfaceInter.

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_SURFACE_INTER()

--  #define     GTS_IS_SURFACE_INTER(obj)

--    Evaluates to TRUE if obj is a GtsSurfaceInter, FALSE otherwise.

--     obj :  a pointer to test.

--    -----------------------------------------------------------------------------------------------------------

feature {} --   GtsSurfaceInterClass struct

--  typedef struct {
--    GtsObjectClass parent_class;
--  } GtsSurfaceInterClass;

--    The surface intersection class.

--    -----------------------------------------------------------------------------------------------------------

feature {} -- GtsSurfaceInter struct

--  typedef struct {
--    GtsObject object;

--    GtsSurface * s1;
--    GtsSurface * s2;
--    GSList * edges;
--  } GtsSurfaceInter;

--    The surface intersection object.

--     GtsObject object;  Parent object.
--     GtsSurface *s1;    Local triangulation of the intersecting faces of the first surface.
--     GtsSurface *s2;    Local triangulation of the intersecting faces of the second surface.
--     GSList *edges;     List of GtsEdge defining the 3D curve intersection of the two surfaces.

feature {} -- External calls
	-- #include <gts.h>

	-- #define GTS_SURFACE_INTER_CLASS (klass)

	-- #define GTS_SURFACE_INTER (obj)

	-- #define GTS_IS_SURFACE_INTER (obj)
	
	-- GtsSurfaceInterClass;
	-- GtsSurfaceInter;

	gts_surface_inter_class: POINTER is
			-- GtsSurfaceInterClass* gts_surface_inter_class (void);
		external "C use <gts.h>"
		end
	
	gts_surface_inter_new (a_class, a_surface, another_surface, a_faces_tree, another_faces_tree: POINTER; is_open1_bool, is_open2_bool: INTEGER): POINTER is
			-- GtsSurfaceInter* gts_surface_inter_new
			-- (GtsSurfaceInterClass *klass, GtsSurface *s1, GtsSurface
			-- *s2, GNode *faces_tree1, GNode *faces_tree2, gboolean
			-- is_open1, gboolean is_open2);
		external "C use <gts.h>"
		end
	
	gts_surface_inter_check (a_si, closed_bool: POINTER): INTEGER is
			-- gboolean gts_surface_inter_check (GtsSurfaceInter *si,
			-- gboolean *closed);
		external "C use <gts.h>"
		end
	
	-- enum GtsBooleanOperation;
		
	gts_surface_inter_boolean (a_si, a_surface: POINTER; an_operation: INTEGER) is
			-- void gts_surface_inter_boolean (GtsSurfaceInter *si,
			-- GtsSurface *surface, GtsBooleanOperation op);
		external "C use <gts.h>"
		end
	
	gts_surface_is_self_intersecting (a_surface: POINTER): POINTER is
			-- GtsSurface* gts_surface_is_self_intersecting (GtsSurface
			-- *s);
		external "C use <gts.h>"
		end

	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurfaceInter)"
		end

end -- class GTS_SURFACES_INTERSECTION
