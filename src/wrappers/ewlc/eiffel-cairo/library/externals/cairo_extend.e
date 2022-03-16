note
	description: "Enum cairo_extend_t"
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	wrapped_version: "1.2.4"

deferred class CAIRO_EXTEND
	-- cairo_extend_t is used to describe how the area outside of a
	-- pattern will be drawn.
	
	-- New entries may be added in future versions.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum

	is_valid_extend (an_extend: INTEGER): BOOLEAN
		do
			Result := ((an_extend = cairo_extend_none) or else
						(an_extend = cairo_extend_repeat) or else
						(an_extend = cairo_extend_reflect) or else
						(an_extend = cairo_extend_pad))
		end

	cairo_extend_none: INTEGER
			-- pixels outside of the source pattern are fully transparent
		external "C macro use <cairo.h>"
		alias "CAIRO_EXTEND_NONE"
		end

	cairo_extend_repeat: INTEGER
			-- the pattern is tiled by repeating
		external "C macro use <cairo.h>"
		alias "CAIRO_EXTEND_REPEAT"
		end

	cairo_extend_reflect: INTEGER
			-- the pattern is tiled by reflecting at the edges (not
			-- implemented for surface patterns currently)
		external "C macro use <cairo.h>"
		alias "CAIRO_EXTEND_REFLECT"
		end

	cairo_extend_pad: INTEGER
			-- pixels outside of the pattern copy the closest pixel from
			-- the source (Since 1.2; not implemented for surface
			-- patterns currently)
		external "C macro use <cairo.h>"
		alias "CAIRO_EXTEND_PAD"
		end

end
