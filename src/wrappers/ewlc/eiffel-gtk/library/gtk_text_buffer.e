note
	description: "Formatted text buffer; GtkTextBuffer stores attributed text for display in a GtkTextView "
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

class GTK_TEXT_BUFFER
	-- A text buffer.

	-- Conceptual Overview:

	-- GTK+ has an extremely powerful framework for multiline text
	-- editing. The primary objects involved in the process are
	-- GTK_TEXT_BUFFER, which represents the text being edited, and
	-- GTK_TEXT_VIEW, a widget which can display a
	-- GTK_TEXT_BUFFER. Each buffer can be displayed by any number of
	-- views.

	-- One of the important things to remember about text in GTK+ is
	-- that it's in the UTF-8 encoding. This means that one character
	-- can be encoded as multiple bytes. Character counts are usually
	-- referred to as offsets, while byte counts are called indexes. If
	-- you confuse these two, things will work fine with ASCII, but as
	-- soon as your buffer contains multibyte characters, bad things
	-- will happen.

	-- Text in a buffer can be marked with tags. A tag is an attribute
	-- that can be applied to some range of text. For example, a tag
	-- might be called "bold" and make the text inside the tag
	-- bold. However, the tag concept is more general than that; tags
	-- don't have to affect appearance. They can instead affect the
	-- behavior of mouse and key presses, "lock" a range of text so the
	-- user can't edit it, or countless other things. A tag is
	-- represented by a GtkTextTag object. One GtkTextTag can be
	-- applied to any number of text ranges in any number of buffers.

	-- Each tag is stored in a GTK_TEXT_TAG_TABLE. A tag table defines
	-- a set of tags that can be used together. Each buffer has one tag
	-- table associated with it; only tags from that tag table can be
	-- used with the buffer. A single tag table can be shared between
	-- multiple buffers, however.

	-- Tags can have names, which is convenient sometimes (for example,
	-- you can name your tag that makes things bold "bold"), but they
	-- can also be anonymous (which is convenient if you're creating
	-- tags on-the-fly).

	-- TODO: the following paragraph uncover details that the Eiffel
	-- wrapper library should actuall hide from the end-user of the
	-- library. Make sure that GTK_TEXT_ITER behaviour mimicks it
	-- efficiently. Paolo 2008-04-06

	-- Most text manipulation is accomplished with iterators,
	-- represented by a GTK_TEXT_ITER. An iterator represents a position
	-- between two characters in the text buffer. GTK_TEXT_ITER is a
	-- struct designed to be allocated on the stack; it's guaranteed to
	-- be copiable by value and never contain any heap-allocated
	-- data. Iterators are not valid indefinitely; whenever the buffer
	-- is modified in a way that affects the number of characters in
	-- the buffer, all outstanding iterators become invalid. (Note that
	-- deleting 5 characters and then reinserting 5 still invalidates
	-- iterators, though you end up with the same number of characters
	-- you pass through a state with a different number).

	-- Because of this, iterators can't be used to preserve positions
	-- across buffer modifications. To preserve a position, the
	-- GTK_TEXT_MARK object is ideal. You can think of a mark as an
	-- invisible cursor or insertion point; it floats in the buffer,
	-- saving a position. If the text surrounding the mark is deleted,
	-- the mark remains in the position the text once occupied; if text
	-- is inserted at the mark, the mark ends up either to the left or
	-- to the right of the new text, depending on its gravity. The
	-- standard text cursor in left-to-right languages is a mark with
	-- right gravity, because it stays to the right of inserted text.

	-- Like tags, marks can be either named or anonymous. There are two
	-- marks built-in to GTK_TEXT_BUFFER; these are named "insert" and
	-- "selection_bound" and refer to the insertion point and the
	-- boundary of the selection which is not the insertion point,
	-- respectively. If no text is selected, these two marks will be in
	-- the same position. You can manipulate what is selected and where
	-- the cursor appears by moving these marks around. 

	-- Text buffers always contain at least one line, but may be empty
	-- (that is, buffers can contain zero characters). The last line in
	-- the text buffer never ends in a line separator (such as
	-- newline); the other lines in the buffer always end in a line
	-- separator. Line separators count as characters when computing
	-- character counts and character offsets. Note that some Unicode
	-- line separators are represented with multiple bytes in UTF-8,
	-- and the two-character sequence "\r\n" is also considered a line
	-- separator.

inherit G_OBJECT

insert
	GTK
	GTK_TEXT_BUFFER_EXTERNALS
	G_SIGNALS

create {ANY}
	make, from_external_pointer, with_tag_table

feature {} -- Creation

	make is
			-- Creates a new text buffer.
		require
			gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_buffer_new (default_pointer))
			-- TODO: Support GTK_TEXT_TAG_TABLEs.  For now, creating a
			-- new one every time.
		end

	with_tag_table (a_tag_table: GTK_TEXT_TAG_TABLE) is
		require
			gtk_initialized: gtk.is_initialized
			non_void_table: a_tag_table/=Void
		do
			from_external_pointer (gtk_text_buffer_new(a_tag_table.handle))
		end

