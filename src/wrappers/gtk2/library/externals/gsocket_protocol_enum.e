-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSOCKET_PROTOCOL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = tcp_low_level)  or else
				(a_value = udp_low_level)  or else
				(a_value = sctp_low_level) )
		end

feature -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_default_external is
		do
			value := default_external_low_level
		end

	set_tcp is
		do
			value := tcp_low_level
		end

	set_udp is
		do
			value := udp_low_level
		end

	set_sctp is
		do
			value := sctp_low_level
		end

feature -- Queries
	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	tcp: BOOLEAN is
		do
			Result := (value=tcp_low_level)
		end

	udp: BOOLEAN is
		do
			Result := (value=udp_low_level)
		end

	sctp: BOOLEAN is
		do
			Result := (value=sctp_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_UNKNOWN"
 			}"
 		end

	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_DEFAULT"
 			}"
 		end

	tcp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_TCP"
 			}"
 		end

	udp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_UDP"
 			}"
 		end

	sctp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SOCKET_PROTOCOL_SCTP"
 			}"
 		end


end -- class GSOCKET_PROTOCOL_ENUM
