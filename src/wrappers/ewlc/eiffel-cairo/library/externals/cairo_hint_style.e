note
	description: "enum cairo_hint_style_t"
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

deferred class CAIRO_HINT_STYLE
	-- Specifies the type of hinting to do on font outlines. Hinting is
	-- the process of fitting outlines to the pixel grid in order to
	-- improve the appearance of the result. Since hinting outlines
	-- involves distorting them, it also reduces the faithfulness to
	-- the original outline shapes. Not all of the outline hinting
	-- styles are supported by all font backends.

	--   New entries may be added in future versions.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_hint_style (a_style: INTEGER): BOOLEAN
		do	
			Result:=((a_style = cairo_hint_style_default) or else
						(a_style = cairo_hint_style_none) or else
						(a_style = cairo_hint_style_slight) or else
						(a_style = cairo_hint_style_medium) or else
						(a_style = cairo_hint_style_full))
		end

	  cairo_hint_style_default: INTEGER
			-- Use the default hint style for for font backend and target
			-- device
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_STYLE_DEFAULT"
		end

	  cairo_hint_style_none: INTEGER
			-- Do not hint outlines
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_STYLE_NONE"
		end

	  cairo_hint_style_slight: INTEGER
			-- Hint outlines slightly to improve contrast while retaining
			-- good fidelity to the original shapes.
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_STYLE_SLIGHT"
		end

	  cairo_hint_style_medium: INTEGER
			-- Hint outlines with medium strength giving a compromise
			-- between fidelity to the original shapes and contrast
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_STYLE_MEDIUM"
		end

	  cairo_hint_style_full: INTEGER
			-- Hint outlines to maximize contrast
		external "C macro use <cairo.h>"
		alias "CAIRO_HINT_STYLE_FULL"
		end
end
