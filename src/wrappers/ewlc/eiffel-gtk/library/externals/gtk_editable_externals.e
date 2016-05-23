note
	description: "External calls for GTK_EDITABLE"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_EDITABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_editable_select_region      (an_editable: POINTER; a_start,an_end: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_editable_get_selection_bounds (an_editable, a_start, an_end: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_insert_text (an_editable, a_new_text: POINTER;new_text_length: INTEGER; a_position: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_delete_text        (an_editable: POINTER; a_start_pos, a_end_pos: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_chars          (an_editable: POINTER; a_start_pos, a_end_pos: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_cut_clipboard      (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_copy_clipboard     (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_paste_clipboard    (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_editable_delete_selection   (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_set_position       (an_editable: POINTER;a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_position       (an_editable: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_set_editable       (an_editable: POINTER; editable: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_editable       (an_editable: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
end
