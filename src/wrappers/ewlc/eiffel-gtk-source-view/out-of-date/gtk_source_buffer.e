note
	description: "A text buffer object for GtkSourceView."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GtkSourceView developers
					
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

class GTK_SOURCE_BUFFER
	-- A GTK_SOURCE_BUFFER object is the model for a GTK_SOURCE_VIEW
	-- widget. It extends GTK_TEXT_BUFFER adding features necessary to
	-- display and edit source code: syntax highlighting, bracket
	-- matching and markers.  It also implements support for undo/redo
	-- operations.
	
	--

	-- By default highlighting is enabled, but you can disable it with
	-- `set_highlight'. This can be useful if you're not using
	-- GTK_SOURCE_LANGUAGE objects to set the highlighting patterns,
	-- and instead you're manually adding GTK_SOURCE_TAG objects to the
	-- buffer's tag table.

inherit GTK_TEXT_BUFFER

insert GLIB_UNICODE_MANIPULATION_EXTERNALS
	
create {ANY} dummy, make, with_language, from_external_pointer

feature {} -- Creation
	make (a_source_tag_table: GTK_SOURCE_TAG_TABLE)
			-- Creates a new source buffer with `a_source_tag_table'. If 
			-- Void a new one is created.
		do
			from_external_pointer(gtk_source_buffer_new
										 (null_or(a_source_tag_table)))
		end

	with_language (a_language: GTK_SOURCE_LANGUAGE)
			-- Creates a new source buffer using the highlighting
			-- patterns in `a_language'.  This is equivalent to creating
			-- a new source buffer with the default tag table and then
			-- calling `set_language'.
		require language_not_void: a_language /= Void
		do
			from_external_pointer (gtk_source_buffer_new_with_language (a_language.handle))
		end

