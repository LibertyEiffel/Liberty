indexing
	description: "GtkTextIter -- Text buffer iterator."
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
	gtk_documentation: "[
							 You may wish to begin by reading the text widget conceptual
							 overview which gives an overview of all the objects and data
							 types related to the text widget and how they work together.
						 ]"

class GTK_TEXT_ITER

inherit
	SHARED_C_STRUCT
		redefine dispose, copy, is_equal end
			 -- This class isn't really shared, but we need to make it conform
			 -- to SHARED_C_STRUCT to be able to create G_SLISTs with it.

insert GTK

creation make, from_external_pointer, copy

feature {} -- Creation
	make is
		require gtk_initialized: gtk.is_initialized
		do
			allocate
		end
	
feature {} -- Disposing

	dispose is
			-- Free an iterator allocated on the heap. This function is
			-- intended for use in language bindings, and is not
			-- especially useful for applications, because iterators can
			-- simply be allocated on the stack.
		do
			gtk_text_iter_free (handle)
			handle := default_pointer
		end

feature

	buffer: GTK_TEXT_BUFFER is
			-- the GtkTextBuffer this iterator is associated with.
		do
			create Result.from_external_pointer (gtk_text_iter_get_buffer (handle))
		end

	copy (another: like Current) is
			-- Copy `another' into Current. A new dynamically-allocated
			-- copy of the underlying iterator is made.
		do
			-- Using `gtk_text_iter_copy', a function used by language
			-- bindings.  It is not useful in applications, because
			-- iterators can be copied with a simple assignment
			-- (GtkTextIter i=j;).
			if handle.is_not_null then dispose end -- Frees any previously used resource
			handle := gtk_text_iter_copy (another.handle)
		end

	offset: INTEGER is
			-- the character offset of an iterator. Each character in a
			-- GtkTextBuffer has an offset, starting with 0 for the first
			-- character in the buffer. Use `iter_at_offset' to convert
			-- an offset back into an iterator.
		do
			Result := gtk_text_iter_get_offset (handle)
		end

	line: INTEGER is
			-- the line number containing the iterator. Lines in a
			-- GtkTextBuffer are numbered beginning with 0 for the first
			-- line in the buffer.
		do
			Result := gtk_text_iter_get_line (handle)
		end

	line_offset: INTEGER is
			-- the character offset of the iterator, counting from the
			-- start of a newline-terminated line. The first character on
			-- the line has offset 0.
		do
			Result := gtk_text_iter_get_line_offset (handle)
		end

	line_index: INTEGER is
			-- The byte index of the iterator, counting from the start of
			-- a newline-terminated line. Remember that GtkTextBuffer
			-- encodes text in UTF-8, and that characters can require a
			-- variable number of bytes to represent.
		do
			Result := gtk_text_iter_get_line_index (handle)
		end

	visible_line_index: INTEGER is
			-- the number of bytes from the start of the line to the
			-- given iter, not counting bytes that are invisible due to
			-- tags with the "invisible" flag toggled on.
		do
			Result := gtk_text_iter_get_visible_line_index (handle)
		end

	visible_line_offset: INTEGER is
			-- the offset in characters from the start of the line to the
			-- given iter, not counting characters that are invisible due
			-- to tags with the "invisible" flag toggled on.
		do
			Result:=gtk_text_iter_get_visible_line_offset(handle)
		end

	char: INTEGER is
			-- the Unicode character at this iterator. If the element at
			-- this iterator is a non-character element, such as an image
			-- embedded in the buffer, the Unicode "unknown" character
			-- 0xFFFC is returned. If invoked on the end iterator, zero
			-- is returned; zero is not a valid Unicode character. So you
			-- can write a loop which ends when `char' is 0.
		do
			Result := gtk_text_iter_get_char (handle)
		end

	slice (an_end: GTK_TREE_ITER): STRING is
			-- the text from current to `an_end'. A "slice" is an array
			-- of characters encoded in UTF-8 format, including the
			-- Unicode "unknown" character 0xFFFC for iterable
			-- non-character elements in the buffer, such as
			-- images. Because images are encoded in the slice, byte and
			-- character offsets in the returned array will correspond to
			-- byte offsets in the text buffer. Note that 0xFFFC can
			-- occur in normal text as well, so it is not a reliable
			-- indicator that a pixbuf or widget is in the buffer.
		obsolete "this is wrong! should be UNICODE_STRING!"
		require valid_end: an_end /= Void
		do
			create Result.from_external_copy (gtk_text_iter_get_slice (handle,
																		an_end.handle))
		end

	text (an_end: GTK_TREE_ITER): STRING is
			-- text from Current to `an_end'. If the range contains
			-- non-text elements such as images, the character and byte
			-- offsets in the returned string will not correspond to
			-- character and byte offsets in the buffer. If you want
			-- offsets to correspond, see `slice'.
		obsolete "this is wrong! should be UNICODE_STRING!"
		require valid_end: an_end /= Void
		do
			create Result.from_external_copy(gtk_text_iter_get_text(handle,
																	an_end.handle))
		end

	visible_slice (an_end: GTK_TEXT_ITER): STRING is
			-- Like `slice', but invisible text is not
			-- included. Invisible text is usually invisible because a
			-- GtkTextTag with the "invisible" attribute turned on has
			-- been applied to it.
		require valid_end: an_end /= Void
		do
			create Result.from_external_copy (gtk_text_iter_get_visible_slice (handle,
																				an_end.handle))
		end

	visible_text (an_end: GTK_TEXT_ITER): STRING is
			-- Like `text', but invisible text is not included. Invisible
			-- text is usually invisible because a GtkTextTag with the
			-- "invisible" attribute turned on has been applied to it.
		require valid_end: an_end /= Void
		do
			create Result.from_external_copy (gtk_text_iter_get_visible_text (handle, an_end.handle))
		end

	pixbuf: GDK_PIXBUF is
			-- The pixbuf at Current iter position, if any. Otherwise Void
		local ptr: POINTER
		do
			ptr := gtk_text_iter_get_pixbuf (handle)
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
			end
		end


	marks: G_SLIST [GTK_TEXT_MARK] is
			-- a list of all GtkTextMark at this location. Because marks
			-- are not iterable (they don't take up any "space" in the
			-- buffer, they are just marks in between iterable
			-- locations), multiple marks can exist in the same
			-- place. The returned list is not in any meaningful order.
		do
			create Result.from_external_pointer (gtk_text_iter_get_marks(handle))
		ensure result_not_void: Result /= Void
		end

	toggled_tags (toggled_on: BOOLEAN): G_SLIST [GTK_TEXT_TAG] is
			-- a list of GtkTextTag that are toggled on or off at this
			-- point. (If toggled_on is TRUE, the list contains tags that
			-- are toggled on.) If a tag is toggled on at iter, then some
			-- non-empty range of characters following iter has that tag
			-- applied to it. If a tag is toggled off, then some
			-- non-empty range following iter does not have the tag
			-- applied to it.

			-- iter : 	an iterator
			-- toggled_on : 	TRUE to get toggled-on tags
		do
			create Result.from_external_pointer
			(gtk_text_iter_get_toggled_tags (handle, toggled_on.to_integer))
		end

	child_anchor: GTK_TEXT_CHILD_ANCHOR is
			-- The anchor (with no new reference count added) at
			-- Current's location, if it exists . Void otherwise.
		local ptr: POINTER
		do
			ptr := gtk_text_iter_get_child_anchor (handle)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	begins_tag (a_tag: GTK_TEXT_TAG): BOOLEAN is
			-- Is `a_tag' is toggled on at exactly this point? If `a_tag'
			-- is Void, returns TRUE if any tag is toggled on at this
			-- point. Note that this feature is True if iter is the start
			-- of the tagged range; `has_tag' tells you whether an
			-- iterator is within a tagged range.
		do
			Result := gtk_text_iter_begins_tag (handle, a_tag.handle).to_boolean
		end


	-- gtk_text_iter_ends_tag ()

	-- gboolean    gtk_text_iter_ends_tag          (const GtkTextIter *iter,
	-- 															GtkTextTag *tag);

	-- Returns TRUE if tag is toggled off at exactly this point. If tag is NULL, returns TRUE if any tag is toggled off at this point. Note that the gtk_text_iter_ends_tag() returns TRUE if iter is the end of the tagged range; gtk_text_iter_has_tag() tells you whether an iterator is within a tagged range.

	-- iter : 	an iterator
	-- tag : 	a GtkTextTag, or NULL
	-- Returns : 	whether iter is the end of a range tagged with tag
	-- gtk_text_iter_toggles_tag ()

	-- gboolean    gtk_text_iter_toggles_tag       (const GtkTextIter *iter,
	-- 															GtkTextTag *tag);

	-- This is equivalent to (gtk_text_iter_begins_tag() || gtk_text_iter_ends_tag()), i.e. it tells you whether a range with tag applied to it begins or ends at iter.

	-- iter : 	an iterator
	-- tag : 	a GtkTextTag, or NULL
	-- Returns : 	whether tag is toggled on or off at iter
	-- gtk_text_iter_has_tag ()

	-- gboolean    gtk_text_iter_has_tag           (const GtkTextIter *iter,
	-- 															GtkTextTag *tag);

	-- Returns TRUE if iter is within a range tagged with tag.

	-- iter : 	an iterator
	-- tag : 	a GtkTextTag
	-- Returns : 	whether iter is tagged with tag

	tags: G_SLIST [GTK_TEXT_ITER] is
			-- a list of tags that apply to iter, in ascending order of
			-- priority (highest-priority tags are last).

			-- TODO: Gtk docs says" The GtkTextTag in the list don't have
			-- a reference added, but you have to free the list
			-- itself". Check if this should be translated into a
			-- particular Eiffel implementation
		do
			create Result.from_external_pointer (gtk_text_iter_get_tags (handle))
		end

	-- gtk_text_iter_editable ()

	-- gboolean    gtk_text_iter_editable          (const GtkTextIter *iter,
	-- 															gboolean default_setting);

	-- Returns whether the character at iter is within an editable region of text. Non-editable text is "locked" and can't be changed by the user via GtkTextView. This function is simply a convenience wrapper around gtk_text_iter_get_attributes(). If no tags applied to this text affect editability, default_setting will be returned.

	-- You don't want to use this function to decide whether text can be inserted at iter, because for insertion you don't want to know whether the char at iter is inside an editable range, you want to know whether a new character inserted at iter would be inside an editable range. Use gtk_text_iter_can_insert() to handle this case.

	-- iter : 	an iterator
	-- default_setting : 	TRUE if text is editable by default
	-- Returns : 	whether iter is inside an editable range
	-- gtk_text_iter_can_insert ()

	-- gboolean    gtk_text_iter_can_insert        (const GtkTextIter *iter,
	-- 															gboolean default_editability);

	-- Considering the default editability of the buffer, and tags that affect editability, determines whether text inserted at iter would be editable. If text inserted at iter would be editable then the user should be allowed to insert text at iter. gtk_text_buffer_insert_interactive() uses this function to decide whether insertions are allowed at a given position.

	-- iter : 	an iterator
	-- default_editability : 	TRUE if text is editable by default
	-- Returns : 	whether text inserted at iter would be editable
	-- gtk_text_iter_starts_word ()

	-- gboolean    gtk_text_iter_starts_word       (const GtkTextIter *iter);

	-- Determines whether iter begins a natural-language word. Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is at the start of a word
	-- gtk_text_iter_ends_word ()

	-- gboolean    gtk_text_iter_ends_word         (const GtkTextIter *iter);

	-- Determines whether iter ends a natural-language word. Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is at the end of a word
	-- gtk_text_iter_inside_word ()

	-- gboolean    gtk_text_iter_inside_word       (const GtkTextIter *iter);

	-- Determines whether iter is inside a natural-language word (as opposed to say inside some whitespace). Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is inside a word
	-- gtk_text_iter_starts_line ()

	-- gboolean    gtk_text_iter_starts_line       (const GtkTextIter *iter);

	-- Returns TRUE if iter begins a paragraph, i.e. if gtk_text_iter_get_line_offset() would return 0. However this function is potentially more efficient than gtk_text_iter_get_line_offset() because it doesn't have to compute the offset, it just has to see whether it's 0.

	-- iter : 	an iterator
	-- Returns : 	whether iter begins a line
	-- gtk_text_iter_ends_line ()

	-- gboolean    gtk_text_iter_ends_line         (const GtkTextIter *iter);

	-- Returns TRUE if iter points to the start of the paragraph delimiter characters for a line (delimiters will be either a newline, a carriage return, a carriage return followed by a newline, or a Unicode paragraph separator character). Note that an iterator pointing to the \n of a \r\n pair will not be counted as the end of a line, the line ends before the \r. The end iterator is considered to be at the end of a line, even though there are no paragraph delimiter chars there.

	-- iter : 	an iterator
	-- Returns : 	whether iter is at the end of a line
	-- gtk_text_iter_starts_sentence ()

	-- gboolean    gtk_text_iter_starts_sentence   (const GtkTextIter *iter);

	-- Determines whether iter begins a sentence. Sentence boundaries are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango text boundary algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is at the start of a sentence.
	-- gtk_text_iter_ends_sentence ()

	-- gboolean    gtk_text_iter_ends_sentence     (const GtkTextIter *iter);

	-- Determines whether iter ends a sentence. Sentence boundaries are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango text boundary algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is at the end of a sentence.
	-- gtk_text_iter_inside_sentence ()

	-- gboolean    gtk_text_iter_inside_sentence   (const GtkTextIter *iter);

	-- Determines whether iter is inside a sentence (as opposed to in between two sentences, e.g. after a period and before the first letter of the next sentence). Sentence boundaries are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango text boundary algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter is inside a sentence.
	-- gtk_text_iter_is_cursor_position ()

	-- gboolean    gtk_text_iter_is_cursor_position
	-- 														  (const GtkTextIter *iter);

	-- See gtk_text_iter_forward_cursor_position() or PangoLogAttr or pango_break() for details on what a cursor position is.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if the cursor can be placed at iter
	-- gtk_text_iter_get_chars_in_line ()

	-- gint        gtk_text_iter_get_chars_in_line (const GtkTextIter *iter);

	-- Returns the number of characters in the line containing iter, including the paragraph delimiters.

	-- iter : 	an iterator
	-- Returns : 	number of characters in the line
	-- gtk_text_iter_get_bytes_in_line ()

	-- gint        gtk_text_iter_get_bytes_in_line (const GtkTextIter *iter);

	-- Returns the number of bytes in the line containing iter, including the paragraph delimiters.

	-- iter : 	an iterator
	-- Returns : 	number of bytes in the line
	-- gtk_text_iter_get_attributes ()

	-- gboolean    gtk_text_iter_get_attributes    (const GtkTextIter *iter,
	-- 															GtkTextAttributes *values);

	-- Computes the effect of any tags applied to this spot in the text. The values parameter should be initialized to the default settings you wish to use if no tags are in effect. You'd typically obtain the defaults from gtk_text_view_get_default_attributes().

	-- gtk_text_iter_get_attributes() will modify values, applying the effects of any tags present at iter. If any tags affected values, the function returns TRUE.

	-- iter : 	an iterator
	-- values : 	a GtkTextAttributes to be filled in
	-- Returns : 	TRUE if values was modified
	-- gtk_text_iter_get_language ()

	-- PangoLanguage* gtk_text_iter_get_language   (const GtkTextIter *iter);

	-- A convenience wrapper around gtk_text_iter_get_attributes(), which returns the language in effect at iter. If no tags affecting language apply to iter, the return value is identical to that of gtk_get_default_language().

	-- iter : 	an iterator
	-- Returns : 	language in effect at iter
	-- gtk_text_iter_is_end ()

	-- gboolean    gtk_text_iter_is_end            (const GtkTextIter *iter);

	-- Returns TRUE if iter is the end iterator, i.e. one past the last dereferenceable iterator in the buffer. gtk_text_iter_is_end() is the most efficient way to check whether an iterator is the end iterator.

	-- iter : 	an iterator
	-- Returns : 	whether iter is the end iterator
	-- gtk_text_iter_is_start ()

	-- gboolean    gtk_text_iter_is_start          (const GtkTextIter *iter);

	-- Returns TRUE if iter is the first iterator in the buffer, that is if iter has a character offset of 0.

	-- iter : 	an iterator
	-- Returns : 	whether iter is the first in the buffer
	-- gtk_text_iter_forward_char ()

	-- gboolean    gtk_text_iter_forward_char      (GtkTextIter *iter);

	-- Moves iter forward by one character offset. Note that images embedded in the buffer occupy 1 character slot, so gtk_text_iter_forward_char() may actually move onto an image instead of a character, if you have images in your buffer. If iter is the end iterator or one character before it, iter will now point at the end iterator, and gtk_text_iter_forward_char() returns FALSE for convenience when writing loops.

	-- iter : 	an iterator
	-- Returns : 	whether iter moved and is dereferenceable
	-- gtk_text_iter_backward_char ()

	-- gboolean    gtk_text_iter_backward_char     (GtkTextIter *iter);

	-- Moves backward by one character offset. Returns TRUE if movement was possible; if iter was the first in the buffer (character offset 0), gtk_text_iter_backward_char() returns FALSE for convenience when writing loops.

	-- iter : 	an iterator
	-- Returns : 	whether movement was possible
	-- gtk_text_iter_forward_chars ()

	-- gboolean    gtk_text_iter_forward_chars     (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count characters if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the new position of iter is different from its original position, and dereferenceable (the last iterator in the buffer is not dereferenceable). If count is 0, the function does nothing and returns FALSE.

	-- iter : 	an iterator
	-- count : 	number of characters to move, may be negative
	-- Returns : 	whether iter moved and is dereferenceable
	-- gtk_text_iter_backward_chars ()

	-- gboolean    gtk_text_iter_backward_chars    (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count characters backward, if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the iterator moved onto a dereferenceable position; if the iterator didn't move, or moved onto the end iterator, then FALSE is returned. If count is 0, the function does nothing and returns FALSE.

	-- iter : 	an iterator
	-- count : 	number of characters to move
	-- Returns : 	whether iter moved and is dereferenceable
	-- gtk_text_iter_forward_line ()

	-- gboolean    gtk_text_iter_forward_line      (GtkTextIter *iter);

	-- Moves iter to the start of the next line. Returns TRUE if there was a next line to move to, and FALSE if iter was simply moved to the end of the buffer and is now not dereferenceable, or if iter was already at the end of the buffer.

	-- iter : 	an iterator
	-- Returns : 	whether iter can be dereferenced
	-- gtk_text_iter_backward_line ()

	-- gboolean    gtk_text_iter_backward_line     (GtkTextIter *iter);

	-- Moves iter to the start of the previous line. Returns TRUE if iter could be moved; i.e. if iter was at character offset 0, this function returns FALSE. Therefore if iter was already on line 0, but not at the start of the line, iter is snapped to the start of the line and the function returns TRUE. (Note that this implies that in a loop calling this function, the line number may not change on every iteration, if your first iteration is on line 0.)

	-- iter : 	an iterator
	-- Returns : 	whether iter moved
	-- gtk_text_iter_forward_lines ()

	-- gboolean    gtk_text_iter_forward_lines     (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count lines forward, if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the iterator moved onto a dereferenceable position; if the iterator didn't move, or moved onto the end iterator, then FALSE is returned. If count is 0, the function does nothing and returns FALSE. If count is negative, moves backward by 0 - count lines.

	-- iter : 	a GtkTextIter
	-- count : 	number of lines to move forward
	-- Returns : 	whether iter moved and is dereferenceable
	-- gtk_text_iter_backward_lines ()

	-- gboolean    gtk_text_iter_backward_lines    (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count lines backward, if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the iterator moved onto a dereferenceable position; if the iterator didn't move, or moved onto the end iterator, then FALSE is returned. If count is 0, the function does nothing and returns FALSE. If count is negative, moves forward by 0 - count lines.

	-- iter : 	a GtkTextIter
	-- count : 	number of lines to move backward
	-- Returns : 	whether iter moved and is dereferenceable
	-- gtk_text_iter_forward_word_ends ()

	-- gboolean    gtk_text_iter_forward_word_ends (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_forward_word_end() up to count times.

	-- iter : 	a GtkTextIter
	-- count : 	number of times to move
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_backward_word_starts ()

	-- gboolean    gtk_text_iter_backward_word_starts
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_backward_word_start() up to count times.

	-- iter : 	a GtkTextIter
	-- count : 	number of times to move
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_forward_word_end ()

	-- gboolean    gtk_text_iter_forward_word_end  (GtkTextIter *iter);

	-- Moves forward to the next word end. (If iter is currently on a word end, moves forward to the next one after that.) Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_backward_word_start ()

	-- gboolean    gtk_text_iter_backward_word_start
	-- 														  (GtkTextIter *iter);

	-- Moves backward to the previous word start. (If iter is currently on a word start, moves backward to the next one after that.) Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_forward_cursor_position ()

	-- gboolean    gtk_text_iter_forward_cursor_position
	-- 														  (GtkTextIter *iter);

	-- Moves iter forward by a single cursor position. Cursor positions are (unsurprisingly) positions where the cursor can appear. Perhaps surprisingly, there may not be a cursor position between all characters. The most common example for European languages would be a carriage return/newline sequence. For some Unicode characters, the equivalent of say the letter "a" with an accent mark will be represented as two characters, first the letter then a "combining mark" that causes the accent to be rendered; so the cursor can't go between those two characters. See also the PangoLogAttr structure and pango_break() function.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if we moved and the new position is dereferenceable
	-- gtk_text_iter_backward_cursor_position ()

	-- gboolean    gtk_text_iter_backward_cursor_position
	-- 														  (GtkTextIter *iter);

	-- Like gtk_text_iter_forward_cursor_position(), but moves backward.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if we moved
	-- gtk_text_iter_forward_cursor_positions ()

	-- gboolean    gtk_text_iter_forward_cursor_positions
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves up to count cursor positions. See gtk_text_iter_forward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- count : 	number of positions to move
	-- Returns : 	TRUE if we moved and the new position is dereferenceable
	-- gtk_text_iter_backward_cursor_positions ()

	-- gboolean    gtk_text_iter_backward_cursor_positions
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves up to count cursor positions. See gtk_text_iter_forward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- count : 	number of positions to move
	-- Returns : 	TRUE if we moved and the new position is dereferenceable
	-- gtk_text_iter_backward_sentence_start ()

	-- gboolean    gtk_text_iter_backward_sentence_start
	-- 														  (GtkTextIter *iter);

	-- Moves backward to the previous sentence start; if iter is already at the start of a sentence, moves backward to the next one. Sentence boundaries are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango text boundary algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_backward_sentence_starts ()

	-- gboolean    gtk_text_iter_backward_sentence_starts
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_backward_sentence_start() up to count times, or until it returns FALSE. If count is negative, moves forward instead of backward.

	-- iter : 	a GtkTextIter
	-- count : 	number of sentences to move
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_forward_sentence_end ()

	-- gboolean    gtk_text_iter_forward_sentence_end
	-- 														  (GtkTextIter *iter);

	-- Moves forward to the next sentence end. (If iter is at the end of a sentence, moves to the next end of sentence.) Sentence boundaries are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango text boundary algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_forward_sentence_ends ()

	-- gboolean    gtk_text_iter_forward_sentence_ends
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_forward_sentence_end() count times (or until gtk_text_iter_forward_sentence_end() returns FALSE). If count is negative, moves backward instead of forward.

	-- iter : 	a GtkTextIter
	-- count : 	number of sentences to move
	-- Returns : 	TRUE if iter moved and is not the end iterator
	-- gtk_text_iter_forward_visible_word_ends ()

	-- gboolean    gtk_text_iter_forward_visible_word_ends
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_forward_visible_word_end() up to count times.

	-- iter : 	a GtkTextIter
	-- count : 	number of times to move
	-- Returns : 	TRUE if iter moved and is not the end iterator

	-- Since 2.4
	-- gtk_text_iter_backward_visible_word_starts ()

	-- gboolean    gtk_text_iter_backward_visible_word_starts
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Calls gtk_text_iter_backward_visible_word_start() up to count times.

	-- iter : 	a GtkTextIter
	-- count : 	number of times to move
	-- Returns : 	TRUE if iter moved and is not the end iterator

	-- Since 2.4
	-- gtk_text_iter_forward_visible_word_end ()

	-- gboolean    gtk_text_iter_forward_visible_word_end
	-- 														  (GtkTextIter *iter);

	-- Moves forward to the next visible word end. (If iter is currently on a word end, moves forward to the next one after that.) Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator

	-- Since 2.4
	-- gtk_text_iter_backward_visible_word_start ()

	-- gboolean    gtk_text_iter_backward_visible_word_start
	-- 														  (GtkTextIter *iter);

	-- Moves backward to the previous visible word start. (If iter is currently on a word start, moves backward to the next one after that.) Word breaks are determined by Pango and should be correct for nearly any language (if not, the correct fix would be to the Pango word break algorithms).

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if iter moved and is not the end iterator

	-- Since 2.4
	-- gtk_text_iter_forward_visible_cursor_position ()

	-- gboolean    gtk_text_iter_forward_visible_cursor_position
	-- 														  (GtkTextIter *iter);

	-- Moves iter forward to the next visible cursor position. See gtk_text_iter_forward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if we moved and the new position is dereferenceable

	-- Since 2.4
	-- gtk_text_iter_backward_visible_cursor_position ()

	-- gboolean    gtk_text_iter_backward_visible_cursor_position
	-- 														  (GtkTextIter *iter);

	-- Moves iter forward to the previous visible cursor position. See gtk_text_iter_backward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if we moved and the new position is dereferenceable

	-- Since 2.4
	-- gtk_text_iter_forward_visible_cursor_positions ()

	-- gboolean    gtk_text_iter_forward_visible_cursor_positions
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves up to count visible cursor positions. See gtk_text_iter_forward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- count : 	number of positions to move
	-- Returns : 	TRUE if we moved and the new position is dereferenceable

	-- Since 2.4
	-- gtk_text_iter_backward_visible_cursor_positions ()

	-- gboolean    gtk_text_iter_backward_visible_cursor_positions
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves up to count visible cursor positions. See gtk_text_iter_forward_cursor_position() for details.

	-- iter : 	a GtkTextIter
	-- count : 	number of positions to move
	-- Returns : 	TRUE if we moved and the new position is dereferenceable

	-- Since 2.4
	-- gtk_text_iter_forward_visible_line ()

	-- gboolean    gtk_text_iter_forward_visible_line
	-- 														  (GtkTextIter *iter);

	-- Moves iter to the start of the next visible line. Returns TRUE if there was a next line to move to, and FALSE if iter was simply moved to the end of the buffer and is now not dereferenceable, or if iter was already at the end of the buffer.

	-- iter : 	an iterator
	-- Returns : 	whether iter can be dereferenced

	-- Since 2.8
	-- gtk_text_iter_backward_visible_line ()

	-- gboolean    gtk_text_iter_backward_visible_line
	-- 														  (GtkTextIter *iter);

	-- Moves iter to the start of the previous visible line. Returns TRUE if iter could be moved; i.e. if iter was at character offset 0, this function returns FALSE. Therefore if iter was already on line 0, but not at the start of the line, iter is snapped to the start of the line and the function returns TRUE. (Note that this implies that in a loop calling this function, the line number may not change on every iteration, if your first iteration is on line 0.)

	-- iter : 	an iterator
	-- Returns : 	whether iter moved

	-- Since 2.8
	-- gtk_text_iter_forward_visible_lines ()

	-- gboolean    gtk_text_iter_forward_visible_lines
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count visible lines forward, if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the iterator moved onto a dereferenceable position; if the iterator didn't move, or moved onto the end iterator, then FALSE is returned. If count is 0, the function does nothing and returns FALSE. If count is negative, moves backward by 0 - count lines.

	-- iter : 	a GtkTextIter
	-- count : 	number of lines to move forward
	-- Returns : 	whether iter moved and is dereferenceable

	-- Since 2.8
	-- gtk_text_iter_backward_visible_lines ()

	-- gboolean    gtk_text_iter_backward_visible_lines
	-- 														  (GtkTextIter *iter,
	-- 															gint count);

	-- Moves count visible lines backward, if possible (if count would move past the start or end of the buffer, moves to the start or end of the buffer). The return value indicates whether the iterator moved onto a dereferenceable position; if the iterator didn't move, or moved onto the end iterator, then FALSE is returned. If count is 0, the function does nothing and returns FALSE. If count is negative, moves forward by 0 - count lines.

	-- iter : 	a GtkTextIter
	-- count : 	number of lines to move backward
	-- Returns : 	whether iter moved and is dereferenceable

	-- Since 2.8
	-- gtk_text_iter_set_offset ()

	-- void        gtk_text_iter_set_offset        (GtkTextIter *iter,
	-- 															gint char_offset);

	-- Sets iter to point to char_offset. char_offset counts from the start of the entire text buffer, starting with 0.

	-- iter : 	a GtkTextIter
	-- char_offset : 	a character number
	-- gtk_text_iter_set_line ()

	-- void        gtk_text_iter_set_line          (GtkTextIter *iter,
	-- 															gint line_number);

	-- Moves iterator iter to the start of the line line_number. If line_number is negative or larger than the number of lines in the buffer, moves iter to the start of the last line in the buffer.

	-- iter : 	a GtkTextIter
	-- line_number : 	line number (counted from 0)
	-- gtk_text_iter_set_line_offset ()

	-- void        gtk_text_iter_set_line_offset   (GtkTextIter *iter,
	-- 															gint char_on_line);

	-- Moves iter within a line, to a new character (not byte) offset. The given character offset must be less than or equal to the number of characters in the line; if equal, iter moves to the start of the next line. See gtk_text_iter_set_line_index() if you have a byte index rather than a character offset.

	-- iter : 	a GtkTextIter
	-- char_on_line : 	a character offset relative to the start of iter's current line
	-- gtk_text_iter_set_line_index ()

	-- void        gtk_text_iter_set_line_index    (GtkTextIter *iter,
	-- 															gint byte_on_line);

	-- Same as gtk_text_iter_set_line_offset(), but works with a byte index. The given byte index must be at the start of a character, it can't be in the middle of a UTF-8 encoded character.

	-- iter : 	a GtkTextIter
	-- byte_on_line : 	a byte index relative to the start of iter's current line
	-- gtk_text_iter_set_visible_line_index ()

	-- void        gtk_text_iter_set_visible_line_index
	-- 														  (GtkTextIter *iter,
	-- 															gint byte_on_line);

	-- Like gtk_text_iter_set_line_index(), but the index is in visible bytes, i.e. text with a tag making it invisible is not counted in the index.

	-- iter : 	a GtkTextIter
	-- byte_on_line : 	a byte index
	-- gtk_text_iter_set_visible_line_offset ()

	-- void        gtk_text_iter_set_visible_line_offset
	-- 														  (GtkTextIter *iter,
	-- 															gint char_on_line);

	-- Like gtk_text_iter_set_line_offset(), but the offset is in visible characters, i.e. text with a tag making it invisible is not counted in the offset.

	-- iter : 	a GtkTextIter
	-- char_on_line : 	a character offset
	-- gtk_text_iter_forward_to_end ()

	-- void        gtk_text_iter_forward_to_end    (GtkTextIter *iter);

	-- Moves iter forward to the "end iterator," which points one past the last valid character in the buffer. gtk_text_iter_get_char() called on the end iterator returns 0, which is convenient for writing loops.

	-- iter : 	a GtkTextIter
	-- gtk_text_iter_forward_to_line_end ()

	-- gboolean    gtk_text_iter_forward_to_line_end
	-- 														  (GtkTextIter *iter);

	-- Moves the iterator to point to the paragraph delimiter characters, which will be either a newline, a carriage return, a carriage return/newline in sequence, or the Unicode paragraph separator character. If the iterator is already at the paragraph delimiter characters, moves to the paragraph delimiter characters for the next line. If iter is on the last line in the buffer, which does not end in paragraph delimiters, moves to the end iterator (end of the last line), and returns FALSE.

	-- iter : 	a GtkTextIter
	-- Returns : 	TRUE if we moved and the new location is not the end iterator
	-- gtk_text_iter_forward_to_tag_toggle ()

	-- gboolean    gtk_text_iter_forward_to_tag_toggle
	-- 														  (GtkTextIter *iter,
	-- 															GtkTextTag *tag);

	-- Moves forward to the next toggle (on or off) of the GtkTextTag tag, or to the next toggle of any tag if tag is NULL. If no matching tag toggles are found, returns FALSE, otherwise TRUE. Does not return toggles located at iter, only toggles after iter. Sets iter to the location of the toggle, or to the end of the buffer if no toggle is found.

	-- iter : 	a GtkTextIter
	-- tag : 	a GtkTextTag, or NULL
	-- Returns : 	whether we found a tag toggle after iter
	-- gtk_text_iter_backward_to_tag_toggle ()

	-- gboolean    gtk_text_iter_backward_to_tag_toggle
	-- 														  (GtkTextIter *iter,
	-- 															GtkTextTag *tag);

	-- Moves backward to the next toggle (on or off) of the GtkTextTag tag, or to the next toggle of any tag if tag is NULL. If no matching tag toggles are found, returns FALSE, otherwise TRUE. Does not return toggles located at iter, only toggles before iter. Sets iter to the location of the toggle, or the start of the buffer if no toggle is found.

	-- iter : 	a GtkTextIter
	-- tag : 	a GtkTextTag, or NULL
	-- Returns : 	whether we found a tag toggle before iter
	-- GtkTextCharPredicate ()

	-- gboolean    (*GtkTextCharPredicate)         (gunichar ch,
	-- 															gpointer user_data);

	-- ch : 
	-- user_data : 
	-- Returns : 
	-- gtk_text_iter_forward_find_char ()

	-- gboolean    gtk_text_iter_forward_find_char (GtkTextIter *iter,
	-- 															GtkTextCharPredicate pred,
	-- 															gpointer user_data,
	-- 															const GtkTextIter *limit);

	-- Advances iter, calling pred on each character. If pred returns TRUE, returns TRUE and stops scanning. If pred never returns TRUE, iter is set to limit if limit is non-NULL, otherwise to the end iterator.

	-- iter : 	a GtkTextIter
	-- pred : 	a function to be called on each character
	-- user_data : 	user data for pred
	-- limit : 	search limit, or NULL for none
	-- Returns : 	whether a match was found
	-- gtk_text_iter_backward_find_char ()

	-- gboolean    gtk_text_iter_backward_find_char
	-- 														  (GtkTextIter *iter,
	-- 															GtkTextCharPredicate pred,
	-- 															gpointer user_data,
	-- 															const GtkTextIter *limit);

	-- Same as gtk_text_iter_forward_find_char(), but goes backward from iter.

	-- iter : 	a GtkTextIter
	-- pred : 	function to be called on each character
	-- user_data : 	user data for pred
	-- limit : 	search limit, or NULL for none
	-- Returns : 	whether a match was found
	-- enum GtkTextSearchFlags

	-- typedef enum {
	--   GTK_TEXT_SEARCH_VISIBLE_ONLY = 1 < < 0,
	--   GTK_TEXT_SEARCH_TEXT_ONLY    = 1 < < 1
	--   /* Possible future plans: SEARCH_CASE_INSENSITIVE, SEARCH_REGEXP */
	-- } GtkTextSearchFlags;

	-- gtk_text_iter_forward_search ()

	-- gboolean    gtk_text_iter_forward_search    (const GtkTextIter *iter,
	-- 															const gchar *str,
	-- 															GtkTextSearchFlags flags,
	-- 															GtkTextIter *match_start,
	-- 															GtkTextIter *match_end,
	-- 															const GtkTextIter *limit);

	-- Searches forward for str. Any match is returned by setting match_start to the first character of the match and match_end to the first character after the match. The search will not continue past limit. Note that a search is a linear or O(n) operation, so you may wish to use limit to avoid locking up your UI on large buffers.

	-- If the GTK_TEXT_SEARCH_VISIBLE_ONLY flag is present, the match may have invisible text interspersed in str. i.e. str will be a possibly-noncontiguous subsequence of the matched range. similarly, if you specify GTK_TEXT_SEARCH_TEXT_ONLY, the match may have pixbufs or child widgets mixed inside the matched range. If these flags are not given, the match must be exact; the special 0xFFFC character in str will match embedded pixbufs or child widgets.

	-- iter : 	start of search
	-- str : 	a search string
	-- flags : 	flags affecting how the search is done
	-- match_start : 	return location for start of match, or NULL
	-- match_end : 	return location for end of match, or NULL
	-- limit : 	bound for the search, or NULL for the end of the buffer
	-- Returns : 	whether a match was found
	-- gtk_text_iter_backward_search ()

	-- gboolean    gtk_text_iter_backward_search   (const GtkTextIter *iter,
	-- 															const gchar *str,
	-- 															GtkTextSearchFlags flags,
	-- 															GtkTextIter *match_start,
	-- 															GtkTextIter *match_end,
	-- 															const GtkTextIter *limit);

	-- Same as gtk_text_iter_forward_search(), but moves backward.

	-- iter : 	a GtkTextIter where the search begins
	-- str : 	search string
	-- flags : 	bitmask of flags affecting the search
	-- match_start : 	return location for start of match, or NULL
	-- match_end : 	return location for end of match, or NULL
	-- limit : 	location of last possible match_start, or NULL for start of buffer
	-- Returns : 	whether a match was found

	is_equal (another: like Current): BOOLEAN is
			-- Tests whether two iterators (Current and `another') are
			-- equal, using the fastest possible mechanism. This function
			-- is very fast; you can expect it to perform better than
			-- e.g. getting the character offset for each iterator and
			-- comparing the offsets yourself. Also, it's a bit faster
			-- than gtk_text_iter_compare().
		do
			Result := (gtk_text_iter_equal (handle, another.handle)).to_boolean
		end


	-- gtk_text_iter_compare ()

	-- gint        gtk_text_iter_compare           (const GtkTextIter *lhs,
	-- 															const GtkTextIter *rhs);

	-- A qsort()-style function that returns negative if lhs is less than rhs, positive if lhs is greater than rhs, and 0 if they're equal. Ordering is in character offset order, i.e. the first character in the buffer is less than the second character in the buffer.

	-- lhs : 	a GtkTextIter
	-- rhs : 	another GtkTextIter
	-- Returns : 	-1 if lhs is less than rhs, 1 if lhs is greater, 0 if they are equal
	-- gtk_text_iter_in_range ()

	-- gboolean    gtk_text_iter_in_range          (const GtkTextIter *iter,
	-- 															const GtkTextIter *start,
	-- 															const GtkTextIter *end);

	-- Checks whether iter falls in the range [start, end). start and end must be in ascending order.

	-- iter : 	a GtkTextIter
	-- start : 	start of range
	-- end : 	end of range
	-- Returns : 	TRUE if iter is in the range
	-- gtk_text_iter_order ()

	-- void        gtk_text_iter_order             (GtkTextIter *first,
	-- 															GtkTextIter *second);

	-- Swaps the value of first and second if second comes before first in the buffer. That is, ensures that first and second are in sequence. Most text buffer functions that take a range call this automatically on your behalf, so there's no real reason to call it yourself in those cases. There are some exceptions, such as gtk_text_iter_in_range(), that expect a pre-sorted range.

	-- first : 	a GtkTextIter
	-- second : 	another GtkTextIter

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextIter)"
		end


