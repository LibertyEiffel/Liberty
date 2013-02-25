-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLS_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unavailable_low_level)  or else
				(a_value = misc_low_level)  or else
				(a_value = bad_certificate_low_level)  or else
				(a_value = not_tls_low_level)  or else
				(a_value = handshake_low_level)  or else
				(a_value = certificate_required_low_level)  or else
				(a_value = eof_low_level) )
		end

feature -- Setters
	default_create,
	set_unavailable is
		do
			value := unavailable_low_level
		end

	set_misc is
		do
			value := misc_low_level
		end

	set_bad_certificate is
		do
			value := bad_certificate_low_level
		end

	set_not_tls is
		do
			value := not_tls_low_level
		end

	set_handshake is
		do
			value := handshake_low_level
		end

	set_certificate_required is
		do
			value := certificate_required_low_level
		end

	set_eof is
		do
			value := eof_low_level
		end

feature -- Queries
	unavailable: BOOLEAN is
		do
			Result := (value=unavailable_low_level)
		end

	misc: BOOLEAN is
		do
			Result := (value=misc_low_level)
		end

	bad_certificate: BOOLEAN is
		do
			Result := (value=bad_certificate_low_level)
		end

	not_tls: BOOLEAN is
		do
			Result := (value=not_tls_low_level)
		end

	handshake: BOOLEAN is
		do
			Result := (value=handshake_low_level)
		end

	certificate_required: BOOLEAN is
		do
			Result := (value=certificate_required_low_level)
		end

	eof: BOOLEAN is
		do
			Result := (value=eof_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unavailable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_UNAVAILABLE"
 			}"
 		end

	misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_MISC"
 			}"
 		end

	bad_certificate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_BAD_CERTIFICATE"
 			}"
 		end

	not_tls_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_NOT_TLS"
 			}"
 		end

	handshake_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_HANDSHAKE"
 			}"
 		end

	certificate_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_CERTIFICATE_REQUIRED"
 			}"
 		end

	eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_ERROR_EOF"
 			}"
 		end


end -- class GTLS_ERROR_ENUM
