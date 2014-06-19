-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GNORMALIZE_MODE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_normalize_all_low_level)  or else
				(a_value = g_normalize_all_compose_low_level)  or else
				(a_value = g_normalize_default_low_level)  or else
				(a_value = g_normalize_default_compose_low_level)  or else
				(a_value = g_normalize_nfc_low_level)  or else
				(a_value = g_normalize_nfd_low_level)  or else
				(a_value = g_normalize_nfkc_low_level)  or else
				(a_value = g_normalize_nfkd_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_normalize_all
		do
			value := g_normalize_all_low_level
		end

	set_g_normalize_all_compose
		do
			value := g_normalize_all_compose_low_level
		end

	set_g_normalize_default
		do
			value := g_normalize_default_low_level
		end

	set_g_normalize_default_compose
		do
			value := g_normalize_default_compose_low_level
		end

	set_g_normalize_nfc
		do
			value := g_normalize_nfc_low_level
		end

	set_g_normalize_nfd
		do
			value := g_normalize_nfd_low_level
		end

	set_g_normalize_nfkc
		do
			value := g_normalize_nfkc_low_level
		end

	set_g_normalize_nfkd
		do
			value := g_normalize_nfkd_low_level
		end

feature {ANY} -- Queries
	is_g_normalize_all: BOOLEAN
		do
			Result := (value=g_normalize_all_low_level)
		end

	is_g_normalize_all_compose: BOOLEAN
		do
			Result := (value=g_normalize_all_compose_low_level)
		end

	is_g_normalize_default: BOOLEAN
		do
			Result := (value=g_normalize_default_low_level)
		end

	is_g_normalize_default_compose: BOOLEAN
		do
			Result := (value=g_normalize_default_compose_low_level)
		end

	is_g_normalize_nfc: BOOLEAN
		do
			Result := (value=g_normalize_nfc_low_level)
		end

	is_g_normalize_nfd: BOOLEAN
		do
			Result := (value=g_normalize_nfd_low_level)
		end

	is_g_normalize_nfkc: BOOLEAN
		do
			Result := (value=g_normalize_nfkc_low_level)
		end

	is_g_normalize_nfkd: BOOLEAN
		do
			Result := (value=g_normalize_nfkd_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_normalize_all_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_ALL"
 			}"
 		end

	g_normalize_all_compose_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_ALL_COMPOSE"
 			}"
 		end

	g_normalize_default_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_DEFAULT"
 			}"
 		end

	g_normalize_default_compose_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_DEFAULT_COMPOSE"
 			}"
 		end

	g_normalize_nfc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFC"
 			}"
 		end

	g_normalize_nfd_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFD"
 			}"
 		end

	g_normalize_nfkc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFKC"
 			}"
 		end

	g_normalize_nfkd_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFKD"
 			}"
 		end


end -- class GNORMALIZE_MODE_ENUM
