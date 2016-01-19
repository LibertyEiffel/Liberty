-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_SEARCH_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_text_search_text_only_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_text_search_text_only is
		do
			value := value.bit_or(gtk_text_search_text_only_low_level)
		end

	unset_gtk_text_search_text_only is
		do
			value := value.bit_xor(gtk_text_search_text_only_low_level)
		end

feature -- Queries
	is_gtk_text_search_text_only: BOOLEAN is
		do
			Result := (value=gtk_text_search_text_only_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_text_search_text_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TEXT_SEARCH_TEXT_ONLY"
 			}"
 		end


end -- class GTK_TEXT_SEARCH_FLAGS_ENUM
