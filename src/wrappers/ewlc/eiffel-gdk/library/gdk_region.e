note
	description: "GdkRegion."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
class GDK_REGION

inherit
	G_STRUCT
		redefine copy, dispose end

insert
	GDK_FILL_RULE -- 	redefine copy end
	GDK_OVERLAP_TYPE -- redefine copy end

create {ANY}
	make, from_polygon, from_external_pointer, from_rectangle, copy, from_external_copy

feature {ANY} -- Creation
	make
			-- Creates a new empty GdkRegion.
		do
			handle := gdk_region_new
		end
	
	from_polygon (some_points: ARRAY[GDK_POINT]; a_fill_rule: INTEGER)
			-- Creates a new GdkRegion using the polygon defined by a
			-- number of points.  `some_points': an array of GdkPoint
			-- structs.  `a_fill_rule' specifies which pixels are
			-- included in the region when the polygon overlaps itself.

			-- TODO: current implementation has to copy `some_points'
			-- into a NATIVE_ARRAY. Implement G_ARRAY or something
			-- similar to achieve better performance. Paolo 2006-07-02
		require valid_fill_rule: is_valid_fill_rule (a_fill_rule)
		local array: NATIVE_ARRAY [POINTER]; i: INTEGER; iter: ITERATOR[GDK_POINT]
		do
			array := array.calloc (some_points.count)
			iter := some_points.get_new_iterator;
			from i:=0; iter.start
			until iter.is_off
			loop
				array.put(iter.item.handle, i)
				i := i + 1
				iter.next
			end
			handle := gdk_region_polygon (array.to_external,some_points.count,a_fill_rule)
		end
	
	from_rectangle (a_rectangle: GDK_RECTANGLE)
			-- Creates a new region containing the area `a_rectangle'.
		require rectangle_not_void: a_rectangle /= Void
		do
			handle := gdk_region_rectangle (handle)
		end


	dispose
			-- Destroys a GdkRegion.
		do
			gdk_region_destroy (handle)
			handle := default_pointer
		end
	
feature {ANY} -- Duplication

	copy (another: GDK_REGION)
			-- Copies region, creating an identical new region.
		do
			handle := gdk_region_copy (another.handle)
		end

feature {} -- Unwrapped code
	
-- gdk_region_get_clipbox ()

-- void        gdk_region_get_clipbox          (GdkRegion *region,
--                                              GdkRectangle *rectangle);

-- Returns the smallest rectangle which includes the entire GdkRegion.
-- region : 	a GdkRegion.
-- rectangle : 	returns the smallest rectangle which includes all of region.
-- gdk_region_get_rectangles ()

-- void        gdk_region_get_rectangles       (GdkRegion *region,
--                                              GdkRectangle **rectangles,
--                                              gint *n_rectangles);

-- Obtains the area covered by the region as a list of rectangles. The array returned in rectangles must be freed with g_free().

-- region : 	a GdkRegion
-- rectangles : 	return location for an array of rectangles
-- n_rectangles : 	length of returned array
-- gdk_region_empty ()

-- gboolean    gdk_region_empty                (GdkRegion *region);

-- Returns TRUE if the GdkRegion is empty.
-- region : 	a GdkRegion.
-- Returns : 	TRUE if region is empty.
-- gdk_region_equal ()

-- gboolean    gdk_region_equal                (GdkRegion *region1,
--                                              GdkRegion *region2);

-- Returns TRUE if the two regions are the same.
-- region1 : 	a GdkRegion.
-- region2 : 	a GdkRegion.
-- Returns : 	TRUE if region1 and region2 are equal.
-- gdk_region_point_in ()

-- gboolean    gdk_region_point_in             (GdkRegion *region,
--                                              int x,
--                                              int y);

-- Returns TRUE if a point is in a region.
-- region : 	a GdkRegion.
-- x : 	the x coordinate of a point.
-- y : 	the y coordinate of a point.
-- Returns : 	TRUE if the point is in region.
-- gdk_region_rect_in ()

-- GdkOverlapType gdk_region_rect_in           (GdkRegion *region,
--                                              GdkRectangle *rect);

