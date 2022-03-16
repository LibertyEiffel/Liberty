note
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_FRAME_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_SHADOW_TYPE

feature {} -- External calls

	gtk_frame_new (a_label: POINTER): POINTER
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label (frame, a_label: POINTER)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label_widget (frame,label_widget: POINTER)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label_align (frame: POINTER; xalign, yalign: REAL)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_shadow_type (frame: POINTER; gtkshadowtype: INTEGER)
		require is_valid_gtk_shadow_type (gtkshadowtype)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label (frame: POINTER): POINTER
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label_align (frame, xalign, yalign: POINTER)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label_widget (frame: POINTER): POINTER
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_shadow_type (frame: POINTER): INTEGER
		external "C use  <gtk/gtk.h>"
		ensure is_valid_gtk_shadow_type (Result)
		end

end
