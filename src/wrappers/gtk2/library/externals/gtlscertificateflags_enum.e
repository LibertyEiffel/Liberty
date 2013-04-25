-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLSCERTIFICATEFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_tls_certificate_bad_identity_low_level)  or else
				(a_value = g_tls_certificate_expired_low_level)  or else
				(a_value = g_tls_certificate_generic_error_low_level)  or else
				(a_value = g_tls_certificate_insecure_low_level)  or else
				(a_value = g_tls_certificate_not_activated_low_level)  or else
				(a_value = g_tls_certificate_revoked_low_level)  or else
				(a_value = g_tls_certificate_unknown_ca_low_level)  or else
				(a_value = g_tls_certificate_validate_all_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_tls_certificate_bad_identity is
		do
			value := g_tls_certificate_bad_identity_low_level
		end

	set_g_tls_certificate_expired is
		do
			value := g_tls_certificate_expired_low_level
		end

	set_g_tls_certificate_generic_error is
		do
			value := g_tls_certificate_generic_error_low_level
		end

	set_g_tls_certificate_insecure is
		do
			value := g_tls_certificate_insecure_low_level
		end

	set_g_tls_certificate_not_activated is
		do
			value := g_tls_certificate_not_activated_low_level
		end

	set_g_tls_certificate_revoked is
		do
			value := g_tls_certificate_revoked_low_level
		end

	set_g_tls_certificate_unknown_ca is
		do
			value := g_tls_certificate_unknown_ca_low_level
		end

	set_g_tls_certificate_validate_all is
		do
			value := g_tls_certificate_validate_all_low_level
		end

feature {ANY} -- Queries
	is_g_tls_certificate_bad_identity: BOOLEAN is
		do
			Result := (value=g_tls_certificate_bad_identity_low_level)
		end

	is_g_tls_certificate_expired: BOOLEAN is
		do
			Result := (value=g_tls_certificate_expired_low_level)
		end

	is_g_tls_certificate_generic_error: BOOLEAN is
		do
			Result := (value=g_tls_certificate_generic_error_low_level)
		end

	is_g_tls_certificate_insecure: BOOLEAN is
		do
			Result := (value=g_tls_certificate_insecure_low_level)
		end

	is_g_tls_certificate_not_activated: BOOLEAN is
		do
			Result := (value=g_tls_certificate_not_activated_low_level)
		end

	is_g_tls_certificate_revoked: BOOLEAN is
		do
			Result := (value=g_tls_certificate_revoked_low_level)
		end

	is_g_tls_certificate_unknown_ca: BOOLEAN is
		do
			Result := (value=g_tls_certificate_unknown_ca_low_level)
		end

	is_g_tls_certificate_validate_all: BOOLEAN is
		do
			Result := (value=g_tls_certificate_validate_all_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_tls_certificate_bad_identity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_BAD_IDENTITY"
 			}"
 		end

	g_tls_certificate_expired_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_EXPIRED"
 			}"
 		end

	g_tls_certificate_generic_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_GENERIC_ERROR"
 			}"
 		end

	g_tls_certificate_insecure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_INSECURE"
 			}"
 		end

	g_tls_certificate_not_activated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_NOT_ACTIVATED"
 			}"
 		end

	g_tls_certificate_revoked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_REVOKED"
 			}"
 		end

	g_tls_certificate_unknown_ca_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_UNKNOWN_CA"
 			}"
 		end

	g_tls_certificate_validate_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_CERTIFICATE_VALIDATE_ALL"
 			}"
 		end


end -- class GTLSCERTIFICATEFLAGS_ENUM
