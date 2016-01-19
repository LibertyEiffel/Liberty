-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLS_REHANDSHAKE_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_tls_rehandshake_never_low_level)  or else
				(a_value = g_tls_rehandshake_safely_low_level)  or else
				(a_value = g_tls_rehandshake_unsafely_low_level) )
		end

feature -- Setters
	default_create,
	set_g_tls_rehandshake_never is
		do
			value := g_tls_rehandshake_never_low_level
		end

	set_g_tls_rehandshake_safely is
		do
			value := g_tls_rehandshake_safely_low_level
		end

	set_g_tls_rehandshake_unsafely is
		do
			value := g_tls_rehandshake_unsafely_low_level
		end

feature -- Queries
	is_g_tls_rehandshake_never: BOOLEAN is
		do
			Result := (value=g_tls_rehandshake_never_low_level)
		end

	is_g_tls_rehandshake_safely: BOOLEAN is
		do
			Result := (value=g_tls_rehandshake_safely_low_level)
		end

	is_g_tls_rehandshake_unsafely: BOOLEAN is
		do
			Result := (value=g_tls_rehandshake_unsafely_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_tls_rehandshake_never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_NEVER"
 			}"
 		end

	g_tls_rehandshake_safely_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_SAFELY"
 			}"
 		end

	g_tls_rehandshake_unsafely_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_UNSAFELY"
 			}"
 		end


end -- class GTLS_REHANDSHAKE_MODE_ENUM
