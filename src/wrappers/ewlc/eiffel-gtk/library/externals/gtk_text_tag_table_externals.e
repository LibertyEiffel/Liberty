note
	description: "GtkTextTagTable: Collection of tags that can be used together"
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
	date: "$Date:  $"
	revision: "$Revision:  $"

deferred class GTK_TEXT_TAG_TABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- void        (*GtkTextTagTableForeach)       (GtkTextTag *tag, gpointer data)

	gtk_text_tag_table_new: POINTER is -- GtkTextTagTable*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_table_add (a_table, a_tag: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_table_remove (a_table, a_tag: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_table_lookup (a_table, a_const_name: POINTER): POINTER is -- GtkTextTag*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_table_foreach (a_table, a_gtktexttagtableforeach_func, some_data: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_table_get_size (a_table: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TEXT_TAG_TABLE_EXTERNALS
