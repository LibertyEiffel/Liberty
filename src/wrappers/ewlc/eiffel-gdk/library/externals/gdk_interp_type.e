note
	description: "Enum GdkInterpType"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- This enumeration describes the different interpolation modes that can
	-- be used with the scaling functions. GDK_INTERP_NEAREST is the fastest
	-- scaling method, but has horrible quality when scaling down.
	-- GDK_INTERP_BILINEAR is the best choice if you aren't sure what to
	-- choose, it has a good speed/quality balance.

deferred class GDK_INTERP_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gdk_interp_type (an_interp_type: INTEGER) : BOOLEAN
		do
			Result:=((an_interp_type=gdk_interp_nearest) or else
			         (an_interp_type=gdk_interp_tiles) or else
			         (an_interp_type=gdk_interp_bilinear) or else
			         (an_interp_type=gdk_interp_hyper))
		end

	gdk_interp_nearest: INTEGER
			-- Nearest neighbor sampling; this is the fastest and lowest
			-- quality mode. Quality is normally unacceptable when scaling
			-- down, but may be OK when scaling up.
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_NEAREST"
		end

	gdk_interp_tiles: INTEGER
			-- This is an accurate simulation of the PostScript image
			-- operator without any interpolation enabled. Each pixel is
			-- rendered as a tiny parallelogram of solid color, the edges
			-- of which are implemented with antialiasing. It resembles
			-- nearest neighbor for enlargement, and bilinear for
			-- reduction.
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_TILES"
		end

	gdk_interp_bilinear: INTEGER
			-- Best quality/speed balance; use this mode by default.
			-- Bilinear interpolation. For enlargement, it is equivalent to
			-- point-sampling the ideal bilinear-interpolated image. For
			-- reduction, it is equivalent to laying down small tiles and
			-- integrating over the coverage area.
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_BILINEAR"
		end

	gdk_interp_hyper: INTEGER
			-- This is the slowest and highest quality reconstruction
			-- function. It is derived from the hyperbolic filters in
			-- Wolberg's "Digital Image Warping", and is formally defined
			-- as the hyperbolic-filter sampling the ideal
			-- hyperbolic-filter interpolated image (the filter is designed
			-- to be idempotent for 1:1 pixel mapping).
		external "C macro use <gdk-pixbuf/gdk-pixbuf.h>"
		alias "GDK_INTERP_HYPER"
		end

end -- GDK_INTERP_TYPE
