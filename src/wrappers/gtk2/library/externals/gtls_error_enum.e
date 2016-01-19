-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLS_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_tls_error_bad_certificate_low_level)  or else
				(a_value = g_tls_error_certificate_required_low_level)  or else
				(a_value = g_tls_error_eof_low_level)  or else
				(a_value = g_tls_error_handshake_low_level)  or else
				(a_value = g_tls_error_misc_low_level)  or else
				(a_value = g_tls_error_not_tls_low_level)  or else
				(a_value = g_tls_error_unavailable_low_level) )
		end

feature -- Setters
	default_create,
	set_g_tls_error_bad_certificate is
		do
			value := g_tls_error_bad_certificate_low_level
		end

	set_g_tls_error_certificate_required is
		do
			value := g_tls_error_certificate_required_low_level
		end

	set_g_tls_error_eof is
		do
			value := g_tls_error_eof_low_level
		end

	set_g_tls_error_handshake is
		do
			value := g_tls_error_handshake_low_level
		end

	set_g_tls_error_misc is
		do
			value := g_tls_error_misc_low_level
		end

	set_g_tls_error_not_tls is
		do
			value := g_tls_error_not_tls_low_level
		end

	set_g_tls_error_unavailable is
		do
			value := g_tls_error_unavailable_low_level
		end

feature -- Queries
	is_g_tls_error_bad_certificate: BOOLEAN is
		do
			Result := (value=g_tls_error_bad_certificate_low_level)
		end

	is_g_tls_error_certificate_required: BOOLEAN is
		do
			Result := (value=g_tls_error_certificate_required_low_level)
		end

	is_g_tls_error_eof: BOOLEAN is
		do
			Result := (value=g_tls_error_eof_low_level)
		end

	is_g_tls_error_handshake: BOOLEAN is
		do
			Result := (value=g_tls_error_handshake_low_level)
		end

	is_g_tls_error_misc: BOOLEAN is
		do
			Result := (value=g_tls_error_misc_low_level)
		end

	is_g_tls_error_not_tls: BOOLEAN is
		do
			Result := (value=g_tls_error_not_tls_low_level)
		end

	is_g_tls_error_unavailable: BOOLEAN is
		do
			Result := (value=g_tls_error_unavailable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_tls_error_bad_certificate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_BAD_CERTIFICATE"
 			}"
 		end

	g_tls_error_certificate_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_CERTIFICATE_REQUIRED"
 			}"
 		end

	g_tls_error_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_EOF"
 			}"
 		end

	g_tls_error_handshake_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_HANDSHAKE"
 			}"
 		end

	g_tls_error_misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_MISC"
 			}"
 		end

	g_tls_error_not_tls_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_NOT_TLS"
 			}"
 		end

	g_tls_error_unavailable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_UNAVAILABLE"
 			}"
 		end


end -- class GTLS_ERROR_ENUM
