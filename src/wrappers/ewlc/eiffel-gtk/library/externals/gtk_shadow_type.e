note
	description:" enum GtkShadowType Used to change the appearance of an outline typically provided by a GtkFrame."
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

deferred class GTK_SHADOW_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_shadow_type (a_shadow: INTEGER): BOOLEAN is
		do
			Result:=((a_shadow = gtk_shadow_none) or else
						(a_shadow = gtk_shadow_in) or else
						(a_shadow = gtk_shadow_out) or else
						(a_shadow = gtk_shadow_etched_in) or else
						(a_shadow = gtk_shadow_etched_out))
		end

	gtk_shadow_none: INTEGER is
			-- No outline.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_NONE"
		end

	gtk_shadow_in: INTEGER is
			-- 	The outline is bevelled inwards..
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_IN"
		end

	gtk_shadow_out: INTEGER is
			-- 	The outline is bevelled outwards like a button..
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_OUT"
		end

	gtk_shadow_etched_in: INTEGER is
			-- 	The outline itself is an inward bevel, but the frame does.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_ETCHED_IN"
		end

	gtk_shadow_etched_out: INTEGER is
			-- TODO
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_ETCHED_OUT"
		end

end
