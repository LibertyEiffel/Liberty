note
	description: "Segments -- segment object and related functions.."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTS team
					
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

class GTS_SEGMENT
	-- Segments are defined by their two GTS_VERTEX. They are not
	-- oriented.

	-- When destroying a GTS_SEGMENT, all the vertices not used by
	-- another edge are also destroyed. This default behaviour can be
	-- changed punctually by setting the global variable
	-- gts_allow_floating_vertices to TRUE. You must not forget to set
	-- this variable back to FALSE as all the algorithms of GTS assume
	-- the default behaviour.
	

inherit GTS_OBJECT redefine struct_size, is_equal end

insert
	GTS_SEGMENT_EXTERNALS
	GTS_SEGMENT_STRUCT
	GTS_VERTEX_EXTERNALS
	GTS_POINT_EXTERNALS	
	GTS_INTERSECT_ENUM
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make (a_v1, a_v2: GTS_VERTEX)
		require
			v1_not_void: a_v1 /= Void
			v2_not_void: a_v2 /= Void
			different_vertices: not a_v1.is_equal(a_v2)
		do
			from_external_pointer(gts_segment_new
										 (gts_segment_class,
										  a_v1.handle, a_v2.handle))
		end
	
feature {ANY}
	v1: GTS_VERTEX
		local p: POINTER
		do
			p:=get_v1(handle)
			check p.is_not_null end
			Result::=wrappers.reference_at(p)
			if Result=Void then
				debug vertex_creation_notice.print_on(std_error) end
				create Result.from_external_pointer(p)
			end
		end

	v2: GTS_VERTEX
		local p: POINTER
		do
			p:=get_v2(handle)
			check p.is_not_null end
			Result::=wrappers.reference_at(p)
			if Result=Void then
				debug vertex_creation_notice.print_on(std_error) end
				create Result.from_external_pointer(p)
			end
		end

feature {ANY}
	is_equal (another: GTS_SEGMENT): BOOLEAN
		do
			Result:=(gts_segments_are_identical(handle, another.handle).to_boolean)
		end

	is_intersecting (another: GTS_SEGMENT): INTEGER
			-- `gts_in' if Current and `another' are intersecting, `gts_on' if
			-- one of the endpoints of Current (resp. `another') lies on `another'
			-- (resp. s1), `gts_out' otherwise.
		require another_not_void: another /= Void
		do
			Result:=(gts_segments_are_intersecting
						(handle,another.handle))
		ensure is_valid_intersection(Result)
		end

	duplicate: like Current
			-- the first GtsSegment different from s which shares the same
			-- endpoints or Void if there is none.
		local ptr: POINTER
		do
			ptr:=gts_segment_is_duplicate(handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	is_ok: BOOLEAN
			-- Is Current GTS_SEGMENT not degenerate (i.e. v1 /= v2) and not
			-- duplicate, FALSE otherwise.
		do
			Result:=(gts_segment_is_ok(handle).to_boolean)
		end

	midvertex: GTS_VERTEX
		do
			create Result.from_external_pointer(gts_segment_midvertex (handle, gts_vertex_class))
		ensure not_void: Result /= Void
		end
	
	is_touching (another: GTS_SEGMENT): BOOLEAN
			-- Are Current and `another' touching?
		do
			Result:=gts_segments_touch(handle,another.handle).to_boolean
		end

	connects (edge_1, edge_2: GTS_EDGE): BOOLEAN
			-- Does Current connect `edge_1' with `edge_2'?
		do
			Result:=gts_segment_connect(handle,edge_1.handle,edge_2.handle).to_boolean
		end

	intersection (a_triangle: GTS_TRIANGLE; boundary: BOOLEAN): GTS_POINT
			-- Checks if segment intersects `a_triangle'. If this is the case,
			-- creates the new point intersection.
		
			-- This function is geometrically robust in the sense that it will not
			-- return a point if segment and `a_triangle' do not intersect and will
			-- return a point if segment and `a_triangle' do intersect. However,
			-- the point coordinates are subject to round-off errors.
		
			-- Note that this function will not return any point if segment is
			-- contained in the plane defined by `a_triangle'.

		
			-- If `boundary' if TRUE, the boundary of `a_triangle' is taken into account.
		
		local	ptr: POINTER
		do
			ptr:=gts_segment_triangle_intersection(handle, a_triangle.handle,
																boundary.to_integer, 
																gts_point_class)
			-- gts_segment_triangle_intersection Returns : a summit of t (if
			-- boundary is set to TRUE), one of the endpoints of s or a new
			-- GtsPoint, intersection of s with t or NULL if s and t don't
			-- intersect.
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

feature {} -- unwrapped code
	-- GTS_SEGMENT_CLASS()
	
	-- #define     GTS_SEGMENT_CLASS(klass)
	
	-- Casts klass to GtsSegmentClass.
	
	-- a descendant of GtsSegmentClass.
	-- GTS_SEGMENT()
	
	-- #define     GTS_SEGMENT(obj)

	-- Casts obj to GtsSegment.
	
	-- a descendant of GtsSegment.
	-- GTS_IS_SEGMENT()
	
	-- #define     GTS_IS_SEGMENT(obj)
	
	-- Evaluates to TRUE if obj is a descendant of GtsSegment, FALSE otherwise.
	
	-- a pointer to test.

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsSegment)"
		end

feature {} -- Implementation
	vertex_creation_notice: STRING
		"[
		 A GTS_SEGMENT created a GTS_VERTEX wrapper for either v1 or v2.
		 ]"
		 
end -- class GTS_SEGMENT
