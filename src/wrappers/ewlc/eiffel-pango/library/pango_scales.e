indexing
	description: "Various scaling factors used in Pango."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

deferred class PANGO_SCALES

inherit ANY undefine is_equal, copy end

feature {} -- Enum

	pango_scale_xx_small: REAL is
			-- The scale factor for three shrinking steps (1 / (1.2 * 1.2 * 1.2)).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_XX_SMALL"
		end

	pango_scale_x_small: REAL is
			-- The scale factor for two shrinking steps (1 / (1.2 * 1.2)).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_X_SMALL"
		end

	pango_scale_small: REAL is
			-- The scale factor for one shrinking step (1 / 1.2).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_SMALL"
		end

	pango_scale_medium: REAL is
			-- The scale factor for normal size (1.0).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_MEDIUM"
		end

	pango_scale_large: REAL is
			-- The scale factor for one magnification step (1.2).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_LARGE"
		end

	pango_scale_x_large: REAL is
			-- The scale factor for two magnification steps (1.2 * 1.2).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_X_LARGE"
		end

	pango_scale_xx_large: REAL is
			-- The scale factor for three magnification steps (1.2 * 1.2 * 1.2).
		external "C macro use <pango/pango.h>"
		alias "PANGO_SCALE_XX_LARGE"
		end

end
