indexing
	description: "Segments -- segment object and related functions.."
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

			-- Description: Segments are defined by their two GtsVertex. They are
			-- not oriented.

			-- When destroying a GtsSegment, all the vertices not used by another
			-- edge are also destroyed. This default behaviour can be changed
			-- punctually by setting the global variable
			-- gts_allow_floating_vertices to TRUE. You must not forget to set this
			-- variable back to FALSE as all the algorithms of GTS assume the
			-- default behaviour.
			
class GTS_SEGMENT

inherit GTS_OBJECT

insert
	GTS_SEGMENT_EXTERNALS
	GTS_SEGMENT_STRUCT
	
creation make, from_external_pointer

feature {} -- Creation
	make (a_v1, a_v2: GTS_VERTEX) is
		require
			v1_not_void: a_v1 /= Void
			v2_not_void: a_v2 /= Void
			different_vertices: not a_v1.is_equal(a_v2)
		do
			from_external_pointer(gts_segment_new
										 (gts_segment_class,
										  a_v1.handle, a_v2.handle))
		end
	
feature
	is_equal (another: GTS_SEGMENT): BOOLEAN is
		do
			Result:=(gts_segments_are_identical(handle, another.handle).to_boolean)
		end

	is_intersecting (another: GTS_VERTEX): INTEGER is
			-- GTS_IN if s1 and s2 are intersecting, GTS_ON if one of the endpoints
			-- of s1 (resp. s2) lies on s2 (resp. s1), GTS_OUT otherwise.
		do
			Result:=(gts_segments_are_intersecting
						(handle,another.handle))
		ensure is_valid_intersect(Result)
		end

	duplicate: GTS_SEGMENT is
			-- the first GtsSegment different from s which shares the same
			-- endpoints or Void if there is none.
		local ptr: POINTER
		do
			ptr:=gts_segment_is_duplicate(handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	is_ok: BOOLEAN is
			-- Is Current GTS_SEGMENT not degenerate (i.e. v1 /= v2) and not
			-- duplicate, FALSE otherwise.
		do
			Result:=(gts_segment_is_ok(handle).to_boolean)
		end

		midvertex: GTS_VERTEX is
		do
			create Result.from_external_pointer
			(handle, gts_vertex_class)
		ensure not_void: Result /= Void
		end
	
feature {} -- unwrapped code
	-- GTS_SEGMENT_CLASS()
	
	-- #define     GTS_SEGMENT_CLASS(klass)
	
	-- Casts klass to GtsSegmentClass.
	
	-- klass :	
	
	-- a descendant of GtsSegmentClass.
	-- GTS_SEGMENT()
	
	-- #define     GTS_SEGMENT(obj)

	-- Casts obj to GtsSegment.
	
	-- obj :	
	
	-- a descendant of GtsSegment.
	-- GTS_IS_SEGMENT()
	
	-- #define     GTS_IS_SEGMENT(obj)
	
	-- Evaluates to TRUE if obj is a descendant of GtsSegment, FALSE otherwise.
	
	-- obj :	

	-- a pointer to test.

	-- #define     gts_segment_connect(s, e1, e2)

	-- Evaluates to TRUE if s connects e1 with e2, FALSE otherwise.
	
	-- gts_segments_touch()

	-- #define     gts_segments_touch(s1, s2)


end -- class GTS_SEGMENT
