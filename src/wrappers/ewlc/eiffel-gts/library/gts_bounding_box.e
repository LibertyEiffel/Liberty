note
	description: "Bounding boxes trees -- implementation of axis-aligned bounding-box trees."
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli, GTS team
					
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

class GTS_BOUNDING_BOX
	-- Description: Axis-aligned bounding box trees can be used for
	-- intersection/collision detection using `traverse_overlapping',
	-- or to compute the minimum distance between an object and a
	-- collection of others using `point_distance', `segment_distance',
	-- `triangle_distance' or `surface_distance'.

inherit SHARED_C_STRUCT

insert GTS_BOUNDING_BOX_EXTERNALS

create {ANY}  
	make, from_external_pointer,
	of_segment, of_triangle, of_surface, of_points, of_bounding_boxes

feature {} -- Creation
	make (a_bounded_object: GTS_OBJECT; an_x1, an_y1, a_z1, an_x2, an_y2, a_z2: REAL)
			-- Create a new bounding box for `a_bounded' object.

			-- `an_x1' : x-coordinate of the lower left corner.

			-- `an_y1' : y-coordinate of the lower left corner.

			--  `a_z1' : z-coordinate of the lower left corner.

			--  `an_x2' : x-coordinate of the upper right corner.

			-- `an_y2' : y-coordinate of the upper right corner.

			-- `a_z2' : z-coordinate of the upper right corner.
		require bounded_object_not_void: a_bounded_object /= Void
		do
			from_external_pointer 
			(gts_bbox_new (gts_bbox_class, a_bounded_object.handle,
								an_x1, an_y1, a_z1, an_x2, an_y2, a_z2))
		end
	
	of_segment (a_segment: GTS_SEGMENT)
			-- Create a new GtsBBox bounding box of `a_segment'.
		require segment_not_void: a_segment /= Void
		do
			from_external_pointer(gts_bbox_segment(gts_bbox_class,a_segment.handle))
		end

	of_triangle (a_triangle: GTS_TRIANGLE)
			-- Create a new bounding box for triangle
		require triangle_not_void: a_triangle /= Void
		do
			from_external_pointer(gts_bbox_triangle(gts_bbox_class,a_triangle.handle))
		end

	of_surface (a_surface: GTS_SURFACE)
			-- Create a new bounding box for surface
		require surface_not_void: a_surface /= Void
		do
			from_external_pointer(gts_bbox_surface(gts_bbox_class,a_surface.handle))
		end

	of_points (some_points: G_SLIST[GTS_POINT])
			-- Create a new bounding box for points
		require points_not_void: some_points /= Void
		do
			from_external_pointer(gts_bbox_points(gts_bbox_class,some_points.handle))
		end

	of_bounding_boxes (some_bounding_boxes: G_SLIST[GTS_BOUNDING_BOX])
			-- Create a new bounding box for bboxes
		require bboxes_not_void: some_bounding_boxes /= Void
		do
			from_external_pointer(gts_bbox_bboxes(gts_bbox_class,some_bounding_boxes.handle))
		end

feature {ANY} 
	set (a_bounded: GTS_OBJECT; an_x1, an_y1, a_z1, an_x2, an_y2, a_z2: REAL)
			-- Sets the fields of the bounding box.

			-- `an_x1' : x-coordinate of the lower left corner.

			-- `an_y1' : y-coordinate of the lower left corner.

			--  `a_z1' : z-coordinate of the lower left corner.

			--  `an_x2' : x-coordinate of the upper right corner.

			-- `an_y2' : y-coordinate of the upper right corner.

			-- `a_z2' : z-coordinate of the upper right corner.
		require bounded_not_void: a_bounded /= Void
		do
			gts_bbox_set (handle, a_bounded.handle,
							  an_x1, an_y1, a_z1, an_x2, an_y2, a_z2)
		end


	--   gts_bbox_draw ()
	
	-- void gts_bbox_draw (GtsBBox *bb, FILE *fptr);

	--    Writes in file fptr an OOGL (Geomview) description of bb.
	
	--     bb :    a GtsBBox.
	--     fptr :  a file pointer.

	is_inside (a_point: GTS_POINT): BOOLEAN
			-- Is `a_point' inside (or on the boundary) of bounding box?
		require point_not_void: a_point /= Void
		do
			Result:=gts_bbox_point_is_inside(handle,a_point.handle).to_boolean
		end

	overlaps (another: GTS_BOUNDING_BOX): BOOLEAN
			-- Are the bounding boxes Current and `another' are overlapping
			-- (including just touching)?
		do
			Result:=gts_bboxes_are_overlapping(handle,another.handle).to_boolean
		end	

	diagonal2: REAL
			-- the squared length of the diagonal of bounding box.
		do
			Result:=gts_bbox_diagonal2(handle)
		end

	distance2 (a_point: GTS_POINT): TUPLE[REAL,REAL]
			-- The lower and upper bounds for the square of the Euclidean distance
			-- between the object contained in bounding box and `a_point'. For
			-- these bounds to make any sense the bounding box must be "tight"
			-- i.e. each of the 6 faces of the box must at least be touched by one
			-- point of the bounded object.
		require point_not_void: a_point /= Void
		local a_min, a_max: REAL
		do
			gts_bbox_point_distance2(handle,a_point.handle,$a_min,$a_max)
			create Result.make_2 (a_min, a_max)
		end

	is_stabbed (a_point: GTS_POINT): BOOLEAN
			-- Does the ray starting at `a_point' and ending at (+infty, p->y,
			-- p->z) intersects with bounding box?
		require point_not_void: a_point /= Void
		do
			Result:=gts_bbox_is_stabbed(handle, a_point.handle).to_boolean
		end

	overlaps_triangle (a_triangle: GTS_TRIANGLE): BOOLEAN
			-- Does bounding box overlap with `a_triangle'.  This is a wrapper
			-- around the fast overlap test of Tomas Akenine-Moller
			-- (http://www.cs.lth.se/home/Tomas_Akenine_Moller/).
		require triangle_not_void: a_triangle /= Void
		do
			Result:=gts_bbox_overlaps_triangle(handle,a_triangle.handle).to_boolean
		end


	--   GtsBBTreeTraverseFunc ()
	
	-- void (*GtsBBTreeTraverseFunc) (GtsBBox *bb1, GtsBBox *bb2, gpointer data);

	-- User function called for each pair of overlapping bounding boxes. See
	-- gts_bb_tree_traverse_overlapping().

	--     bb1 :   a GtsBBox.
	--     bb2 :   another GtsBBox.
	--     data :  user data passed to the function.


end -- class GTS_BOUNDING_BOX
