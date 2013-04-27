-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCREDENTIALSTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_credentials_type_freebsd_cmsgcred_low_level)  or else
				(a_value = g_credentials_type_invalid_low_level)  or else
				(a_value = g_credentials_type_linux_ucred_low_level)  or else
				(a_value = g_credentials_type_openbsd_sockpeercred_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_credentials_type_freebsd_cmsgcred is
		do
			value := g_credentials_type_freebsd_cmsgcred_low_level
		end

	set_g_credentials_type_invalid is
		do
			value := g_credentials_type_invalid_low_level
		end

	set_g_credentials_type_linux_ucred is
		do
			value := g_credentials_type_linux_ucred_low_level
		end

	set_g_credentials_type_openbsd_sockpeercred is
		do
			value := g_credentials_type_openbsd_sockpeercred_low_level
		end

feature {ANY} -- Queries
	is_g_credentials_type_freebsd_cmsgcred: BOOLEAN is
		do
			Result := (value=g_credentials_type_freebsd_cmsgcred_low_level)
		end

	is_g_credentials_type_invalid: BOOLEAN is
		do
			Result := (value=g_credentials_type_invalid_low_level)
		end

	is_g_credentials_type_linux_ucred: BOOLEAN is
		do
			Result := (value=g_credentials_type_linux_ucred_low_level)
		end

	is_g_credentials_type_openbsd_sockpeercred: BOOLEAN is
		do
			Result := (value=g_credentials_type_openbsd_sockpeercred_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_credentials_type_freebsd_cmsgcred_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CREDENTIALS_TYPE_FREEBSD_CMSGCRED"
 			}"
 		end

	g_credentials_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CREDENTIALS_TYPE_INVALID"
 			}"
 		end

	g_credentials_type_linux_ucred_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CREDENTIALS_TYPE_LINUX_UCRED"
 			}"
 		end

	g_credentials_type_openbsd_sockpeercred_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CREDENTIALS_TYPE_OPENBSD_SOCKPEERCRED"
 			}"
 		end


end -- class GCREDENTIALSTYPE_ENUM
