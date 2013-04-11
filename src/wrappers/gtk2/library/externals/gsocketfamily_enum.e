-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKETFAMILY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_socket_family_invalid_low_level)  or else
				(a_value = g_socket_family_ipv4_low_level)  or else
				(a_value = g_socket_family_ipv6_low_level)  or else
				(a_value = g_socket_family_unix_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_socket_family_invalid is
		do
			value := g_socket_family_invalid_low_level
		end

	set_g_socket_family_ipv4 is
		do
			value := g_socket_family_ipv4_low_level
		end

	set_g_socket_family_ipv6 is
		do
			value := g_socket_family_ipv6_low_level
		end

	set_g_socket_family_unix is
		do
			value := g_socket_family_unix_low_level
		end

feature {ANY} -- Queries
	is_g_socket_family_invalid: BOOLEAN is
		do
			Result := (value=g_socket_family_invalid_low_level)
		end

	is_g_socket_family_ipv4: BOOLEAN is
		do
			Result := (value=g_socket_family_ipv4_low_level)
		end

	is_g_socket_family_ipv6: BOOLEAN is
		do
			Result := (value=g_socket_family_ipv6_low_level)
		end

	is_g_socket_family_unix: BOOLEAN is
		do
			Result := (value=g_socket_family_unix_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_socket_family_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_INVALID"
 			}"
 		end

	g_socket_family_ipv4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_IPV4"
 			}"
 		end

	g_socket_family_ipv6_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_IPV6"
 			}"
 		end

	g_socket_family_unix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_FAMILY_UNIX"
 			}"
 		end


end -- class GSOCKETFAMILY_ENUM
