indexing
	description: "A Unicode character."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, Glib team
					
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
					
expanded class UNICODE_CHARACTER
	-- A Unicode character 

	-- A number of functions for dealing with Unicode characters and
	-- strings. There are analogues of the traditional C functions
	-- found in ctype.h character classification and case conversion
	-- functions, UTF-8 analogues of some string utility functions,
	-- functions to perform normalization, case conversion and
	-- collation on UTF-8 strings and finally functions to convert
	-- between the UTF-8, UTF-16 and UCS-4 encodings of Unicode.
	
	-- The implementations of the Unicode functions in GLib are based
	-- on the Unicode Character Data tables, which are available from
	-- www.unicode.org. GLib 2.8 supports Unicode 4.0, GLib 2.10
	-- supports Unicode 4.1, GLib 2.12 supports Unicode 5.0.


	-- Note for the people used to use other languages: compared with a
	-- "low-level" INTEGER_32 (also known in C/C++ as int/gint or so on)
	-- this class has *NO* overhead in memory usage (tested) and programs
	-- using it should be as compact and as fast like those using plain
	-- INTEGER_32.

insert
	ANY undefine default_create end
	WRAPPER_HANDLER
	GUNICODE_EXTERNALS
	GLIB_TYPES

feature {ANY} -- Code	
	code: NATURAL_32

	set (a_code: NATURAL_32) is
		-- Set `code' do `a_code'
	do
		code := a_code
	end