feature {ANY} -- Operations

	set_text(a_text: STRING) is
			-- Deletes current contents of buffer, and inserts `a_text'
			-- instead. `a_text' must be valid UTF-8.
			-- `a_text': UTF-8 text to insert
		require
			text_not_void: a_text /= Void
			text_is_utf8: -- TODO: a_text should be valid UTF-8!
		do
			gtk_text_buffer_set_text(handle, a_text.to_external, a_text.count)
		end

feature {ANY} -- Access

	text (a_start, an_end: GTK_TEXT_ITER; include_hidden_chars: BOOLEAN): STRING is
			-- the text in the range [`a_start',`an_end'). Excludes
			-- undisplayed text (text marked with tags that set the
			-- invisibility attribute) if `include_hidden_chars' is
			-- False. Does not include characters representing embedded
			-- images, so byte and character indexes into the returned
			-- string do not correspond to byte and character indexes
			-- into the buffer.  Contrast with `slice'
			-- `a_start' : 	start of a range
			-- `an_end' : 	end of a range
			-- include_hidden_chars : 	whether to include invisible text
		--obsolete "Result's type will be changed to UTF8_STRING when this class will be available"
		require
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
			start_in_current_buffer: a_start.buffer = Current
			end_in_current_buffer: an_end.buffer = Current
		local
			p: POINTER
		do
			p := gtk_text_buffer_get_text (handle, a_start.handle, an_end.handle, include_hidden_chars.to_integer)
				check not p.is_null end
			create  Result.from_external (p)
		ensure
			not_void: Result /= Void
		end

	line_count: INTEGER is
			-- the number of lines in the buffer. This value is cached,
			-- so the function is very fast.
		do
			Result:=gtk_text_buffer_get_line_count (handle)
		end

	char_count: INTEGER is
			-- the number of characters in the buffer; note that
			-- characters and bytes are not the same, you can't
			-- e.g. expect the contents of the buffer in string form to
			-- be this many bytes long. The character count is cached, so
			-- this function is very fast.
		do
			Result := gtk_text_buffer_get_char_count (handle)
		end

	tag_table: GTK_TEXT_TAG_TABLE is
			-- the GtkTextTagTable associated with this buffer.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_TEXT_TAG_TABLE]
		do
			if hidden_tag_table = Void then 
				hidden_tag_table := factory.wrapper (gtk_text_buffer_get_tag_table (handle))
			end
			Result := hidden_tag_table
		end

	insert_at (an_iter: GTK_TEXT_ITER; some_text: STRING) is
			-- Inserts `a_length' bytes of text at `an_iter' position. Emits the
			-- "insert_text" signal; insertion actually occurs in the default
			-- handler for the signal. iter is invalidated when insertion occurs
			-- (because the buffer contents change), but the default signal handler
			-- revalidates it to point to the end of the inserted text.

			-- Note: C API has also a lenght argument, put at -1 for
			-- nul-terminated that will be inserted entirely.
		require
			valid_iter: an_iter /= Void
			some_text: some_text /= Void
			-- valid_length: a_length >= -1
		do
			gtk_text_buffer_insert (handle, an_iter.handle, some_text.to_external, -1)
		end

	insert_at_cursor (some_text: STRING; a_length: INTEGER) is
			-- calls `insert_at', using the current cursor position as the
			-- insertion point.
		do
			gtk_text_buffer_insert_at_cursor (handle, some_text.to_external, a_length)
		end

	is_successful: BOOLEAN
			-- Have the last operation been successful? Typically updated
			-- by insertion commands

	insert_interactive (an_iter: GTK_TEXT_ITER; a_text: STRING;
							  a_length: INTEGER; default_editable: BOOLEAN) is
			-- Like `insert_at', but the insertion will not occur if
			-- `an_iter' is at a non-editable location in the
			-- buffer. Usually you want to prevent insertions at
			-- ineditable locations if the insertion results from a user
			-- action (is interactive).

			-- `default_editable' indicates the editability of text that
			-- doesn't have a tag affecting editability applied to
			-- it. Typically the result of GTK_TEXT_VIEW's `is_editable'
			-- is appropriate here.

			-- `an_iter': a position in buffer
			-- `a_text': some UTF-8 text
			-- `a_length': length of text in bytes, or -1
			-- `default_editable': default editability of buffer
			-- `is_successful' is set to True whether text was actually inserted
		do
			is_successful := (gtk_text_buffer_insert_interactive
									(handle, an_iter.handle,
									 a_text.to_external, a_length,
									 default_editable.to_integer)).to_boolean
		end

	insert_interactive_at_cursor (a_text: STRING; a_length: INTEGER; default_editable: BOOLEAN) is
			-- Calls `insert_interactive' at the cursor position.

			-- `default_editable' indicates the editability of text that
			-- doesn't have a tag affecting editability applied to
			-- it. Typically the result of GTK_TEXT_VIEW's `is_editable'
			-- is appropriate here.

			-- `a_text': text in UTF-8 format

			-- `a_length': length of text in bytes, or -1

			-- `default_editable': default editability of buffer

			-- `is_successful' is updated (i.e. True whether text was
			-- actually inserted, false otherwise).
		do
			is_successful:=(gtk_text_buffer_insert_interactive_at_cursor
								 (handle, a_text.to_external, a_length,
								  default_editable.to_integer)).to_boolean
		end

	insert_range (an_iter, a_start, an_end: GTK_TEXT_ITER) is
			-- Copies text, tags, and pixbufs between `a_start' and
			-- `an_end' (the order of start and end doesn't matter) and
			-- inserts the copy at `an_iter'. Used instead of simply
			-- getting/inserting text because it preserves images and
			-- tags. If start and end are in a different buffer from
			-- buffer, the two buffers must share the same tag table.

			-- Implemented via emissions of the `insert_text' and
			-- `apply_tag' signals, so expect those.

			-- `a_start' and `an_end' are positions in the same
			-- GtkTextBuffer

			-- `is_successful' *not* is updated.  Use `insert_range_interactive'
			-- if you need that.
		require
			iter_not_void: an_iter /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
			start_and_end_in_the_same_buffer: a_start.buffer = an_end.buffer
		do
			gtk_text_buffer_insert_range (handle, an_iter.handle,
								  a_start.handle, an_end.handle)
		end

	insert_range_interactive (an_iter, a_start, an_end: GTK_TEXT_ITER;
									  default_editable: BOOLEAN) is
			-- Same as `insert_range', but does nothing if the insertion
			-- point isn't editable. The `default_editable' parameter
			-- indicates whether the text is editable at iter if no tags
			-- enclosing `an_iter' affect editability. Typically the result of
			-- GTK_TEXT_VIEW's `is_editable' is appropriate here.

			-- `is_successful' is updated (i.e. True whether text was
			-- actually inserted, false otherwise).
		require
			iter_not_void: an_iter /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
			start_and_end_in_the_same_buffer: a_start.buffer = an_end.buffer
		do
			is_successful := (gtk_text_buffer_insert_range_interactive
								 (handle, an_iter.handle,
								  a_start.handle, an_end.handle,
								  default_editable.to_integer)).to_boolean
		end

	insert_with_tags (an_iter: GTK_TEXT_ITER; some_text: STRING;
							some_tags: COLLECTION[GTK_TEXT_TAG]) is
			-- Inserts `some_text' into buffer at `an_iter', applying the
			-- list of tags to the newly-inserted text. Equivalent to
			-- calling `insert_at', then `apply_tag' on the inserted
			-- text; this is just a convenience feature.

			-- `an_iter': 	an iterator in buffer
			-- `some_text': 	UTF-8 text
			-- `some_tags' : 	collection of tags to apply to text
		require
			iter_not_void: an_iter /= Void
			text_not_void: some_text /= Void
			tags_not_void: some_tags /= Void
		local
			tags: ITERATOR[GTK_TEXT_TAG];
			a_start_offset: INTEGER
			a_start_iter: GTK_TEXT_ITER
		do
			-- Note: this code is a more or less direct traduction from C
			-- to Eiffel of the "internal" GTK implementation.
			a_start_offset := an_iter.offset

			insert_at (an_iter, some_text)
			-- Now an_iter points to the end of the inserted text
			a_start_iter := iter_at_offset (a_start_offset)
			tags := some_tags.get_new_iterator
			from tags.start until tags.is_off
			loop
				apply_tag (tags.item, a_start_iter, an_iter)
				tags.next
			end
		end

	insert_with_tags_by_name (an_iter: GTK_TEXT_ITER; some_text: STRING;
									  some_tag_names: COLLECTION[STRING]) is
			-- Inserts `some_text' into buffer at `an_iter', applying the
			-- list of tags to the newly-inserted text.  Same as
			-- `insert_with_tags', but allows you to pass in tag names
			-- instead of tag objects.

			-- `an_iter': 	an iterator in buffer
			-- `some_text': 	UTF-8 text
			-- `some_tags_name' : collection of names of tags to apply to text
		require
			iter_not_void: an_iter /= Void
			text_not_void: some_text /= Void
			tag_names_not_void: some_tag_names /= Void
		local
			tag_names: ITERATOR[STRING]; tag: GTK_TEXT_TAG
			a_start_offset: INTEGER
			a_start_iter: GTK_TEXT_ITER
		do
			-- Note: this code is a more or less direct traduction from C
			-- to Eiffel of the "internal" GTK implementation.
			a_start_offset := an_iter.offset

			insert_at (an_iter, some_text)
			-- Now an_iter points to the end of the inserted text
			a_start_iter := iter_at_offset (a_start_offset)
			tag_names := some_tag_names.get_new_iterator
			from tag_names.start until tag_names.is_off
			loop
				tag := tag_table.lookup (tag_names.item)
				check tag_not_void: tag /= Void end
				apply_tag (tag, a_start_iter, an_iter)
				tag_names.next
			end
		end

	delete (a_start, an_end: GTK_TEXT_ITER) is
			-- Deletes text between `a_start' and `an_end'. The order of
			-- start and end is not actually relevant; `delete' will
			-- reorder them. This function actually emits the
			-- "delete_range" signal, and the default handler of that
			-- signal deletes the text. Because the buffer is modified,
			-- all outstanding iterators become invalid after calling
			-- this function; however, the start and end will be
			-- re-initialized to point to the location where text was
			-- deleted.
		require
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
			start_in_current_buffer: a_start.buffer = Current
			end_in_current_buffer: an_end.buffer = Current
		do
			gtk_text_buffer_delete(handle, a_start.handle, an_end.handle)
		ensure
			ordered_iterators: a_start <= an_end
			ordering_could_have_changed_iterators: (((old a_start) >= (old an_end)) implies
																 (a_start.is_equal(old an_end) and
																  (an_end.is_equal(old a_start))))
		end

	delete_interactive (a_start, an_end: GTK_TEXT_ITER;
							  default_editable: BOOLEAN) is
			-- Deletes all editable text in the given range. Calls
			-- `buffer_delete' for each editable sub-range of [`a_start',
			-- `an_end'). `a_start' and `an_end' are revalidated to point to the
			-- location of the last deleted range, or left untouched if
			-- no text was deleted.

			-- `a_start': start of range to delete

			-- `an_end': end of range

			-- `default_editable': whether the buffer is editable by default

			-- `is_successful' is set to True whether some text was
			-- actually deleted, False otherwise.
		do
			is_successful:=(gtk_text_buffer_delete_interactive
								 (handle, a_start.handle, an_end.handle,
								  default_editable.to_integer)).to_boolean
		end

	backspace (an_iter: GTK_TEXT_ITER; interactive, default_editable: BOOLEAN) is
			-- Performs the appropriate action as if the user hit the
			-- delete key with the cursor at the position specified by
			-- iter. In the normal case a single character will be
			-- deleted, but when combining accents are involved, more
			-- than one character can be deleted, and when precomposed
			-- character and accent combinations are involved, less than
			-- one character will be deleted.

			-- Because the buffer is modified, all outstanding iterators
			-- become invalid after calling this function; however, the
			-- iter will be re-initialized to point to the location where
			-- text was deleted.

			-- `an_iter': a position in buffer

			-- `interactive': whether the deletion is caused by user
			-- interaction

			-- `default_editable': whether the buffer is editable by
			-- default

			-- `is_successful' is set to True if the buffer was modified,
			-- False otherwise.
		require
			iter_not_void: an_iter /= Void
			iter_in_current_buffer: an_iter.buffer = Current
		do
			is_successful:=(gtk_text_buffer_backspace
								 (handle, an_iter.handle,
								  interactive.to_integer,
								  default_editable.to_integer)).to_boolean
		end

	slice (a_start, an_end: GTK_TEXT_ITER;
			 include_hidden_chars: BOOLEAN): STRING is
			-- the text in the range [`a_start,' `an_end'). Excludes
			-- undisplayed text (text marked with tags that set the
			-- invisibility attribute) if `include_hidden_chars' is
			-- FALSE. The string includes a 0xFFFC character whenever the
			-- buffer contains embedded images, so byte and character
			-- indexes into Result do correspond to byte and character
			-- indexes into the buffer. Contrast with `text'. Note that
			-- 0xFFFC can occur in normal text as well, so it is not a
			-- reliable indicator that a pixbuf or widget is in the
			-- buffer.

			-- `a_start' : 	start of a range

			-- `an_end' : 	end of a range

			-- include_hidden_chars : whether to include invisible text
		obsolete "Result will be changed to UTF8_STRING when this class will be available"
		require
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
			start_in_current_buffer: a_start.buffer = Current
			end_in_current_buffer: an_end.buffer = Current
		do
			create Result.from_external
			(gtk_text_buffer_get_slice (handle,
												 a_start.handle, an_end.handle,
												 include_hidden_chars.to_integer))
		end

	insert_pixbuf (an_iter: GTK_TEXT_ITER; an_image: GDK_PIXBUF) is
			-- Inserts `an_image' into the text buffer at `an_iter'. The
			-- image will be counted as one character in character
			-- counts, and when obtaining the buffer contents as a
			-- string, will be represented by the Unicode "object
			-- replacement character" 0xFFFC. Note that the "slice"
			-- variants for obtaining portions of the buffer as a string
			-- include this character for pixbufs, but the "text"
			-- variants do not. e.g. see `slice' and `text'.

			-- `an_iter' : location to insert the pixbuf
		require
			iter_not_void: an_iter /= Void
			image_not_void: an_image /= Void
			iter_in_current_buffer: an_iter.buffer = Current
		do
			gtk_text_buffer_insert_pixbuf (handle, an_iter.handle, an_image.handle)
		end

	insert_child_anchor (an_iter: GTK_TEXT_ITER; an_anchor: GTK_TEXT_CHILD_ANCHOR) is
			-- Inserts a child widget anchor (`an_anchor') into the text
			-- buffer at `an_iter'. The anchor will be counted as one
			-- character in character counts, and when obtaining the
			-- buffer contents as a string, will be represented by the
			-- Unicode "object replacement character" 0xFFFC. Note that
			-- the `slice' feature- used to obtain portions of the buffer
			-- as a string - include this character for child anchors,
			-- but the `text' feature do not.  Consider
			-- `create_child_anchor' as a more convenient alternative to
			-- this function. The buffer will add a reference to the
			-- anchor, so you can `unref' it after insertion.

			-- `an_iter' : location to insert the anchor
		require
			iter_not_void: an_iter /= Void
			anchor_not_void: an_anchor /= Void
			iter_in_current_buffer: an_iter.buffer = Current
		do
			gtk_text_buffer_insert_child_anchor(handle, an_iter.handle, an_anchor.handle)
		end

	child_anchor_at (an_iter: GTK_TEXT_ITER): GTK_TEXT_CHILD_ANCHOR is
			-- A newly created child anchor, inserted into the buffer at `an_iter'.
		require
			iter_not_void: an_iter /= Void
			iter_in_current_buffer: an_iter.buffer = Current
		do
			create Result.from_external_pointer (gtk_text_buffer_create_child_anchor (handle, an_iter.handle))
			-- Note: C documentation says "The new anchor is owned by the
			-- buffer; no reference count is returned to the caller of
			-- gtk_text_buffer_create_child_anchor()"; so we have to
			Result.unref
			-- because the from_external_pointer ref-ed it.
		end

	create_mark (a_mark_name: STRING; a_place: GTK_TEXT_ITER; left_gravity: BOOLEAN): GTK_TEXT_MARK is
			-- Creates a mark at `a_place'. If mark_name is NULL, the
			-- mark is anonymous; otherwise, the mark can be retrieved by
			-- name using `mark'. If a mark has left gravity, and text is
			-- inserted at the mark's current location, the mark will be
			-- moved to the left of the newly-inserted text. If the mark
			-- has right gravity (`left_gravity' = False), the mark will
			-- end up on the right of newly-inserted text. The standard
			-- left-to-right cursor is a mark with right gravity (when
			-- you type, the cursor stays on the right side of the text
			-- you're typing).

			-- Emits the "mark_set" signal as notification of the mark's
			-- initial placement.
		require
			name_not_void: a_mark_name /= Void
			iter_not_void: a_place /= Void
			iter_in_current_buffer: a_place.buffer = Current
		do
			create Result.from_external_pointer
			(gtk_text_buffer_create_mark (handle, a_mark_name.to_external,
										a_place.handle, left_gravity.to_integer))
			-- The caller of this function does not own a reference to
			-- the returned GtkTextMark, so you can ignore the return
			-- value if you like. Marks are owned by the buffer and go
			-- away when the buffer does.
		end

	move_mark (a_mark: GTK_TEXT_MARK; a_new_location: GTK_TEXT_ITER) is
			-- Moves `a_mark' to `a_new_location'. Emits the "mark_set"
			-- signal as notification of the move.
		require
			mark_not_void: a_mark /= Void
			iter_not_void: a_new_location /= Void
			iter_in_current_buffer: a_new_location.buffer = Current
		do
			gtk_text_buffer_move_mark (handle, a_mark.handle, a_new_location.handle)
		end

	move_mark_by_name (a_name: STRING; a_new_location: GTK_TEXT_ITER) is
			-- Moves the mark named `a_name' (which must exist) to
			-- `a_new_location' where. See `move_mark' for details.
		require
			name_not_void: a_name /= Void
			named_mark_exists: mark (a_name) /= Void
			-- Note: the above precondition is not a monster of
			-- efficiency... it could have been made faster
		do
			gtk_text_buffer_move_mark_by_name (handle, a_name.to_external, a_new_location.handle)
		end

	delete_mark (a_mark: GTK_TEXT_MARK) is
			-- Deletes `a_mark,' so that it's no longer located anywhere
			-- in the buffer. Removes the reference the buffer holds to
			-- the mark, so if you haven't called g_object_ref() on the
			-- mark, it will be freed. Even if the mark isn't freed, most
			-- operations on mark become invalid. There is no way to
			-- undelete a mark.

			-- The "mark_deleted" signal will be emitted as notification
			-- after the mark is deleted.
		require mark_not_void: a_mark /= Void
		do
			gtk_text_buffer_delete_mark (handle, a_mark.handle)
		ensure mark_deleted: a_mark.is_deleted
		end

	delete_mark_by_name (a_name: STRING) is
			-- Deletes the mark named `a_name'; the mark must exist. See
			-- `delete_mark' for details.
		require
			name_not_void: a_name /= Void
			named_mark_exists: mark (a_name) /= Void
		do
			gtk_text_buffer_delete_mark_by_name (handle, a_name.to_external)
		end

	mark (a_name: STRING): GTK_TEXT_MARK is
			-- the mark named `a_name' in Current buffer, or Void if no
			-- such mark exists in the buffer.
		require
			name_not_void: a_name /= Void
		do
			create Result.from_external_pointer (gtk_text_buffer_get_mark (handle, a_name.to_external))
			-- Note: text mark are not cached because AFAIK once
			-- invalidated they can't be re-used and must be freed. Paolo
			-- 2007-01-05
		end

	insert_mark: GTK_TEXT_MARK is
			-- the mark that represents the cursor (insertion
			-- point). Equivalent to calling `mark(once "insert")' but very
			-- slightly more efficient, and involves less typing.
		local
			mark_ptr: POINTER
			mark_factory: G_OBJECT_EXPANDED_FACTORY [GTK_TEXT_MARK]
		do
			Result := mark_factory.wrapper (gtk_text_buffer_get_insert(handle))
		end

	selection_bound: GTK_TEXT_MARK is
			-- the mark that represents the selection bound. Equivalent
			-- to calling `mark(once "selection_bound")', but very slightly
			-- more efficient, and involves less typing.

			-- The currently-selected text in buffer is the region
			-- between the "selection_bound" and "insert" marks. If
			-- "selection_bound" and "insert" are in the same place, then
			-- there is no current selection. `selection_bounds' is
			-- another convenient function for handling the selection, if
			-- you just want to know whether there's a selection and what
			-- its bounds are.
		do
			create Result.from_external_pointer(gtk_text_buffer_get_selection_bound(handle))
			-- Note: text mark are not cached because AFAIK once
			-- invalidated they can't be re-used and must be freed. Paolo
			-- 2007-01-05
		end

	place_cursor (where: GTK_TEXT_ITER) is
			-- Moves the "insert" and "selection_bound" marks
			-- simultaneously. If you move them to the same place in two
			-- steps with `move_mark', you will temporarily select a
			-- region in between their old and new locations, which can
			-- be pretty inefficient since the temporarily-selected
			-- region will force stuff to be recalculated. This function
			-- moves them as a unit, which can be optimized.
		require
			where_not_void: where /= Void
			where_in_current_buffer: where.buffer = Current
		do
			gtk_text_buffer_place_cursor(handle, where.handle)
		ensure
			insert_mark_moved: iter_at_mark(insert_mark).is_equal(where)
			selection_bound_moved: iter_at_mark(selection_bound).is_equal(where)
			selection_bound_equal_insert: selection_bound.is_equal(insert_mark)
		end

	select_range (an_insert_mark, a_bound: GTK_TEXT_ITER) is
			-- moves the "insert" and "selection_bound" marks
			-- simultaneously. If you move them in two steps with
			-- `move_mark'), you will temporarily select a region in
			-- between their old and new locations, which can be pretty
			-- inefficient since the temporarily-selected region will
			-- force stuff to be recalculated. This function moves them
			-- as a unit, which can be optimized.

			-- `an_insert_mark': 	where to put the "insert" mark

			-- `a_bound': 	where to put the "selection_bound" mark
		do
			gtk_text_buffer_select_range (handle, an_insert_mark.handle, a_bound.handle)
		end

	apply_tag (a_tag: GTK_TEXT_TAG; a_start, an_end: GTK_TEXT_ITER) is
			-- Emits the "apply_tag" signal on buffer. The default
			-- handler for the signal applies tag to the given
			-- range. start and end do not have to be in order.

			-- `a_tag' : a GtkTextTag
			-- `a_start' : one bound of range to be tagged
			-- `an_end' : other bound of range to be tagged
		require
			tag_not_void: a_tag /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
		do
			gtk_text_buffer_apply_tag (handle, a_tag.handle, a_start.handle, an_end.handle)
		end

	remove_tag  (a_tag: GTK_TEXT_TAG; a_start, an_end: GTK_TEXT_ITER) is
			-- Emits the "remove_tag" signal. The default handler for the
			-- signal removes all occurrences of tag from the given
			-- range. start and end don't have to be in order.

			-- `a_tag' : a GtkTextTag
			-- `a_start' : one bound of range to be tagged
			-- `an_end' : other bound of range to be tagged
		require
			tag_not_void: a_tag /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
		do
			gtk_text_buffer_remove_tag (handle, a_tag.handle,
												 a_start.handle, an_end.handle)
		end

	apply_tag_by_name (a_tag_name: STRING; a_start, an_end: GTK_TEXT_ITER) is
			-- Calls ` gtk_text_tag_table_lookup' on the buffer's tag
			-- table to get a GtkTextTag, then calls `apply_tag'.

			-- `a_tag_name' : the name of a tag
			-- `a_start' : one bound of range to be tagged
			-- `an_end' : other bound of range to be tagged
		require
			tag_name_not_void: a_tag_name /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
		do
			gtk_text_buffer_apply_tag_by_name (handle,
														  a_tag_name.to_external,
														  a_start.handle, an_end.handle)
		end

	remove_tag_by_name  (a_tag_name: STRING; a_start, an_end: GTK_TEXT_ITER) is
			-- Calls `gtk_text_tag_table_lookup' on the buffer's tag
			-- table to get a GtkTextTag, then calls `remove_tag'.
			
			-- `a_tag_name' : the name of a tag
			-- `a_start' : one bound of range to be tagged
			-- `an_end' : other bound of range to be tagged
		require
			tag_name_not_void: a_tag_name /= Void
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
		do
			gtk_text_buffer_remove_tag_by_name (handle,
															a_tag_name.to_external,
															a_start.handle, an_end.handle)
		end

	remove_all_tags (a_start, an_end: GTK_TEXT_ITER) is
			-- Removes all tags in the range between `a_start' and
			-- `an_end'. Be careful with this function; it could remove
			-- tags added in code unrelated to the code you're currently
			-- writing. That is, using this function is probably a bad
			-- idea if you have two or more unrelated code sections that
			-- add tags.

			-- `a_start' : one bound of range to be tagged
			-- `an_end' : other bound of range to be tagged
		require
			start_not_void: a_start /= Void
			end_not_void: an_end /= Void
		do
			gtk_text_buffer_remove_all_tags (handle, a_start.handle,an_end.handle)
		end

	create_tag (a_tag_name: STRING; some_properties: COLLECTION[TUPLE[STRING,G_VALUE]]): GTK_TEXT_TAG is
			-- Creates a tag and adds it to the tag table for
			-- buffer. Equivalent to calling `GTK_TEXT_TAG.make' and then
			-- adding the tag to the buffer's tag table. The tag is owned
			-- by the buffer's tag table, so the ref count will be equal
			-- to one.

			-- If a_tag_name is Void, the tag is anonymous.
			
			-- If tag_name is non-Void, a tag called tag_name must not
			-- already exist in the tag table for this buffer.

			-- The first_property_name argument and subsequent arguments
			-- are a list of properties to set on the tag, as with
			-- G_OBJECT's `set'.

			-- `a_tag_name': name of the new tag, or Void
		local
			iterator: ITERATOR[TUPLE[STRING,G_VALUE]]
			a_name: STRING
			a_value: G_VALUE
		do
			if a_tag_name /= Void then
				create Result.with_name (a_tag_name)
			else
				create Result.make
			end

			tag_table.add (Result)
			iterator := some_properties.get_new_iterator
			from
				iterator.start
			until
				iterator.is_off
			loop
				a_name := iterator.item.item_1
				a_value := iterator.item.item_2
				check
					name_not_void: a_name /= Void
					value_not_void: a_value /= Void
				end
				Result.set_property (a_name, a_value)
				iterator.next
			end
		end

	iter_at_line_offset (a_line_number, a_char_offset: INTEGER): GTK_TEXT_ITER is
			-- an iterator pointing to `a_char_offset' (offset from start
			-- of line) within `a_line_number' (counting from 0). The
			-- `a_char_offset' must exist, offsets off the end of the
			-- line are not allowed. Note characters, not bytes; UTF-8
			-- may encode one character as multiple bytes.
		do
			create Result.make
			gtk_text_buffer_get_iter_at_line_offset (handle, Result.handle,
																  a_line_number, a_char_offset)
		end

	iter_at_offset (an_offset: INTEGER): GTK_TEXT_ITER is
			-- The iterator pointing to a position `an_offset' chars from
			-- the start of the entire buffer. If `an_offset' is -1 or
			-- greater than the number of characters in the buffer, iter
			-- is initialized to the end iterator, the iterator one past
			-- the last valid character in the buffer.

			-- `an_offset': char offset from start of buffer, counting
			-- from 0, or -1
		do
			create Result.make
			gtk_text_buffer_get_iter_at_offset (handle, Result.handle, an_offset)
		end

	iter_at_line (a_line_number: INTEGER): GTK_TEXT_ITER is
			-- an iterator to the start of the given line (counting from
			-- 0).
		do
			create Result.make
			gtk_text_buffer_get_iter_at_line(handle, Result.handle, a_line_number)
		end

	iter_at_line_index (a_line_number, a_byte_index: INTEGER): GTK_TEXT_ITER is
			-- Obtains an iterator pointing to `a_byte_index' within the
			-- `a_line_number' (counting from 0). `a_byte_index' must be
			-- the start of a UTF-8 character, and must not be beyond the
			-- end of the line. Note bytes, not characters; UTF-8 may
			-- encode one character as multiple bytes.

			-- buffer : 	a GtkTextBuffer
			-- iter : 	iterator to initialize

			-- byte_index : 	byte index from start of line
		do
			create Result.make
			gtk_text_buffer_get_iter_at_line_index (handle, Result.handle,
																 a_line_number, a_byte_index)
		ensure not_void: Result /= Void
		end

	iter_at_mark (a_mark: GTK_TEXT_MARK): GTK_TEXT_ITER is
			-- A newly allocated iterator with the current position of `a_mark'.
		require mark_not_void: a_mark /= Void
		do
			create Result.make
			gtk_text_buffer_get_iter_at_mark(handle, Result.handle, a_mark.handle)
		ensure not_void: Result /= Void
		end

	iter_at_child_anchor (an_anchor: GTK_TEXT_CHILD_ANCHOR): GTK_TEXT_ITER is
			-- the location of anchor within buffer.
		require anchor_not_void: an_anchor /= Void
		do
			create Result.make
			gtk_text_buffer_get_iter_at_child_anchor(handle,Result.handle, an_anchor.handle)
		ensure not_void: Result /= Void
		end

	start_iter: GTK_TEXT_ITER is
			-- A newly created iterator with the first position in the
			-- text buffer. This is the same as using
			-- `get_iter_at_offset' to get the iter at character offset
			-- 0.
		do
			--create Result.make
			Result := iter_at_offset (0)
			gtk_text_buffer_get_start_iter(handle, Result.handle)
		ensure not_void: Result /= Void
		end

	end_iter: GTK_TEXT_ITER is
			-- A newly created iterator with the "end iterator," one past
			-- the last valid character in the text buffer. If
			-- dereferenced with `char', the end iterator has a
			-- character value of 0. The entire buffer lies in the range
			-- from the first position in the buffer (call
			-- gtk_text_buffer_get_start_iter() to get character position
			-- 0) to the end iterator.
		do
			create Result.make
			gtk_text_buffer_get_end_iter (handle, Result.handle)
		ensure
			not_void: Result /= Void
			is_off: Result.is_off
		end

	bounds: TUPLE[GTK_TEXT_ITER, GTK_TEXT_ITER] is
			-- the first and last iterators in the buffer; the entire buffer lies within the range.
		local a_start, an_end: GTK_TEXT_ITER
		do
			create a_start.make; create an_end.make
			gtk_text_buffer_get_bounds(handle, a_start.handle, an_end.handle)
			create Result.make_2(a_start, an_end)
		end

	is_modified: BOOLEAN is
			-- Has the buffer been modified after the last call to
			-- `set_modified' set it to False. Used for example to enable
			-- a "save" function in a text editor.
		do
			Result := gtk_text_buffer_get_modified(handle).to_boolean
		end

	set_modified (a_setting: BOOLEAN) is
			-- Used to keep track of whether the buffer has been modified
			-- since the last time it was saved. Whenever the buffer is
			-- saved to disk, call `set_modified(False)'. When the buffer
			-- is modified, it will automatically toggled on the modified
			-- bit again. When the modified bit flips, the buffer emits a
			-- "modified_changed" signal.
		do
			gtk_text_buffer_set_modified (handle, a_setting.to_integer)
		end

	delete_selection (interactive, default_editable: BOOLEAN) is
			-- Deletes the range between the "insert" and
			-- "selection_bound" marks, that is, the currently-selected
			-- text. If `interactive' is True, the editability of the
			-- selection will be considered (users can't delete
			-- uneditable text).

			-- `interactive': whether the deletion is caused by user
			-- interaction

			-- `default_editable': whether the buffer is editable by
			-- default

			-- `is_successful' will be True if there was a non-empty
			-- selection to delete.
		do
			is_successful:=(gtk_text_buffer_delete_selection(handle,
																			 interactive.to_integer,
																			 default_editable.to_integer).to_boolean)
		end

	paste_clipboard (a_clipboard: GTK_CLIPBOARD; an_override_location: GTK_TEXT_ITER; default_editable: BOOLEAN) is
			-- Pastes the contents of `a_clipboard' at the insertion
			-- point, or at `override_location' (if it is not
			-- Void). (Note: pasting is asynchronous, that is, we'll ask
			-- for the paste data and return, and at some point later
			-- after the main loop runs, the paste data will be
			-- inserted.)

			-- `an_override_location': location to insert pasted text, or
			-- Void for at the cursor

			-- `default_editable' : 	whether the buffer is editable by default
		require
			clipboard_not_void: a_clipboard /= Void
			location_not_void: an_override_location /= Void
		do
			gtk_text_buffer_paste_clipboard (handle, a_clipboard.handle,
			an_override_location.handle, default_editable.to_integer)
		end

	copy_clipboard (a_clipboard: GTK_CLIPBOARD) is
			-- Copies the currently-selected text to `a_clipboard'.
		require
			clipboard_not_void: a_clipboard /= Void
		do
			gtk_text_buffer_copy_clipboard  (handle, a_clipboard.handle)
		end

	cut_clipboard (a_clipboard: GTK_CLIPBOARD; default_editable: BOOLEAN) is
			-- Copies the currently-selected text to `a_clipboard,' then
			-- deletes said text if it's editable. `default_editable' is
			-- the default editability of the buffer.
		require
			clipboard_not_void: a_clipboard /= Void
		do
			gtk_text_buffer_cut_clipboard (handle, a_clipboard.handle, default_editable.to_integer)
		end

	selection_bounds: TUPLE[GTK_TEXT_ITER, GTK_TEXT_ITER] is
			-- the selection start and end; Void if there is no selection
		local a_start, an_end: GTK_TEXT_ITER; is_some_text_selected: BOOLEAN
		do
			create a_start.make; create an_end.make
			is_some_text_selected:=(gtk_text_buffer_get_selection_bounds
															 (handle,a_start.handle, an_end.handle).to_boolean)
			if is_some_text_selected then
				create Result.make_2(a_start, an_end)
			end
		end

	begin_user_action is
			-- Called to indicate that the buffer operations between here
			-- and a call to `end_user_action' are part of a single
			-- user-visible operation. The operations between
			-- `begin_user_action' and `end_user_action' can then be
			-- grouped when creating an undo stack. GtkTextBuffer
			-- maintains a count of calls to `begin_user_action' that
			-- have not been closed with a call to `end_user_action', and
			-- emits the "begin_user_action" and "end_user_action"
			-- signals only for the outermost pair of calls. This allows
			-- you to build user actions from other user actions.

			-- The "interactive" buffer mutation functions, such as
			-- insert_interactive, automatically call begin/end user
			-- action around the buffer operations they perform, so
			-- there's no need to add extra calls if you user action
			-- consists solely of a single call to one of those
			-- functions.
		do
			gtk_text_buffer_begin_user_action(handle)
		end

	end_user_action is
			-- See `begin_user_action' function for a full explanation.--
			-- Both calls should be paired.
		do
			gtk_text_buffer_end_user_action (handle)
		end

	-- gtk_text_buffer_add_selection_clipboard ()

	-- void        gtk_text_buffer_add_selection_clipboard
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkClipboard *clipboard);

	-- Adds clipboard to the list of clipboards in which the selection contents of buffer are available. In most cases, clipboard will be the GtkClipboard of type GDK_SELECTION_PRIMARY for a view of buffer.

	-- buffer : 	a GtkTextBuffer
	-- clipboard : 	a GtkClipboard
	-- gtk_text_buffer_remove_selection_clipboard ()

	-- void        gtk_text_buffer_remove_selection_clipboard
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkClipboard *clipboard);

	-- Removes a GtkClipboard added with gtk_text_buffer_add_selection_clipboard()

	-- buffer : 	a GtkTextBuffer
	-- clipboard : 	a GtkClipboard added to buffer by gtk_text_buffer_add_selection_clipboard().
	-- Property Details
	-- The "tag-table" property

	--   "tag-table"            GtkTextTagTable       : Read / Write / Construct Only

	-- Text Tag Table.
	-- The "text" property

	--   "text"                 gchararray            : Read / Write

	-- The text content of the buffer. Without child widgets and images, see gtk_text_buffer_get_text() for more information.

	-- Default value: ""

	-- Since 2.8
	-- Signal Details
feature {ANY}  -- TODO: The "apply-tag" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextTag    *arg1,
	--                                             GtkTextIter   *arg2,
	--                                             GtkTextIter   *arg3,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- arg3 :
	-- user_data : 	user data set when the signal handler was connected.


feature {ANY} -- The "begin-user-action" signal

	begin_user_action_signal_name: STRING is "begin-user-action"
		-- void        user_function                  (GtkTextBuffer *textbuffer,
		--                                             gpointer       user_data)       : Run last

	enable_on_begin_user_action is
			-- Connects "begin_user_action" signal to `on_begin_user_action' feature.
		do
			connect (Current, begin_user_action_signal_name, $on_begin_user_action)
		end

	on_begin_user_action is
			-- Built-in begin_user_action signal handler; empty by design; redefine it.
			-- Indicates that the user has begin_user_action the contents of the widget.
		do
		end

	connect_agent_to_begin_user_action_signal (a_procedure: PROCEDURE [ANY, TUPLE[like Current]]) is
			-- textbuffer : 	the object which received the signal.
		require valid_procedure: a_procedure /= Void
		local begin_user_action_callback: BEGIN_USER_ACTION_CALLBACK
		do
			create begin_user_action_callback.make
			begin_user_action_callback.connect (Current, a_procedure)
		end

feature {ANY} -- The "changed" signal

	changed_signal_name: STRING is "changed"

	enable_on_changed is
			-- Connects "changed" signal to `on_changed' feature.
		do
			connect (Current, changed_signal_name, $on_changed)
		end

	on_changed is
			-- Built-in changed signal handler; empty by design; redefine it.
			-- Indicates that the user has changed the contents of the widget.
		do
		end

	connect_agent_to_changed_signal (a_procedure: PROCEDURE [ANY, TUPLE[like Current]]) is
		require valid_procedure: a_procedure /= Void
		local changed_callback: CHANGED_CALLBACK [like Current]
		do
			create changed_callback.make
			changed_callback.connect (Current, a_procedure)
		end

feature {ANY} -- TODO: The "delete-range" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextIter   *arg1,
	--                                             GtkTextIter   *arg2,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY} -- The "end-user-action" signal

	end_user_action_signal_name: STRING is "end-user-action"
		-- void        user_function                  (GtkTextBuffer *textbuffer,
		--                                             gpointer       user_data)       : Run last

	enable_on_end_user_action is
			-- Connects "end_user_action" signal to `on_end_user_action' feature.
		do
			connect (Current, end_user_action_signal_name, $on_end_user_action)
		end

	on_end_user_action is
			-- Built-in end_user_action signal handler; empty by design; redefine it.
			-- Indicates that the user has end_user_action the contents of the widget.
		do
		end

	connect_agent_to_end_user_action_signal (a_procedure: PROCEDURE [ANY, TUPLE[like Current]]) is
			-- textbuffer : 	the object which received the signal.
		require valid_procedure: a_procedure /= Void
		local end_user_action_callback: END_USER_ACTION_CALLBACK
		do
			create end_user_action_callback.make
			end_user_action_callback.connect (Current, a_procedure)
		end

feature {ANY} -- TODO: The "insert-child-anchor" signal

	-- void        user_function                  (GtkTextBuffer      *textbuffer,
	--                                             GtkTextIter        *arg1,
	--                                             GtkTextChildAnchor *arg2,
	--                                             gpointer            user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY}  -- TODO: The "insert-pixbuf" signal

	-- void user_function (GtkTextBuffer *textbuffer, GtkTextIter
	-- *arg1, GdkPixbuf *arg2, gpointer user_data) : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY}  -- The "insert-text" signal

	connect_agent_to_insert_text_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TEXT_ITER, STRING, GTK_TEXT_BUFFER]]) is
			-- textbuffer : 	the object which received the signal.
			-- arg1 :
			-- arg2 :
			-- arg3 :
		require
			valid_procedure: a_procedure /= Void
		local
			insert_text_callback: BUFFER_INSERT_TEXT_CALLBACK
		do
			create insert_text_callback.make
			insert_text_callback.connect (Current, a_procedure)
		end

