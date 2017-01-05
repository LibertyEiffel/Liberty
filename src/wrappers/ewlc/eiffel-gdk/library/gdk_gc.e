note
	description: "Graphics Contexts -- Objects to encapsulate drawing properties"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

	-- All drawing operations in GDK take a graphics context (GC) argument.
	-- A graphics context encapsulates information about the way things are drawn,
	-- such as the foreground color or line width. By using graphics contexts, the
	-- number of arguments to each drawing call is greatly reduced, and
	-- communication overhead is minimized, since identical arguments do not need
	-- to be passed repeatedly.
	--
	-- Most values of a graphics context can be set at creation time by using
	-- create gc.with_values() (NOT IMPLEMENTED), or can be set one-by-one using
	-- functions such as gc.set_foreground(). A few of the values in the GC,
	-- such as the dash pattern, can only be set by the latter method. 

class GDK_GC

inherit
	G_OBJECT

insert
	GDK_GC_EXTERNALS

create {ANY} from_external_pointer, make

feature {} -- Creation

	make (a_drawable: GDK_DRAWABLE)
			-- Create a new graphics context with default values.
		do
			from_external_pointer (gdk_gc_new (a_drawable.handle))
		end

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GdkGc)"
		end

feature {ANY} -- Operations

	set_rgb_fg_color (a_color: GDK_COLOR)
			-- Set the foreground color of a GC using an unallocated color.
			-- The pixel value for the color will be determined using GdkRGB.
			-- If the colormap for the GC has not previously been initialized
			-- for GdkRGB, then for pseudo-color colormaps (colormaps with a
			-- small modifiable number of colors), a colorcube will be
			-- allocated in the colormap.
			--
			-- Calling this function for a GC without a colormap is an error.
		do
			gdk_gc_set_rgb_fg_color (handle, a_color.handle)
		end

	set_rgb_bg_color (a_color: GDK_COLOR)
			-- Set the background color of a GC using an unallocated color.
			-- The pixel value for the color will be determined using GdkRGB.
			-- If the colormap for the GC has not previously been initialized
			-- for GdkRGB, then for pseudo-color colormaps (colormaps with a
			-- small modifiable number of colors), a colorcube will be
			-- allocated in the colormap.
			--
			-- Calling this function for a GC without a colormap is an error.
		do
			gdk_gc_set_rgb_bg_color (handle, a_color.handle)
		end

end
