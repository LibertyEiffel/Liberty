-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLSAUTHENTICATIONMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_tls_authentication_none_low_level)  or else
				(a_value = g_tls_authentication_requested_low_level)  or else
				(a_value = g_tls_authentication_required_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_tls_authentication_none is
		do
			value := g_tls_authentication_none_low_level
		end

	set_g_tls_authentication_requested is
		do
			value := g_tls_authentication_requested_low_level
		end

	set_g_tls_authentication_required is
		do
			value := g_tls_authentication_required_low_level
		end

feature {ANY} -- Queries
	is_g_tls_authentication_none: BOOLEAN is
		do
			Result := (value=g_tls_authentication_none_low_level)
		end

	is_g_tls_authentication_requested: BOOLEAN is
		do
			Result := (value=g_tls_authentication_requested_low_level)
		end

	is_g_tls_authentication_required: BOOLEAN is
		do
			Result := (value=g_tls_authentication_required_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_tls_authentication_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_AUTHENTICATION_NONE"
 			}"
 		end

	g_tls_authentication_requested_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_AUTHENTICATION_REQUESTED"
 			}"
 		end

	g_tls_authentication_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_AUTHENTICATION_REQUIRED"
 			}"
 		end


end -- class GTLSAUTHENTICATIONMODE_ENUM
