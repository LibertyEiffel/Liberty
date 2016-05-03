note
	description: "Strings -- text buffers which grow automatically as text is added."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

	long: "[
	A GString is similar to a standard C string, except that it grows
	automatically as text is appended or inserted. Also, it stores the
	length of the string, so can be used for binary data with embedded nul
	bytes.
	]"

deferred class G_STRING_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- utility function

	char_in_string (string: POINTER; i: INTEGER): CHARACTER is
		obsolete "unnecessary use of inline. Use native_array.from_pointer instead"
		external "C inline use <glib.h>"
		alias "string[i]"
		end

feature {} -- struct access 		
	str (string: POINTER): POINTER is
		external "C struct GString get str use <glib.h>"
		end

	len (string: POINTER): INTEGER is
		external "C struct GString get len use <glib.h>"
		end

	allocated_len (string: POINTER): INTEGER is
		external "C struct GString get allocated_len use <glib.h>"
		end

feature {} -- external calls

	g_string_new (a_string: POINTER): POINTER is
			-- Creates a new GString, initialized with the given
			-- `a_string', the initial text to copy into the
			-- string. Returns : the new GString.
		external "C <glib.h>"
		end

	g_string_new_len (a_string: POINTER; a_len: INTEGER): POINTER is
			external "C <glib.h>"
		end

	g_string_sized_new (a_size: INTEGER): POINTER is
		external "C <glib.h>"
		end

	g_string_assign (a_string, a_source: POINTER) is
			-- opies the characters from a_source into a GString, destroying
			-- any previous contents. It is rather like the standard strcpy()
			-- function, except that you do not have to worry about having enough
			-- space to copy the string.
		external "C <glib.h>"
		end

	g_string_printf (string, format: POINTER) is
			-- Writes a formatted string into a GString. This is similar
			-- to the standard sprintf() function, except that the
			-- GString buffer automatically expands to contain the
			-- results. The previous contents of the GString are
			-- destroyed. string : a GString. format : the string
			-- format. See the printf() documentation.
		external "C <glib.h>"
		end

	g_string_append_printf (string,format: POINTER) is
			--	Appends a formatted string onto the end of a GString. This
			--	function is is similar to g_string_printf() except that
			--	the text is appended to the GString. string : a
			--	GString. format : the string format. See the printf()
			--	documentation.
		external "C <glib.h>"
		end

	g_string_append (string, val: POINTER): POINTER is
		-- Adds a string onto the end of a GString, expanding it if
		-- necessary. string : a GString. val : the string to append
		-- onto the end of the GString.
		external "C <glib.h>"
		end
	

	g_string_append_c (string: POINTER; c: CHARACTER) is
			-- Adds a character onto the end of a GString, expanding it
			-- if necessary. string : a GString. c : the character to
			-- append onto the end of the GString.
		external "C <glib.h>"
		end

-- TODO g_string_append_unichar ()

-- GString*    g_string_append_unichar         (GString *string,
-- 															gunichar wc);

-- 	Converts a Unicode character into UTF-8, and appends it to the string.

-- 	string :  a GString
-- 	wc :      a Unicode character
-- 	Returns : string
-- 			external "C <glib.h>"
-- 		end


	g_string_append_len (string,val: POINTER; a_len: INTEGER): POINTER is
			-- Appends len bytes of val to string. Because len is
			-- provided, val may contain embedded nuls and need not be
			-- nul-terminated. string : a GString. val : bytes to
			-- append. len : number of bytes of val to use. Returns : the
			-- GString.
		external "C <glib.h>"
		end
	

	g_string_prepend (string,val: POINTER): POINTER is
			-- Adds a string on to the start of a GString, expanding it
			-- if necessary. string : a GString.  val : the string to
			-- prepend on the start of the GString. Returns : the
			-- GString.
		external "C <glib.h>"
		end

	g_string_prepend_c (string: POINTER; c:CHARACTER): POINTER is
			-- Adds a character onto the start of a GString, expanding it
			-- if necessary. string : a GString. c : the character to
			-- prepend on the start of the GString.
		external "C <glib.h>"
		end

	-- TODO g_string_prepend_unichar ()

	-- GString*    g_string_prepend_unichar        (GString *string,
	-- 															gunichar wc);
	
	-- 	Converts a Unicode character into UTF-8, and prepends it to the
	-- 	string.
	
	-- 	string :  a GString.
	-- 	wc :      a Unicode character.
	-- 	Returns : string.
	-- 			external "C <glib.h>"
	-- 		end


-- g_string_prepend_len ()

-- GString*    g_string_prepend_len            (GString *string,
-- 															const gchar *val,
-- 															gssize len);

-- 	Prepends len bytes of val to string. Because len is provided, val may
-- 	contain embedded nuls and need not be nul-terminated.
-- 	string :  a GString.
-- 	val :     bytes to prepend.
-- 	len :     number of bytes in val to prepend.
-- 	Returns : the GString passed in.
-- 			external "C <glib.h>"
-- 		end


	g_string_insert (string: POINTER; pos: INTEGER; val: POINTER) is
			-- Inserts a copy of a string into a GString, expanding it if
			-- necessary. string : a GString. pos : the position to
			-- insert the copy of the string. val : the string to
			-- insert. Returns : the GString.
		external "C <glib.h>"
		end

	g_string_insert_c (string: POINTER; pos: INTEGER; c: CHARACTER) is
			-- Inserts a character into a GString, expanding it if
			-- necessary. string : a GString. pos : the position to
			-- insert the character. c : the character to insert. Returns
			-- : the GString.
		external "C <glib.h>"
		end


-- TODO g_string_insert_unichar ()

-- GString*    g_string_insert_unichar         (GString *string,
-- 															gssize pos,
-- 															gunichar wc);

-- 	Converts a Unicode character into UTF-8, and insert it into the string
-- 	at the given position.

-- 	string : a GString
-- 	pos : the position at which to insert character, or -1 to append at
-- 	the end of the string.
-- 	wc : a Unicode character
-- 	Returns : string
-- 			external "C <glib.h>"
-- 		end

	g_string_insert_len (string: POINTER; pos: INTEGER; val: POINTER; a_len: INTEGER): POINTER is
			-- Inserts len bytes of val into string at pos. Because len
			-- is provided, val may contain embedded nuls and need not be
			-- nul-terminated. If pos is -1, bytes are inserted at the
			-- end of the string. string : a GString. pos : position in
			-- string where insertion should happen, or -1 for atthe
			-- end.val : bytes to insert. len : number of bytes of val to
			-- insert. Returns : the GString.
		external "C <glib.h>"
		end

	g_string_erase (string: POINTER; pos,a_len: INTEGER) is
			-- Removes len characters from a GString, starting at
			-- position pos.The rest of the GString is shifted down to
			-- fill the gap. string : a GString.pos : the position of the
			-- characters to remove. len : the number of characters to
			-- remove, or -1 to remove all following characters. Returns
			-- : the GString.
		external "C <glib.h>"
		end

	g_string_truncate (string: POINTER; a_len: INTEGER) is
			-- Cuts off the end of the GString, leaving the first len
			-- characters. string : a GString. len : the new size of the
			-- GString. Returns : the GString.
		external "C <glib.h>"
		end

	g_string_set_size (string: POINTER; a_len: INTEGER): POINTER is
			-- Sets the length of a GString. If the length is less than
			-- the current length, the string will be truncated. If the
			-- length is greater than the current length, the contents of
			-- the newly added area are undefined. (However, as always,
			-- string->str[string->len] will be a nul byte.) string : a
			-- GString len : the new length Returns : string
		external "C <glib.h>"
		end

	g_string_free (string: POINTER; free_segment: INTEGER): POINTER is
			-- Frees the memory allocated for the GString. If
			-- free_segment is TRUE it also frees the character
			-- data. string : a GString. free_segment : if TRUE the
			-- actual character data is freed as well. Returns : the
			-- character data of string (i.e. NULL if free_segment is
			-- TRUE)
		external "C <glib.h>"
		end

	g_string_hash (a_str: POINTER): INTEGER is
			-- Creates a hash code for str; for use with GHashTable. str
			-- : a string to hash. Returns : hash code for str.
		external "C <glib.h>"
		end

	g_string_equal (v,v2: POINTER): INTEGER is
			-- Compares two strings for equality, returning TRUE if they
			-- are equal. For use with GHashTable.v : a GString. v2 :
			-- another GString. Returns : TRUE if they strings are the
			-- same length and contain the same bytes.
		external "C <glib.h>"
		end

end
