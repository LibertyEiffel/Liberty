-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKETPROTOCOL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_socket_protocol_default_low_level)  or else
				(a_value = g_socket_protocol_sctp_low_level)  or else
				(a_value = g_socket_protocol_tcp_low_level)  or else
				(a_value = g_socket_protocol_udp_low_level)  or else
				(a_value = g_socket_protocol_unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_socket_protocol_default is
		do
			value := g_socket_protocol_default_low_level
		end

	set_g_socket_protocol_sctp is
		do
			value := g_socket_protocol_sctp_low_level
		end

	set_g_socket_protocol_tcp is
		do
			value := g_socket_protocol_tcp_low_level
		end

	set_g_socket_protocol_udp is
		do
			value := g_socket_protocol_udp_low_level
		end

	set_g_socket_protocol_unknown is
		do
			value := g_socket_protocol_unknown_low_level
		end

feature {ANY} -- Queries
	is_g_socket_protocol_default: BOOLEAN is
		do
			Result := (value=g_socket_protocol_default_low_level)
		end

	is_g_socket_protocol_sctp: BOOLEAN is
		do
			Result := (value=g_socket_protocol_sctp_low_level)
		end

	is_g_socket_protocol_tcp: BOOLEAN is
		do
			Result := (value=g_socket_protocol_tcp_low_level)
		end

	is_g_socket_protocol_udp: BOOLEAN is
		do
			Result := (value=g_socket_protocol_udp_low_level)
		end

	is_g_socket_protocol_unknown: BOOLEAN is
		do
			Result := (value=g_socket_protocol_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_socket_protocol_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_DEFAULT"
 			}"
 		end

	g_socket_protocol_sctp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_SCTP"
 			}"
 		end

	g_socket_protocol_tcp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_TCP"
 			}"
 		end

	g_socket_protocol_udp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_UDP"
 			}"
 		end

	g_socket_protocol_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_UNKNOWN"
 			}"
 		end


end -- class GSOCKETPROTOCOL_ENUM
