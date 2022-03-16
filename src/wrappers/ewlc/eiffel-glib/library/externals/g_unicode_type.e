note
	description: "Enum "
	copyright: "[
					Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder
					
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

deferred class G_UNICODE_TYPE
	-- The possible character classifications. See
	-- http://www.unicode.org/Public/UNIDATA/UnicodeData.html.

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_unicode_type (a_type: INTEGER): BOOLEAN
		do	
			Result:=((a_type = g_unicode_control) or else
						(a_type = g_unicode_format) or else
						(a_type = g_unicode_unassigned) or else
						(a_type = g_unicode_private_use) or else
						(a_type = g_unicode_surrogate) or else
						(a_type = g_unicode_lowercase_letter) or else
						(a_type = g_unicode_modifier_letter) or else
						(a_type = g_unicode_other_letter) or else
						(a_type = g_unicode_titlecase_letter) or else
						(a_type = g_unicode_uppercase_letter) or else
						(a_type = g_unicode_combining_mark) or else
						(a_type = g_unicode_enclosing_mark) or else
						(a_type = g_unicode_non_spacing_mark) or else
						(a_type = g_unicode_decimal_number) or else
						(a_type = g_unicode_letter_number) or else
						(a_type = g_unicode_other_number) or else
						(a_type = g_unicode_connect_punctuation) or else
						(a_type = g_unicode_dash_punctuation) or else
						(a_type = g_unicode_close_punctuation) or else
						(a_type = g_unicode_final_punctuation) or else
						(a_type = g_unicode_initial_punctuation) or else
						(a_type = g_unicode_other_punctuation) or else
						(a_type = g_unicode_open_punctuation) or else
						(a_type = g_unicode_currency_symbol) or else
						(a_type = g_unicode_modifier_symbol) or else
						(a_type = g_unicode_math_symbol) or else
						(a_type = g_unicode_other_symbol) or else
						(a_type = g_unicode_line_separator) or else
						(a_type = g_unicode_paragraph_separator) or else
						(a_type = g_unicode_space_separator))
		end

	g_unicode_control: INTEGER
			-- G_UNICODE_CONTROL
		external "C macro use <glib.h>"
		alias "G_UNICODE_CONTROL"
		end

	g_unicode_format: INTEGER
			-- G_UNICODE_FORMAT
		external "C macro use <glib.h>"
		alias "G_UNICODE_FORMAT"
		end

	g_unicode_unassigned: INTEGER
			-- G_UNICODE_UNASSIGNED
		external "C macro use <glib.h>"
		alias "G_UNICODE_UNASSIGNED"
		end

	g_unicode_private_use: INTEGER
			-- G_UNICODE_PRIVATE_USE
		external "C macro use <glib.h>"
		alias "G_UNICODE_PRIVATE_USE"
		end

	g_unicode_surrogate: INTEGER
			-- G_UNICODE_SURROGATE
		external "C macro use <glib.h>"
		alias "G_UNICODE_SURROGATE"
		end

	g_unicode_lowercase_letter: INTEGER
			-- G_UNICODE_LOWERCASE_LETTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_LOWERCASE_LETTER"
		end

	g_unicode_modifier_letter: INTEGER
			-- G_UNICODE_MODIFIER_LETTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_MODIFIER_LETTER"
		end

	g_unicode_other_letter: INTEGER
			-- G_UNICODE_OTHER_LETTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_OTHER_LETTER"
		end

	g_unicode_titlecase_letter: INTEGER
			-- G_UNICODE_TITLECASE_LETTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_TITLECASE_LETTER"
		end

	g_unicode_uppercase_letter: INTEGER
			-- G_UNICODE_UPPERCASE_LETTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_UPPERCASE_LETTER"
		end

	g_unicode_combining_mark: INTEGER
			-- G_UNICODE_COMBINING_MARK
		external "C macro use <glib.h>"
		alias "G_UNICODE_COMBINING_MARK"
		end

	g_unicode_enclosing_mark: INTEGER
			-- G_UNICODE_ENCLOSING_MARK
		external "C macro use <glib.h>"
		alias "G_UNICODE_ENCLOSING_MARK"
		end

	g_unicode_non_spacing_mark: INTEGER
			-- G_UNICODE_NON_SPACING_MARK
		external "C macro use <glib.h>"
		alias "G_UNICODE_NON_SPACING_MARK"
		end

	g_unicode_decimal_number: INTEGER
			-- G_UNICODE_DECIMAL_NUMBER
		external "C macro use <glib.h>"
		alias "G_UNICODE_DECIMAL_NUMBER"
		end

	g_unicode_letter_number: INTEGER
			-- G_UNICODE_LETTER_NUMBER
		external "C macro use <glib.h>"
		alias "G_UNICODE_LETTER_NUMBER"
		end

	g_unicode_other_number: INTEGER
			-- G_UNICODE_OTHER_NUMBER
		external "C macro use <glib.h>"
		alias "G_UNICODE_OTHER_NUMBER"
		end

	g_unicode_connect_punctuation: INTEGER
			-- G_UNICODE_CONNECT_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_CONNECT_PUNCTUATION"
		end

	g_unicode_dash_punctuation: INTEGER
			-- G_UNICODE_DASH_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_DASH_PUNCTUATION"
		end

	g_unicode_close_punctuation: INTEGER
			-- G_UNICODE_CLOSE_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_CLOSE_PUNCTUATION"
		end

	g_unicode_final_punctuation: INTEGER
			-- G_UNICODE_FINAL_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_FINAL_PUNCTUATION"
		end

	g_unicode_initial_punctuation: INTEGER
			-- G_UNICODE_INITIAL_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_INITIAL_PUNCTUATION"
		end

	g_unicode_other_punctuation: INTEGER
			-- G_UNICODE_OTHER_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_OTHER_PUNCTUATION"
		end

	g_unicode_open_punctuation: INTEGER
			-- G_UNICODE_OPEN_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_OPEN_PUNCTUATION"
		end

	g_unicode_currency_symbol: INTEGER
			-- G_UNICODE_CURRENCY_SYMBOL
		external "C macro use <glib.h>"
		alias "G_UNICODE_CURRENCY_SYMBOL"
		end

	g_unicode_modifier_symbol: INTEGER
			-- G_UNICODE_MODIFIER_SYMBOL
		external "C macro use <glib.h>"
		alias "G_UNICODE_MODIFIER_SYMBOL"
		end

	g_unicode_math_symbol: INTEGER
			-- G_UNICODE_MATH_SYMBOL
		external "C macro use <glib.h>"
		alias "G_UNICODE_MATH_SYMBOL"
		end

	g_unicode_other_symbol: INTEGER
			-- G_UNICODE_OTHER_SYMBOL
		external "C macro use <glib.h>"
		alias "G_UNICODE_OTHER_SYMBOL"
		end

	g_unicode_line_separator: INTEGER
			-- G_UNICODE_LINE_SEPARATOR
		external "C macro use <glib.h>"
		alias "G_UNICODE_LINE_SEPARATOR"
		end

	g_unicode_paragraph_separator: INTEGER
			-- G_UNICODE_PARAGRAPH_SEPARATOR
		external "C macro use <glib.h>"
		alias "G_UNICODE_PARAGRAPH_SEPARATOR"
		end

	g_unicode_space_separator: INTEGER
			-- G_UNICODE_SPACE_SEPARATOR
		external "C macro use <glib.h>"
		alias "G_UNICODE_SPACE_SEPARATOR"
		end

end
