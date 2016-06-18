note
	description: "GdkRectangle."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

class GDK_RECTANGLE

inherit G_STRUCT

create {ANY} from_external_pointer, from_external_copy, make

feature {ANY} --Creation

	make
		do
			allocate
		end

feature {ANY}
	x: INTEGER
			-- the x coordinate of the left edge of the rectangle.
		do
			Result:=get_x(handle)
		end

	y: INTEGER
			-- the y coordinate of the top of the rectangle.
		do
			Result:=get_y(handle)
		end

	width: INTEGER
			-- the width of the rectangle.
		do
			Result:=get_width(handle)
		end

	height: INTEGER
			-- the height of the rectangle.
		do
			Result:=get_height(handle)
		end
	
feature {ANY} -- Union and intersection

	intersection (a_rectangle, another_rectangle: GDK_RECTANGLE): BOOLEAN
			-- Makes Current the intersection of two rectangles; Result
			-- is True if they actually intersect.
		require
			a_rectangle_not_void: a_rectangle /= Void
			another_rectangle_not_void: another_rectangle /= Void
		do
			Result := (gdk_rectangle_intersect (a_rectangle.handle, another_rectangle.handle,
															handle).to_boolean)
		end
	
	union (a_rectangle, another_rectangle: GDK_RECTANGLE)
			-- Makes Current the union of two rectangles. The union of
			-- `a_rectangle' and `another_rectangle' is the smallest
			-- rectangle which includes both within it.
		require
			a_rectangle_not_void: a_rectangle /= Void
			another_rectangle_not_void: another_rectangle /= Void
		do
			gdk_rectangle_union (a_rectangle.handle, another_rectangle.handle, handle)
		end
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkRectangle)"
		end

feature {} -- Struct accesing

	get_x (span: POINTER): INTEGER
		external "C struct GdkRectangle get x use <gdk/gdk.h>"
		end

	get_y (span: POINTER): INTEGER
		external "C struct GdkRectangle get y use <gdk/gdk.h>"
		end
	
	get_width (span: POINTER): INTEGER
		external "C struct GdkRectangle get width use <gdk/gdk.h>"
		end

	get_height (span: POINTER): INTEGER
		external "C struct GdkRectangle get height use <gdk/gdk.h>"
		end

feature {} -- External features

	gdk_rectangle_intersect (a_src1_rectangle, a_src2_rectangle, a_dest_gdk_rectangle: POINTER): INTEGER is -- gboolean
		external "C use  <gdk/gdk.h>"
		end
	
	gdk_rectangle_union (a_src1_rectangle, a_src2_rectangle, a_dest_rectangle: POINTER)
		external "C use  <gdk/gdk.h>"
		end
end
