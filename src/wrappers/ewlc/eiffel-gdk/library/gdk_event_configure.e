note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, $original_copyright_holder
					
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

class GDK_EVENT_CONFIGURE
	-- Generated when a window size or position has changed.
	
inherit GDK_EVENT 
		
create {ANY}  from_external_pointer

feature {ANY}
	x: INTEGER is
			-- the new x coordinate of the window, relative to its 
			-- parent.
		do
			Result:=get_x(handle)
		end

	y: INTEGER is
			-- the new y coordinate of the window, relative to its 
			-- parent.
		do
			Result:=get_y(handle)
		end

	width: INTEGER is
			-- the new width of the window.
		do
			Result:=get_width(handle)
		end

	height: INTEGER is
			-- the new height of the window.
		do
			Result:=get_height(handle)
		end

feature {} -- Structure getter/setter calls
  get_type (a_ptr: POINTER): INTEGER is
			-- GdkEventType type;
		external "C struct GdkEventExpose get type use <gdk/gdk.h>"
		end


  get_window (a_ptr: POINTER): POINTER is
			-- GdkWindow *window;
		external "C struct GdkEventExpose get *window use <gdk/gdk.h>"
		end


  get_send_event (a_ptr: POINTER): INTEGER_8 is
			-- gint8 send_event;
		external "C struct GdkEventExpose get send_event use <gdk/gdk.h>"
		end

  get_x (a_ptr: POINTER): INTEGER is
			-- gint x;
		external "C struct GdkEventExpose get x use <gdk/gdk.h>"
		end


  get_y (a_ptr: POINTER): INTEGER is
			-- gint y;
		external "C struct GdkEventExpose get y use <gdk/gdk.h>"
		end

  get_width (a_ptr: POINTER): INTEGER is
			-- gint width;
		external "C struct GdkEventExpose get width use <gdk/gdk.h>"
		end

  get_height (a_ptr: POINTER): INTEGER is
			-- gint height;
		external "C struct GdkEventExpose get height use <gdk/gdk.h>"
		end


end -- class GDK_EVENT_CONFIGURE
