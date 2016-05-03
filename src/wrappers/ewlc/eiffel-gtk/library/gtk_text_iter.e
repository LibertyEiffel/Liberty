note
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
	C_STRUCT
		-- Note: This class isn't really shared, but we need to make it
		-- conform to SHARED_C_STRUCT to be able to create G_SLISTs with
		-- it. It should be expanded, if Smarteiffel implements
		-- disposing expanded objects.
		redefine
			allocate, copy, is_equal
		end
	COMPARABLE
		redefine
			copy, is_equal, -- infix "<", 
			infix "<=", infix ">", infix ">=", in_range, compare, three_way_comparison
		end

insert
	GTK
	GTK_TEXT_SEARCH_FLAGS

create {ANY} make, from_external_pointer, copy, from_external_copy

feature {} -- Creation
	make is
		require gtk_initialized: gtk.is_initialized
		do
			allocate
		end

feature {} -- Allocating
	allocate is
		require
			handle.is_null
		do
			-- The semantic of an GTK_TEXT_ITER is akin to an expanded
			-- object as they are usually allocated on the stack as
			-- locally declared variables. So they usually rely on the
			-- automatic memory handling of the stack. 

			-- In our case there is no need to allocate a dummy object and then copy it.
			handle := calloc (1, struct_size)

			-- Different versions of GTK wrap either g_free or g_slice_free in gtk_text_iter_free.
			-- Also, there is no malloc-like function in GTK to allocate iterators.
			-- Therefore, we allocate iterators using gtk_text_iter_copy()
			-- handle := gtk_text_iter_copy (dummy_iter)

			if handle.is_null then
				raise_exception (No_more_memory)
			end
		end

feature {} -- Disposing

	dispose is
			-- Free an iterator allocated on the heap. This function is
			-- intended for use in language bindings, and is not
			-- especially useful for applications, because iterators can
			-- simply be allocated on the stack.
		do
			-- There's an invariant that provides handle.is_not_null, but C_STRUCT
			-- calls dispose from within the constructor from_external_copy, which
			-- is certain to reach this code with a Void handle.  Nothing breaks
			-- if you call gtk_text_iter_free here, but noisy Gtk warnings would
			-- ensue.
			if handle.is_not_null then free (handle) end
			handle := default_pointer
		end

