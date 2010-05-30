class ITERATOR_ON_UTF8_STRING
	-- Iterator on UTF8 string.

	-- 
inherit
	ITERATOR[UNICODE_CHARACTER]

insert 
	GUNICODE_EXTERNALS
	-- GUNICODE_MACROS

creation {UTF8_STRING}
	make

feature {}
	string: UTF8_STRING
		-- The string to be traversed

	pointer: POINTER
		-- Current position
feature {ANY}
	make (s: UTF8_STRING) is
		require
			s /= Void
		do
			string := s
			pointer := string.handle
		ensure
			string = s
		end

	start is
		do
			pointer := string.handle
		end

	is_off: BOOLEAN is
		do
			Result := pointer > string.handle + string.bytes_count
		end

	is_before: BOOLEAN is
		-- Is Current off, before the beginning of the string?
	do
		Result := pointer < string.handle
	end

	item: UNICODE_CHARACTER is
		do
			Result.set(g_utf8_get_char(pointer))
		end

	next is
		do
			pointer := g_utf8_next_char (pointer)
		end

	prev is
		-- Go backward.
	local prev_ptr: POINTER
	do
		prev_ptr := g_utf8_prev_char(string.handle,pointer)
		if prev_ptr.is_null then
			-- no UTF-8 characters are presents before pointer in string. Set pointer to a something meaningful
			pointer := pointer + (-1) 
		end
		--   g_utf8_find_prev_char ()

		--  gchar*      g_utf8_find_prev_char           (const gchar *str,
		--                                               const gchar *p);

		--    Given a position p with a UTF-8 encoded string str, find the start of the
		--    previous UTF-8 character starting before p. Returns NULL if no UTF-8 characters
		--    are present in str before p.

		--    p does not have to be at the beginning of a UTF-8 character. No check is made to
		--    see if the character found is actually valid other than it starts with an
		--    appropriate byte.

		--    str :     pointer to the beginning of a UTF-8 encoded string
		--    p :       pointer to some position within str
		--    Returns : a pointer to the found character or NULL.
	end
end -- class ITERATOR_ON_UTF8_STRING
