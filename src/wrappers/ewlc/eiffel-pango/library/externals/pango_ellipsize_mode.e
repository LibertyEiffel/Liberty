note
	description: "Enum  PangoEllipsizeMode"
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

deferred class PANGO_ELLIPSIZE_MODE
	-- The PangoEllipsizeMode type describes what sort of (if any)
	-- ellipsization should be applied to a line of text. In the
	-- ellipsization process characters are removed from the text in
	-- order to make it fit to a given width and replaced with an
	-- ellipsis.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_pango_ellipsize_mode (a_mode :INTEGER): BOOLEAN is
		do	
			Result:=((a_mode = pango_ellipsize_none) or else
						(a_mode = pango_ellipsize_start) or else
						(a_mode = pango_ellipsize_middle) or else
						(a_mode = pango_ellipsize_end))
		end

	pango_ellipsize_none: INTEGER is
			-- No ellipsization
		external "C macro use <gtk/gtk.h>"
		alias "PANGO_ELLIPSIZE_NONE"
		end
	
	pango_ellipsize_start: INTEGER is
			-- Omit characters at the start of the text
		external "C macro use <gtk/gtk.h>"
		alias "PANGO_ELLIPSIZE_START"
		end
	
	pango_ellipsize_middle: INTEGER is
			-- Omit characters in the middle of the text
		external "C macro use <gtk/gtk.h>"
		alias "PANGO_ELLIPSIZE_MIDDLE"
		end
	
	pango_ellipsize_end: INTEGER is
			-- Omit characters at the end of the text
		external "C macro use <gtk/gtk.h>"
		alias "PANGO_ELLIPSIZE_END"
		end
end
