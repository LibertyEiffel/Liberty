note
	description: "Boolean operations -- set operations between surfaces: union, intersection, difference."
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli, GTK+ team
					
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

deferred class GTS_BOOLEAN_OPERATION
	-- Description: The three-dimensional curve intersection of two
	-- surfaces is described by a GtsSurfaceInter object. This object
	-- contains additional information which allows to compute all the
	-- set operations between the two surfaces.


	-- inherit (SHARED_?)C_STRUCT

	-- insert FOO_EXTERNALS

feature {ANY} 


--   gts_surface_inter_class ()

--  GtsSurfaceInterClass* gts_surface_inter_class
--                                              (void);

--     Returns :  the GtsSurfaceInterClass.

--    -----------------------------------------------------------------------------------------------------------

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


--   gts_surface_inter_boolean ()

--  void        gts_surface_inter_boolean       (GtsSurfaceInter *si,
--                                               GtsSurface *surface,
--                                               GtsBooleanOperation op);

--    Adds to surface the part of the surface described by si and op.

--     si :       a GtsSurfaceInter.
--     surface :  a GtsSurface.
--     op :       a GtsBooleanOperation.

--    -----------------------------------------------------------------------------------------------------------

--   gts_surface_is_self_intersecting ()

--  GtsSurface* gts_surface_is_self_intersecting
--                                              (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  a new GtsSurface containing the faces of s which are self-intersecting or NULL if no faces of
--                s are self-intersecting.
feature {} -- External calls
--  #include <gts.h>

-- #define   GTS_SURFACE_INTER_CLASS  (klass)
-- #define   GTS_SURFACE_INTER  (obj)
-- #define   GTS_IS_SURFACE_INTER  (obj)
--  GtsSurfaceInterClass;
--  GtsSurfaceInter;

--  GSList*  gts_surface_intersection  (GtsSurface *s1, GtsSurface *s2, GNode *faces_tree1, GNode *faces_tree2);
--  GtsSurfaceInterClass* gts_surface_inter_class (void);
--  GtsSurfaceInter* gts_surface_inter_new  (GtsSurfaceInterClass *klass, GtsSurface *s1, GtsSurface *s2, GNode *faces_tree1, GNode *faces_tree2, gboolean is_open1, gboolean is_open2);
--  gboolean   gts_surface_inter_check  (GtsSurfaceInter *si, gboolean *closed);
--  enum   GtsBooleanOperation;
--  void   gts_surface_inter_boolean (GtsSurfaceInter *si, GtsSurface *surface, GtsBooleanOperation op);
--  GtsSurface* gts_surface_is_self_intersecting (GtsSurface *s);
end -- class GTS_BOOLEAN_OPERATION