feature {ANY}

	buffer: GTK_TEXT_BUFFER is
			-- the GtkTextBuffer this iterator is associated with.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_TEXT_BUFFER]; buffer_ptr: POINTER
		do
			Result := factory.wrapper (gtk_text_iter_get_buffer (handle))
		end

	copy (another: like Current) is
			-- Copy `another' into Current. A new dynamically-allocated
			-- copy of the underlying iterator is made.
		require else
			another /= Void
		do
			-- Using `gtk_text_iter_copy', a function used by language
			-- bindings.  It is not useful in applications, because
			-- iterators can be copied with a simple assignment
			-- (GtkTextIter i=j;).

			if handle.is_not_null then dispose end -- Frees any previously used resource
			handle := gtk_text_iter_copy (another.handle)
			if handle.is_null then
				raise_exception (No_more_memory)
			end
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
		local retriever: G_OBJECT_EXPANDED_FACTORY [GDK_PIXBUF]
		do
			Result := retriever.wrapper (gtk_text_iter_get_pixbuf (handle))
		end

	marks: G_SLIST [GTK_TEXT_MARK] is
			-- All the GTK_TEXT_MARK at Current location. Because marks
			-- are not iterable (they don't take up any "space" in the
			-- buffer, they are just marks in between iterable
			-- locations), multiple marks can exist in the same
			-- place. The list is not in any meaningful order.
		do
			create {G_OBJECT_SLIST [GTK_TEXT_MARK]} Result.from_external_pointer (gtk_text_iter_get_marks(handle))
		ensure result_not_void: Result /= Void
		end

	toggled_tags (toggled_on: BOOLEAN): G_SLIST [GTK_TEXT_TAG] is
			-- The GTK_TEXT_TAGs that are toggled on or off at this
			-- point. (If toggled_on is TRUE, the list contains tags that
			-- are toggled on.) If a tag is toggled on at iter, then some
			-- non-empty range of characters following iter has that tag
			-- applied to it. If a tag is toggled off, then some
			-- non-empty range following iter does not have the tag
			-- applied to it.
		do
			create {G_OBJECT_SLIST [GTK_TEXT_TAG]} Result.from_external_pointer
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

	tag_begins (a_tag: GTK_TEXT_TAG): BOOLEAN is
			-- Is `a_tag' is toggled on at exactly this point? If `a_tag'
			-- is Void, returns TRUE if any tag is toggled on at this
			-- point. Note that this feature is True if iter is the start
			-- of the tagged range; `has_tag' tells you whether an
			-- iterator is within a tagged range.
		do
			Result := gtk_text_iter_begins_tag (handle, a_tag.handle).to_boolean
		end

	tag_ends (a_tag: GTK_TEXT_TAG): BOOLEAN is
			-- Is `a_tag' toggled off at exactly this point? Note that
			-- the `tag_ends' returns True if iter is the end of the
			-- tagged range; `has_tag' tells you whether an iterator is
			-- within a tagged range. 
		require tag_not_void: a_tag /= Void
		do
			Result := (gtk_text_iter_ends_tag(handle, a_tag.handle).to_boolean)
		end

	is_any_tag_toggled: BOOLEAN is
			-- Is if any tag toggled off at this point? 
		do
			Result := (gtk_text_iter_ends_tag(handle, default_pointer).to_boolean)
		end

	toggles_tag (a_tag: GTK_TEXT_TAG): BOOLEAN is
			-- Is `a_tag' toggled on or off at Current iterator? This is
			-- equivalent to (tag_begins or tag_ends), i.e. it tells you
			-- whether a range with tag applied to it begins or ends at
			-- iter.

			-- TODO: the C implementation allow a NULL tag. Check if it 
			-- means "toggles_any_tag"?
		local tp: POINTER
		do
			if a_tag/=Void then tp:=a_tag.handle end
			Result:=(gtk_text_iter_toggles_tag(handle, a_tag.handle).to_boolean)
		end

	has_tag (a_tag: GTK_TEXT_TAG): BOOLEAN is
			-- Is Current iterator within a range tagged with `a_tag'?
		require tag_not_void: a_tag /= Void
		do
			Result := gtk_text_iter_has_tag(handle,a_tag.handle).to_boolean
		end

	tags: G_SLIST [GTK_TEXT_TAG] is
			-- a list of tags that apply to iter, in ascending order of
			-- priority (highest-priority tags are last).

			-- TODO: Gtk docs says" The GtkTextTag in the list don't have
			-- a reference added, but you have to free the list
			-- itself". Check if this should be translated into a
			-- particular Eiffel implementation
		do
			create {G_OBJECT_SLIST [GTK_TEXT_TAG]}  Result.from_external_pointer (gtk_text_iter_get_tags (handle))
		end

	is_editable (a_default_setting: BOOLEAN): BOOLEAN is
			-- Is the character at iter within an editable region of
			-- text?  Non-editable text is "locked" and can't be changed
			-- by the user via GtkTextView. This feature is simply a
			-- convenience wrapper around `attributes'
			-- gtk_text_iter_get_attributes(). If no tags applied to this
			-- text affect editability, default_setting will be returned.

			-- You don't want to use this function to decide whether text
			-- can be inserted at iter, because for insertion you don't
			-- want to know whether the char at iter is inside an
			-- editable range, you want to know whether a new character
			-- inserted at iter would be inside an editable range. Use
			-- `can_insert'to handle this case.

			-- Set `a_default_setting' to True if text is editable by
			-- default.
		
			-- TODO: original C documentation pretty unclear. 
		do
			Result:= gtk_text_iter_editable (handle, a_default_setting.to_integer).to_boolean
		end

	can_insert (a_default_editability: BOOLEAN): BOOLEAN is
			-- Would the text inserted at Current iter be editable?
			-- Considering the default editability of the buffer, and
			-- tags that affect editability, determines whether text
			-- inserted at iter would be editable. If text inserted at
			-- iter would be editable then the user should be allowed to
			-- insert text at iter. GTK_TEXT_BUFFER's
			-- `insert_interactive' uses this function to decide whether
			-- insertions are allowed at a given position.
		
			-- Set `a_default_editability' to True if text is editable by
			-- default.
		do
			Result:=gtk_text_iter_can_insert(handle, a_default_editability.to_integer).to_boolean
		end

	starts_word: BOOLEAN is
			-- Is Current iter at the start of a (natural-language) word?
			-- Word breaks are determined by Pango and should be correct
			-- for nearly any language (if not, the correct fix would be
			-- to the Pango word break algorithms).
		do
			Result:=gtk_text_iter_starts_word(handle).to_boolean
		end

	ends_word: BOOLEAN is
			-- Is Current iter is at the end of a (natural-language)
			-- word?  Word breaks are determined by Pango and should be
			-- correct for nearly any language (if not, the correct fix
			-- would be to the Pango word break algorithms).
		do
			Result:=gtk_text_iter_ends_word(handle).to_boolean
		end

	inside_word: BOOLEAN is
			-- Is Current iter inside a (natural-language) word? This is
			-- the opposite of "inside some whitespace". Word breaks are
			-- determined by Pango and should be correct for nearly any
			-- language (if not, the correct fix would be to the Pango
			-- word break algorithms).
		do
			Result:=gtk_text_iter_inside_word(handle).to_boolean
		end

	starts_line: BOOLEAN is
			-- Does Current iter begin a paragraph? If True `line_offset'
			-- would be 0. However this function is potentially more
			-- efficient than `line_offset' because it doesn't have to
			-- compute the offset, it just has to see whether it's 0.
		do
			Result:=gtk_text_iter_starts_line(handle).to_boolean
		end

	ends_line: BOOLEAN is
			-- Does iter point to the start of the paragraph delimiter
			-- characters for a line? Delimiters will be either a
			-- newline, a carriage return, a carriage return followed by
			-- a newline, or a Unicode paragraph separator
			-- character. Note that an iterator pointing to the \n ("%N")
			-- of a \r\n ("%R%N") pair will not be counted as the end of
			-- a line, the line ends before the \r ("%N"). The end
			-- iterator is considered to be at the end of a line, even
			-- though there are no paragraph delimiter chars there.
		do
			Result:=gtk_text_iter_ends_line(handle).to_boolean
		end

	starts_sentence: BOOLEAN is
			-- Does Current iter begin a sentence? Sentence boundaries
			-- are determined by Pango and should be correct for nearly
			-- any language (if not, the correct fix would be to the
			-- Pango text boundary algorithms).
		do
			Result:= gtk_text_iter_starts_sentence   (handle).to_boolean
		end

	ends_sentence: BOOLEAN is
			-- Does Curret iter end a sentence? Sentence boundaries are
			-- determined by Pango and should be correct for nearly any
			-- language (if not, the correct fix would be to the Pango
			-- text boundary algorithms).
		do
			Result:=gtk_text_iter_ends_sentence (handle).to_boolean
		end

	is_inside_sentence: BOOLEAN is
			-- Is Current iter inside a sentence? This is the opposite of
			-- in between two sentences, e.g. after a period and before
			-- the first letter of the next sentence. Sentence boundaries
			-- are determined by Pango and should be correct for nearly
			-- any language (if not, the correct fix would be to the
			-- Pango text boundary algorithms).
		do
			Result := gtk_text_iter_inside_sentence (handle).to_boolean
		end

	is_cursor_position: BOOLEAN is
			-- Can the cursor be placed at Current iter? See
			-- `forward_cursor_position' or PangoLogAttr or pango_break()
			-- for details on what a cursor position is.
		do
			Result:=gtk_text_iter_is_cursor_position(handle).to_boolean
		end

	chars_in_line: INTEGER is
			-- the number of characters in the line containing iter,
			-- including the paragraph delimiters.
		do
			Result:=gtk_text_iter_get_chars_in_line (handle)
		end

	bytes_inline: INTEGER is
			-- the number of bytes in the line containing iter, including
			-- the paragraph delimiters.
		do
			Result:=gtk_text_iter_get_bytes_in_line (handle)
		end

	attributes: GTK_TEXT_ATTRIBUTES is
			-- the effect of any tags applied to this spot in the
			-- text. This is computed modifying a copy of `default_attributes'.

			-- Void if no changes occours.

			-- Note: the behaviour of this feature is quite different
			-- from the C function that it wraps
			-- (gtk_text_iter_get_attributes). If you need to apply the
			-- effets of tags from a different starting point please
			-- notify Paolo. 2006-12-31.
		local values_modified: BOOLEAN
		do
			-- Result := default_attributes
			-- values_modified := gtk_text_iter_get_attributes (handle, 
			-- Result.handle).to_boolean
			
			-- gtk_text_iter_get_attributes() will modify values,
			-- applying the effects of any tags present at iter. If any
			-- tags affected values, the function returns TRUE.
			
			-- if not values_modified then Result := Void end
		ensure implemented: False
		end

	language: PANGO_LANGUAGE is
			-- The language in effect at iter. 	
		do
			-- Note: This is convenience wrapper around
			-- `gtk_text_iter_get_attributes', which returns - if no
			-- tags affecting language apply to iter - the return value
			-- is identical to that of gtk_get_default_language()
			-- (TODO).

			create Result.from_external_pointer(gtk_text_iter_get_language(handle))
		end

