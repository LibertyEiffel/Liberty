note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GtkSource developers
					
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

	wrapped_version: "1.8.5"

class GTK_SOURCE_VIEW

inherit
	GTK_TEXT_VIEW
		redefine 
			make,
			struct_size
		end

	--  TODO: GtkSourceView implements AtkImplementorIface.

create {ANY} dummy, make, from_buffer, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkSourceView. An empty default buffer will be created
			-- for you. If you want to specify your own buffer, consider
			-- `from_buffer'.
		do
			from_external_pointer(gtk_source_view_new)
		end

	from_buffer (a_buffer: GTK_SOURCE_BUFFER)
			-- Creates a new GtkSourceView widget displaying
			-- `a_buffer'. One buffer can be shared among many widgets.
		require buffer_not_void: a_buffer/=Void
		do
			from_external_pointer(gtk_source_view_new_with_buffer(a_buffer.handle))
		end

feature {ANY} -- Setters
	set_show_line_numbers (a_setting: BOOLEAN)
			-- If `a_setting' is line numbers will be displayed beside the text.
		do
			gtk_source_view_set_show_line_numbers(handle,a_setting.to_integer)
		ensure set: a_setting=are_line_numbers_shown
		end

	set_show_line_markers (a_setting: BOOLEAN)
			-- If `a_setting' is True line markers will be displayed beside the
			-- text.
		do
			gtk_source_view_set_show_line_markers(handle,a_setting.handle)
		ensure set: a_setting=are_line_markers_shown
		end

	set_tabs_width (a_width: INTEGER)
			-- Sets the width of tabulation in characters.
		require natural: a_width >= 0
		do
			gtk_source_view_set_tabs_width(handle,a_width)
		ensure set: a_width = tabs_width
		end

	set_auto_indent (a_setting: BOOLEAN)
			-- If `a_setting' is True auto indentation of text is enabled.
		do
			gtk_source_view_set_auto_indent(handle, a_setting.to_integer)
		ensure set: a_setting = auto_indent
		end

	set_insert_spaces_instead_of_tabs (a_setting: BOOLEAN)
			-- If `a_setting' is True any tabulator character inserted is replaced
			-- by a group of space characters.
		do
			gtk_source_view_set_insert_spaces_instead_of_tabs
			(handle, a_setting.to_integer)
		ensure set: a_setting = are_spaces_inserted_instead_of_tabs 
		end

	set_indent_on_tab (a_setting: BOOLEAN)
			-- If `a_setting' is True, when the tab key is pressed and there is a
			-- selection, the selected text is indented of one level instead of
			-- being replaced with the "\t" characters. Shift+Tab unindents the
			-- selection.
		do
			gtk_source_view_set_indent_on_tab
			(handle, a_setting.to_integer)
		ensure set: a_setting = indent_on_tab
		end			

	set_show_margin (a_setting: BOOLEAN)
			-- If `a_setting' is True a margin is displayed.
		do
			gtk_source_view_set_show_margin(handle,a_setting.to_integer)
		ensure set: a_setting = is_margin_shown
		end
	
	set_margin (a_margin: INTEGER)
			-- Sets the position of the right margin. (TODO: should be NATURAL)
		require valid: a_margin.in_range(1,200)
		do
			gtk_source_view_set_margin (handle, a_margin)
		end

	set_highlight_current_line (a_setting: BOOLEAN)
			-- If `a_setting' is True the current line is highlighted
		do
			gtk_source_view_set_highlight_current_line
			(handle, a_setting.to_integer)
		ensure set: a_setting = is_current_line_highlighted
		end
 
	set_marker_pixbuf (a_marker_type: STRING; a_pixbuf: GDK_PIXBUF)
			-- Associates `a_pixbuf' with `a_marker_type'.
		require 
			marker_not_void: a_marker_type/=Void
			pixbuf_not_void: a_pixbuf/=Void
		do
			gtk_source_view_set_marker_pixbuf (handle,
														  a_marker_type.to_external,
														  a_pixbuf.handle)
		end

	set_smart_home_end (a_setting: BOOLEAN)
			-- If `a_setting' is True "Home" and "End" keys will move to
			-- the first/last non-space character of the line before
			-- moving to the start/end.

			--   enable : whether to enable smart behavior for HOME and END keys.
		do
			gtk_source_view_set_smart_home_end (handle,a_setting.to_integer)
		ensure set: a_setting = is_smart_home_end_set
		end

feature {ANY} -- Getters
	are_line_numbers_shown: BOOLEAN
			-- Are line numbers displayed beside the text? Default 
			-- value: False 
		do
			Result:=gtk_source_view_get_show_line_numbers(handle).to_boolean
		end

	are_line_markers_show: BOOLEAN
			-- Are line markers displayed beside the text? Default 
			-- value: False
		do
				Result:=gtk_source_view_get_show_line_markers(handle).to_boolean
		end
			
	tabs_width: INTEGER
			-- Tabs Width. Default value: 8

			-- TODO: should be NATURAL
		do
			Result:=gtk_source_view_get_tabs_width(handle)
		ensure valid: Result.in_range(1,32)
		end

	auto_indent: BOOLEAN
			-- Is auto indentation of text enabled?
		do
			Result:=gtk_source_view_get_auto_indent(handle).to_boolean
		end

	are_spaces_inserted_instead_of_tabs: BOOLEAN
			-- When inserting a tabulator character, should it be
			-- replaced by a group of space characters?
		do
			Result:=gtk_source_view_get_insert_spaces_instead_of_tabs(handle).to_boolean
		end

	indent_on_tab: BOOLEAN
			-- Should the current selection be indented instead of
			-- replaced with the "\t" character when the tab key is
			-- pressed?
		do
			Result:=gtk_source_view_get_indent_on_tab(handle).to_boolean
		end

	is_margin_shown: BOOLEAN
			-- Is margin displayed? Default value: False
		do
			Result:=gtk_source_view_get_show_margin(handle).to_boolean
		end
	
	margin: INTEGER
			-- the position of the right margin. Default value: 80

			-- TODO: should be NATURAL
		do
			Result:=gtk_source_view_get_margin(handle)
		ensure valid: Result.in_range(0,200)
		end

	is_current_line_highlighted: BOOLEAN
			-- Is the current line is highlighted?
		do
			Result:=gtk_source_view_get_highlight_current_line(handle).to_boolean
		end

	pixbuf_for_marker (a_marker: STRING): GDK_PIXBUF
			-- The pixbuf associated with `a_marker'. Void if not found.
		require marker_not_void: a_marker/=Void
		local ptr: POINTER
		do
			ptr:=gtk_source_view_get_marker_pixbuf(handle,a_marker.to_external)
			if ptr.is_not_null then create Result from_external_pointer(ptr) end
		end

	is_smart_home_end_set: BOOLEAN
			-- Will HOME and END keys move to the first/last non-space
			-- character of the line before moving to the start/end? 
			-- Default value: True
		do
			Result:=gtk_source_view_get_smart_home_end(handle).to_boolean
		end

