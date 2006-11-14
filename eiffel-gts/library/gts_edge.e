indexing
	description: "Edges -- edge object and related functions."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTS team
					
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

class GTS_EDGE

inherit GTS_SEGMENT

insert GTS_EDGE_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
end -- class FOO
 
Synopsis


Description

Edges are derived from GtsSegment. They are used to define GtsTriangle.
Details
GTS_EDGE_CLASS()

#define     GTS_EDGE_CLASS(klass)

Casts klass to GtsEdgeClass.

klass :	

a descendant of GtsObjectClass.
GTS_EDGE()

#define     GTS_EDGE(obj)

Casts obj to GtsEdge.

obj :	

a descendant of GtsObject.
GTS_IS_EDGE()

#define     GTS_IS_EDGE(obj)

Evaluates to TRUE if obj is a GtsEdge, FALSE otherwise.

obj :	

a pointer to test.
GtsEdgeClass

typedef struct {
  GtsSegmentClass parent_class;
} GtsEdgeClass;

The edge class. No virtual function associated.
GtsEdge

typedef struct {
  GtsSegment segment;

  GSList * triangles;
} GtsEdge;

The edge object.

GtsSegment segment;	

The parent object.
GSList *triangles;	

List of GtsTriangle using this edge.
gts_edge_class ()

GtsEdgeClass* gts_edge_class                (void);

Returns :	

the GtsEdgeClass.
gts_edge_new ()

GtsEdge*    gts_edge_new                    (GtsEdgeClass *klass,
                                             GtsVertex *v1,
                                             GtsVertex *v2);

klass :	

a GtsEdgeClass.
v1 :	

a GtsVertex.
v2 :	

a GtsVertex.
Returns :	

a new GtsEdge linking v1 and v2.
gts_edge_replace ()

void        gts_edge_replace                (GtsEdge *e,
                                             GtsEdge *with);

Replaces e with with. For each triangle which uses e as an edge, e is replaced with with. The with->triangles list is updated appropriately and the e->triangles list is freed and set to NULL.

e :	

a GtsEdge.
with :	

a GtsEdge.
gts_edge_is_unattached()

#define       gts_edge_is_unattached(s) ((s)->triangles == NULL ? TRUE : FALSE)

Evaluates to TRUE if no triangles uses s as an edge, FALSE otherwise.

s :	

a GtsEdge.
gts_edge_is_duplicate ()

GtsEdge*    gts_edge_is_duplicate           (GtsEdge *e);

e :	

a GtsEdge.
Returns :	

the first GtsEdge different from e which shares the same endpoints or NULL if there is none.
gts_edge_has_parent_surface ()

GtsFace*    gts_edge_has_parent_surface     (GtsEdge *e,
                                             GtsSurface *surface);

e :	

a GtsEdge.
surface :	

a GtsSurface.
Returns :	

a GtsFace of surface having e as an edge, NULL otherwise.
gts_edge_has_any_parent_surface ()

GtsFace*    gts_edge_has_any_parent_surface (GtsEdge *e);

e :	

a GtsEdge.
Returns :	

NULL if e is not an edge of any triangle or if all the faces having e has an edge do not belong to any surface, a GtsFace belonging to a surface and having e as an edge.
gts_edge_is_boundary ()

GtsFace*    gts_edge_is_boundary            (GtsEdge *e,
                                             GtsSurface *surface);

e :	

a GtsEdge.
surface :	

a GtsSurface or NULL.
Returns :	

the unique GtsFace (which belongs to surface) and which has e as an edge (i.e. e is a boundary edge (of surface)) or NULL if there is more than one or no faces (belonging to surface) and with e as an edge.
gts_edge_is_contact ()

guint       gts_edge_is_contact             (GtsEdge *e);

e :	

a GtsEdge.
Returns :	

the number of sets of connected triangles sharing e as a contact edge.
gts_edge_belongs_to_tetrahedron ()

gboolean    gts_edge_belongs_to_tetrahedron (GtsEdge *e);

e :	

a GtsEdge.
Returns :	

TRUE if e is used by faces forming a tetrahedron, FALSE otherwise.
gts_edge_face_number ()

guint       gts_edge_face_number            (GtsEdge *e,
                                             GtsSurface *s);

e :	

a GtsEdge.
s :	

a GtsSurface.
Returns :	

the number of faces using e and belonging to s.
gts_edge_manifold_faces ()

gboolean    gts_edge_manifold_faces         (GtsEdge *e,
                                             GtsSurface *s,
                                             GtsFace **f1,
                                             GtsFace **f2);

If e is a manifold edge of surface s, fills f1 and f2 with the faces belonging to s and sharing e.

e :	

a GtsEdge.
s :	

a GtsSurface.
f1 :	

pointer for first face.
f2 :	

pointer for second face.
Returns :	

TRUE if e is a manifold edge, FALSE otherwise.
GtsEncroachFunc ()

gboolean    (*GtsEncroachFunc)              (GtsVertex *v,
                                             GtsEdge *e,
                                             GtsSurface *s,
                                             gpointer data);

v :	

e :	

s :	

data :	

Returns :	

gts_edge_is_encroached ()

GtsVertex*  gts_edge_is_encroached          (GtsEdge *e,
                                             GtsSurface *s,
                                             GtsEncroachFunc encroaches,
                                             gpointer data);

e :	

a GtsEdge.
s :	

a GtsSurface describing a (constrained) Delaunay triangulation.
encroaches :	

a GtsEncroachFunc.
data :	

user data to be passed to encroaches.
Returns :	

a GtsVertex belonging to s and encroaching upon e (as defined by encroaches) or NULL if there is none.
gts_edges_merge ()

GList*      gts_edges_merge                 (GList *edges);

For each edge in edges check if it is duplicated (as returned by gts_edge_is_duplicate()). If it is replace it by its duplicate, destroy it and remove it from the list.

edges :	

a list of GtsEdge.
Returns :	

the updated edges list.
gts_edges_from_vertices ()

GSList*     gts_edges_from_vertices         (GSList *vertices,
                                             GtsSurface *parent);

vertices :	

a list of GtsVertex.
parent :	

a GtsSurface.
Returns :	

a list of unique GtsEdge which have one of their vertices in vertices and are used by a face of parent.
gts_edge_swap ()

void        gts_edge_swap                   (GtsEdge *e,
                                             GtsSurface *s);

Performs an "edge swap" on the two triangles sharing e and belonging to s.

e :	

a GtsEdge.
s :	

a GtsSurface.
<<< Segments	Triangles >>>
end -- class GTS_EDGE

