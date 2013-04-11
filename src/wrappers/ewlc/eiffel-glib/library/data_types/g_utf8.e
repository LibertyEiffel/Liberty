class G_UTF8

insert
	G_UTF8_EXTERNALS

create {ANY}
	from_unicode_string

feature {} -- Creation

	from_unicode_string (an_unicode_string: UNICODE_STRING) is
		require
			an_unicode_string /= Void
		do
			utf8_string := an_unicode_string.to_utf8
		end

feature {G_UTF8} -- Representation

	utf8_ptr: POINTER is
		do
			Result := utf8_string.to_external
		end

feature {} -- Representation

	utf8_string: STRING

	utf8_len: INTEGER is
		do
			Result := utf8_string.count
		end

feature {ANY}

	to_string: STRING is
		do
			Result := utf8_string
		end

	to_lower is
			-- Convert the string to lower case.
		do
			create utf8_string.from_external (g_utf8_strdown (utf8_ptr, utf8_len))
		end

	to_upper is
			-- Convert the string to upper case.
		do
			create utf8_string.from_external (g_utf8_strup (utf8_ptr, utf8_len))
		end

	compare, three_way_comparison (other: like Current): INTEGER is
		do
			Result := g_utf8_collate (utf8_ptr, other.utf8_ptr)
		end

invariant
	utf8_string /= Void
	utf8_ptr.is_not_null

end --class G_UTF8