feature {ANY} -- Iterator-like 
	is_off: BOOLEAN is
			-- Is iter the end iterator? End iterator is one past the
			-- last dereferenceable iterator in the buffer. This feature
			-- is the most efficient way to check whether an iterator is
			-- the end iterator.

			-- Note: this features wraps gtk_text_iter_is_end. I have
			-- changed name to conform to the iterator pattern. Paolo
			-- 2006-12-31
		do
			Result:= gtk_text_iter_is_end(handle).to_boolean
		end

	is_valid: BOOLEAN
			-- Have the iter being moved and dereferenceable?

	is_start: BOOLEAN is
			-- Is Current iter the first iterator in the buffer, that is
			-- if iter has a character offset of 0?.
		do
			Result := gtk_text_iter_is_start(handle).to_boolean
		end

	next, forward_char is
			-- Moves iter forward by one character offset. Note that
			-- images embedded in the buffer occupy 1 character slot, so
			-- `forward_char' may actually move onto an image instead of
			-- a character, if you have images in your buffer. If iter is
			-- the end iterator or one character before it, iter will now
			-- point at the end iterator, and
			-- gtk_text_iter_forward_char() returns FALSE for convenience
			-- when writing loops.
		do
			is_valid:=gtk_text_iter_forward_char(handle).to_boolean
		end

	backward_char is
			-- Moves backward by one character offset. `is_valid' will be
			-- True if movement was possible; if iter was the first in
			-- the buffer (character offset 0), `is_valid' will be False
			-- for convenience when writing loops.
		do
			is_valid:=gtk_text_iter_backward_char(handle).to_boolean
		end

	forward_chars (a_count: INTEGER) is
			-- Moves `a_count' characters if possible (if `a_count' would
			-- move past the start or end of the buffer, moves to the
			-- start or end of the buffer). `is_valid' indicates whether
			-- the new position of iter is different from its original
			-- position, and dereferenceable (the last iterator in the
			-- buffer is not dereferenceable). If `a_count' is 0, the
			-- function does nothing and `is_valid' is False.  `a_count'
			-- is number of characters to move, may be negative.
		do
			is_valid:=gtk_text_iter_forward_chars(handle, a_count).to_boolean
		ensure a_count = 0 implies is_valid = False
		end

	backward_chars (a_count: INTEGER) is
			-- Moves `a_count' characters backward, if possible (if
			-- `a_count' would move past the start or end of the buffer,
			-- moves to the start or end of the buffer). `is_valid'
			-- indicates whether the iterator moved onto a
			-- dereferenceable position; if the iterator didn't move, or
			-- moved onto the end iterator, then False is returned. If
			-- `a_count' is 0, nothing is done and `is_valid' is False.
		do
			is_valid:=gtk_text_iter_backward_chars(handle,a_count).to_boolean
		end

	forward_line is
			-- Moves iter to the start of the next line. `is_valid' is
			-- True if there was a next line to move to, and False if
			-- iter was simply moved to the end of the buffer and is now
			-- not dereferenceable, or if iter was already at the end of
			-- the buffer.
		do
			is_valid:=gtk_text_iter_forward_line(handle).to_boolean
		end

	backward_line is
			-- Moves iter to the start of the previous line. `is_valid'
			-- is True if iter could be moved; i.e. if iter was at
			-- character offset 0, `is_valid' is False. Therefore if iter
			-- was already on line 0, but not at the start of the line,
			-- iter is snapped to the start of the line and `is_valid' is
			-- True. (Note that this implies that in a loop calling this
			-- function, the line number may not change on every
			-- iteration, if your first iteration is on line 0.)
		do
			is_valid:=gtk_text_iter_backward_line(handle).to_boolean
		end

	forward_lines (a_count: INTEGER) is
			-- Moves `a_count' lines forward, if possible (if `a_count'
			-- would move past the start or end of the buffer, moves to
			-- the start or end of the buffer). `is_valid' indicates
			-- whether the iterator moved onto a dereferenceable
			-- position; if the iterator didn't move, or moved onto the
			-- end iterator, then `is_valid' will be False. If `a_count'
			-- is 0, the function does nothing and `is_valid' is
			-- False. If `a_count' is negative, moves backward by
			-- `0-a_count' lines.
		do
			is_valid:=gtk_text_iter_forward_lines(handle, a_count).to_boolean
		end

	backward_lines (a_count: INTEGER) is
			-- Moves `a_count' lines backward, if possible (if `a_count'
			-- would move past the start or end of the buffer, moves to
			-- the start or end of the buffer). `is_valid' indicates
			-- whether the iterator moved onto a dereferenceable
			-- position; if the iterator didn't move, or moved onto the
			-- end iterator, then `is_valid' is False. If `a_count' is 0,
			-- the function does nothing and `is_valid' is False. If
			-- `a_count' is negative, moves forward by 0 - count lines.
		do
			is_valid:=gtk_text_iter_backward_lines(handle, a_count).to_boolean
		end

	forward_word_ends (a_count: INTEGER) is
			-- Calls `forward_word_end' up to `a_count' times. Then
			-- `is_valid' is True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_forward_word_ends(handle, a_count).to_boolean
		end

	backward_word_starts (a_count: INTEGER) is
			-- Calls `backward_word_start' up to `a_count'
			-- times. `is_valid' will be True if iter moved and is not
			-- the end iterator.
		do
			is_valid:=gtk_text_iter_backward_word_starts(handle,a_count).to_boolean
		end

	forward_word_end is
			-- Moves forward to the next word end. (If iter is currently
			-- on a word end, moves forward to the next one after that.)
			-- Word breaks are determined by Pango and should be correct
			-- for nearly any language (if not, the correct fix would be
			-- to the Pango word break algorithms).

			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_forward_word_end(handle).to_boolean
		end

	backward_word_start is
			-- Moves backward to the previous word start. (If iter is
			-- currently on a word start, moves backward to the next one
			-- after that). Word breaks are determined by Pango and
			-- should be correct for nearly any language (if not, the
			-- correct fix would be to the Pango word break algorithms).
			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.		
		do
			is_valid:=gtk_text_iter_backward_word_start(handle).to_boolean
		end

	forward_cursor_position is
			-- Moves iter forward by a single cursor position. Cursor
			-- positions are (unsurprisingly) positions where the cursor
			-- can appear. Perhaps surprisingly, there may not be a
			-- cursor position between all characters. The most common
			-- example for European languages would be a carriage
			-- return/newline sequence. For some Unicode characters, the
			-- equivalent of say the letter "a" with an accent mark will
			-- be represented as two characters, first the letter then a
			-- "combining mark" that causes the accent to be rendered; so
			-- the cursor can't go between those two characters. See also
			-- the PangoLogAttr structure and pango_break() function.

			-- `is_valid' will be True if we moved and the new position
			-- is dereferenceable
		do
			is_valid:=gtk_text_iter_forward_cursor_position(handle).to_boolean
		end

	backward_cursor_position is
			-- Like `forward_cursor_position', but moves backward.

			-- `is_valid' will be True if we moved
		do
			is_valid:=gtk_text_iter_backward_cursor_position(handle).to_boolean
		end

	forward_cursor_positions (a_count: INTEGER) is
			-- Moves up to `a_count' cursor positions. See
			-- `forward_cursor_position' for details.
		
			-- `is_valid' will be True if we moved and the new position
			-- is dereferenceable.	
		do
			is_valid:=gtk_text_iter_forward_cursor_positions(handle, a_count).to_boolean
		end
	
	backward_cursor_positions (a_count: INTEGER) is
			-- Moves up to `a_count' cursor positions. See
			-- `forward_cursor_position' for details.

			-- `is_valid' will be True if we moved and the new position
			-- is dereferenceable.
		do
			is_valid:=gtk_text_iter_backward_cursor_positions(handle, a_count).to_boolean
		end

	backward_sentence_start is
			-- Moves backward to the previous sentence start; if iter is
			-- already at the start of a sentence, moves backward to the
			-- next one. Sentence boundaries are determined by Pango and
			-- should be correct for nearly any language (if not, the
			-- correct fix would be to the Pango text boundary
			-- algorithms).

			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_backward_sentence_start(handle).to_boolean
		end

	backward_sentence_starts (a_count: INTEGER) is
			-- Calls `backward_sentence_start' up to count times, or
			-- until `is_valid' will be False. If `a_count' is negative,
			-- moves forward instead of backward.

			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_backward_sentence_starts(handle,a_count).to_boolean
		end

	forward_sentence_end is
			-- Moves forward to the next sentence end. (If iter is at the
			-- end of a sentence, moves to the next end of sentence.)
			-- Sentence boundaries are determined by Pango and should be
			-- correct for nearly any language (if not, the correct fix
			-- would be to the Pango text boundary algorithms).

			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_forward_sentence_end(handle).to_boolean
		end
	
	forward_sentence_ends (a_count: INTEGER) is
			-- Calls `forward_sentence_end' `a_count' times (or until
			-- `forward_sentence_end' sets `is_valid' to False). If
			-- `a_count' is negative, moves backward instead of forward.

			-- `is_valid' will be set to True if iter moved and is not
			-- the end iterator.
		do
			is_valid:=gtk_text_iter_forward_sentence_ends(handle,a_count).to_boolean
		end

	forward_visible_word_ends (a_count: INTEGER) is
			-- Calls `forward_visible_word_end' up to `a_count' times.

			-- `is_valid' will be set to True if iter moved and is not
			-- the end iterator.
		do
			is_valid:=gtk_text_iter_forward_visible_word_ends(handle, a_count).to_boolean
		end

	backward_visible_word_starts (a_count: INTEGER) is
			-- Calls `backward_visible_word_start' up to `a_count' times.
		
			-- `is_valid' will be True if iter moved and is not the end
			-- iterator.
		do
			is_valid:=gtk_text_iter_backward_visible_word_starts(handle, a_count).to_boolean
		end

	forward_visible_word_end is
			-- Moves forward to the next visible word end. (If iter is
			-- currently on a word end, moves forward to the next one
			-- after that.) Word breaks are determined by Pango and
			-- should be correct for nearly any language (if not, the
			-- correct fix would be to the Pango word break algorithms).

			-- `is_valid' will be set to True if iter moved and is not
			-- the end iterator.
		do
			is_valid:=gtk_text_iter_forward_visible_word_end(handle).to_boolean
		end

	backward_visible_word_start is
			-- Moves backward to the previous visible word start. (If
			-- iter is currently on a word start, moves backward to the
			-- next one after that.) Word breaks are determined by Pango
			-- and should be correct for nearly any language (if not, the
			-- correct fix would be to the Pango word break algorithms).
		
			-- `is_valid' will be set to True if iter moved and is not
			-- the end iterator.
		do
			is_valid:=gtk_text_iter_backward_visible_word_start(handle).to_boolean
		end

	forward_visible_cursor_position is
			-- Moves iter forward to the next visible cursor
			-- position. See `forward_cursor_position' for details.

			-- `is_valid' will be set to True if we moved and the new
			-- position is dereferenceable.
		do
			is_valid:=gtk_text_iter_forward_visible_cursor_position(handle).to_boolean
		end


	backward_visible_cursor_position is
			-- Moves iter forward to the previous visible cursor
			-- position. See `backward_cursor_position' for details.

			-- `is_valid' will be set to True if we moved and the new
			-- position is dereferenceable
		do
			is_valid:=gtk_text_iter_backward_visible_cursor_position(handle).to_boolean
		end

	forward_visible_cursor_positions (a_count: INTEGER) is
			-- Moves up to `a_count' visible cursor positions. See
			-- `forward_cursor_position' for details.

			-- `is_valid' will be set to True if we moved and the new
			-- position is dereferenceable.
		do
			is_valid:=gtk_text_iter_forward_visible_cursor_positions(handle, a_count).to_boolean
		end	

	backward_visible_cursor_positions (a_count: INTEGER) is
			-- Moves up to `a_count' visible cursor positions. See
			-- `forward_cursor_position' for details.

			-- `is_valid' will be set to True if we moved and the new
			-- position is dereferenceable.
		do
			is_valid:=gtk_text_iter_backward_visible_cursor_positions(handle,a_count).to_boolean
		end

	forward_visible_line is
			-- Moves iter to the start of the next visible line.
			-- `is_valid' is set to True if there was a next line to move
			-- to, and False if iter was simply moved to the end of the
			-- buffer and is now not dereferenceable, or if iter was
			-- already at the end of the buffer.
		do
			is_valid:=gtk_text_iter_forward_visible_line(handle).to_boolean
		end

	iter_backward_visible_line is
			-- Moves iter to the start of the previous visible line.
			-- `is_valid' is seto to True if iter could be moved; i.e. if
			-- iter was at character offset 0, this function returns
			-- FALSE. Therefore if iter was already on line 0, but not at
			-- the start of the line, iter is snapped to the start of the
			-- line and the function returns TRUE. (Note that this
			-- implies that in a loop calling this function, the line
			-- number may not change on every iteration, if your first
			-- iteration is on line 0.)
		do
			is_valid:=gtk_text_iter_backward_visible_line(handle).to_boolean
		end

	forward_visible_lines (a_count: INTEGER) is
			-- Moves `a_count' visible lines forward, if possible (if
			-- count would move past the start or end of the buffer,
			-- moves to the start or end of the buffer). `is_valid'
			-- indicates whether the iterator moved onto a
			-- dereferenceable position; if the iterator didn't move, or
			-- moved onto the end iterator, then `is_valid' is False. If
			-- `a_count' is 0, the function does nothing and `is_valid'
			-- is set to False. If `a_count' is negative, moves backward
			-- by 0 - count lines.
		do
			is_valid:=gtk_text_iter_forward_visible_lines(handle, a_count).to_boolean
		end

	backward_visible_lines (a_count: INTEGER) is
			-- Moves `a_count' visible lines backward, if possible (if
			-- `a_count' would move past the start or end of the buffer,
			-- moves to the start or end of the buffer). `is_valid'
			-- indicates whether the iterator moved onto a
			-- dereferenceable position; if the iterator didn't move, or
			-- moved onto the end iterator, then `is_valid' is False. If
			-- `a_count' is 0, nothing is done and `is_valid' is
			-- False. If `a_count' is negative, moves forward by 0 -
			-- count lines.

		do
			is_valid:=gtk_text_iter_backward_visible_lines(handle,a_count).to_boolean
		end

	set_offset (a_char_offset: INTEGER) is
			-- Sets iter to point to `a_char_offset'. `a_char_offset'
			-- counts from the start of the entire text buffer, starting
			-- with 0.
		do
			gtk_text_iter_set_offset(handle,a_char_offset)
		end

	set_line (a_line_number: INTEGER) is
			-- Moves iterator iter to the start of the line
			-- `a_line_number' (counted from 0). If `a_line_number' is
			-- negative or larger than the number of lines in the buffer,
			-- moves iter to the start of the last line in the buffer.
		do
			gtk_text_iter_set_line(handle, a_line_number)
		end

	set_line_offset (a_char_on_line: INTEGER) is
			-- Moves iter within a line, to a new character (not byte)
			-- offset. The given character offset must be less than or
			-- equal to the number of characters in the line; if equal,
			-- iter moves to the start of the next line. See
			-- `set_line_index' if you have a byte index rather than a
			-- character offset.
		do
			gtk_text_iter_set_line_offset (handle,a_char_on_line)
		end

	set_line_index (a_byte_on_line: INTEGER) is
			-- Same as `set_line_offset', but works with a byte
			-- index. The given byte index must be at the start of a
			-- character, it can't be in the middle of a UTF-8 encoded
			-- character (TODO: turn it into a precondition).
			-- `a_byte_on_line' is the byte index relative to the start
			-- of iter's current line.
		do
			gtk_text_iter_set_line_index (handle, a_byte_on_line)
		end

	set_visible_line_index (a_byte_on_line: INTEGER) is
			-- Like `set_line_index', but the index is in visible bytes,
			-- i.e. text with a tag making it invisible is not counted in
			-- the index. 
		do
			gtk_text_iter_set_visible_line_index(handle, a_byte_on_line)
		end	

	set_visible_line_offset (a_char_on_line: INTEGER) is
			-- Like `set_line_offset', but the offset is in visible
			-- characters, i.e. text with a tag making it invisible is
			-- not counted in the offset.
		do
			gtk_text_iter_set_visible_line_offset(handle,a_char_on_line)
		end
	
	forward_to_end is
			-- Moves iter forward to the "end iterator," which points one
			-- past the last valid character in the
			-- buffer. 
		do
			gtk_text_iter_forward_to_end(handle)
			is_valid:=False
		ensure
			not_valid: not is_valid
			-- TODO: `char' called on the end iterator is 0, which is
			-- convenient for writing loops (when writing C code).
		end

	forward_to_line_end is
			-- Moves the iterator to point to the paragraph delimiter
			-- characters, which will be either a newline, a carriage
			-- return, a carriage return/newline in sequence, or the
			-- Unicode paragraph separator character. If the iterator is
			-- already at the paragraph delimiter characters, moves to
			-- the paragraph delimiter characters for the next line. If
			-- iter is on the last line in the buffer, which does not end
			-- in paragraph delimiters, moves to the end iterator (end of
			-- the last line), and `is_valid' is set to False.
			-- `is_valid' is set to True if we moved and the new location
			-- is not the end iterator.
		do
			is_valid:=gtk_text_iter_forward_to_line_end(handle).to_boolean
		end
	
	forward_to_tag_toggle (a_tag: GTK_TEXT_TAG) is
			-- Moves forward to the next toggle (on or off) of `a_tag,'
			-- or to the next toggle of any tag if `a_tag' is Void. If no
			-- matching tag toggles are found `is_valid' is set to False,
			-- otherwise to True. Does not return toggles located at
			-- iter, only toggles after iter. Sets iter to the location
			-- of the toggle, or to the end of the buffer if no toggle is
			-- found.
		do
			if a_tag=Void then
				is_valid:=gtk_text_iter_forward_to_tag_toggle(handle,default_pointer).to_boolean
			else
				is_valid:=gtk_text_iter_forward_to_tag_toggle(handle,a_tag.handle).to_boolean
			end
		end

	backward_to_tag_toggle (a_tag: GTK_TEXT_TAG) is
			-- Moves backward to the next toggle (on or off) of `a_tag,'
			-- or to the next toggle of any tag if `a_tag' is Void. If no
			-- matching tag toggles are found, `is_valid' is set to
			-- False, otherwise to True. Toggles located at iter are not
			-- counted, only toggles before iter. Sets iter to the
			-- location of the toggle, or the start of the buffer if no
			-- toggle is found.
		do
			if a_tag = Void then
				is_valid := gtk_text_iter_backward_to_tag_toggle(handle,default_pointer).to_boolean
			else
				is_valid := gtk_text_iter_backward_to_tag_toggle(handle,a_tag.handle).to_boolean
			end
		end

	is_found: BOOLEAN
			-- Have the last search/scan been successful?

	forward_find_char (a_predicate: PREDICATE[TUPLE[INTEGER_32]]; a_limit: GTK_TEXT_ITER) is
			-- Advances iter, calling `a_predicate' on each character. If
			-- `a_predicate' is True, scanning is stopped and `is_found'
			-- TRUE and stops scanning. If `a_predicate' is never True,
			-- iter is set to `a_limit' if limit is non-Void, otherwise
			-- to the end iterator.
		local ca: POINTER
		do
			ca := callback_array($callback)
			if a_limit = Void then
				is_found := gtk_text_iter_forward_find_char (handle, $hidden_callback,
																			ca, -- i.e.: user_data,
																			default_pointer -- i.e. no limit
																		  ).to_boolean
			else
				is_found := gtk_text_iter_forward_find_char (handle, $hidden_callback,
																			ca, -- i.e.: user_data,
																			a_limit.handle -- i.e. no limit
																		  ).to_boolean
			end
		end

	backward_find_char (a_predicate: PREDICATE[TUPLE[INTEGER_32]]; a_limit: GTK_TEXT_ITER) is
			-- Same as `forward_find_char', but goes backward from iter.
		local ca: POINTER
		do
			ca:=callback_array($callback)
			if a_limit=Void
			 then is_found:=gtk_text_iter_backward_find_char
				(handle, $hidden_callback,
				 ca, -- i.e.: user_data,
				 default_pointer -- i.e. no limit
				 ).to_boolean
			else is_found:=gtk_text_iter_backward_find_char
				(handle, $hidden_callback,
				 ca, -- i.e.: user_data,
				 a_limit.handle -- i.e. no limit
				 ).to_boolean
			end
		end

	forward_search (a_string: STRING; some_flags: INTEGER;
						 a_start_match, an_end_match, a_limit: GTK_TEXT_ITER) is
			-- Searches forward for `a_string'. Any match is returned by
			-- setting `a_match_start' to the first character of the
			-- match and `a_match_end' to the first character after the
			-- match. The search will not continue past `a_limit'. Note
			-- that a search is a linear or O(n) operation, so you may
			-- wish to use limit to avoid locking up your UI on large
			-- buffers.

			-- If the `gtk_text_search_visible_only' flag is present, the
			-- match may have invisible text interspersed in
			-- `a_string'. i.e. it will be a possibly-noncontiguous
			-- subsequence of the matched range. similarly, if you
			-- specify `gtk_text_search_text_only,' the match may have
			-- pixbufs or child widgets mixed inside the matched
			-- range. If these flags are not given, the match must be
			-- exact; the special 0xFFFC character in `a_string' will match
			-- embedded pixbufs or child widgets.

			-- `a_string': 	a search string

			-- `some_flags': 	flags affecting how the search is done

			-- `a_match_start' is set to the location for start of match,
			-- if not Void NULL

			-- `a_match_end' is set to the location for end of match, if
			-- it is not Void.

			-- `a_limit' is the bound for the search; Void to indicate
			-- the end of the buffer.
			
			-- `is_found' is set whether a match was found.

			-- TODO: match start and end iterators passed as arguments
			-- does not strictly follow the no-side-effects requirement
			-- usually expected in Eiffel design. Check for a best way to
			-- wrap this feature.
		require
			string_not_void: a_string /= Void
			valid_flags: are_valid_search_flags(some_flags)
		local smp, emp, lp: POINTER
		do
			if a_start_match/=Void then smp:=a_start_match.handle end
			if an_end_match/=Void then emp:=an_end_match.handle end
			if a_limit/=Void then lp:=a_limit.handle end
			is_found:=gtk_text_iter_forward_search(handle,a_string.to_external,
																some_flags,
																smp, emp, lp).to_boolean
		end

	backward_search (a_string: STRING; some_flags: INTEGER;
						  a_start_match, an_end_match, a_limit: GTK_TEXT_ITER) is
			-- Same as `forward_search', but moves backward.
		require
			string_not_void: a_string /= Void
			valid_flags: are_valid_search_flags(some_flags)
		local smp, emp, lp: POINTER
		do
			if a_start_match/=Void then smp:=a_start_match.handle end
			if an_end_match/=Void then emp:=an_end_match.handle end
			if a_limit/=Void then lp:=a_limit.handle end
			is_found:=gtk_text_iter_backward_search(handle,a_string.to_external,
																 some_flags,
																 smp, emp, lp).to_boolean
		end

	order (another: GTK_TEXT_ITER) is
			-- Swaps the value of Current and `another' if `another'
			-- comes before Current in the buffer. That is, ensures that
			-- Current and `another' are in sequence. Most text buffer
			-- functions that take a range call this automatically on
			-- your behalf, so there's no real reason to call it yourself
			-- in those cases. There are some exceptions, such as
			-- `in_range', that expect a pre-sorted range.
		require another_not_void: another /= Void
		do
			gtk_text_iter_order (handle, another.handle)
		ensure ordered: Current <= another
		end

