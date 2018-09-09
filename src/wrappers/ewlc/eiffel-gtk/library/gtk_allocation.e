note
	description: "GTK_ALLOCATION, a region which has been allocated to the widget by its parent."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_ALLOCATION
		-- A GtkAllocation of a widget represents
		-- region which has been allocated to the widget by its parent. It is a
		-- subregion of its parents allocation. See the section called ?Size
		-- Allocation? for more information.

		-- gint x; 	the X position of the widget's area relative to its parents allocation.
		-- gint y; 	the Y position of the widget's area relative to its parents allocation.
		-- gint width; 	the width of the widget's allocated area.
		-- gint height; 	the height of the widget's allocated area.

inherit
	G_STRUCT redefine is_equal end

create {ANY} copy, copy_from_pointer

feature {} -- Creation

	copy_from_pointer (a_ptr: POINTER)
		require
			a_ptr.is_not_null
		do
			dispose
			allocate
			handle := memcpy (handle, a_ptr, struct_size)
		end

feature {ANY}

	is_equal (other: like Current): BOOLEAN
		do
			Result := width = other.width and height = other.height and
			          x = other.x and y = other.y
		end

	width: INTEGER
			-- the width of the widget's allocated area
		do
			Result := get_width_external (handle)
		end

	set_width (a_width: INTEGER)
		do
			set_width_external (handle, a_width)
		end

	height: INTEGER
			-- the widget's desired height
		do
			Result := get_height_external (handle)
		end

	set_height (an_height: INTEGER)
		do
			set_height_external (handle, an_height)
		end

	x: INTEGER
			-- the X position of the widget's area relative
			-- to its parents allocation
		do
			Result := get_x_external (handle)
		end

	set_x (a_x: INTEGER)
		do
			set_x_external (handle, a_x)
		end

	y: INTEGER
			-- the X position of the widget's area relative
			-- to its parents allocation
		do
			Result := get_y_external (handle)
		end

	set_y (a_y: INTEGER)
		do
			set_y_external (handle, a_y)
		end

feature {} -- External

	get_width_external (ptr: POINTER): INTEGER
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation get width use <gtk/gtk.h>"
		end

	set_width_external (ptr: POINTER; a_width:INTEGER)
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation set width use <gtk/gtk.h>"
		end

	get_height_external (ptr: POINTER): INTEGER
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation get height use <gtk/gtk.h>"
		end

	set_height_external (ptr: POINTER; an_height:INTEGER)
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation set height use <gtk/gtk.h>"
		end

	get_x_external (ptr: POINTER): INTEGER
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation get x use <gtk/gtk.h>"
		end

	set_x_external (ptr: POINTER; a_x:INTEGER)
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation set x use <gtk/gtk.h>"
		end

	get_y_external (ptr: POINTER): INTEGER
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation get y use <gtk/gtk.h>"
		end

	set_y_external (ptr: POINTER; a_y:INTEGER)
		require valid_ptr: ptr.is_not_null
		external "C struct GtkAllocation set y use <gtk/gtk.h>"
		end

feature {ANY}  -- struct size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof (GtkAllocation)"
		end

end -- class GTK_ALLOCATION