feature {ANY} -- Style Properties
	right_margin_line_alpha: INTEGER_32
			-- The ::right-margin-line-alpha determines the alpha
			-- component with which the vertical line will be drawn. 0
			-- means it is fully transparent (invisible). 255 means it
			-- has full opacity (text under the line won't be visible).

			--   Allowed values: [0,255]
			
			--   Default value: 40

			-- TODO: Could be a NATURAL_8, judging from allowed values.
		do
			Result:=integer_property(right_margin_line_alpha_property_name)
		ensure valid: Result.in_range(0,255)
		end

	right_margin_line_color: GDK_COLOR
			-- The ::right_margin-line-color property contains the color
			-- with which the right margin line (vertical line indicating
			-- the right margin) will be drawn.
		do
			create Result.from_external_pointer
			(property(right_margin_line_color_property_name).pointer)
		ensure not_void: Result/=Void
		end

	right_margin_overlay_alpha: INTEGER
			-- The ::right_margin_overlay_alpha determines the alpha
			-- component with which the overlay will be drawn. 0 means it
			-- is fully transparent (invisible).  255 means it has full
			-- opacity (text under the overlay won't be visible).
			-- Default value: 15
		do
			Result:=integer_property(right_margin_overlay_alpha_property_name)
		ensure valid: Result.in_range(0,255)
		end
	
	right_margin_overlay_color: GDK_COLOR
			-- The color with which the right margin overlay will be
			-- drawn. This property will have an effect if only
			-- is_right_margin_overlay_toggled is True.
		do
			create Result.from_external_pointer
			(property(right_margin_overlay_color_property_name).pointer)
		ensure not_void: Result/=Void
		end

	is_right_margin_overlay_toggle: BOOLEAN
			-- The ::right_margin_overlay_toggle property determines
			-- whether the widget will draw a transparent overlay on top
			-- of the area on the right side of the right margin line. On
			-- some systems, this has a noticable performance impact, so
			-- this property is FALSE by default.

			-- Default value: "FALSE"

			-- Note: the documentation of the C library says that this
			-- property is actually an array of (8 bit) characters. This
			-- is quite strange for a property.
		do
			Result:=boolean_property(right_margin_overlay_toggle_property_name)
		end
 
feature {} -- Style properties labels
	right_margin_line_alpha_property_name: STRING is "right-margin-line-alpha"
	right_margin_line_color_property_name: STRING is "right-margin-line-color"
	right_margin_overlay_alpha_property_name: STRING is "right-margin-overlay-alpha"
	right_margin_overlay_color_property_name: STRING is "right-margin-overlay-color"
	right_margin_overlay_toggle_property_name: STRING is "right-margin-overlay-toggle"

feature {ANY} -- Signals
	--   "redo"                                           : Run Last / Action
	--   "undo"                                           : Run Last / Action

	--  The "redo" signal
	--
	-- void                user_function                      (GtkSourceView *sourceview,
	--                                                         gpointer       user_data)       : Run Last / Action
	--
	--   sourceview : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "undo" signal
	--
	-- void                user_function                      (GtkSourceView *sourceview,
	--                                                         gpointer       user_data)       : Run Last / Action
	--
	--   sourceview : the object which received the signal.
	--   user_data :  user data set when the signal handler was connected.

feature {} -- External calls
	-- #include <gtksourceview/gtksourceview.h>
	
	gtk_source_view_new: POINTER
			-- GtkWidget* gtk_source_view_new (void);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_new_with_buffer (a_buffer: POINTER): POINTER
			-- GtkWidget* gtk_source_view_new_with_buffer (GtkSourceBuffer
			-- *buffer);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_show_line_numbers (a_view: POINTER; a_show_bool: INTEGER)
			-- void gtk_source_view_set_show_line_numbers (GtkSourceView *view,
			-- gboolean show);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_show_line_numbers (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_show_line_numbers (GtkSourceView
			-- *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_show_line_markers (a_view: POINTER; a_show_bool: INTEGER)
			-- void gtk_source_view_set_show_line_markers (GtkSourceView *view,
			-- gboolean show);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_show_line_markers (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_show_line_markers (GtkSourceView
			-- *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_tabs_width (a_view: POINTER; a_width: INTEGER)
			-- void gtk_source_view_set_tabs_width (GtkSourceView *view, guint
			-- width);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_tabs_width (a_view: POINTER): INTEGER
			-- 	guint gtk_source_view_get_tabs_width (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_auto_indent (a_view: POINTER; an_enable_bool: INTEGER)
			-- void gtk_source_view_set_auto_indent (GtkSourceView *view, gboolean
			-- enable);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_auto_indent (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_auto_indent (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_insert_spaces_instead_of_tabs (a_view: POINTER; an_enable: INTEGER)
			-- void gtk_source_view_set_insert_spaces_instead_of_tabs
			-- (GtkSourceView *view, gboolean enable);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_insert_spaces_instead_of_tabs (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_insert_spaces_instead_of_tabs
			-- (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_indent_on_tab (a_view: POINTER; an_enable_bool: INTEGER)
			-- void gtk_source_view_set_indent_on_tab (GtkSourceView *view,
			-- gboolean enable);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_indent_on_tab (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_indent_on_tab (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_show_margin (a_view: POINTER; a_show_bool: INTEGER)
			-- void gtk_source_view_set_show_margin (GtkSourceView *view, gboolean
			-- show);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_show_margin (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_show_margin (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_margin (a_view: POINTER; a_margin: INTEGER)
			-- void gtk_source_view_set_margin (GtkSourceView *view, guint margin);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_margin (a_view: POINTER): INTEGER
			-- guint gtk_source_view_get_margin (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_highlight_current_line (a_view: POINTER; a_show_bool: INTEGER)
			-- void gtk_source_view_set_highlight_current_line (GtkSourceView
			-- *view, gboolean show);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_highlight_current_line (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_highlight_current_line (GtkSourceView
			-- *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_marker_pixbuf (a_view, a_marker_type, a_pixbuf: POINTER)
			-- void gtk_source_view_set_marker_pixbuf (GtkSourceView *view, const
			-- gchar *marker_type, GdkPixbuf *pixbuf);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_marker_pixbuf (a_view, a_marker_type: POINTER): POINTER
			-- GdkPixbuf* gtk_source_view_get_marker_pixbuf (GtkSourceView *view,
			-- const gchar *marker_type);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_set_smart_home_end (a_view: POINTER; a_enable_bool: INTEGER)
			-- void gtk_source_view_set_smart_home_end (GtkSourceView *view, gboolean enable);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	gtk_source_view_get_smart_home_end (a_view: POINTER): INTEGER
			-- gboolean gtk_source_view_get_smart_home_end (GtkSourceView *view);
		external "C use <gtksourceview/gtksourceview.h>"
		end

	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtksourceview/gtksourceview.h>"
		alias "sizeof(GtkSourceView)"
		end
end -- class GTK_SOURCE_VIEW