feature {ANY}  -- TODO: 	-- The "mark-deleted" signal

	-- void user_function (GtkTextBuffer *textbuffer, GtkTextMark
	-- *arg1, gpointer user_data) : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY}  -- TODO: -- The "mark-set" signal

	-- void user_function (GtkTextBuffer *textbuffer, GtkTextIter
	-- *arg1, GtkTextMark *arg2, gpointer user_data) : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY}  -- TODO: -- The "modified-changed" signal

	-- void user_function (GtkTextBuffer *textbuffer, gpointer
	-- user_data) : Run last

	-- textbuffer : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.

feature {ANY}  -- TODO: -- The "remove-tag" signal

	-- void user_function (GtkTextBuffer *textbuffer, GtkTextTag *arg1,
	-- GtkTextIter *arg2, GtkTextIter *arg3, gpointer user_data) : Run
	-- last

	-- textbuffer : 	the object which received the signal.
	-- arg1 :
	-- arg2 :
	-- arg3 :
	-- user_data : 	user data set when the signal handler was connected.

feature {} -- Implementation
	hidden_tag_table: GTK_TEXT_TAG_TABLE
			-- Hidden reference to the Eiffel wrapper of the
			-- GtkTextTagTable of Current. Handled by `tag_table'.

feature {ANY} -- struct size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextBuffer)"
		end

end -- class GTK_TEXT_BUFFER
