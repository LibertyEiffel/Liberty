note
	description: "enum cairo_subpixel_order_t"
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

deferred class CAIRO_SUBPIXEL_ORDER
	-- The subpixel order specifies the order of color elements within
	-- each pixel on the display device when rendering with an
	-- antialiasing mode of CAIRO_ANTIALIAS_SUBPIXEL.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_subpixel_order (an_order: INTEGER): BOOLEAN
		do	
			Result:=((an_order = cairo_subpixel_order_default) or else
						(an_order = cairo_subpixel_order_rgb) or else
						(an_order = cairo_subpixel_order_bgr) or else
						(an_order = cairo_subpixel_order_vrgb) or else
						(an_order = cairo_subpixel_order_vbgr))
		end
		
	cairo_subpixel_order_default: INTEGER
			-- Use the default subpixel order for for the target device
		external "C macro use <cairo.h>"
		alias "CAIRO_SUBPIXEL_ORDER_DEFAULT"
		end

	cairo_subpixel_order_rgb: INTEGER
			-- Subpixel elements are arranged horizontally with red at
			-- the left
		external "C macro use <cairo.h>"
		alias "CAIRO_SUBPIXEL_ORDER_RGB"
		end
	
	cairo_subpixel_order_bgr: INTEGER
			-- Subpixel elements are arranged horizontally with blue at
			-- the left
		external "C macro use <cairo.h>"
		alias "CAIRO_SUBPIXEL_ORDER_BGR"
		end

	cairo_subpixel_order_vrgb: INTEGER
			-- Subpixel elements are arranged vertically with red at the
			-- top
		external "C macro use <cairo.h>"
		alias "CAIRO_SUBPIXEL_ORDER_VRGB"
		end

	cairo_subpixel_order_vbgr: INTEGER
			-- Subpixel elements are arranged vertically with blue at the
			-- top
		external "C macro use <cairo.h>"
		alias "CAIRO_SUBPIXEL_ORDER_VBGR"
		end


end