feature {ANY} -- Comparability
	is_equal (another: like Current): BOOLEAN is
			-- Tests whether two iterators (Current and `another') are
			-- equal, using the fastest possible mechanism. This function
			-- is very fast; you can expect it to perform better than
			-- e.g. getting the character offset for each iterator and
			-- comparing the offsets yourself. Also, it's a bit faster
			-- than `compare'.
		do
			Result := (gtk_text_iter_equal (handle, another.handle)).to_boolean
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			Result:= compare(other)<0
		end

	infix "<=" (other: like Current): BOOLEAN is
		do
			Result:= compare(other)<=0
		end

	infix ">" (other: like Current): BOOLEAN is
		do
			Result:= compare(other)>0
		end

	infix ">=" (other: like Current): BOOLEAN is
		do
			Result:= compare(other)>=0
		end

	in_range (lower, upper: like Current): BOOLEAN is
			-- Does Current fall in the range [lower, upper). 
		require
			ascending_order: lower <= upper
		do
			Result:=gtk_text_iter_in_range(handle, lower.handle, upper.handle).to_boolean
		end

	three_way_comparison (other: like Current): INTEGER is
		obsolete "Please use compare"
		do
			Result:=compare(other)
		end

	compare (another: like Current): INTEGER is
			-- A qsort()-style function that returns negative if Current
			-- is less than `another,' positive if Current is greater
			-- than `another,' and 0 if they're equal. Ordering is in
			-- character offset order, i.e. the first character in the
			-- buffer is less than the second character in the buffer.
		do
			Result:=gtk_text_iter_compare(handle, another.handle)
		end

feature {ANY} -- size

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

	gtk_text_iter_forward_find_char (an_iter: POINTER; a_predicate, user_data: POINTER; a_limit: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_text_iter_backward_find_char (an_iter: POINTER; a_predicate, user_data: POINTER; a_limit: POINTER): INTEGER is -- gboolean
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

feature {} -- GtkTextCharPredicate callback
	hidden_callback (a_gunichar: INTEGER_32; data: POINTER): INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "$Result = ((*GtkTextCharPredicate)($data[0]) ($a_gunichar, $data[1]));"
		end

	callback_array (a_callback_pointer: POINTER): POINTER is
			-- This call is required because we need to build an array
			-- with the address of an Eiffel feature (namely
			-- callback). `$' operator thought can be used only in a
			-- feature call. Hence this.
		do
			Result:= {NATIVE_ARRAY[POINTER]
						 <<a_callback_pointer ,Current.to_pointer>>
							}.to_external
		end

feature {}
	callback (a_unicode_character: INTEGER_32): BOOLEAN is
		do
			debug
				print ("Gtk text char predicate function callback:")
				print (" a_unicode_character=") print(a_unicode_character.to_string)
				print ("%N")
			end
				
			Result:=(predicate.item([a_unicode_character]).to_integer).to_boolean
		end

	predicate: PREDICATE[TUPLE[INTEGER_32]]

invariant
	handle.is_not_null
end
