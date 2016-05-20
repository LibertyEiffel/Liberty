note
	description: "Generated when all or part of a window becomes visible and needs to be redrawn."
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, GTK+ team
					
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

inherit
	GDK_EVENT

insert
	GDK_EVENT_EXPOSE_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} -- access

	area: GDK_RECTANGLE is
			-- bounding box of region. 
		do
			create Result.from_external_copy (gdk_event_expose_get_area (handle))
		end

	region: GDK_REGION is
			-- bounding box of region. 
		do
			create Result.from_external_copy (gdk_event_expose_get_region (handle))
		end

	count: INTEGER is
			-- the number of contiguous GDK_EXPOSE events following this one.
			-- The only use for this is "exposure compression", i.e. handling
			-- all contiguous GDK_EXPOSE events in one go, though GDK performs
			-- some exposure compression so this is not normally needed. 
		do
			Result := gdk_event_expose_get_count (handle)
		end

-- feature -- size
-- 
-- 	struct_size: INTEGER is
-- 		external "C inline use <gdk/gdk.h>"
-- 		alias "sizeof(GdkEventExpose)"
-- 		end

invariant is_event_expose

end -- class GDK_EVENT_EXPOSE
