indexing
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

inherit G_OBJECT

insert GTK_TEXT_BUFFER_EXTERNALS

creation
	make, from_external_pointer

feature {NONE} -- Creation

	make is
			-- Creates a new text buffer.
		do
			handle := gtk_text_buffer_new(default_pointer)
			-- TODO: Support GTK_TEXT_TAG_TABLEs.  For now, creating a
			-- new one every time.
			store_eiffel_wrapper
		end

feature -- Operations

	set_text(a_text: STRING) is
			-- Deletes current contents of buffer, and inserts `a_text' 
			-- instead. `a_text' must be valid UTF-8.
		require
			a_text /= Void
			-- a_text should be valid UTF-8!
		do
			gtk_text_buffer_set_text(handle, a_text.to_external, a_text.count)
		end

feature -- Access

-- Waiting to get GtkTextIter's going before uncommenting this

	text (a_start, an_end: GTK_TREE_ITER; include_hidden_chars: BOOLEAN): STRING is
			-- the text in the range [`a_start',`an_end'). Excludes
			-- undisplayed text (text marked with tags that set the
			-- invisibility attribute) if `include_hidden_chars' is
			-- False. Does not include characters representing embedded
			-- images, so byte and character indexes into the returned
			-- string do not correspond to byte and character indexes
			-- into the buffer.  Contrast with
			-- `slice'
		do
			create  Result.from_external (gtk_text_buffer_get_text
													(handle,
													 a_start.handle, an_end.handle,
													 include_hidden_chars.to_integer))
			-- Gtk function returns an allocated UTF-8 string; AFAIK we
			-- can just use from_external. Paolo 2006-07-03

			-- If Gtk is going to free this text, we should be using
			-- from_external_copy instead!  end
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
		local retriever: G_RETRIEVER [GTK_TEXT_TAG_TABLE]; ptr: POINTER
		do
			if hidden_tag_table /= Void then -- retrieve the cached reference to the Eiffel wrapper
				Result := hidden_tag_table
			else -- try to retrieve the wrapper 
				ptr := gtk_text_buffer_get_tag_table (handle)
				if retriever.has_eiffel_wrapper_stored (ptr) then -- return the retrieved wrapper
					Result :=  retriever.retrieve_eiffel_wrapper_from_gobject_pointer (ptr)
				else -- create a new wrapper for the underlying C object
					create Result.from_external_pointer (ptr)
				end
			end
		end

	insert_at (an_iter: GTK_TEXT_ITER; some_text: STRING; a_length: INTEGER) is
			-- Inserts `a_length' bytes of text at `an_iter' position. If
			-- `a_length' is -1, text must be nul-terminated and will be
			-- inserted in its entirety. Emits the "insert_text" signal;
			-- insertion actually occurs in the default handler for the
			-- signal. iter is invalidated when insertion occurs (because
			-- the buffer contents change), but the default signal
			-- handler revalidates it to point to the end of the inserted
			-- text.
		require
			valid_iter: an_iter /= Void
			some_text: some_text /= Void
			valid_length: a_length >= -1
		do
			gtk_text_buffer_insert (handle, an_iter.handle, some_text.to_external, a_length)
		end

	insert_at_cursor (some_text: STRING; a_length: INTEGER) is
			-- calls `insert_at', using the current cursor position as
			-- the insertion point.
		do
			gtk_text_buffer_insert_at_cursor (handle, some_text.to_external, a_length)
		end
	
	-- TODO: gboolean gtk_text_buffer_insert_interactive (GtkTextBuffer
	-- *buffer, GtkTextIter *iter, const gchar *text, gint len,
	-- gboolean default_editable);
	
	-- Like gtk_text_buffer_insert(), but the insertion will not occur if iter is at a non-editable location in the buffer. Usually you want to prevent insertions at ineditable locations if the insertion results from a user action (is interactive).
	
	-- default_editable indicates the editability of text that doesn't have a tag affecting editability applied to it. Typically the result of gtk_text_view_get_editable() is appropriate here.
	
	-- buffer : 	a GtkTextBuffer
	-- iter : 	a position in buffer
	-- text : 	some UTF-8 text
	-- len : 	length of text in bytes, or -1
	-- default_editable : 	default editability of buffer
	-- Returns : 	whether text was actually inserted
	
	-- gtk_text_buffer_insert_interactive_at_cursor ()

	-- gboolean    gtk_text_buffer_insert_interactive_at_cursor
	--                                             (GtkTextBuffer *buffer,
	--                                              const gchar *text,
	--                                              gint len,
	--                                              gboolean default_editable);

	-- Calls gtk_text_buffer_insert_interactive() at the cursor position.

	-- default_editable indicates the editability of text that doesn't have a tag affecting editability applied to it. Typically the result of gtk_text_view_get_editable() is appropriate here.

	-- buffer : 	a GtkTextBuffer
	-- text : 	text in UTF-8 format
	-- len : 	length of text in bytes, or -1
	-- default_editable : 	default editability of buffer
	-- Returns : 	whether text was actually inserted
	-- gtk_text_buffer_insert_range ()

	-- void        gtk_text_buffer_insert_range    (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              const GtkTextIter *start,
	--                                              const GtkTextIter *end);

	-- Copies text, tags, and pixbufs between start and end (the order of start and end doesn't matter) and inserts the copy at iter. Used instead of simply getting/inserting text because it preserves images and tags. If start and end are in a different buffer from buffer, the two buffers must share the same tag table.

	-- Implemented via emissions of the insert_text and apply_tag signals, so expect those.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	a position in buffer
	-- start : 	a position in a GtkTextBuffer
	-- end : 	another position in the same buffer as start
	-- gtk_text_buffer_insert_range_interactive ()

	-- gboolean    gtk_text_buffer_insert_range_interactive
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              const GtkTextIter *start,
	--                                              const GtkTextIter *end,
	--                                              gboolean default_editable);

	-- Same as gtk_text_buffer_insert_range(), but does nothing if the insertion point isn't editable. The default_editable parameter indicates whether the text is editable at iter if no tags enclosing iter affect editability. Typically the result of gtk_text_view_get_editable() is appropriate here.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	a position in buffer
	-- start : 	a position in a GtkTextBuffer
	-- end : 	another position in the same buffer as start
	-- default_editable : 	default editability of the buffer
	-- Returns : 	whether an insertion was possible at iter

	insert_with_tags (an_iter: GTK_TEXT_ITER; some_text: STRING; some_tags: COLLECTION[GTK_TEXT_TAG]) is
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
			start_offset: INTEGER
			start_iter: GTK_TEXT_ITER
		do
			-- Note: this code is a more or less direct traduction from C
			-- to Eiffel of the "internal" GTK implementation.
			start_offset := an_iter.offset

			insert_at (an_iter, some_text, -1)
			-- Now an_iter points to the end of the inserted text
			start_iter := buffer.iter_at_offset (start_offset)
			tags := some_tags.get_new_iterator
			from tags.start until tags.is_off
			loop
				apply_tag (tags.item, start_iter, an_iter)
				tags.next
			end
		end


	-- TODO: insert_with_tags_by_name (

	-- void        gtk_text_buffer_insert_with_tags_by_name
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              const gchar *text,
	--                                              gint len,
	--                                              const gchar *first_tag_name,
	--                                              ...);

	-- Same as gtk_text_buffer_insert_with_tags(), but allows you to pass in tag names instead of tag objects.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	position in buffer
	-- text : 	UTF-8 text
	-- len : 	length of text, or -1
	-- first_tag_name : 	name of a tag to apply to text
	-- ... : 	more tag names
	-- gtk_text_buffer_delete ()

	-- void        gtk_text_buffer_delete          (GtkTextBuffer *buffer,
	--                                              GtkTextIter *start,
	--                                              GtkTextIter *end);

	-- Deletes text between start and end. The order of start and end is not actually relevant; gtk_text_buffer_delete() will reorder them. This function actually emits the "delete_range" signal, and the default handler of that signal deletes the text. Because the buffer is modified, all outstanding iterators become invalid after calling this function; however, the start and end will be re-initialized to point to the location where text was deleted.

	-- buffer : 	a GtkTextBuffer
	-- start : 	a position in buffer
	-- end : 	another position in buffer
	-- gtk_text_buffer_delete_interactive ()

	-- gboolean    gtk_text_buffer_delete_interactive
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *start_iter,
	--                                              GtkTextIter *end_iter,
	--                                              gboolean default_editable);

	-- Deletes all editable text in the given range. Calls gtk_text_buffer_delete() for each editable sub-range of [start,end). start and end are revalidated to point to the location of the last deleted range, or left untouched if no text was deleted.

	-- buffer : 	a GtkTextBuffer
	-- start_iter : 	start of range to delete
	-- end_iter : 	end of range
	-- default_editable : 	whether the buffer is editable by default
	-- Returns : 	whether some text was actually deleted
	-- gtk_text_buffer_backspace ()

	-- gboolean    gtk_text_buffer_backspace       (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              gboolean interactive,
	--                                              gboolean default_editable);

	-- Performs the appropriate action as if the user hit the delete key with the cursor at the position specified by iter. In the normal case a single character will be deleted, but when combining accents are involved, more than one character can be deleted, and when precomposed character and accent combinations are involved, less than one character will be deleted.

	-- Because the buffer is modified, all outstanding iterators become invalid after calling this function; however, the iter will be re-initialized to point to the location where text was deleted.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	a position in buffer
	-- interactive : 	whether the deletion is caused by user interaction
	-- default_editable : 	whether the buffer is editable by default
	-- Returns : 	TRUE if the buffer was modified

	-- Since 2.6
	-- gtk_text_buffer_set_text ()

	-- void        gtk_text_buffer_set_text        (GtkTextBuffer *buffer,
	--                                              const gchar *text,
	--                                              gint len);

	-- Deletes current contents of buffer, and inserts text instead. If len is -1, text must be nul-terminated. text must be valid UTF-8.

	-- buffer : 	a GtkTextBuffer
	-- text : 	UTF-8 text to insert
	-- len : 	length of text in bytes
	-- gtk_text_buffer_get_text ()

	-- gchar*      gtk_text_buffer_get_text        (GtkTextBuffer *buffer,
	--                                              const GtkTextIter *start,
	--                                              const GtkTextIter *end,
	--                                              gboolean include_hidden_chars);

	-- Returns the text in the range [start,end). Excludes undisplayed text (text marked with tags that set the invisibility attribute) if include_hidden_chars is FALSE. Does not include characters representing embedded images, so byte and character indexes into the returned string do not correspond to byte and character indexes into the buffer. Contrast with gtk_text_buffer_get_slice().

	-- buffer : 	a GtkTextBuffer
	-- start : 	start of a range
	-- end : 	end of a range
	-- include_hidden_chars : 	whether to include invisible text
	-- Returns : 	an allocated UTF-8 string
	-- gtk_text_buffer_get_slice ()

	-- gchar*      gtk_text_buffer_get_slice       (GtkTextBuffer *buffer,
	--                                              const GtkTextIter *start,
	--                                              const GtkTextIter *end,
	--                                              gboolean include_hidden_chars);

	-- Returns the text in the range [start,end). Excludes undisplayed text (text marked with tags that set the invisibility attribute) if include_hidden_chars is FALSE. The returned string includes a 0xFFFC character whenever the buffer contains embedded images, so byte and character indexes into the returned string do correspond to byte and character indexes into the buffer. Contrast with gtk_text_buffer_get_text(). Note that 0xFFFC can occur in normal text as well, so it is not a reliable indicator that a pixbuf or widget is in the buffer.

	-- buffer : 	a GtkTextBuffer
	-- start : 	start of a range
	-- end : 	end of a range
	-- include_hidden_chars : 	whether to include invisible text
	-- Returns : 	an allocated UTF-8 string
	-- gtk_text_buffer_insert_pixbuf ()

	-- void        gtk_text_buffer_insert_pixbuf   (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              GdkPixbuf *pixbuf);

	-- Inserts an image into the text buffer at iter. The image will be counted as one character in character counts, and when obtaining the buffer contents as a string, will be represented by the Unicode "object replacement character" 0xFFFC. Note that the "slice" variants for obtaining portions of the buffer as a string include this character for pixbufs, but the "text" variants do not. e.g. see gtk_text_buffer_get_slice() and gtk_text_buffer_get_text().

	-- buffer : 	a GtkTextBuffer
	-- iter : 	location to insert the pixbuf
	-- pixbuf : 	a GdkPixbuf
	-- gtk_text_buffer_insert_child_anchor ()

	-- void        gtk_text_buffer_insert_child_anchor
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              GtkTextChildAnchor *anchor);

	-- Inserts a child widget anchor into the text buffer at iter. The anchor will be counted as one character in character counts, and when obtaining the buffer contents as a string, will be represented by the Unicode "object replacement character" 0xFFFC. Note that the "slice" variants for obtaining portions of the buffer as a string include this character for child anchors, but the "text" variants do not. e.g. see gtk_text_buffer_get_slice() and gtk_text_buffer_get_text(). Consider gtk_text_buffer_create_child_anchor() as a more convenient alternative to this function. The buffer will add a reference to the anchor, so you can unref it after insertion.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	location to insert the anchor
	-- anchor : 	a GtkTextChildAnchor
	-- gtk_text_buffer_create_child_anchor ()

	-- GtkTextChildAnchor* gtk_text_buffer_create_child_anchor
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter);

	-- This is a convenience function which simply creates a child anchor with gtk_text_child_anchor_new() and inserts it into the buffer with gtk_text_buffer_insert_child_anchor(). The new anchor is owned by the buffer; no reference count is returned to the caller of gtk_text_buffer_create_child_anchor().

	-- buffer : 	a GtkTextBuffer
	-- iter : 	location in the buffer
	-- Returns : 	the created child anchor
	-- gtk_text_buffer_create_mark ()

	-- GtkTextMark* gtk_text_buffer_create_mark    (GtkTextBuffer *buffer,
	--                                              const gchar *mark_name,
	--                                              const GtkTextIter *where,
	--                                              gboolean left_gravity);

	-- Creates a mark at position where. If mark_name is NULL, the mark is anonymous; otherwise, the mark can be retrieved by name using gtk_text_buffer_get_mark(). If a mark has left gravity, and text is inserted at the mark's current location, the mark will be moved to the left of the newly-inserted text. If the mark has right gravity (left_gravity = FALSE), the mark will end up on the right of newly-inserted text. The standard left-to-right cursor is a mark with right gravity (when you type, the cursor stays on the right side of the text you're typing).

	-- The caller of this function does not own a reference to the returned GtkTextMark, so you can ignore the return value if you like. Marks are owned by the buffer and go away when the buffer does.

	-- Emits the "mark_set" signal as notification of the mark's initial placement.

	-- buffer : 	a GtkTextBuffer
	-- mark_name : 	name for mark, or NULL
	-- where : 	location to place mark
	-- left_gravity : 	whether the mark has left gravity
	-- Returns : 	the new GtkTextMark object
	-- gtk_text_buffer_move_mark ()

	-- void        gtk_text_buffer_move_mark       (GtkTextBuffer *buffer,
	--                                              GtkTextMark *mark,
	--                                              const GtkTextIter *where);

	-- Moves mark to the new location where. Emits the "mark_set" signal as notification of the move.

	-- buffer : 	a GtkTextBuffer
	-- mark : 	a GtkTextMark
	-- where : 	new location for mark in buffer
	-- gtk_text_buffer_move_mark_by_name ()

	-- void        gtk_text_buffer_move_mark_by_name
	--                                             (GtkTextBuffer *buffer,
	--                                              const gchar *name,
	--                                              const GtkTextIter *where);

	-- Moves the mark named name (which must exist) to location where. See gtk_text_buffer_move_mark() for details.

	-- buffer : 	a GtkTextBuffer
	-- name : 	name of a mark
	-- where : 	new location for mark
	-- gtk_text_buffer_delete_mark ()

	-- void        gtk_text_buffer_delete_mark     (GtkTextBuffer *buffer,
	--                                              GtkTextMark *mark);

	-- Deletes mark, so that it's no longer located anywhere in the buffer. Removes the reference the buffer holds to the mark, so if you haven't called g_object_ref() on the mark, it will be freed. Even if the mark isn't freed, most operations on mark become invalid. There is no way to undelete a mark. gtk_text_mark_get_deleted() will return TRUE after this function has been called on a mark; gtk_text_mark_get_deleted() indicates that a mark no longer belongs to a buffer. The "mark_deleted" signal will be emitted as notification after the mark is deleted.

	-- buffer : 	a GtkTextBuffer
	-- mark : 	a GtkTextMark in buffer
	-- gtk_text_buffer_delete_mark_by_name ()

	-- void        gtk_text_buffer_delete_mark_by_name
	--                                             (GtkTextBuffer *buffer,
	--                                              const gchar *name);

	-- Deletes the mark named name; the mark must exist. See gtk_text_buffer_delete_mark() for details.

	-- buffer : 	a GtkTextBuffer
	-- name : 	name of a mark in buffer
	-- gtk_text_buffer_get_mark ()

	-- GtkTextMark* gtk_text_buffer_get_mark       (GtkTextBuffer *buffer,
	--                                              const gchar *name);

	-- Returns the mark named name in buffer buffer, or NULL if no such mark exists in the buffer.

	-- buffer : 	a GtkTextBuffer
	-- name : 	a mark name
	-- Returns : 	a GtkTextMark, or NULL
	-- gtk_text_buffer_get_insert ()

	-- GtkTextMark* gtk_text_buffer_get_insert     (GtkTextBuffer *buffer);

	-- Returns the mark that represents the cursor (insertion point). Equivalent to calling gtk_text_buffer_get_mark() to get the mark named "insert", but very slightly more efficient, and involves less typing.

	-- buffer : 	a GtkTextBuffer
	-- Returns : 	insertion point mark
	-- gtk_text_buffer_get_selection_bound ()

	-- GtkTextMark* gtk_text_buffer_get_selection_bound
	--                                             (GtkTextBuffer *buffer);

	-- Returns the mark that represents the selection bound. Equivalent to calling gtk_text_buffer_get_mark() to get the mark named "selection_bound", but very slightly more efficient, and involves less typing.

	-- The currently-selected text in buffer is the region between the "selection_bound" and "insert" marks. If "selection_bound" and "insert" are in the same place, then there is no current selection. gtk_text_buffer_get_selection_bounds() is another convenient function for handling the selection, if you just want to know whether there's a selection and what its bounds are.

	-- buffer : 	a GtkTextBuffer
	-- Returns : 	selection bound mark
	-- gtk_text_buffer_place_cursor ()

	-- void        gtk_text_buffer_place_cursor    (GtkTextBuffer *buffer,
	--                                              const GtkTextIter *where);

	-- This function moves the "insert" and "selection_bound" marks simultaneously. If you move them to the same place in two steps with gtk_text_buffer_move_mark(), you will temporarily select a region in between their old and new locations, which can be pretty inefficient since the temporarily-selected region will force stuff to be recalculated. This function moves them as a unit, which can be optimized.

	-- buffer : 	a GtkTextBuffer
	-- where : 	where to put the cursor
	-- gtk_text_buffer_select_range ()

	-- void        gtk_text_buffer_select_range    (GtkTextBuffer *buffer,
	--                                              const GtkTextIter *ins,
	--                                              const GtkTextIter *bound);

	-- This function moves the "insert" and "selection_bound" marks simultaneously. If you move them in two steps with gtk_text_buffer_move_mark(), you will temporarily select a region in between their old and new locations, which can be pretty inefficient since the temporarily-selected region will force stuff to be recalculated. This function moves them as a unit, which can be optimized.

	-- buffer : 	a GtkTextBuffer
	-- ins : 	where to put the "insert" mark
	-- bound : 	where to put the "selection_bound" mark

	-- Since 2.4
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
			-- g_object_set().

			-- `a_tag_name': name of the new tag, or Void
		local 
			tag_ptr, tagname_ptr: POINTER; 
			iterator: ITERATOR[TUPLE[STRING,G_VALUE]]
			a_name: STRING; a_value: G_VALUE
		do
			if a_tag_name /= Void then 
				create Result.with_name (a_tag_name)
			else 
				create Result.make
			end
			
			tag_table.add (Result)
			iterator := some_properties.get_new_iterator
			from iterator.start until iterator.is_off
			loop
				a_name := iterator.item.item_1; a_value := iterator.item.item_2
				: iterator.item.item_1 /= Void
				check 
					name_not_void: a_name /= Void
					value_not_void: a_value /= Void
				end
				Result.set_property (a_name, a_value)
				iterator.next
			end
		end

	-- gtk_text_buffer_get_iter_at_line_offset ()

	-- void        gtk_text_buffer_get_iter_at_line_offset
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              gint line_number,
	--                                              gint char_offset);

	-- Obtains an iterator pointing to char_offset within the given line. The char_offset must exist, offsets off the end of the line are not allowed. Note characters, not bytes; UTF-8 may encode one character as multiple bytes.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- line_number : 	line number counting from 0
	-- char_offset : 	char offset from start of line

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
	-- gtk_text_buffer_get_iter_at_line ()

	-- void        gtk_text_buffer_get_iter_at_line
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              gint line_number);

	-- Initializes iter to the start of the given line.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- line_number : 	line number counting from 0
	-- gtk_text_buffer_get_iter_at_line_index ()

	-- void        gtk_text_buffer_get_iter_at_line_index
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              gint line_number,
	--                                              gint byte_index);

	-- Obtains an iterator pointing to byte_index within the given line. byte_index must be the start of a UTF-8 character, and must not be beyond the end of the line. Note bytes, not characters; UTF-8 may encode one character as multiple bytes.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- line_number : 	line number counting from 0
	-- byte_index : 	byte index from start of line
	-- gtk_text_buffer_get_iter_at_mark ()

	-- void        gtk_text_buffer_get_iter_at_mark
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              GtkTextMark *mark);

	-- Initializes iter with the current position of mark.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- mark : 	a GtkTextMark in buffer
	-- gtk_text_buffer_get_iter_at_child_anchor ()

	-- void        gtk_text_buffer_get_iter_at_child_anchor
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter,
	--                                              GtkTextChildAnchor *anchor);

	-- Obtains the location of anchor within buffer.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	an iterator to be initialized
	-- anchor : 	a child anchor that appears in buffer
	-- gtk_text_buffer_get_start_iter ()

	-- void        gtk_text_buffer_get_start_iter  (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter);

	-- Initialized iter with the first position in the text buffer. This is the same as using gtk_text_buffer_get_iter_at_offset() to get the iter at character offset 0.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- gtk_text_buffer_get_end_iter ()

	-- void        gtk_text_buffer_get_end_iter    (GtkTextBuffer *buffer,
	--                                              GtkTextIter *iter);

	-- Initializes iter with the "end iterator," one past the last valid character in the text buffer. If dereferenced with gtk_text_iter_get_char(), the end iterator has a character value of 0. The entire buffer lies in the range from the first position in the buffer (call gtk_text_buffer_get_start_iter() to get character position 0) to the end iterator.

	-- buffer : 	a GtkTextBuffer
	-- iter : 	iterator to initialize
	-- gtk_text_buffer_get_bounds ()

	-- void        gtk_text_buffer_get_bounds      (GtkTextBuffer *buffer,
	--                                              GtkTextIter *start,
	--                                              GtkTextIter *end);

	-- Retrieves the first and last iterators in the buffer, i.e. the entire buffer lies within the range [start,end).

	-- buffer : 	a GtkTextBuffer
	-- start : 	iterator to initialize with first position in the buffer
	-- end : 	iterator to initialize with the end iterator
	-- gtk_text_buffer_get_modified ()

	-- gboolean    gtk_text_buffer_get_modified    (GtkTextBuffer *buffer);

	-- Indicates whether the buffer has been modified since the last call to gtk_text_buffer_set_modified() set the modification flag to FALSE. Used for example to enable a "save" function in a text editor.

	-- buffer : 	a GtkTextBuffer
	-- Returns : 	TRUE if the buffer has been modified
	-- gtk_text_buffer_set_modified ()

	-- void        gtk_text_buffer_set_modified    (GtkTextBuffer *buffer,
	--                                              gboolean setting);

	-- Used to keep track of whether the buffer has been modified since the last time it was saved. Whenever the buffer is saved to disk, call gtk_text_buffer_set_modified (buffer, FALSE). When the buffer is modified, it will automatically toggled on the modified bit again. When the modified bit flips, the buffer emits a "modified_changed" signal.

	-- buffer : 	a GtkTextBuffer
	-- setting : 	modification flag setting
	-- gtk_text_buffer_delete_selection ()

	-- gboolean    gtk_text_buffer_delete_selection
	--                                             (GtkTextBuffer *buffer,
	--                                              gboolean interactive,
	--                                              gboolean default_editable);

	-- Deletes the range between the "insert" and "selection_bound" marks, that is, the currently-selected text. If interactive is TRUE, the editability of the selection will be considered (users can't delete uneditable text).

	-- buffer : 	a GtkTextBuffer
	-- interactive : 	whether the deletion is caused by user interaction
	-- default_editable : 	whether the buffer is editable by default
	-- Returns : 	whether there was a non-empty selection to delete
	-- gtk_text_buffer_paste_clipboard ()

	-- void        gtk_text_buffer_paste_clipboard (GtkTextBuffer *buffer,
	--                                              GtkClipboard *clipboard,
	--                                              GtkTextIter *override_location,
	--                                              gboolean default_editable);

	-- Pastes the contents of a clipboard at the insertion point, or at override_location. (Note: pasting is asynchronous, that is, we'll ask for the paste data and return, and at some point later after the main loop runs, the paste data will be inserted.)

	-- buffer : 	a GtkTextBuffer
	-- clipboard : 	the GtkClipboard to paste from
	-- override_location : 	location to insert pasted text, or NULL for at the cursor
	-- default_editable : 	whether the buffer is editable by default
	-- gtk_text_buffer_copy_clipboard ()

	-- void        gtk_text_buffer_copy_clipboard  (GtkTextBuffer *buffer,
	--                                              GtkClipboard *clipboard);

	-- Copies the currently-selected text to a clipboard.

	-- buffer : 	a GtkTextBuffer
	-- clipboard : 	the GtkClipboard object to copy to.
	-- gtk_text_buffer_cut_clipboard ()

	-- void        gtk_text_buffer_cut_clipboard   (GtkTextBuffer *buffer,
	--                                              GtkClipboard *clipboard,
	--                                              gboolean default_editable);

	-- Copies the currently-selected text to a clipboard, then deletes said text if it's editable.

	-- buffer : 	a GtkTextBuffer
	-- clipboard : 	the GtkClipboard object to cut to.
	-- default_editable : 	default editability of the buffer
	-- gtk_text_buffer_get_selection_bounds ()

	-- gboolean    gtk_text_buffer_get_selection_bounds
	--                                             (GtkTextBuffer *buffer,
	--                                              GtkTextIter *start,
	--                                              GtkTextIter *end);

	-- Returns TRUE if some text is selected; places the bounds of the selection in start and end (if the selection has length 0, then start and end are filled in with the same value). start and end will be in ascending order. If start and end are NULL, then they are not filled in, but the return value still indicates whether text is selected.

	-- buffer : 	a GtkTextBuffer a GtkTextBuffer
	-- start : 	iterator to initialize with selection start
	-- end : 	iterator to initialize with selection end
	-- Returns : 	whether the selection has nonzero length
	-- gtk_text_buffer_begin_user_action ()

	-- void        gtk_text_buffer_begin_user_action
	--                                             (GtkTextBuffer *buffer);

	-- Called to indicate that the buffer operations between here and a call to gtk_text_buffer_end_user_action() are part of a single user-visible operation. The operations between gtk_text_buffer_begin_user_action() and gtk_text_buffer_end_user_action() can then be grouped when creating an undo stack. GtkTextBuffer maintains a count of calls to gtk_text_buffer_begin_user_action() that have not been closed with a call to gtk_text_buffer_end_user_action(), and emits the "begin_user_action" and "end_user_action" signals only for the outermost pair of calls. This allows you to build user actions from other user actions.

	-- The "interactive" buffer mutation functions, such as gtk_text_buffer_insert_interactive(), automatically call begin/end user action around the buffer operations they perform, so there's no need to add extra calls if you user action consists solely of a single call to one of those functions.

	-- buffer : 	a GtkTextBuffer
	-- gtk_text_buffer_end_user_action ()

	-- void        gtk_text_buffer_end_user_action (GtkTextBuffer *buffer);

	-- Should be paired with a call to gtk_text_buffer_begin_user_action(). See that function for a full explanation.

	-- buffer : 	a GtkTextBuffer
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
	-- The "apply-tag" signal

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
	-- The "begin-user-action" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "changed" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "delete-range" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextIter   *arg1,
	--                                             GtkTextIter   *arg2,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "end-user-action" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "insert-child-anchor" signal

	-- void        user_function                  (GtkTextBuffer      *textbuffer,
	--                                             GtkTextIter        *arg1,
	--                                             GtkTextChildAnchor *arg2,
	--                                             gpointer            user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "insert-pixbuf" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextIter   *arg1,
	--                                             GdkPixbuf     *arg2,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "insert-text" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextIter   *arg1,
	--                                             gchar         *arg2,
	--                                             gint           arg3,
	--                                             gpointer       user_data)       : Run last

	-- textbuffer : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- arg3 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "mark-deleted" signal

	-- void        user_function                  (GtkTextBuffer *textbuffer,
	--                                             GtkTextMark   *arg1,
	--                                             gpointer       user_data)       : Run last

-- textbuffer : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "mark-set" signal

-- void        user_function                  (GtkTextBuffer *textbuffer,
--                                             GtkTextIter   *arg1,
--                                             GtkTextMark   *arg2,
--                                             gpointer       user_data)       : Run last

-- textbuffer : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "modified-changed" signal

-- void        user_function                  (GtkTextBuffer *textbuffer,
--                                             gpointer       user_data)       : Run last

-- textbuffer : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "remove-tag" signal

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
-- See Also

-- GtkTextView, GtkTextIter, GtkTextMark

feature {} -- Implementation
	hidden_tag_table: GTK_TEXT_TAG_TABLE
			-- Hidden reference to the Eiffel wrapper of the
			-- GtkTextTagTable of Current. Handled by `tag_table'.

end -- class GTK_TEXT_BUFFER
