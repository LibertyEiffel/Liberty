-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_FILTER_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_file_filter_display_name_low_level | 
				gtk_file_filter_mime_type_low_level | 
				gtk_file_filter_uri_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_file_filter_display_name is
		do
			value := value.bit_or(gtk_file_filter_display_name_low_level)
		end

	unset_gtk_file_filter_display_name is
		do
			value := value.bit_xor(gtk_file_filter_display_name_low_level)
		end

	set_gtk_file_filter_mime_type is
		do
			value := value.bit_or(gtk_file_filter_mime_type_low_level)
		end

	unset_gtk_file_filter_mime_type is
		do
			value := value.bit_xor(gtk_file_filter_mime_type_low_level)
		end

	set_gtk_file_filter_uri is
		do
			value := value.bit_or(gtk_file_filter_uri_low_level)
		end

	unset_gtk_file_filter_uri is
		do
			value := value.bit_xor(gtk_file_filter_uri_low_level)
		end

feature -- Queries
	is_gtk_file_filter_display_name: BOOLEAN is
		do
			Result := (value=gtk_file_filter_display_name_low_level)
		end

	is_gtk_file_filter_mime_type: BOOLEAN is
		do
			Result := (value=gtk_file_filter_mime_type_low_level)
		end

	is_gtk_file_filter_uri: BOOLEAN is
		do
			Result := (value=gtk_file_filter_uri_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_file_filter_display_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_DISPLAY_NAME"
 			}"
 		end

	gtk_file_filter_mime_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_MIME_TYPE"
 			}"
 		end

	gtk_file_filter_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_URI"
 			}"
 		end


end -- class GTK_FILE_FILTER_FLAGS_ENUM
