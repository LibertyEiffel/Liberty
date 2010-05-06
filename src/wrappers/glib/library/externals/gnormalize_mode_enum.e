-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GNORMALIZE_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_external_low_level)  or else
				(a_value = default__compose_low_level)  or else
				(a_value = nfc_low_level)  or else
				(a_value = all_low_level)  or else
				(a_value = nfkd_low_level)  or else
				(a_value = all__compose_low_level)  or else
				(a_value = nfkc_low_level) )
		end

feature -- Setters
	default_create,
	set_default_external is
		do
			value := default_external_low_level
		end

	set_default__compose is
		do
			value := default__compose_low_level
		end

	set_nfc is
		do
			value := nfc_low_level
		end

	set_all is
		do
			value := all_low_level
		end

	set_nfkd is
		do
			value := nfkd_low_level
		end

	set_all__compose is
		do
			value := all__compose_low_level
		end

	set_nfkc is
		do
			value := nfkc_low_level
		end

feature -- Queries
	is_default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	is_default__compose: BOOLEAN is
		do
			Result := (value=default__compose_low_level)
		end

	is_nfc: BOOLEAN is
		do
			Result := (value=nfc_low_level)
		end

	is_all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	is_nfkd: BOOLEAN is
		do
			Result := (value=nfkd_low_level)
		end

	is_all__compose: BOOLEAN is
		do
			Result := (value=all__compose_low_level)
		end

	is_nfkc: BOOLEAN is
		do
			Result := (value=nfkc_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_DEFAULT"
 			}"
 		end

	default__compose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_DEFAULT_COMPOSE"
 			}"
 		end

	nfc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFC"
 			}"
 		end

	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_ALL"
 			}"
 		end

	nfkd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFKD"
 			}"
 		end

	all__compose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_ALL_COMPOSE"
 			}"
 		end

	nfkc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_NORMALIZE_NFKC"
 			}"
 		end


end -- class GNORMALIZE_MODE_ENUM
