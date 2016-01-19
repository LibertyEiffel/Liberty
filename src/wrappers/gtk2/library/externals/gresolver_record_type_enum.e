-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GRESOLVER_RECORD_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_resolver_record_mx_low_level)  or else
				(a_value = g_resolver_record_ns_low_level)  or else
				(a_value = g_resolver_record_soa_low_level)  or else
				(a_value = g_resolver_record_srv_low_level)  or else
				(a_value = g_resolver_record_txt_low_level) )
		end

feature -- Setters
	default_create,
	set_g_resolver_record_mx is
		do
			value := g_resolver_record_mx_low_level
		end

	set_g_resolver_record_ns is
		do
			value := g_resolver_record_ns_low_level
		end

	set_g_resolver_record_soa is
		do
			value := g_resolver_record_soa_low_level
		end

	set_g_resolver_record_srv is
		do
			value := g_resolver_record_srv_low_level
		end

	set_g_resolver_record_txt is
		do
			value := g_resolver_record_txt_low_level
		end

feature -- Queries
	is_g_resolver_record_mx: BOOLEAN is
		do
			Result := (value=g_resolver_record_mx_low_level)
		end

	is_g_resolver_record_ns: BOOLEAN is
		do
			Result := (value=g_resolver_record_ns_low_level)
		end

	is_g_resolver_record_soa: BOOLEAN is
		do
			Result := (value=g_resolver_record_soa_low_level)
		end

	is_g_resolver_record_srv: BOOLEAN is
		do
			Result := (value=g_resolver_record_srv_low_level)
		end

	is_g_resolver_record_txt: BOOLEAN is
		do
			Result := (value=g_resolver_record_txt_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_resolver_record_mx_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_RECORD_MX"
 			}"
 		end

	g_resolver_record_ns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_RECORD_NS"
 			}"
 		end

	g_resolver_record_soa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_RECORD_SOA"
 			}"
 		end

	g_resolver_record_srv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_RECORD_SRV"
 			}"
 		end

	g_resolver_record_txt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_RESOLVER_RECORD_TXT"
 			}"
 		end


end -- class GRESOLVER_RECORD_TYPE_ENUM
