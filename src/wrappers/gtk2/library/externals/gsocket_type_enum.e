-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKET_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_socket_type_datagram_low_level)  or else
				(a_value = g_socket_type_invalid_low_level)  or else
				(a_value = g_socket_type_seqpacket_low_level)  or else
				(a_value = g_socket_type_stream_low_level) )
		end

feature -- Setters
	default_create,
	set_g_socket_type_datagram is
		do
			value := g_socket_type_datagram_low_level
		end

	set_g_socket_type_invalid is
		do
			value := g_socket_type_invalid_low_level
		end

	set_g_socket_type_seqpacket is
		do
			value := g_socket_type_seqpacket_low_level
		end

	set_g_socket_type_stream is
		do
			value := g_socket_type_stream_low_level
		end

feature -- Queries
	is_g_socket_type_datagram: BOOLEAN is
		do
			Result := (value=g_socket_type_datagram_low_level)
		end

	is_g_socket_type_invalid: BOOLEAN is
		do
			Result := (value=g_socket_type_invalid_low_level)
		end

	is_g_socket_type_seqpacket: BOOLEAN is
		do
			Result := (value=g_socket_type_seqpacket_low_level)
		end

	is_g_socket_type_stream: BOOLEAN is
		do
			Result := (value=g_socket_type_stream_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_socket_type_datagram_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_TYPE_DATAGRAM"
 			}"
 		end

	g_socket_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_TYPE_INVALID"
 			}"
 		end

	g_socket_type_seqpacket_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_TYPE_SEQPACKET"
 			}"
 		end

	g_socket_type_stream_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_TYPE_STREAM"
 			}"
 		end


end -- class GSOCKET_TYPE_ENUM
