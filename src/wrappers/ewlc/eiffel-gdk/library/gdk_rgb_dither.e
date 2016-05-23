note
	description: "Enum GdkRgbDither - Selects whether or not GdkRGB applies dithering to the image on display."
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

	-- Selects whether or not GdkRGB applies dithering to the image on
	-- display. Since GdkRGB currently only handles images with 8 bits
	-- per component, dithering on 24 bit per pixel displays is a moot
	-- point.

deferred class GDK_RGB_DITHER

inherit ANY undefine is_equal, copy end



feature {ANY}  -- enum

	is_valid_rgb_dither (a_dither :INTEGER): BOOLEAN is
		do
			Result:=((a_dither = gdk_rgb_dither_none) or else
						(a_dither = gdk_rgb_dither_normal) or else
						(a_dither = gdk_rgb_dither_max))
		end

	gdk_rgb_dither_none: INTEGER is
			--  Never use dithering.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_RGB_DITHER_NONE"
		end
	
	gdk_rgb_dither_normal: INTEGER is
			--  Use dithering in 8 bits per pixel (and below) only.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_RGB_DITHER_NORMAL"
		end
	
	gdk_rgb_dither_max: INTEGER is
			--  Use dithering in 16 bits per pixel and below.
		external "C macro use <gdk/gdk.h>"
		alias "GDK_RGB_DITHER_MAX"
		end
end
