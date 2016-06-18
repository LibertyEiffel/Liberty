note
	description: "GtkTextView - Widget that displays a GtkTextBuffer"
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

deferred class GTK_TEXT_VIEW_EXTERNALS

inherit ANY undefine is_equal, copy end
insert GTK_TEXT_WINDOW_TYPE


feature {}

	gtk_text_view_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_new_with_buffer(buff: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_buffer (handle, buff: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_buffer (handle: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		ensure
			Result.is_not_null
		end

	gtk_text_view_scroll_to_mark (a_text_view, a_mark: POINTER;
		                          within_margin: REAL;
		                          use_align_bool: INTEGER;
		                          xalign: REAL; yalign: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_scroll_to_iter (a_text_view, an_iter: POINTER;
		                          within_margin: REAL;
		                          use_align_bool: INTEGER;
		                          xalign: REAL; yalign: REAL): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_scroll_mark_onscreen (a_text_view: POINTER; a_mark: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_move_mark_onscreen (a_text_view: POINTER; a_mark: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_place_cursor_onscreen (a_text_view: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_visible_rect (a_text_view: POINTER; a_visible_rect: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_iter_location (a_text_view: POINTER; a_const_iter: POINTER; a_gdkrectangle_location: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_line_at_y (a_text_view: POINTER; target_iter: POINTER; a_y: INTEGER; line_top: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_line_yrange (a_text_view, an_iter: POINTER;
		                           an_y_integer, a_height_integer: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_iter_at_location (a_text_view, an_iter: POINTER;
		                                an_x: INTEGER; an_y: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_iter_at_position (a_text_view, an_iter: POINTER;
		                                a_trailing_integer: POINTER;
		                                an_x, an_y: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_buffer_to_window_coords (a_text_view: POINTER;
														a_gtk_text_window_type: INTEGER;
														a_buffer_x, a_buffer_y: INTEGER;
														a_window_x_integer: POINTER;
														a_window_y_integer: POINTER)
		require
			valid_window_type: is_valid_gtk_text_window_type (a_gtk_text_window_type)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_view_window_to_buffer_coords (a_text_view: POINTER;
														a_gtk_text_window_type: INTEGER;
														a_window_x, a_window_y: INTEGER;
														a_buffer_x_integer: POINTER;
														a_buffer_y_integer: POINTER)
		require
			valid_window_type: is_valid_gtk_text_window_type (a_gtk_text_window_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_window (a_text_view: POINTER;
		                      a_gtk_text_window_type: INTEGER): POINTER is -- GdkWindow*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_window_type (a_text_view, a_gdk_window: POINTER): INTEGER is -- GtkTextWindowType
		external "C use <gtk/gtk.h>"
		ensure
			valid_window_type: is_valid_gtk_text_window_type (Result)
		end

	gtk_text_view_set_border_window_size (a_text_view: POINTER; a_window_type: INTEGER; a_size: INTEGER)
		require
			valid_window_type: is_valid_gtk_text_window_type (a_window_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_border_window_size (a_text_view: POINTER; a_window_type: INTEGER): INTEGER is -- gint
		require
			valid_window_type: is_valid_gtk_text_window_type (a_window_type)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_forward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_backward_display_line (a_text_view: POINTER; an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_forward_display_line_end (a_text_view: POINTER; an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_backward_display_line_start (a_text_view: POINTER; an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_starts_display_line (a_text_view: POINTER; a_const_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_move_visually (a_text_view: POINTER; an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_add_child_at_anchor (a_text_view: POINTER; child: POINTER; anchor: POINTER)
		external "C use <gtk/gtk.h>"
		end

-- GtkTextChildAnchor;
	gtk_text_child_anchor_new: POINTER is -- GtkTextChildAnchor*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_child_anchor_get_widgets (anchor: POINTER): POINTER is -- GList*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_child_anchor_get_deleted (anchor: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_add_child_in_window (a_text_view: POINTER; child: POINTER; which_window, an_xpos: INTEGER; an_ypos: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_move_child (a_text_view: POINTER; child: POINTER; an_xpos: INTEGER; an_ypos: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_wrap_mode (a_text_view: POINTER; wrap_mode: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_wrap_mode (a_text_view: POINTER): INTEGER is -- GtkWrapMode
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_editable (a_text_view: POINTER; setting_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_editable (a_text_view: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_cursor_visible (a_text_view: POINTER; setting_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_cursor_visible (a_text_view: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_overwrite (a_text_view: POINTER; overwrite_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_overwrite (a_text_view: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_pixels_above_lines (a_text_view: POINTER; a_pixels_above_lines: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_pixels_above_lines (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_pixels_below_lines (a_text_view: POINTER; a_pixels_below_lines: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_pixels_below_lines (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_pixels_inside_wrap (a_text_view: POINTER; a_pixels_inside_wrap: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_pixels_inside_wrap (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_justification (a_text_view: POINTER; justification: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_justification (a_text_view: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_left_margin (a_text_view: POINTER; a_left_margin: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_left_margin (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_right_margin (a_text_view: POINTER; a_right_margin: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_right_margin (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_indent (a_text_view: POINTER; a_indent: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_indent (a_text_view: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_tabs (a_text_view: POINTER; tabs: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_tabs (a_text_view: POINTER): POINTER is -- PangoTabArray*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_accepts_tab (a_text_view: POINTER; accepts_tab_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_accepts_tab (a_text_view: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_default_attributes (a_text_view: POINTER): POINTER is -- GtkTextAttributes*
		external "C use <gtk/gtk.h>"
		end

-- #define GTK_TEXT_VIEW_PRIORITY_VALIDATE

end -- class GTK_TEXT_VIEW_EXTERNALS
