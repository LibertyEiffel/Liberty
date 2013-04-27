-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKET_CLIENT_EVENT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_socket_client_complete_low_level)  or else
				(a_value = g_socket_client_connected_low_level)  or else
				(a_value = g_socket_client_connecting_low_level)  or else
				(a_value = g_socket_client_proxy_negotiated_low_level)  or else
				(a_value = g_socket_client_proxy_negotiating_low_level)  or else
				(a_value = g_socket_client_resolved_low_level)  or else
				(a_value = g_socket_client_resolving_low_level)  or else
				(a_value = g_socket_client_tls_handshaked_low_level)  or else
				(a_value = g_socket_client_tls_handshaking_low_level) )
		end

feature -- Setters
	default_create,
	set_g_socket_client_complete is
		do
			value := g_socket_client_complete_low_level
		end

	set_g_socket_client_connected is
		do
			value := g_socket_client_connected_low_level
		end

	set_g_socket_client_connecting is
		do
			value := g_socket_client_connecting_low_level
		end

	set_g_socket_client_proxy_negotiated is
		do
			value := g_socket_client_proxy_negotiated_low_level
		end

	set_g_socket_client_proxy_negotiating is
		do
			value := g_socket_client_proxy_negotiating_low_level
		end

	set_g_socket_client_resolved is
		do
			value := g_socket_client_resolved_low_level
		end

	set_g_socket_client_resolving is
		do
			value := g_socket_client_resolving_low_level
		end

	set_g_socket_client_tls_handshaked is
		do
			value := g_socket_client_tls_handshaked_low_level
		end

	set_g_socket_client_tls_handshaking is
		do
			value := g_socket_client_tls_handshaking_low_level
		end

feature -- Queries
	is_g_socket_client_complete: BOOLEAN is
		do
			Result := (value=g_socket_client_complete_low_level)
		end

	is_g_socket_client_connected: BOOLEAN is
		do
			Result := (value=g_socket_client_connected_low_level)
		end

	is_g_socket_client_connecting: BOOLEAN is
		do
			Result := (value=g_socket_client_connecting_low_level)
		end

	is_g_socket_client_proxy_negotiated: BOOLEAN is
		do
			Result := (value=g_socket_client_proxy_negotiated_low_level)
		end

	is_g_socket_client_proxy_negotiating: BOOLEAN is
		do
			Result := (value=g_socket_client_proxy_negotiating_low_level)
		end

	is_g_socket_client_resolved: BOOLEAN is
		do
			Result := (value=g_socket_client_resolved_low_level)
		end

	is_g_socket_client_resolving: BOOLEAN is
		do
			Result := (value=g_socket_client_resolving_low_level)
		end

	is_g_socket_client_tls_handshaked: BOOLEAN is
		do
			Result := (value=g_socket_client_tls_handshaked_low_level)
		end

	is_g_socket_client_tls_handshaking: BOOLEAN is
		do
			Result := (value=g_socket_client_tls_handshaking_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_socket_client_complete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_COMPLETE"
 			}"
 		end

	g_socket_client_connected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_CONNECTED"
 			}"
 		end

	g_socket_client_connecting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_CONNECTING"
 			}"
 		end

	g_socket_client_proxy_negotiated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_PROXY_NEGOTIATED"
 			}"
 		end

	g_socket_client_proxy_negotiating_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_PROXY_NEGOTIATING"
 			}"
 		end

	g_socket_client_resolved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_RESOLVED"
 			}"
 		end

	g_socket_client_resolving_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_RESOLVING"
 			}"
 		end

	g_socket_client_tls_handshaked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_TLS_HANDSHAKED"
 			}"
 		end

	g_socket_client_tls_handshaking_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_CLIENT_TLS_HANDSHAKING"
 			}"
 		end


end -- class GSOCKET_CLIENT_EVENT_ENUM
