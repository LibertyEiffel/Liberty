-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_WRAP_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_wrap_char_low_level)  or else
				(a_value = gtk_wrap_none_low_level)  or else
				(a_value = gtk_wrap_word_low_level)  or else
				(a_value = gtk_wrap_word_char_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_wrap_char is
		do
			value := gtk_wrap_char_low_level
		end

	set_gtk_wrap_none is
		do
			value := gtk_wrap_none_low_level
		end

	set_gtk_wrap_word is
		do
			value := gtk_wrap_word_low_level
		end

	set_gtk_wrap_word_char is
		do
			value := gtk_wrap_word_char_low_level
		end

feature -- Queries
	is_gtk_wrap_char: BOOLEAN is
		do
			Result := (value=gtk_wrap_char_low_level)
		end

	is_gtk_wrap_none: BOOLEAN is
		do
			Result := (value=gtk_wrap_none_low_level)
		end

	is_gtk_wrap_word: BOOLEAN is
		do
			Result := (value=gtk_wrap_word_low_level)
		end

	is_gtk_wrap_word_char: BOOLEAN is
		do
			Result := (value=gtk_wrap_word_char_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_wrap_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WRAP_CHAR"
 			}"
 		end

	gtk_wrap_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WRAP_NONE"
 			}"
 		end

	gtk_wrap_word_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WRAP_WORD"
 			}"
 		end

	gtk_wrap_word_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WRAP_WORD_CHAR"
 			}"
 		end


end -- class GTK_WRAP_MODE_ENUM
