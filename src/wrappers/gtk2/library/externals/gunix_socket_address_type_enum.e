-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNIX_SOCKET_ADDRESS_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_unix_socket_address_abstract_low_level)  or else
				(a_value = g_unix_socket_address_abstract_padded_low_level)  or else
				(a_value = g_unix_socket_address_anonymous_low_level)  or else
				(a_value = g_unix_socket_address_invalid_low_level)  or else
				(a_value = g_unix_socket_address_path_low_level) )
		end

feature -- Setters
	default_create,
	set_g_unix_socket_address_abstract is
		do
			value := g_unix_socket_address_abstract_low_level
		end

	set_g_unix_socket_address_abstract_padded is
		do
			value := g_unix_socket_address_abstract_padded_low_level
		end

	set_g_unix_socket_address_anonymous is
		do
			value := g_unix_socket_address_anonymous_low_level
		end

	set_g_unix_socket_address_invalid is
		do
			value := g_unix_socket_address_invalid_low_level
		end

	set_g_unix_socket_address_path is
		do
			value := g_unix_socket_address_path_low_level
		end

feature -- Queries
	is_g_unix_socket_address_abstract: BOOLEAN is
		do
			Result := (value=g_unix_socket_address_abstract_low_level)
		end

	is_g_unix_socket_address_abstract_padded: BOOLEAN is
		do
			Result := (value=g_unix_socket_address_abstract_padded_low_level)
		end

	is_g_unix_socket_address_anonymous: BOOLEAN is
		do
			Result := (value=g_unix_socket_address_anonymous_low_level)
		end

	is_g_unix_socket_address_invalid: BOOLEAN is
		do
			Result := (value=g_unix_socket_address_invalid_low_level)
		end

	is_g_unix_socket_address_path: BOOLEAN is
		do
			Result := (value=g_unix_socket_address_path_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unix_socket_address_abstract_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ABSTRACT"
 			}"
 		end

	g_unix_socket_address_abstract_padded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED"
 			}"
 		end

	g_unix_socket_address_anonymous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_ANONYMOUS"
 			}"
 		end

	g_unix_socket_address_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_INVALID"
 			}"
 		end

	g_unix_socket_address_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNIX_SOCKET_ADDRESS_PATH"
 			}"
 		end


end -- class GUNIX_SOCKET_ADDRESS_TYPE_ENUM
