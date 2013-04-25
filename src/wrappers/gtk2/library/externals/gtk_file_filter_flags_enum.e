-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_FILTER_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (filename_low_level | 
				display_name_low_level | 
				mime_type_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_filename is
		do
			value := value.bit_or(filename_low_level)
		end

	unset_filename is
		do
			value := value.bit_xor(filename_low_level)
		end

	set_display_name is
		do
			value := value.bit_or(display_name_low_level)
		end

	unset_display_name is
		do
			value := value.bit_xor(display_name_low_level)
		end

	set_mime_type is
		do
			value := value.bit_or(mime_type_low_level)
		end

	unset_mime_type is
		do
			value := value.bit_xor(mime_type_low_level)
		end

feature {ANY} -- Queries
	is_filename: BOOLEAN is
		do
			Result := (value=filename_low_level)
		end

	is_display_name: BOOLEAN is
		do
			Result := (value=display_name_low_level)
		end

	is_mime_type: BOOLEAN is
		do
			Result := (value=mime_type_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_FILENAME"
 			}"
 		end

	display_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_DISPLAY_NAME"
 			}"
 		end

	mime_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILE_FILTER_MIME_TYPE"
 			}"
 		end


end -- class GTK_FILE_FILTER_FLAGS_ENUM
