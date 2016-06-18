note
	description: "GtkEditable -- Interface for text-editing widgets."
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

			-- The GtkEditable interface is an interface which should be
			-- implemented by text editing widgets, such as GtkEntry and
			-- GtkText. It contains functions for generically
			-- manipulating an editable widget, a large number of action
			-- signals used for key bindings, and several signals that an
			-- application can connect to to modify the behavior of a
			-- widget.

			-- As an example of the latter usage, by connecting the
			-- following handler to "insert_text", an application can
			-- convert all entry into a widget into uppercase.

			-- Example 3. Forcing entry to uppercase.
	
			-- include <ctype.h>
	
			-- void
			-- insert_text_handler (GtkEditable *editable,
			--                      const gchar *text,
			--                      gint         length,
			--                      gint        *position,
			--                      gpointer     data)
			-- {
			--   int i;
			--   gchar *result = g_utf8_strup (text, length);
	
			--   g_signal_handlers_block_by_func (editable,
			-- 				   (gpointer) insert_text_handler, data);
			--   gtk_editable_insert_text (editable, result, length, position);
			--   g_signal_handlers_unblock_by_func (editable,
			--                                      (gpointer) insert_text_handler, data);
			--   g_signal_stop_emission_by_name (editable, "insert_text"); 
			--   g_free (result);
			-- }

deferred class GTK_EDITABLE
inherit
	GTK_WIDGET
		-- DELETE: undefine make end
		-- TODO check this, since I'm not sure. Indeed any known
		-- implementation is a GTK_WIDGET, therefore it shouldn't bring
		-- any harm.
insert
	GTK_EDITABLE_EXTERNALS
	GTK_EDITABLE_STRUCT
		-- Known Implementations: GtkEditable is implemented by
		-- GtkEntry, GtkOldEditable, GtkSpinButton and GtkText.

feature {ANY}
	select_region (a_start, an_end: INTEGER)
			-- Selects a region of text. The characters that are selected
			-- are those characters at positions from `a_start' up to,
			-- but not including `an_end'. If `an_end' is negative, then
			-- the the characters selected will be those characters from
			-- `a_start' to the end of the text.
		do
			gtk_editable_select_region (handle, a_start, an_end)
		end

	selection_bounds: TUPLE[BOOLEAN,INTEGER,INTEGER]
			-- current selection bounds, and if there is a selection. The
			-- format of the tuple is [`is_there_a_selection',
			-- `start',`end'].
		local is_there,a_start,an_end: INTEGER
		do
			is_there := gtk_editable_get_selection_bounds(handle,$a_start,$an_end)
			create Result.make_3 (is_there.to_boolean,a_start,an_end)
		end

	insert_text (a_text: STRING; a_position: REFERENCE [INTEGER])
			-- Inserts `a_text' at `a_position'.
		local io_position: INTEGER
		do
			-- editable : 	a GtkEditable widget.
			
			-- new_text : 	the text to insert.
			
			-- new_text_length : 	the length of the text to insert, in bytes
			
			-- position : an inout parameter. The caller initializes it
			-- to the position at which to insert the text. After the
			-- call it points at the position after the newly inserted
			-- text.
			
