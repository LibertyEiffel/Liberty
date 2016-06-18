note

	description: "GTK Text buffer. Text with attributes to be stored in a GtkTextView"

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
	date: "$Date:  $"
	revision: "$Revision:  $"

deferred class GTK_TEXT_BUFFER_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {}

	gtk_text_buffer_new(dummy_table: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_set_text(handle, text: POINTER; len: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_text(handle, start, finish: POINTER; hidden: INTEGER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_line_count (gtktextbuffer_buffer: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_char_count (gtktextbuffer_buffer: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_tag_table (gtktextbuffer_buffer: POINTER): POINTER is -- GtkTextTagTable*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert (a_buffer, an_iter: POINTER; a_text_const_string: POINTER; len: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_at_cursor (a_buffer: POINTER;
		                              a_text_const_string: POINTER;
		                              len: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_interactive (a_buffer: POINTER; a_iter: POINTER;
		                                a_text_const_string: POINTER;
		                                len: INTEGER;
		                                default_editable: INTEGER) : INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_interactive_at_cursor (a_buffer: POINTER;
		                                          a_text_const_string: POINTER;
		                                          len: INTEGER;
		                                          default_editable: INTEGER) : INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_range (a_buffer: POINTER; a_iter: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_range_interactive (a_buffer: POINTER; a_iter: POINTER;
		                                      a_start: POINTER; a_end: POINTER;
		                                      default_editable: INTEGER):INTEGER
		external "C use <gtk/gtk.h>"
		end

	-- TODO: since it is variadic gtk_text_buffer_insert_with_tags
	-- (a_buffer: POINTER; a_iter: POINTER; a_text_const_string:
	-- POINTER; gint len; GtkTextTag *first_tag; ...)
	
	-- TODO: since it is variadic
	-- gtk_text_buffer_insert_with_tags_by_name (a_buffer: POINTER;
	-- a_iter: POINTER; a_text_const_string: POINTER; gint len;
	-- a_first_const_string: POINTER_tag_name; ...)

	gtk_text_buffer_delete (a_buffer: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_delete_interactive (a_buffer: POINTER; a_start_iter: POINTER;
		                                a_end_iter: POINTER;
		                                default_editable: INTEGER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_backspace (a_buffer: POINTER; a_iter: POINTER;
		                       a_interactive: INTEGER;
		                       a_default_editable: INTEGER) : INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_slice (a_buffer: POINTER; a_start: POINTER;
		                       a_end: POINTER;
		                       a_include_hidden_chars: INTEGER) : POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_pixbuf (a_buffer: POINTER; a_iter: POINTER; pixbuf: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_insert_child_anchor (a_buffer: POINTER; a_iter: POINTER; anchor: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_create_child_anchor (a_buffer: POINTER; a_iter: POINTER) : POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_create_mark (a_buffer: POINTER; a_mark_name_const_string: POINTER;
		                         a_where: POINTER; a_left_gravity: INTEGER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_move_mark (a_buffer: POINTER; a_mark: POINTER; a_where: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_move_mark_by_name (a_buffer: POINTER;
		                               a_name_const_string: POINTER;
		                               a_where: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_delete_mark (a_buffer: POINTER; a_mark: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_delete_mark_by_name (a_buffer: POINTER; a_name_const_string: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_mark (a_buffer: POINTER; a_name_const_string: POINTER): POINTER is -- GtkTextMark*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_insert (a_buffer: POINTER): POINTER is -- GtkTextMark*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_selection_bound (a_buffer: POINTER): POINTER is -- GtkTextMark*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_place_cursor (a_buffer: POINTER; a_where: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_select_range (a_buffer: POINTER; a_ins: POINTER; a_bound: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_apply_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_remove_tag (a_buffer: POINTER; a_tag: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_apply_tag_by_name (a_buffer: POINTER; a_name_const_string: POINTER;
		                             a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_remove_tag_by_name (a_buffer, a_name_const_string: POINTER;
		                                a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_remove_all_tags (a_buffer: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_create_tag (a_buffer: POINTER; a_tag_name_const_string: POINTER;
		                        a_first_property_name_const_string: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_line_offset (a_buffer: POINTER; a_iter: POINTER;
		                                     line_number: INTEGER; char_offset: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_offset (a_buffer: POINTER; a_iter: POINTER; char_offset: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_line (a_buffer: POINTER; a_iter: POINTER; line_number: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_line_index (a_buffer: POINTER; a_iter: POINTER;
	                                        line_number: INTEGER; byte_index: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_mark (a_buffer: POINTER; a_iter: POINTER; a_mark: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_iter_at_child_anchor (a_buffer: POINTER; a_iter: POINTER; anchor: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_start_iter (a_buffer: POINTER; a_iter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_end_iter (a_buffer: POINTER; a_iter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_bounds (a_buffer: POINTER; a_start: POINTER; a_end: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_modified (a_buffer: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_set_modified (a_buffer: POINTER; a_setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_delete_selection (a_buffer: POINTER; a_interactive: INTEGER;
		                              a_default_editable: INTEGER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_paste_clipboard (a_buffer: POINTER; a_clipboard: POINTER;
		                             a_override_location: POINTER;
		                             a_default_editable: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_copy_clipboard (a_buffer: POINTER; a_clipboard: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_cut_clipboard (a_buffer: POINTER; a_clipboard: POINTER;
		                           a_default_editable: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_selection_bounds (a_buffer, a_start, a_end: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_begin_user_action (a_buffer: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_end_user_action (a_buffer: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_add_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_remove_selection_clipboard (a_buffer: POINTER; a_clipboard: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_is_text_buffer (a_buffer: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IS_TEXT_BUFFER"
		end

end -- class GTK_TEXT_BUFFER_EXTERNALS
