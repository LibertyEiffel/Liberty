-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_FILTER_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_recent_filter_age_low_level | 
				gtk_recent_filter_display_name_low_level | 
				gtk_recent_filter_group_low_level | 
				gtk_recent_filter_mime_type_low_level | 
				gtk_recent_filter_uri_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_recent_filter_age is
		do
			value := value.bit_or(gtk_recent_filter_age_low_level)
		end

	unset_gtk_recent_filter_age is
		do
			value := value.bit_xor(gtk_recent_filter_age_low_level)
		end

	set_gtk_recent_filter_display_name is
		do
			value := value.bit_or(gtk_recent_filter_display_name_low_level)
		end

	unset_gtk_recent_filter_display_name is
		do
			value := value.bit_xor(gtk_recent_filter_display_name_low_level)
		end

	set_gtk_recent_filter_group is
		do
			value := value.bit_or(gtk_recent_filter_group_low_level)
		end

	unset_gtk_recent_filter_group is
		do
			value := value.bit_xor(gtk_recent_filter_group_low_level)
		end

	set_gtk_recent_filter_mime_type is
		do
			value := value.bit_or(gtk_recent_filter_mime_type_low_level)
		end

	unset_gtk_recent_filter_mime_type is
		do
			value := value.bit_xor(gtk_recent_filter_mime_type_low_level)
		end

	set_gtk_recent_filter_uri is
		do
			value := value.bit_or(gtk_recent_filter_uri_low_level)
		end

	unset_gtk_recent_filter_uri is
		do
			value := value.bit_xor(gtk_recent_filter_uri_low_level)
		end

feature -- Queries
	is_gtk_recent_filter_age: BOOLEAN is
		do
			Result := (value=gtk_recent_filter_age_low_level)
		end

	is_gtk_recent_filter_display_name: BOOLEAN is
		do
			Result := (value=gtk_recent_filter_display_name_low_level)
		end

	is_gtk_recent_filter_group: BOOLEAN is
		do
			Result := (value=gtk_recent_filter_group_low_level)
		end

	is_gtk_recent_filter_mime_type: BOOLEAN is
		do
			Result := (value=gtk_recent_filter_mime_type_low_level)
		end

	is_gtk_recent_filter_uri: BOOLEAN is
		do
			Result := (value=gtk_recent_filter_uri_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_recent_filter_age_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_AGE"
 			}"
 		end

	gtk_recent_filter_display_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_DISPLAY_NAME"
 			}"
 		end

	gtk_recent_filter_group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_GROUP"
 			}"
 		end

	gtk_recent_filter_mime_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_MIME_TYPE"
 			}"
 		end

	gtk_recent_filter_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_URI"
 			}"
 		end


end -- class GTK_RECENT_FILTER_FLAGS_ENUM
