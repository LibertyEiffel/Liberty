-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNIX_SOCKET_ADDRESS_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = anonymous_low_level)  or else
				(a_value = path_low_level)  or else
				(a_value = abstract_low_level)  or else
				(a_value = abstract_padded_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_anonymous is
		do
			value := anonymous_low_level
		end

	set_path is
		do
			value := path_low_level
		end

	set_abstract is
		do
			value := abstract_low_level
		end

	set_abstract_padded is
		do
			value := abstract_padded_low_level
		end

feature {ANY} -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	anonymous: BOOLEAN is
		do
			Result := (value=anonymous_low_level)
		end

	path: BOOLEAN is
		do
			Result := (value=path_low_level)
		end

	abstract: BOOLEAN is
		do
			Result := (value=abstract_low_level)
		end

	abstract_padded: BOOLEAN is
		do
			Result := (value=abstract_padded_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_INVALID"
 			}"
 		end

	anonymous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ANONYMOUS"
 			}"
 		end

	path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_PATH"
 			}"
 		end

	abstract_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ABSTRACT"
 			}"
 		end

	abstract_padded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED"
 			}"
 		end


end -- class GUNIX_SOCKET_ADDRESS_TYPE_ENUM