feature {} -- External call
	gtk_text_iter_get_buffer (an_iter: POINTER): POINTER is -- GtkTextBuffer*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_copy (an_iter: POINTER): POINTER is -- GtkTextIter*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_free (an_iter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_offset (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_line (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_line_offset (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_line_index (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_visible_line_index (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_visible_line_offset (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_char (an_iter: POINTER): INTEGER is -- gunichar
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_slice (an_start: POINTER; an_end: POINTER): POINTER is -- gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_text (an_start: POINTER; an_end: POINTER): POINTER is -- gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_visible_slice (an_start: POINTER; an_end: POINTER): POINTER is -- gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_visible_text (an_start: POINTER; an_end: POINTER): POINTER is -- gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_pixbuf (an_iter: POINTER): POINTER is -- GdkPixbuf*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_marks (an_iter: POINTER): POINTER is -- GSList*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_toggled_tags (an_iter: POINTER; toggled_on: INTEGER): POINTER is -- GSList*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_child_anchor (an_iter: POINTER): POINTER is -- GtkTextChildAnchor*  
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_begins_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_ends_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_toggles_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_has_tag (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_tags (an_iter: POINTER): POINTER is -- GSList*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_editable (an_iter: POINTER; default_setting: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_can_insert (an_iter: POINTER; default_editability: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_starts_word (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_ends_word (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_inside_word (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_starts_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_ends_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_starts_sentence (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_ends_sentence (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_inside_sentence (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_is_cursor_position (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_chars_in_line (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_bytes_in_line (an_iter: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_attributes (an_iter: POINTER; gtktextattributes: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_get_language (an_iter: POINTER): POINTER is -- PangoLanguage*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_is_end (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_is_start (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_char (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_char (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_chars (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_chars (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_word_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_word_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_word_end (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_word_start (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_cursor_position (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_cursor_position (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_sentence_start (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_sentence_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_sentence_end (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_sentence_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_word_ends (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_word_starts (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_word_end (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_word_start (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_cursor_position (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_cursor_position (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_cursor_positions (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_line (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_visible_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_visible_lines (an_iter: POINTER; a_count: INTEGER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_offset (an_iter: POINTER; a_char_offset: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_line (an_iter: POINTER; a_line_number: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_line_offset (an_iter: POINTER; a_char_on_line: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_line_index (an_iter: POINTER; a_byte_on_line: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_visible_line_index (an_iter: POINTER; a_byte_on_line: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_set_visible_line_offset (an_iter: POINTER; a_char_on_line: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_to_end (an_iter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_to_line_end (an_iter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_forward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_to_tag_toggle (an_iter: POINTER; a_tag: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	--(*GtkTextCharPredicate) (gunichar ch; gpointer user_data): INTEGER 

	gtk_text_iter_forward_find_char (an_iter: POINTER; predicate, user_data: POINTER; a_limit: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_find_char (an_iter: POINTER; predicate, user_data: POINTER; a_limit: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end


	gtk_text_iter_forward_search (an_iter: POINTER; a_string: POINTER; some_flags: INTEGER; an_match_start: POINTER; an_match_end: POINTER; a_limit: POINTER): INTEGER is -- gboolean
		require --valid_flags: are_valid_search_flags (some_flags)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_search (an_iter: POINTER; a_string: POINTER; some_flags: INTEGER; a_match_start: POINTER; a_match_end: POINTER; a_limit: POINTER): INTEGER is -- gboolean
		require --valid_flags: are_valid_search_flags (some_flags)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_equal (an_lhs: POINTER; an_rhs: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_compare (an_lhs: POINTER; an_rhs: POINTER): INTEGER is -- gint
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_in_range (an_iter: POINTER; an_start: POINTER; an_end: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_order (first: POINTER; an_second: POINTER) is
		external "C use <gtk/gtk.h>"
		end

end
