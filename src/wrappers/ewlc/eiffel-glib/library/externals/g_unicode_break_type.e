note
	description: "The possible line break classifications."
	copyright: "[
					Copyright (C) 2007-2018: $EWLC_developer, $original_copyright_holder
					
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

deferred class G_UNICODE_BREAK_TYPE
	--  The possible line break classifications. The five Hangul types
	--  were Added in Unicode 4.1, so, has been introduced in GLib
	--  2.10. Note that new types may be added in the
	--  future. Applications should be ready to handle unknown
	--  values. They may be regarded as `g_unicode_break_unknown'. See
	--  http://www.unicode.org/unicode/reports/tr14/.

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_unicode_break_type (a_type: INTEGER): BOOLEAN
		do	
			Result:=((a_type = g_unicode_break_mandatory) or else
						(a_type = g_unicode_break_carriage_return) or else
						(a_type = g_unicode_break_line_feed) or else
						(a_type = g_unicode_break_combining_mark) or else
						(a_type = g_unicode_break_surrogate) or else
						(a_type = g_unicode_break_zero_width_space) or else
						(a_type = g_unicode_break_inseparable) or else
						(a_type = g_unicode_break_non_breaking_glue) or else
						(a_type = g_unicode_break_contingent) or else
						(a_type = g_unicode_break_space) or else
						(a_type = g_unicode_break_after) or else
						(a_type = g_unicode_break_before) or else
						(a_type = g_unicode_break_before_and_after) or else
						(a_type = g_unicode_break_hyphen) or else
						(a_type = g_unicode_break_non_starter) or else
						(a_type = g_unicode_break_open_punctuation) or else
						(a_type = g_unicode_break_close_punctuation) or else
						(a_type = g_unicode_break_quotation) or else
						(a_type = g_unicode_break_exclamation) or else
						(a_type = g_unicode_break_ideographic) or else
						(a_type = g_unicode_break_numeric) or else
						(a_type = g_unicode_break_infix_separator) or else
						(a_type = g_unicode_break_symbol) or else
						(a_type = g_unicode_break_alphabetic) or else
						(a_type = g_unicode_break_prefix) or else
						(a_type = g_unicode_break_postfix) or else
						(a_type = g_unicode_break_complex_context) or else
						(a_type = g_unicode_break_ambiguous) or else
						(a_type = g_unicode_break_unknown) or else
						(a_type = g_unicode_break_next_line) or else
						(a_type = g_unicode_break_word_joiner) or else
						(a_type = g_unicode_break_hangul_l_jamo) or else
						(a_type = g_unicode_break_hangul_v_jamo) or else
						(a_type = g_unicode_break_hangul_t_jamo) or else
						(a_type = g_unicode_break_hangul_lv_syllable) or else
						(a_type = g_unicode_break_hangul_lvt_syllable))
		end

	g_unicode_break_mandatory: INTEGER
			-- G_UNICODE_BREAK_MANDATORY
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_MANDATORY"
		end

	g_unicode_break_carriage_return: INTEGER
			-- G_UNICODE_BREAK_CARRIAGE_RETURN
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_CARRIAGE_RETURN"
		end

	g_unicode_break_line_feed: INTEGER
			-- G_UNICODE_BREAK_LINE_FEED
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_LINE_FEED"
		end

	g_unicode_break_combining_mark: INTEGER
			-- G_UNICODE_BREAK_COMBINING_MARK
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_COMBINING_MARK"
		end

	g_unicode_break_surrogate: INTEGER
			-- G_UNICODE_BREAK_SURROGATE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_SURROGATE"
		end

	g_unicode_break_zero_width_space: INTEGER
			-- G_UNICODE_BREAK_ZERO_WIDTH_SPACE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
		end

	g_unicode_break_inseparable: INTEGER
			-- G_UNICODE_BREAK_INSEPARABLE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_INSEPARABLE"
		end

	g_unicode_break_non_breaking_glue: INTEGER
			-- G_UNICODE_BREAK_NON_BREAKING_GLUE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_NON_BREAKING_GLUE"
		end

	g_unicode_break_contingent: INTEGER
			-- G_UNICODE_BREAK_CONTINGENT
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_CONTINGENT"
		end

	g_unicode_break_space: INTEGER
			-- G_UNICODE_BREAK_SPACE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_SPACE"
		end

	g_unicode_break_after: INTEGER
			-- G_UNICODE_BREAK_AFTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_AFTER"
		end

	g_unicode_break_before: INTEGER
			-- G_UNICODE_BREAK_BEFORE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_BEFORE"
		end

	g_unicode_break_before_and_after: INTEGER
			-- G_UNICODE_BREAK_BEFORE_AND_AFTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_BEFORE_AND_AFTER"
		end

	g_unicode_break_hyphen: INTEGER
			-- G_UNICODE_BREAK_HYPHEN
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HYPHEN"
		end

	g_unicode_break_non_starter: INTEGER
			-- G_UNICODE_BREAK_NON_STARTER
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_NON_STARTER"
		end

	g_unicode_break_open_punctuation: INTEGER
			-- G_UNICODE_BREAK_OPEN_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_OPEN_PUNCTUATION"
		end

	g_unicode_break_close_punctuation: INTEGER
			-- G_UNICODE_BREAK_CLOSE_PUNCTUATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
		end

	g_unicode_break_quotation: INTEGER
			-- G_UNICODE_BREAK_QUOTATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_QUOTATION"
		end

	g_unicode_break_exclamation: INTEGER
			-- G_UNICODE_BREAK_EXCLAMATION
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_EXCLAMATION"
		end

	g_unicode_break_ideographic: INTEGER
			-- G_UNICODE_BREAK_IDEOGRAPHIC
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_IDEOGRAPHIC"
		end

	g_unicode_break_numeric: INTEGER
			-- G_UNICODE_BREAK_NUMERIC
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_NUMERIC"
		end

	g_unicode_break_infix_separator: INTEGER
			-- G_UNICODE_BREAK_INFIX_SEPARATOR
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_INFIX_SEPARATOR"
		end

	g_unicode_break_symbol: INTEGER
			-- G_UNICODE_BREAK_SYMBOL
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_SYMBOL"
		end

	g_unicode_break_alphabetic: INTEGER
			-- G_UNICODE_BREAK_ALPHABETIC
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_ALPHABETIC"
		end

	g_unicode_break_prefix: INTEGER
			-- G_UNICODE_BREAK_PREFIX
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_PREFIX"
		end

	g_unicode_break_postfix: INTEGER
			-- G_UNICODE_BREAK_POSTFIX
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_POSTFIX"
		end

	g_unicode_break_complex_context: INTEGER
			-- G_UNICODE_BREAK_COMPLEX_CONTEXT
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_COMPLEX_CONTEXT"
		end

	g_unicode_break_ambiguous: INTEGER
			-- G_UNICODE_BREAK_AMBIGUOUS
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_AMBIGUOUS"
		end

	g_unicode_break_unknown: INTEGER
			-- G_UNICODE_BREAK_UNKNOWN
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_UNKNOWN"
		end

	g_unicode_break_next_line: INTEGER
			-- G_UNICODE_BREAK_NEXT_LINE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_NEXT_LINE"
		end

	g_unicode_break_word_joiner: INTEGER
			-- G_UNICODE_BREAK_WORD_JOINER
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_WORD_JOINER"
		end

	g_unicode_break_hangul_l_jamo: INTEGER
			-- G_UNICODE_BREAK_HANGUL_L_JAMO
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HANGUL_L_JAMO"
		end

	g_unicode_break_hangul_v_jamo: INTEGER
			-- G_UNICODE_BREAK_HANGUL_V_JAMO
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HANGUL_V_JAMO"
		end

	g_unicode_break_hangul_t_jamo: INTEGER
			-- G_UNICODE_BREAK_HANGUL_T_JAMO
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HANGUL_T_JAMO"
		end

	g_unicode_break_hangul_lv_syllable: INTEGER
			-- G_UNICODE_BREAK_HANGUL_LV_SYLLABLE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
		end

	g_unicode_break_hangul_lvt_syllable: INTEGER
			-- G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE
		external "C macro use <glib.h>"
		alias "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
		end

end
