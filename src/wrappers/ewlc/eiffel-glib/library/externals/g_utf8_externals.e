deferred class G_UTF8_EXTERNALS

feature {} -- Externals

	g_utf8_strdown (utf8_ptr: POINTER; utf8_len: INTEGER): POINTER is
		external "C use <glib.h>"
		end

	g_utf8_strup (utf8_ptr: POINTER; utf8_len: INTEGER): POINTER is
		external "C use <glib.h>"
		end

	g_utf8_collate (utf8_ptr, other_utf8_ptr: POINTER): INTEGER is
		external "C use <glib.h>"
		end

end --class G_UTF8_EXTERNALS