-- Tests whether a rectangle is within a region.
-- region : 	a GdkRegion.
-- rect : 	a GdkRectangle.
-- Returns : 	GDK_OVERLAP_RECTANGLE_IN, GDK_OVERLAP_RECTANGLE_OUT, or GDK_OVERLAP_RECTANGLE_PART, depending on whether the rectangle is inside, outside, or partly inside the GdkRegion, respectively.

-- gdk_region_offset ()

-- void        gdk_region_offset               (GdkRegion *region,
--                                              gint dx,
--                                              gint dy);

-- Moves a region the specified distance.
-- region : 	a GdkRegion.
-- dx : 	the distance to move the region horizontally.
-- dy : 	the distance to move the region vertically.
-- gdk_region_shrink ()

-- void        gdk_region_shrink               (GdkRegion *region,
--                                              gint dx,
--                                              gint dy);

-- Resizes a region by the specified amount. Positive values shrink the region. Negative values expand it.
-- region : 	a GdkRegion.
-- dx : 	the number of pixels to shrink the region horizontally.
-- dy : 	the number of pixels to shrink the region vertically.
-- gdk_region_union_with_rect ()

-- void        gdk_region_union_with_rect      (GdkRegion *region,
--                                              GdkRectangle *rect);

-- Sets the area of region to the union of the areas of region and rect. The resulting area is the set of pixels contained in either region or rect.

-- region : 	a GdkRegion.
-- rect : 	a GdkRectangle.
-- gdk_region_intersect ()

-- void        gdk_region_intersect            (GdkRegion *source1,
--                                              GdkRegion *source2);

-- Sets the area of source1 to the intersection of the areas of source1 and source2. The resulting area is the set of pixels contained in both source1 and source2.

-- source1 : 	a GdkRegion
-- source2 : 	another GdkRegion
-- gdk_region_union ()

-- void        gdk_region_union                (GdkRegion *source1,
--                                              GdkRegion *source2);

-- Sets the area of source1 to the union of the areas of source1 and source2. The resulting area is the set of pixels contained in either source1 or source2.

-- source1 : 	a GdkRegion
-- source2 : 	a GdkRegion
-- gdk_region_subtract ()

-- void        gdk_region_subtract             (GdkRegion *source1,
--                                              GdkRegion *source2);

-- Subtracts the area of source2 from the area source1. The resulting area is the set of pixels contained in source1 but not in source2.

-- source1 : 	a GdkRegion
-- source2 : 	another GdkRegion
-- gdk_region_xor ()

-- void        gdk_region_xor                  (GdkRegion *source1,
--                                              GdkRegion *source2);

-- Sets the area of source1 to the exclusive-OR of the areas of source1 and source2. The resulting area is the set of pixels contained in one or the other of the two sources but not in both.

-- source1 : 	a GdkRegion
-- source2 : 	another GdkRegion

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkRegion)"
		end

feature {} -- extnernal features

	gdk_region_new: POINTER is -- GdkRegion*
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_region_polygon (some_gdk_points: POINTER; n_points: INTEGER; a_gdkfillrule: INTEGER): POINTER is -- GdkRegion*
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_region_copy (a_region: POINTER): POINTER is -- GdkRegion*
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_region_rectangle (a_gdk_rectangle: POINTER): POINTER is -- GdkRegion*
		external "C use  <gdk/gdk.h>"
		end

	gdk_region_destroy (a_region: POINTER)
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_region_get_clipbox (a_region, a_gdk_rectangle: POINTER)
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_region_get_rectangles (a_region, rectangles, n_rectangles: POINTER)
		-- Note GdkRectangle **rectangles; gint *n_rectangles
		external "C use  <gdk/gdk.h>"
		end

	gdk_region_empty (a_region: POINTER): INTEGER is -- gboolean
		external "C use  <gdk/gdk.h>"
		end

	gdk_region_equal (a_region, another_region: POINTER): INTEGER is -- gboolean
		external "C use  <gdk/gdk.h>"
		end

	gdk_region_point_in (a_region: POINTER; an_x, an_y: INTEGER): INTEGER is -- gboolean
		external "C use  <gdk/gdk.h>"
		end

	gdk_region_rect_in (a_region, a_gdk_rectangle: POINTER): INTEGER is -- GdkOverlapType
		external "C use  <gdk/gdk.h>"
		ensure valid_result: is_valid_overlap_type (Result)
		end
end
