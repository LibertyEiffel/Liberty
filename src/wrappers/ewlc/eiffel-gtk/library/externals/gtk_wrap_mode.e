note
	description: "Enum GtkWrapMode describes a type of line wrapping."
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli, GTK+ team
				
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

deferred class GTK_WRAP_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_wrap_mode (a_mode :INTEGER): BOOLEAN
		do
			Result:=((a_mode=gtk_wrap_none) or else
						(a_mode=gtk_wrap_char) or else
						(a_mode=gtk_wrap_word) or else
						(a_mode=gtk_wrap_word_char))
		end

	gtk_wrap_none: INTEGER
			-- do not wrap lines; just make the text area wider
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_NONE"
		end

	gtk_wrap_char: INTEGER
			-- wrap text, breaking lines anywhere the cursor can appear
			-- (between characters, usually - if you want to be
			-- technical, between graphemes, see pango_get_log_attrs())
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_CHAR"
		end

	gtk_wrap_word: INTEGER
			-- wrap text, breaking lines in between words
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_WORD"
		end

	gtk_wrap_word_char: INTEGER
			-- wrap text, breaking lines in between words, or if that is
			-- not enough, also between graphemes.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_WORD_CHAR"
		end

end