feature {ANY} 
	is_valid: BOOLEAN is
		-- Is Current a valid Unicode character? Some possible
		-- values of `code' will not be valid. 0 is
		-- considered a valid character, though it's normally a
		-- string terminator.
	do
		Result:=g_unichar_validate(code).to_boolean
	end

	is_alphanumeric: BOOLEAN is
		-- Is Current character alphanumeric?
	do
		Result:=g_unichar_isalnum(code).to_boolean
	end

	is_alphabetic: BOOLEAN is
		-- Is Current an alphabetic character (i.e.: a letter)?
	do
		Result:=g_unichar_isalpha(code).to_boolean
	end

	is_control: BOOLEAN is
		-- Is Current a control character?
	do
		Result:=g_unichar_iscntrl(code).to_boolean
	end

	is_digit: BOOLEAN is
		-- Is Current a digit? This covers ASCII 0-9 and also digits in other
		-- languages/scripts. 
	do
		Result:=g_unichar_isdigit(code).to_boolean
	end

	is_graph: BOOLEAN is
		-- Is Current a character printable and not a space? It is False for
		-- control characters, format characters, and spaces. `is_print' is
		-- similar, but returns TRUE for spaces.
	do
		Result:=g_unichar_isgraph(code).to_boolean
	end

	is_lowercase: BOOLEAN is
		-- Is Current a lowercase letter?
	do
		Result:=g_unichar_islower(code).to_boolean
	end

	is_printable: BOOLEAN is
		-- Is Current printable? Unlike `is_graph', it is True for
		-- spaces.
	do
		Result:=g_unichar_isprint(code).to_boolean
	end

	is_punctuation: BOOLEAN is
		-- Is Current a punctuation or symbol character?
	do
		Result:=g_unichar_ispunct(code).to_boolean
	end

	is_space: BOOLEAN is
		-- Is Current character a space, tab, or line separator
		-- (newline, carriage return, etc.)?

		-- TODO: Given some UTF-8 text, obtain a character value with
		-- g_utf8_get_char().

		-- Note: don't use this to do word breaking; you have to use
		-- Pango or equivalent to get word breaking right, the
		-- algorithm is fairly complex.)
	do
		Result:=g_unichar_isspace(code).to_boolean
	end

	is_upper: BOOLEAN is
		-- Is Current an uppercase character?
	do
		Result:=g_unichar_isupper(code).to_boolean
	end

	is_hexadecimal_digit: BOOLEAN is
		-- Is Current character a hexadecimal digit?
	do
		Result:=g_unichar_isxdigit(code).to_boolean
	end

	is_title: BOOLEAN is
		-- Is Current character a titlecase? Some characters in
		-- Unicode which are composites, such as the DZ digraph have
		-- three case variants instead of just two.  The titlecase
		-- form is used at the beginning of a word where only the
		-- first letter is capitalized. The titlecase form of the DZ
		-- digraph is U+01F2 LATIN CAPITAL LETTTER D WITH SMALL
		-- LETTER Z.
	do
		Result:=g_unichar_istitle(code).to_boolean
	end

	is_defined: BOOLEAN is
		-- Does `code' have a assigned character in the Unicode
		-- standard?		
	do
		Result:=g_unichar_isdefined(code).to_boolean
	end

	is_wide: BOOLEAN is
		-- Is Current character typically rendered in a double-width cell?
	do
		Result:=g_unichar_iswide(code).to_boolean
	end

	is_wide_cjk: BOOLEAN is 
		-- Is Current character typically rendered in a double-width cell under
		-- legacy East Asian locales? If a character is wide according to
		-- `is_wide', then it is also reported wide with this function, but the
		-- converse is not necessarily true. See the Unicode Standard Annex 11
		-- for details.
	do
		Result:=g_unichar_iswide_cjk(code).to_boolean
	end

feature {ANY} -- Convertions
	to_upper: like Current is
		--  Current character converted to uppercase. If it is not an lowercase
		--  or titlecase character, or has no upper case equivalent the
		--  character is returned unchanged.
	do
		Result.set(g_unichar_toupper(code))
	end

	to_lower: like Current is
		-- Current character converted to lower case. If it is not an
		-- upperlower or titlecase character, or has no lowercase
		-- equivalent the character is returned unchanged.
	do
		Result.set(g_unichar_tolower(code))
	end

	to_title: like Current is
		-- Current character converted to title case. If it not an uppercase or
		-- a lowercase character it is returned unchanged.
	do
		Result.set(g_unichar_totitle (code))
	end	

	digit_value: INTEGER_32 is
		-- The numeric value of Current character as a decimal digit.
	do
		Result := g_unichar_digit_value(code)
	ensure
		is_digit implies Result.in_range(0,9)
		not is_digit implies Result = -1 
	end

	xdigit_value: INTEGER_32 is
		-- The numeric value of current character as an hexadecimal digit.
	do
		Result:=g_unichar_xdigit_value(code)
	ensure
		is_hexadecimal_digit implies Result.in_range(0,15)
		not is_hexadecimal_digit implies Result = -1 
	end

	type: GUNICODE_TYPE_ENUM is
		-- the type of the character. See
		-- http://www.unicode.org/Public/UNIDATA/UnicodeData.html.
	do
		Result.change_value(g_unichar_type(code))
	end

	break_type: GUNICODE_BREAK_TYPE_ENUM is
		-- The break type of Current character. The break type is used to find
		-- word and line breaks ("text boundaries"), Pango implements the
		-- Unicode boundary resolution algorithms and normally you would use a
		-- function such as pango_break() instead of caring about break types
		-- yourself.
	do
		Result.change_value(g_unichar_break_type(code))
	end


	canonical_decomposition: G_UNICODE_STRING is
		-- The canonical decomposition of a Unicode character. (TODO: not finished)
	local p: POINTER; a_result_len: like gsize
	do
		p := g_unicode_canonical_decomposition(code,$a_result_len)
		--    result_len : location to store the length of the return value.
		--    Returns :    a newly allocated string of Unicode characters. result_len is set to
		--                 the resulting length of the string.
		not_yet_implemented
	end

	mirror_char: REFERENCE[like Current] is
		-- In Unicode, some characters are mirrored. This means that their
		-- images are mirrored horizontally in text that is laid out from right
		-- to left. For instance, "(" would become its mirror image, ")", in
		-- right-to-left text.

		-- If Current has the Unicode mirrored property and there is another unicode
		-- character that typically has a glyph that is the mirror image of
		-- Current's glyph then Result will be not Void.

	local res: INTEGER_32; mirrored: like code; mirror_unichar: like Current
	do
		res := g_unichar_get_mirror_char(code, $mirrored)
		if res/=0 then
			mirror_unichar.set(mirrored)
			create Result.set_item(mirror_unichar)
		end
	end

feature {} -- Unwrapped 

--  gunichar    g_utf8_get_char_validated       (const gchar *p,
--                                               gssize max_len);

--    Convert a sequence of bytes encoded as UTF-8 to a Unicode character. This
--    function checks for incomplete characters, for invalid characters such as
--    characters that are out of the range of Unicode, and for overlong encodings of
--    valid characters.

--    p :       a pointer to Unicode character encoded as UTF-8
--    max_len : the maximum number of bytes to read, or -1, for no maximum.
--    Returns : the resulting character. If p points to a partial sequence at the end
--              of a string that could begin a valid character, returns (gunichar)-2;
--              otherwise, if p does not point to a valid UTF-8 encoded Unicode
--              character, returns (gunichar)-1.

end -- class UNICODE_CHARACTER