feature {ANY} -- Brackets checking
	are_brackets_checked: BOOLEAN
			-- Is bracket match highlighting activated for the source? 
		do 
			Result:=gtk_source_buffer_get_check_brackets(handle).to_boolean
		end
	
	set_check_brackets (a_setting: BOOLEAN)
			-- Controls the bracket match highlighting function in the
			-- buffer. If activated (`a_setting'=True), when you position
			-- your cursor over a bracket character (a parenthesis, a
			-- square bracket, etc.)  the matching opening or closing
			-- bracket character will be highlighted. You can specify the
			-- style with the `set_bracket_match_style' feature.
		do
			gtk_source_buffer_set_check_brackets(handle,a_setting.to_integer)
			ensure set: a_setting=are_brackets_checked
		end

	set_bracket_match_style (a_style: INTEGER)
			-- Sets the style used for highlighting matching brackets.
		require valid_style: is_valid_gtk_source_tag_style(a_style)
		do
			gtk_source_buffer_set_bracket_match_style(handle, a_style)
		end	

feature {ANY} -- Text highlighting
	is_highlighted: BOOLEAN
			-- Is text highlighting activated in the source buffer?
		do
			Result:=gtk_source_buffer_get_highlight(handle).to_boolean
		end
	
	set_highlight (a_setting: BOOLEAN)
			-- Controls whether text is highlighted in the buffer. If
			-- `a_setting' is True, the text will be highlighted
			-- according to the patterns installed in the buffer (either
			-- set with `set_language' or by adding individual
			-- GTK_SOURCE_TAG tags to the buffer's tag table). Otherwise,
			-- any current highlighted text will be restored to the
			-- default buffer style.

			--

			-- Tags not of GTK_SOURCE_TAG type will not be removed by
			-- this option, and normal GTK_TEXT_TAG priority settings
			-- apply when highlighting is enabled.

			--

			-- If not using a GTK_SOURCE_LANGUAGE for setting the
			-- highlighting patterns in the buffer, it is recommended for
			-- performance reasons that you add all the GTK_SOURCE_TAG
			-- tags with highlighting disabled and enable it when
			-- finished.
		do
			gtk_source_buffer_set_highlight(handle,a_setting.to_boolean)
		ensure set: a_setting=is_highlighted
		end

feature {ANY} -- Language
	language: GTK_SOURCE_LANGUAGE
			-- the language used for the source buffer. See `set_language'. Can be
			-- Void
		do
			from_external_pointer(gtk_source_buffer_get_language(handle))
			-- Determines the GtkSourceLanguage used by the buffer. The returned
			-- object should not be unreferenced by the user.
		end

	set_language (a_language: GTK_SOURCE_LANGUAGE)
			-- Sets the GTK_SOURCE_LANGUAGE the source buffer will use, adding
			-- GtkSourceTag tags with the language's patterns and setting the
			-- escape character with `set_escape_char'. Note that this will remove
			-- any GtkSourceTag tags currently in the buffer's tag table. The
			-- buffer holds a reference to the language set.

			-- `a_language' can be Void
		do
			gtk_source_buffer_set_language(handle,null_or(a_language))
		end

	escape_char: like gunichar
			-- The UTF-8 escaping character used by the source buffer highlighting
			-- engine.
		do
			Result:=gtk_source_buffer_get_escape_char(handle)
		end

	set_escape_char (an_escape_char: like gunichar)
			-- Sets the escape character to be used by the highlighting engine.

			-- When performing the initial analysis, the engine will discard a
			-- matching syntax pattern if it's prefixed with an odd number of
			-- escape characters.  This allows for example to correctly highlight
			-- strings with escaped quotes embedded.

			-- This setting affects only syntax patterns (i.e. those defined in
			-- GtkSyntaxTag tags).
		do
			gtk_source_buffer_set_escape_char(handle, an_escape_char)
		end

feature {ANY} -- Undo-Redo
	max_undo_levels: INTEGER
			-- the number of undo levels the buffer will track for buffer
			-- edits.
		do
			Result:=gtk_source_buffer_get_max_undo_levels(handle)
		end

	set_max_undo_levels (some_max_undo_levels: INTEGER)
			-- Sets the number of undo levels for user actions the buffer
			-- will track. If the number of user actions exceeds the
			-- limit set by this function, older actions will be
			-- discarded.

			--

			-- A new action is started whenever the function
			-- `begin_user_action' is called. In general, this happens
			-- whenever the user presses any key which modifies the
			-- buffer, but the undo manager will try to merge similar
			-- consecutive actions, such as multiple character insertions
			-- into one action. But, inserting a newline does start a new
			-- action.
		do
			gtk_source_buffer_set_max_undo_levels(handle,some_max_undo_levels)
		ensure set: some_max_undo_levels = max_undo_levels
		end

	can_undo: BOOLEAN
			-- Is it possible to undo the last action in the source buffer?
		do
			Result:=gtk_source_buffer_can_undo(handle).to_boolean
		end

	can_redo: BOOLEAN
			-- Is a redo possible? Can the source buffer redo the last action
			-- (i.e. if the last operation was an undo)?
		do
			Result:=gtk_source_buffer_can_redo(handle).to_boolean
		end

	undo
			-- Undoes the last user action which modified the buffer. Use
			-- `can_undo' to check whether a call to this function will have any
			-- effect.
		
			--
		
			-- Actions are defined as groups of operations between a call to
			-- `begin_user_action' and `end_user_action', or sequences of similar
			-- edits (inserts or deletes) on the same line.
		do
			gtk_source_buffer_undo(handle)
		end

	redo
			-- Redoes the last undo operation. Use `can_redo' to check whether a
			-- call to this function will have any effect.
		do
			gtk_source_buffer_redo(handle)
		end

	begin_not_undoable_action
			-- Marks the beginning of a not undoable action on the buffer,
			-- disabling the undo manager. Typically you would call this function
			-- before initially setting the contents of the buffer (e.g. when
			-- loading a file in a text editor).
		
			--
		
			-- You may nest `begin_not_undoable_action' / `end_not_undoable_action'
			-- blocks.
		do
			gtk_source_buffer_begin_not_undoable_action(handle)
		end
	
	end_not_undoable_action
			-- Marks the end of a not undoable action on the buffer. When the last
			-- not undoable block is closed through the call to this function, the
			-- list of undo actions is cleared and the undo manager is re-enabled.
		do
			gtk_source_buffer_end_not_undoable_action(handle)
		end
	
feature {ANY} -- Markers
	create_marker (a_name, a_type: STRING; a_place: GTK_TEXT_ITER): GTK_SOURCE_MARKER
			-- Creates a marker in the buffer of type type. A marker is
			-- semantically very similar to a GTK_TEXT_MARK, except it has a type
			-- which is used by the GTK_SOURCE_VIEW displaying the buffer to show a
			-- pixmap on the left margin, at the line the marker is in. Because of
			-- this, a marker is generally associated to a line and not a character
			-- position. Markers are also accessible through a position or range in
			-- the buffer.

			--

			-- Markers are implemented using GtkTextMark, so all characteristics
			-- and restrictions to marks apply to markers too. These includes life
			-- cycle issues and "mark-set" and "mark-deleted" signal emissions.
		
			--
		
			-- Like a GtkTextMark, a GtkSourceMarker can be anonymous if `a_name'
			-- is Void. Also, the buffer owns the markers so you shouldn't
			-- unreference it.
		
			--
		
			-- Markers always have left gravity and are moved to the beginning of
			-- the line when the user deletes the line they were in. Also, if the
			-- user deletes a region of text which contained lines with markers,
			-- those are deleted.
		
			--
		
			-- Typical uses for a marker are bookmarks, breakpoints, current
			-- executing instruction indication in a source file, etc..
		
			--
		
			-- `a_name': the name of the marker, or Void.
		
			-- `a_type': a string defining the marker type, or Void.
		
			-- `a_place': the location to place the marker.
		do
			create Result.from_external_pointer
			(gtk_source_buffer_create_marker (handle,
														 null_or_string(a_name),
														 null_or_string(a_type),
														 a_place.handle))
		end

	move_marker (a_marker: GTK_SOURCE_MARKER; a_place: GTK_TEXT_ITER)
			--   Moves `a_marker' to `a_place'.
		require
			marker_not_void: a_marker/=Void
			place_not_void: a_place/=Void
		do
			gtk_source_buffer_move_marker(handle, a_marker.handle, a_place.handle)
		end

	delete_marker (a_marker: GTK_SOURCE_MARKER)
			-- Deletes marker from the source buffer. The same conditions as for
			-- GtkTextMark apply here. The marker is no longer accessible from the
			-- buffer, but if you held a reference to it, it will not be destroyed.
		require marker_not_void: a_marker /= Void
		do
			gtk_source_buffer_delete_marker(handle,a_marker.handle)
		end

	marker (a_name: STRING): GTK_SOURCE_MARKER
			-- the GTK_SOURCE_MARKER named `a_name' in buffer: Void if it doesn't
			-- exists.
		local ptr: POINTER
		do
			ptr:=gtk_source_buffer_get_marker(handle,null_or_string(a_name))
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	markers_in_region (a_start, an_end: GTK_TEXT_ITER): G_SLIST[GTK_SOURCE_MARKER]
			-- An ordered (by position) list of marker objects inside the region
			-- delimited by `a_start' and `an_end'. The iters may be in any order.
		do
			create Result.from_external_pointer
			(gtk_source_buffer_get_markers_in_region
			(handle, a_start.handle, an_end.handle))
		end

	first_marker: GTK_SOURCE_MARKER
			-- the first (nearest to the top of the buffer) marker in buffer. Void
			-- if there are no markers in the buffer.
		local ptr: POINTER
		do
			ptr:=gtk_source_buffer_get_first_marker(handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	last_marker: GTK_SOURCE_MARKER
			-- the last (nearest to the bottom of the buffer) marker in buffer.
			-- Void if there are no markers in the buffer.
		local ptr: POINTER
		do
			ptr:=gtk_source_buffer_get_last_marker(handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end

	iter_at_marker(a_marker: GTK_SOURCE_MARKER): GTK_TEXT_ITER
			-- the location of marker.
		require marker_not_void: a_marker /= Void
		do
			create Result.make
			gtk_source_buffer_get_iter_at_marker(handle, Result.handle, a_marker.handle)
		end
	
	next_marker (an_iter: GTK_TEXT_ITER): GTK_SOURCE_MARKER
			-- the nearest marker to the right of `an_iter'. If there are multiple
			-- markers at the same position, this function will always return the
			-- first one (from the internal linked list), even if starting the
			-- search exactly at its location. You can get the others using
			-- GTK_SOURCE_MARKER's `next'.

			-- Void if there are no more markers after iter.
		require iter_not_void: an_iter/=Void
		local ptr: POINTER
		do
			ptr:=gtk_source_buffer_get_next_marker(handle, an_iter.handle)
			if ptr.is_not_null then create Result.from_external_pointer(ptr) end
		end
	
	prev_marker (an_iter: GTK_TEXT_ITER): GTK_SOURCE_MARKER
			-- the nearest marker to the left of `an_iter'. If there are multiple
			-- markers at the same position, this function will always return the
			-- last one (from the internal linked list), even if starting the
			-- search exactly at its location. You can get the others using
			-- GTK_SOURCE_MARKER's `prev'.

			-- Void if there are no more markers after `an_iter'.
		require iter_not_void: an_iter/=Void
		local ptr: POINTER
		do
			ptr:=gtk_source_buffer_get_prev_marker(handle,an_iter.handle)
			if ptr.is_not_null then create Result.from_external_pointer(ptr) end
		end

feature {} -- TODO: Signals
	--   "can-redo"                                       : Run Last
	--   "can-undo"                                       : Run Last
	--   "highlight-updated"                              : Run Last
	--   "marker-updated"                                 : Run Last

	--Signal Details
	--
	--  The "can-redo" signal
	--
	-- void                user_function                      (GtkSourceBuffer *sourcebuffer,
	--                                                         gboolean         arg1,
	--                                                         gpointer         user_data)         : Run Last
	--
	--   Emitted whenever there is a change in the buffer's ability to redo an
	--   operation.
	--
	--   sourcebuffer : the object which received the signal.
	--   arg1 :         TRUE if the buffer can now perform an redo.
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "can-undo" signal
	--
	-- void                user_function                      (GtkSourceBuffer *sourcebuffer,
	--                                                         gboolean         arg1,
	--                                                         gpointer         user_data)         : Run Last
	--
	--   Emitted whenever there is a change in the buffer's ability to undo an
	--   operation.
	--
	--   sourcebuffer : the object which received the signal.
	--   arg1 :         TRUE if the buffer can now perform an undo.
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "highlight-updated" signal
	--
	-- void                user_function                      (GtkSourceBuffer *sourcebuffer,
	--                                                         GtkTextIter     *arg1,
	--                                                         GtkTextIter     *arg2,
	--                                                         gpointer         user_data)         : Run Last
	--
	--   Emitted whenever the syntax highlighting information has been updated, so
	--   that views can request a redraw if the region changed is visible. Usually
	--   only view widgets displaying this buffer will be interested in this
	--   signal.
	--
	--   sourcebuffer : the object which received the signal.
	--   arg1 :         GtkTextIter at the start of the updated region.
	--   arg2 :         GtkTextIter at the end of the updated region.
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "marker-updated" signal
	--
	-- void                user_function                      (GtkSourceBuffer *sourcebuffer,
	--                                                         GtkTextIter     *arg1,
	--                                                         gpointer         user_data)         : Run Last
	--
	--   Emitted whenever a marker of sourcebuffer has changed and needs to be
	--   redisplayed by the view. A change in a marker's type or location can
	--   trigger this signal.
	--
	--   Note that moving a marker causes the emission of this signal twice: one
	--   for the old location and one for the new.
	--
	--   sourcebuffer : the object which received the signal.
	--   arg1 :         GtkTextIter at the location where the change occurred.
	--   user_data :    user data set when the signal handler was connected.
	--
	--See Also
	--
	--   There is an introduction document describing the basic concepts of the
	--   buffer/view interactions.
	--
	--   Check GtkTextBuffer for information about the base buffer; and
	--   GtkSourceView for examples on setting up the buffer to be displayed in a
	--   view widget.

feature {} -- External calls
	gtk_source_buffer_new (a_table: POINTER): POINTER
			-- GtkSourceBuffer* gtk_source_buffer_new (GtkSourceTagTable *table);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_new_with_language (a_language: POINTER): POINTER
			-- GtkSourceBuffer* gtk_source_buffer_new_with_language (GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_check_brackets (a_buffer: POINTER): INTEGER
			-- gboolean gtk_source_buffer_get_check_brackets (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_check_brackets (a_buffer: POINTER; a_check_brackets: INTEGER)
			--	void gtk_source_buffer_set_check_brackets (GtkSourceBuffer *buffer, gboolean check_brackets);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_bracket_match_style (a_source_buffer, a_style: POINTER)
			-- void gtk_source_buffer_set_bracket_match_style (GtkSourceBuffer *source_buffer, const GtkSourceTagStyle *style);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_highlight (a_buffer: POINTER): INTEGER
			-- 	gboolean gtk_source_buffer_get_highlight (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_highlight (a_buffer: POINTER; an_highlight_bool: INTEGER)
			-- 	void gtk_source_buffer_set_highlight (GtkSourceBuffer *buffer, gboolean highlight);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

 gtk_source_buffer_get_max_undo_levels (a_buffer: POINTER): INTEGER
			-- 	gint gtk_source_buffer_get_max_undo_levels (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_max_undo_levels (a_buffer: POINTER; a_max_undo_levels: INTEGER)
			-- 	void gtk_source_buffer_set_max_undo_levels (GtkSourceBuffer *buffer, gint max_undo_levels);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_language (a_buffer: POINTER): POINTER
			--	GtkSourceLanguage* gtk_source_buffer_get_language (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_language (a_buffer, a_language: POINTER)
			-- 	void gtk_source_buffer_set_language (GtkSourceBuffer *buffer, GtkSourceLanguage *language);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gunichar gtk_source_buffer_get_escape_char (a_buffer: POINTER)
			-- 	gunichar gtk_source_buffer_get_escape_char (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_set_escape_char (a_buffer: POINTER; , gunichar escape_char)
			-- 	void gtk_source_buffer_set_escape_char (GtkSourceBuffer *buffer, gunichar escape_char);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_can_undo (a_buffer: POINTER): INTEGER
			-- 	gboolean gtk_source_buffer_can_undo (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_can_redo (a_buffer: POINTER): INTEGER
			-- 	gboolean gtk_source_buffer_can_redo (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_undo (a_buffer: POINTER)
			-- 	void gtk_source_buffer_undo (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_redo (a_buffer: POINTER)
			-- 	void gtk_source_buffer_redo (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_begin_not_undoable_action (a_buffer: POINTER)
			-- 	void gtk_source_buffer_begin_not_undoable_action (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_end_not_undoable_action (a_buffer: POINTER)
			-- 	void gtk_source_buffer_end_not_undoable_action (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_create_marker (a_buffer: POINTER; , const gchar *name, const gchar *type, const GtkTextIter *where): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_create_marker (GtkSourceBuffer *buffer, const gchar *name, const gchar *type, const GtkTextIter *where);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_move_marker (a_buffer: POINTER; , GtkSourceMarker *marker, const GtkTextIter *where)
			-- 	void gtk_source_buffer_move_marker (GtkSourceBuffer *buffer, GtkSourceMarker *marker, const GtkTextIter *where);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_delete_marker (a_buffer: POINTER; , GtkSourceMarker *marker)
			-- 	void gtk_source_buffer_delete_marker (GtkSourceBuffer *buffer, GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_marker (a_buffer: POINTER; , const gchar *name): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_get_marker (GtkSourceBuffer *buffer, const gchar *name);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_markers_in_region (a_buffer: POINTER; , const GtkTextIter *begin, const GtkTextIter *end): POINTER
			-- 	GSList* gtk_source_buffer_get_markers_in_region (GtkSourceBuffer *buffer, const GtkTextIter *begin, const GtkTextIter *end);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_first_marker (a_buffer: POINTER): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_get_first_marker (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_last_marker (a_buffer: POINTER): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_get_last_marker (GtkSourceBuffer *buffer);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_iter_at_marker (a_buffer: POINTER; , GtkTextIter *iter, GtkSourceMarker *marker)
			-- 	void gtk_source_buffer_get_iter_at_marker (GtkSourceBuffer *buffer, GtkTextIter *iter, GtkSourceMarker *marker);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_next_marker (a_buffer: POINTER; , GtkTextIter *iter): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_get_next_marker (GtkSourceBuffer *buffer, GtkTextIter *iter);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

	gtk_source_buffer_get_prev_marker (a_buffer: POINTER; , GtkTextIter *iter): POINTER
			-- 	GtkSourceMarker* gtk_source_buffer_get_prev_marker (GtkSourceBuffer *buffer, GtkTextIter *iter);
		external "C use <gtksourceview/gtksourcebuffer.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtksourceview/gtksourcebuffer.h>"
		alias "sizeof(GtkSourceBuffer)"
		end

end -- class GTK_SOURCE_BUFFER
