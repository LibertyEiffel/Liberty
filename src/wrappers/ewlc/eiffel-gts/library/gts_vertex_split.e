note
	description: "Vertex split -- object encoding a reversible edge-collapse operation."
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

class GTS_VERTEX_SPLIT [EDGE->GTS_EDGE]
	-- A vertex split encodes a reversible edge-collapse operation. It
	-- is the building block of the progressive mesh representation
	-- proposed by Hoppe ("Progressive meshes", SIGGRAPH, 1996). It
	-- encodes an edge collapse operation and its inverse the "vertex
	-- split". The implementation of vertex split in GTS is somewhat
	-- more general than the original version of Hoppe. Non-manifold
	-- edges can be collapsed and non-manifold vertices can be split.

inherit SHARED_C_STRUCT

insert
	GTS_VERTEX_SPLIT_EXTERNALS
	GTS_EDGE_EXTERNALS
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make (a_vertex: GTS_VERTEX; an_object, another_object: GTS_OBJECT) is
			-- Creates a new GtsSplit which would collapse `an_object'
			-- and `another_object' into `a_vertex'. The collapse itself
			-- is not performed. `an_object' and `another_object' can be
			-- either a GtsVertex or a GtsSplit
		do
			from_external_pointer
			(gts_split_new (gts_split_class, a_vertex.handle,
								 an_object.handle, another_object.handle))
		end
	
feature {ANY}
	collapse (an_heap: GTS_EXTENDED_BINARY_HEAP[GTS_EDGE]) is
			-- Collapses the vertex split. Any new edge created during
			-- the process will be of class of `item'. If `an_heap' is
			-- not Void, the new edges will be inserted into it and the
			-- destroyed edges will be removed from it.
		do
			gts_split_collapse (handle, gts_edge_class, null_or(an_heap))
		end

	expand (a_surface: GTS_SURFACE) is
			-- Expands the vertex split vs adding the newly created faces
			-- to s. Any new edge will be of class klass.
		
			--     vs :     a GtsSplit.
			--     s :      a GtsSurface.
			--     klass :  a GtsEdgeClass.
		do
			gts_split_expand(handle,a_surface.handle,gts_edge_class)
		end

	height: INTEGER is
			-- the maximum height of the vertex split tree having Current as root.
		obsolete "Should be NATURAL, since it is a guint"
		do
			Result:=gts_split_height(handle)
		end
	
	traverse (an_order, a_depth: INTEGER; a_function: PROCEDURE[TUPLE[GTS_VERTEX_SPLIT[EDGE]]]) is
			-- Traverses the GtsSplit tree having Current as root. Calls
			-- `a_function' for each GtsSplit of the tree in the order
			-- specified by `an_order'. If order is set to `g_pre_order'
			-- `a_function' is called for the GtsSplit then its children,
			-- if order is set to `g_post_order' `a_function' is called
			-- for the children and then for the GtsSplit.

			-- `a_depth': the maximum depth of the traversal. Nodes below
			-- this depth will not be visited. If depth is -1 all nodes
			-- in the tree are visited. If depth is 1, only the root is
			-- visited. If depth is 2, the root and its children are
			-- visited. And so on.

			-- `a_function' : the function to call for each visited
			-- GtsHSplit.  data : user data to pass to the function.
		require implemented: False
		do
			gts_split_traverse (handle, an_order, a_depth,
									  default_pointer, -- GtsSplitTraverseFunc func,
									  default_pointer -- gpointer data
									  );
		end
feature {ANY}
	v1: GTS_VERTEX is
			-- the first vertex of the edge collapsed by Current.
		local a_pointer: POINTER
		do
			a_pointer:=gts_split_v2(handle)
			Result::= wrappers.reference_at(a_pointer)
			if Result=Void then
				create Result.from_external_pointer(a_pointer)
			end
		end

	v2: GTS_VERTEX is
			-- the second vertex of the edge collapsed by Current.
		local a_pointer: POINTER
		do
			a_pointer:=gts_split_v2(handle)
			Result::= wrappers.reference_at(a_pointer)
			if Result=Void then
				create Result.from_external_pointer(a_pointer)
			end
		end

feature {} -- Unwrapped code
	--   GTS_SPLIT_CLASS()

--  #define     GTS_SPLIT_CLASS(klass)

--    Casts klass to GtsSplitClass.

--     klass :  a descendant of GtsSplitClass.

--   GTS_SPLIT()

--  #define     GTS_SPLIT(obj)

--    Casts obj to GtsSplit.

--     obj :  a descendant of GtsSplit.

--    -----------------------------------------------------------------------------------------------------------

--   GTS_IS_SPLIT()

--  #define     GTS_IS_SPLIT(obj)

--    Evaluates to TRUE if obj is a GtsSplit.

--     obj :  a pointer to test.

--    -----------------------------------------------------------------------------------------------------------


--   GtsSplitClass

--  typedef struct {
--    GtsObjectClass parent_class;
--  } GtsSplitClass;

--    The vertex split class.

--    -----------------------------------------------------------------------------------------------------------

--   GtsSplitCFace

--  typedef struct _GtsSplitCFace GtsSplitCFace;

--    An opaque structure describing the faces collapsed by a vertex split.

--    -----------------------------------------------------------------------------------------------------------

	--   GtsSplit
	
	--  typedef struct {
	--    GtsObject object;
	
	--    GtsVertex * v;
	--    GtsObject * v1;
	--    GtsObject * v2;
	--    GtsSplitCFace * cfaces;
	--    guint ncf;
	--  } GtsSplit;

	-- The vertex split object. If v1 is a GtsSplit the corresponding
	-- vertex can be found in GTS_SPLIT(v1)->v.  This conversion is
	-- performed directly by the two macros GTS_SPLIT_V1 and
	-- GTS_SPLIT_V2. Together with the current GtsSplit, v1 and v2
	-- define one level of a vertex split tree. If v1 or v2 are both
	-- GtsVertex, the current vertex split is a leaf of the tree.

	--     GtsVertex *v;           Vertex to be split.
	--     GtsObject *v1;          Either a GtsSplit or GtsVertex, first vertex of the edge to be expanded.
	--     GtsObject *v2;          Either a GtsSplit or GtsVertex, second vertex of the edge to be expanded.
	--     GtsSplitCFace *cfaces;  An array of GtsSplitCFace describing the faces collapsed by the vertex split.
	--     guint ncf;              Number of faces collapsed in cfaces.

--    -----------------------------------------------------------------------------------------------------------

	--   GtsSplitTraverseFunc ()

--  gboolean    (*GtsSplitTraverseFunc)         (GtsSplit *vs,
--                                               gpointer data);

--    A user-defined function to be called when traversing a vertex split tree.

--     vs :       the GtsSplit for which this function is called.
--     data :     user data passed to the function.
--     Returns :  TRUE to stop the traversal, FALSE to continue.


end -- class GTS_VERTEX_SPLIT
