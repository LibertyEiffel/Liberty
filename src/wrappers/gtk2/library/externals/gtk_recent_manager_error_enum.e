-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_MANAGER_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = not_found_low_level)  or else
				(a_value = invalid_uri_low_level)  or else
				(a_value = invalid_encoding_low_level)  or else
				(a_value = not_registered_low_level)  or else
				(a_value = read_low_level)  or else
				(a_value = write_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_not_found is
		do
			value := not_found_low_level
		end

	set_invalid_uri is
		do
			value := invalid_uri_low_level
		end

	set_invalid_encoding is
		do
			value := invalid_encoding_low_level
		end

	set_not_registered is
		do
			value := not_registered_low_level
		end

	set_read is
		do
			value := read_low_level
		end

	set_write is
		do
			value := write_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

feature {ANY} -- Queries
	not_found: BOOLEAN is
		do
			Result := (value=not_found_low_level)
		end

	invalid_uri: BOOLEAN is
		do
			Result := (value=invalid_uri_low_level)
		end

	invalid_encoding: BOOLEAN is
		do
			Result := (value=invalid_encoding_low_level)
		end

	not_registered: BOOLEAN is
		do
			Result := (value=not_registered_low_level)
		end

	read: BOOLEAN is
		do
			Result := (value=read_low_level)
		end

	write: BOOLEAN is
		do
			Result := (value=write_low_level)
		end

	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_NOT_FOUND"
 			}"
 		end

	invalid_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_INVALID_URI"
 			}"
 		end

	invalid_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_INVALID_ENCODING"
 			}"
 		end

	not_registered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_NOT_REGISTERED"
 			}"
 		end

	read_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_READ"
 			}"
 		end

	write_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_WRITE"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_MANAGER_ERROR_UNKNOWN"
 			}"
 		end


end -- class GTK_RECENT_MANAGER_ERROR_ENUM
