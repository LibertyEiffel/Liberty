note
	description: "."
	copyright: "[
					Copyright (C) 2008-2017: Paolo Redaelli
					
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

deferred class GDK
	-- This class is inserted by GTK_MAIN and other libraries requiring
	-- GDK to invoke `store_gdk_creation_agents'.

inherit WRAPPER_HANDLER undefine default_create end

insert SHARED_CREATION_DICTIONARY undefine default_create end

feature {} -- Creation agents
	store_gdk_creation_agents
		once
			creation_agents.put (agent create_gdk_screen , "GdkScreen")
			creation_agents.put (agent create_gdk_window , "GdkWindow")
			creation_agents.put (agent create_gdk_pixmap , "GdkPixmap")
			creation_agents.put (agent create_gdk_pixbuf , "GdkPixbuf")
			creation_agents.put (agent create_gdk_drag_context , "GdkDragContext")
			creation_agents.put (agent create_gdk_gc , "GdkGc")
		end

		create_gdk_screen (p: POINTER): GDK_SCREEN do create Result.from_external_pointer(p) end
		create_gdk_window (p: POINTER): GDK_WINDOW do create Result.from_external_pointer(p) end
		create_gdk_pixmap (p: POINTER): GDK_PIXMAP do create Result.from_external_pointer(p) end
		create_gdk_pixbuf (p: POINTER): GDK_PIXBUF do create Result.from_external_pointer(p) end
		create_gdk_drag_context (p: POINTER): GDK_DRAG_CONTEXT do create Result.from_external_pointer(p) end
		create_gdk_gc (p: POINTER): GDK_GC do create Result.from_external_pointer(p) end
	
end -- class GDK
