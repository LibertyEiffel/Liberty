note
	description: "The GtkAlignment widget externals."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
	revision: "$REvision:$"

deferred class GTK_ALIGNMENT_EXTERNALS

inherit
	ANY undefine is_equal, copy end

feature {} -- external calls

	gtk_alignment_new (xalign, yalign, xscale, yscale: REAL_32): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_alignment_set (alignment: POINTER; xalign, yalign, xscale, yscale: REAL_32)
		external "C use <gtk/gtk.h>"
		end

	gtk_alignment_get_padding (alignment, guint_padding_top, guint_padding_bottom, guint_padding_left, guint_padding_right: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_alignment_set_padding (alignment: POINTER; guint_padding_top, guint_padding_bottom, guint_padding_left, guint_padding_right: INTEGER)
			-- TODO all guint_* shall be NATURAL!
		external "C use <gtk/gtk.h>"
		end
end
