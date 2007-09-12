indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK developers
					
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

class GDK_EVENT_EXPOSE
	-- A GDK_EVENT_EXPOSE is generated when all or part of a window
	-- becomes visible and needs to be redrawn.

	-- typedef struct {
	-- GdkEventType type;
	--   GdkWindow *window;
	--   gint8 send_event;
	--   GdkRectangle area;
	--   GdkRegion *region;
	--   gint count; /* If non-zero, how many more events follow. */
	-- } GdkEventExpose;

inherit SHARED_C_STRUCT redefine from_external_pointer end

creation dummy, from_external_pointer

feature -- Creation
	from_external_pointer(a_pointer: POINTER) is
		do
			Precursor(a_pointer)
			create internal_window.from_external_pointer(default_pointer)
			create internal_area.from_external_pointer(default_pointer)
			create internal_region.from_external_pointer(default_pointer)
		end
	
feature 
	type: INTEGER is
			-- the type of the event (GDK_EXPOSE).
		do
			Result:=get_type(handle)
		end
	
	window: GDK_WINDOW is
			-- the window which received the event.
		do
			internal_window.from_external_pointer(get_window(handle))
			Result:=internal_window
		end

	send_event: BOOLEAN is
			-- Was the event sent explicitly (e.g. using XSendEvent)?
		do
			Result:=get_send_event(handle).to_boolean
		end

	area: GDK_RECTANGLE is
			-- bounding box of region.
		do
			internal_area.from_external_pointer(get_area(handle))
			Result:=internal_area
		end

	region: GDK_REGION is
			-- the region that needs to be redrawn.
		do
			internal_region.from_external_pointer(get_region(handle))
			Result:=internal_region
		end

	count: INTEGER is
			-- the number of contiguous GDK_EXPOSE events following this
			-- one. The only use for this is "exposure compression",
			-- i.e. handling all contiguous GDK_EXPOSE events in one go,
			-- though GDK performs some exposure compression so this is not
			-- normally needed.
		do
			Result:=get_count(handle)
		end
	
feature {} -- Internal
	internal_window: GDK_WINDOW
	internal_area: GDK_RECTANGLE
	internal_region: GDK_REGION
	
	get_type (a_ptr: POINTER): INTEGER is
			-- GdkEventType type;
		external "C struct GdkEventExpose get type <gdk/gdk.h>"
		end

	get_window (a_ptr: POINTER): POINTER is
			-- GdkWindow *window;
		external "C struct GdkEventExpose get window <gdk/gdk.h>"
		end

	get_send_event (a_ptr: POINTER): INTEGER_8 is
			-- gint8 send_event;
		external "C struct GdkEventExpose get area <gdk/gdk.h>"
		end

	get_area (a_ptr: POINTER): POINTER is
			-- GdkRectangle area; Note: the struct contains the 
			-- "expanded" structure; here we return a pointer to that substructure
		external "C struct GdkEventExpose get area <gdk/gdk.h>"
		alias " ( &(a_ptr->area) )"
		end

	get_region (a_ptr: POINTER): POINTER is
			-- GdkRegion *region;
		external "C struct GdkEventExpose get region <gdk/gdk.h>"
		end

	get_count (a_ptr: POINTER): INTEGER is
			-- gint count;
		external "C struct GdkEventExpose get count <gdk/gdk.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkEventExpose)"
		end

end -- class GDK_EVENT_EXPOSE
