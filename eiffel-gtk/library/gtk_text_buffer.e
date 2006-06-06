class GTK_TEXT_BUFFER

inherit G_OBJECT

insert GTK_TEXT_BUFFER_EXTERNALS

creation make

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
			-- instead. a_text must be valid UTF-8.
		require
			a_text /= Void
			-- a_text should be valid UTF-8!
		do
			gtk_text_buffer_set_text(handle, a_text.to_external, a_text.count)
		end

feature -- Access

-- Waiting to get GtkTextIter's going before uncommenting this

--	get_text(include_hidden_chars: BOOLEAN): STRING is
			-- Returns the text in the range [start,end). Excludes
			-- undisplayed text (text marked with tags that set the
			-- invisibility attribute) if `include_hidden_chars' is False.
			-- Does not include characters representing embedded images, so
			-- byte and character indexes into the returned string do not
			-- correspond to byte and character indexes into the buffer.
			-- Contrast with gtk_text_buffer_get_slice(). <-- XXXX: Also to do
--		do
--			create Result.from_external(gtk_text_buffer_get_text(handle,
--										 default_pointer, default_pointer,
--										 include_hidden_chars.to_integer))
				-- If Gtk is going to free this text, we should be using
				-- from_external_copy instead!
--		end
end -- class GTK_TEXT_BUFFER
