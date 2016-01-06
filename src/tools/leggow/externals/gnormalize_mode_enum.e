-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GNORMALIZE_MODE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = all_low_level)  or else
				(a_value = all_compose_low_level)  or else
				(a_value = default_compose_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = nfc_low_level)  or else
				(a_value = nfd_low_level)  or else
				(a_value = nfkc_low_level)  or else
				(a_value = nfkd_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_all
               do
                       value := all_low_level
               end

	set_all_compose
               do
                       value := all_compose_low_level
               end

	set_default_compose
               do
                       value := default_compose_low_level
               end

	set_default_external
               do
                       value := default_external_low_level
               end

	set_nfc
               do
                       value := nfc_low_level
               end

	set_nfd
               do
                       value := nfd_low_level
               end

	set_nfkc
               do
                       value := nfkc_low_level
               end

	set_nfkd
               do
                       value := nfkd_low_level
               end

feature {ANY} -- Queries
       is_all: BOOLEAN
               do
                       Result := (value=all_low_level)
               end

       is_all_compose: BOOLEAN
               do
                       Result := (value=all_compose_low_level)
               end

       is_default_compose: BOOLEAN
               do
                       Result := (value=default_compose_low_level)
               end

       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_nfc: BOOLEAN
               do
                       Result := (value=nfc_low_level)
               end

       is_nfd: BOOLEAN
               do
                       Result := (value=nfd_low_level)
               end

       is_nfkc: BOOLEAN
               do
                       Result := (value=nfkc_low_level)
               end

       is_nfkd: BOOLEAN
               do
                       Result := (value=nfkd_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     all_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_ALL"
                       }"
               end

     all_compose_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_ALL_COMPOSE"
                       }"
               end

     default_compose_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_DEFAULT_COMPOSE"
                       }"
               end

     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_DEFAULT"
                       }"
               end

     nfc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_NFC"
                       }"
               end

     nfd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_NFD"
                       }"
               end

     nfkc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_NFKC"
                       }"
               end

     nfkd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_NORMALIZE_NFKD"
                       }"
               end


end -- class GNORMALIZE_MODE_ENUM
