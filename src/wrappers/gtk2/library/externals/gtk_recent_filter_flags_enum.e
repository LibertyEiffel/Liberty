-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_FILTER_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (uri_low_level | 
				mime_type_low_level | 
				application_low_level | 
				group_low_level | 
				age_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_uri is
		do
			value := value.bit_or(uri_low_level)
		end

	unset_uri is
		do
			value := value.bit_xor(uri_low_level)
		end

	set_mime_type is
		do
			value := value.bit_or(mime_type_low_level)
		end

	unset_mime_type is
		do
			value := value.bit_xor(mime_type_low_level)
		end

	set_application is
		do
			value := value.bit_or(application_low_level)
		end

	unset_application is
		do
			value := value.bit_xor(application_low_level)
		end

	set_group is
		do
			value := value.bit_or(group_low_level)
		end

	unset_group is
		do
			value := value.bit_xor(group_low_level)
		end

	set_age is
		do
			value := value.bit_or(age_low_level)
		end

	unset_age is
		do
			value := value.bit_xor(age_low_level)
		end

feature {ANY} -- Queries
	is_uri: BOOLEAN is
		do
			Result := (value=uri_low_level)
		end

	is_mime_type: BOOLEAN is
		do
			Result := (value=mime_type_low_level)
		end

	is_application: BOOLEAN is
		do
			Result := (value=application_low_level)
		end

	is_group: BOOLEAN is
		do
			Result := (value=group_low_level)
		end

	is_age: BOOLEAN is
		do
			Result := (value=age_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_URI"
 			}"
 		end

	mime_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_MIME_TYPE"
 			}"
 		end

	application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_APPLICATION"
 			}"
 		end

	group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_GROUP"
 			}"
 		end

	age_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECENT_FILTER_AGE"
 			}"
 		end


end -- class GTK_RECENT_FILTER_FLAGS_ENUM
