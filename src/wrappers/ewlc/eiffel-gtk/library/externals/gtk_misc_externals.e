note
	description: "External calls for GTK_MISC"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MISC_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_misc_set_alignment (a_misc: POINTER; a_gfloat_xalign,a_gfloat_yalign: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_misc_set_padding (a_misc: POINTER; an_xpad, an_ypad: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_misc_get_alignment (a_misc,gfloat_xalign,gfloat_yalign: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_misc_get_padding (a_misc,gint_xpad,gint_ypad: POINTER)
		external "C use <gtk/gtk.h>"
		end

feature {} -- accessing  GtkMisc structure

	get_xalign (a_gtk_misc: POINTER): REAL_32
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end

	get_yalign (a_gtk_misc: POINTER): REAL_32
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end

	get_xpad (a_gtk_misc: POINTER): INTEGER_16
			-- TODO shall be NATURAL_16
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end

	get_ypad (a_gtk_misc: POINTER): INTEGER_16
			-- TODO shall be NATURAL_16
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end
end