--			not_yet_implemented -- TODO missing position_ptr := WHAT? + a_position
			io_position := a_position.item
			gtk_editable_insert_text (handle, a_text.to_external, a_text.count, $io_position)
			a_position.set_item (io_position)
		end

	delete_text (a_start, an_end: INTEGER)
			-- Deletes a sequence of characters. The characters that are
			-- deleted are those characters at positions from `a_start'
			-- up to, but not including `an_end'. If `an_end' is
			-- negative, then the the characters deleted will be those
			-- characters from 'a_start' to the end of the text.
		do
			gtk_editable_delete_text (handle,a_start, an_end)
		end

	substring (a_start, an_end: INTEGER): STRING
			-- Retrieves a sequence of characters. The characters that
			-- are retrieved are those characters at positions from
			-- `a_start' up to, but not including `an_end'. If `an_end'
			-- is negative, then the the characters retrieved will be
			-- those characters from `a_start' to the end of the text.
		do
			create Result.from_external(gtk_editable_get_chars (handle,a_start,an_end))
			-- Using from_external, since the return value of
			-- gtk_editable_get_chars are the characters in the indicated
			-- region. The result must be freed with g_free() when the
			-- application is finished with it.
		end

	cut_clipboard
			-- Causes the characters in the current selection to be
			-- copied to the clipboard and then deleted from the widget.
		do
			gtk_editable_cut_clipboard (handle)
		end

	copy_clipboard
			-- Causes the characters in the current selection to be
			-- copied to the clipboard.
		do
			gtk_editable_copy_clipboard (handle)
		end

	paste_clipboard
			-- Causes the contents of the clipboard to be pasted into the
			-- given widget at the current cursor position.
		do
			gtk_editable_paste_clipboard (handle)
		end

	delete_selection
			-- Deletes the current contents of the widgets selection and disclaims the selection.
		do
			gtk_editable_delete_selection (handle)
		end

	set_position (a_position: INTEGER)
			-- Sets the cursor position. The cursor is displayed before
			-- the character with the given (base 0) index in the
			-- widget. The value must be less than or equal to the number
			-- of characters in the widget. A value of -1 indicates that
			-- the position should be set after the last character in the
			-- entry. Note that this position is in characters, not in
			-- bytes.
		do
			gtk_editable_set_position (handle,a_position)
		end

	position: INTEGER
			-- current cursor position. The cursor is displayed before
			-- the character with the given (base 0) index in the
			-- widget. The value will be less than or equal to the number
			-- of characters in the widget. Note that this position is in
			-- characters, not in bytes.
		do
			Result:=gtk_editable_get_position (handle)
		end

	set_editable
			-- Allow the user to edit the text
		do
			gtk_editable_set_editable (handle,1)
		ensure is_editable
		end

	unset_editable
			-- Forbid the user to edit the text
		do
			gtk_editable_set_editable (handle,0)
		ensure not is_editable
		end

	is_editable: BOOLEAN
			-- is the text editable by the user?
		do
			Result := (gtk_editable_get_editable(handle)).to_boolean
		end

feature {ANY} -- The "changed" signal
	changed_signal_name: STRING is "changed"
	enable_on_changed
			-- Connects "changed" signal to `on_changed' feature.
		do
			connect (Current, changed_signal_name, $on_changed)
		end

	on_changed
			-- Built-in changed signal handler; empty by design; redefine it.

			-- Indicates that the user has changed the contents of the widget.
		do
		end

	connect_agent_to_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_EDITABLE]])
		require valid_procedure: a_procedure /= Void
		local changed_callback: CHANGED_CALLBACK [like Current]
		do
			create changed_callback.make
			changed_callback.connect (Current, a_procedure)
		end
	
	-- Signal Details
	-- The "changed" signal
	
	-- void user_function (GtkEditable *editable, gpointer user_data);

	
	-- editable : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY} -- The "delete-text" signal

	-- void user_function (GtkEditable *editable, gint `a_start', gint
	-- `an_end', gpointer user_data);

	-- This signal is emitted when text is deleted from the widget by
	-- the user. The default handler for this signal will normally be
	-- responsible for inserting the text, so by connecting to this
	-- signal and then stopping the signal with gtk_signal_emit_stop(),
	-- it is possible to modify the inserted text, or prevent it from
	-- being inserted entirely. The `a_start' and `an_end' parameters
	-- are interpreted as for gtk_editable_delete_text()
	
	-- editable : 	the object which received the signal.
	-- `a_start' : 	the starting position.
	-- `an_end' : 	the end position.
	-- user_data : 	user data set when the signal handler was connected.
	

feature {ANY} -- The "insert-text" signal

	insert_text_signal_name: STRING is "insert-text"
		-- 		"insert-text"
		--             void        user_function      (GtkEditable *editable,
		--                                             gchar       *new_text,
		--                                             gint         new_text_length,
		--                                             gint        *position,
		--                                             gpointer     user_data)            : Run last

	on_insert_text
			-- Built-in insert-text signal handler; empty by design; redefine it.
		do
		end

	enable_on_insert_text
			-- Connects "insert-text" signal to `on_insert_text' feature.
			
			-- This signal is emitted when text is inserted into the widget by
			-- the user. The default handler for this signal will normally be
			-- responsible for inserting the text, so by connecting to this
			-- signal and then stopping the signal with gtk_signal_emit_stop(),
			-- it is possible to modify the inserted text, or prevent it from
			-- being inserted entirely.
		do
			connect (Current, insert_text_signal_name, $on_insert_text)
		end

	connect_agent_to_insert_text_signal (a_procedure: PROCEDURE [ANY, TUPLE [STRING, INTEGER, REFERENCE [INTEGER], GTK_EDITABLE]])
			-- editable : 	the object which received the signal.
			-- new_text : 	the new text to insert.
			-- new_text_length : 	the length of the new text, in bytes,
			--  or -1 if new_text is nul-terminated
			-- position : 	the position, in characters, at which to insert the new text.
			--  this is an in-out parameter. After the signal emission is finished,
			--  it should point after the newly inserted text.
		require
			valid_procedure: a_procedure /= Void
		local
			insert_text_callback: INSERT_TEXT_CALLBACK
		do
			create insert_text_callback.make
			insert_text_callback.connect (Current, a_procedure)
		end

end -- class GTK_EDITABLE
