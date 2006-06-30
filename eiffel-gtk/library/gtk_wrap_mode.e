indexing
	description: "Enum GtkWrapMode - Describes a type of line wrapping."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_WRAP_MODE
feature  -- enum
	is_valid_wrap_mode (a_mode :INTEGER): BOOLEAN is
		do	
			Result:=((a_mode = gtk_wrap_none) or else
						(a_mode = gtk_wrap_char) or else
						(a_mode = gtk_wrap_word) or else
						(a_mode = gtk_wrap_word_char))
		end
	
	gtk_wrap_none: INTEGER is
			-- do not wrap lines; just make the text area wider 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_NONE"
		end

	gtk_wrap_char: INTEGER is
			-- wrap text, breaking lines anywhere the cursor can appear
			-- (between characters, usually - if you want to be
			-- technical, between graphemes, see pango_get_log_attrs())
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_CHAR"
		end

	gtk_wrap_word: INTEGER is
			-- wrap text, breaking lines in between words 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_WORD"
		end

	gtk_wrap_word_char: INTEGER is
			-- wrap text, breaking lines in between words, or if that is
			-- not enough, also between graphemes.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WRAP_WORD_CHAR"
		end
end
