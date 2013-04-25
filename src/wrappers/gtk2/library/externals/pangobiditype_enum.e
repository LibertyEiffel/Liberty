-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOBIDITYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_bidi_type_al_low_level)  or else
				(a_value = pango_bidi_type_an_low_level)  or else
				(a_value = pango_bidi_type_b_low_level)  or else
				(a_value = pango_bidi_type_bn_low_level)  or else
				(a_value = pango_bidi_type_cs_low_level)  or else
				(a_value = pango_bidi_type_en_low_level)  or else
				(a_value = pango_bidi_type_es_low_level)  or else
				(a_value = pango_bidi_type_et_low_level)  or else
				(a_value = pango_bidi_type_l_low_level)  or else
				(a_value = pango_bidi_type_lre_low_level)  or else
				(a_value = pango_bidi_type_lro_low_level)  or else
				(a_value = pango_bidi_type_nsm_low_level)  or else
				(a_value = pango_bidi_type_on_low_level)  or else
				(a_value = pango_bidi_type_pdf_low_level)  or else
				(a_value = pango_bidi_type_r_low_level)  or else
				(a_value = pango_bidi_type_rle_low_level)  or else
				(a_value = pango_bidi_type_rlo_low_level)  or else
				(a_value = pango_bidi_type_s_low_level)  or else
				(a_value = pango_bidi_type_ws_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_bidi_type_al is
		do
			value := pango_bidi_type_al_low_level
		end

	set_pango_bidi_type_an is
		do
			value := pango_bidi_type_an_low_level
		end

	set_pango_bidi_type_b is
		do
			value := pango_bidi_type_b_low_level
		end

	set_pango_bidi_type_bn is
		do
			value := pango_bidi_type_bn_low_level
		end

	set_pango_bidi_type_cs is
		do
			value := pango_bidi_type_cs_low_level
		end

	set_pango_bidi_type_en is
		do
			value := pango_bidi_type_en_low_level
		end

	set_pango_bidi_type_es is
		do
			value := pango_bidi_type_es_low_level
		end

	set_pango_bidi_type_et is
		do
			value := pango_bidi_type_et_low_level
		end

	set_pango_bidi_type_l is
		do
			value := pango_bidi_type_l_low_level
		end

	set_pango_bidi_type_lre is
		do
			value := pango_bidi_type_lre_low_level
		end

	set_pango_bidi_type_lro is
		do
			value := pango_bidi_type_lro_low_level
		end

	set_pango_bidi_type_nsm is
		do
			value := pango_bidi_type_nsm_low_level
		end

	set_pango_bidi_type_on is
		do
			value := pango_bidi_type_on_low_level
		end

	set_pango_bidi_type_pdf is
		do
			value := pango_bidi_type_pdf_low_level
		end

	set_pango_bidi_type_r is
		do
			value := pango_bidi_type_r_low_level
		end

	set_pango_bidi_type_rle is
		do
			value := pango_bidi_type_rle_low_level
		end

	set_pango_bidi_type_rlo is
		do
			value := pango_bidi_type_rlo_low_level
		end

	set_pango_bidi_type_s is
		do
			value := pango_bidi_type_s_low_level
		end

	set_pango_bidi_type_ws is
		do
			value := pango_bidi_type_ws_low_level
		end

feature {ANY} -- Queries
	is_pango_bidi_type_al: BOOLEAN is
		do
			Result := (value=pango_bidi_type_al_low_level)
		end

	is_pango_bidi_type_an: BOOLEAN is
		do
			Result := (value=pango_bidi_type_an_low_level)
		end

	is_pango_bidi_type_b: BOOLEAN is
		do
			Result := (value=pango_bidi_type_b_low_level)
		end

	is_pango_bidi_type_bn: BOOLEAN is
		do
			Result := (value=pango_bidi_type_bn_low_level)
		end

	is_pango_bidi_type_cs: BOOLEAN is
		do
			Result := (value=pango_bidi_type_cs_low_level)
		end

	is_pango_bidi_type_en: BOOLEAN is
		do
			Result := (value=pango_bidi_type_en_low_level)
		end

	is_pango_bidi_type_es: BOOLEAN is
		do
			Result := (value=pango_bidi_type_es_low_level)
		end

	is_pango_bidi_type_et: BOOLEAN is
		do
			Result := (value=pango_bidi_type_et_low_level)
		end

	is_pango_bidi_type_l: BOOLEAN is
		do
			Result := (value=pango_bidi_type_l_low_level)
		end

	is_pango_bidi_type_lre: BOOLEAN is
		do
			Result := (value=pango_bidi_type_lre_low_level)
		end

	is_pango_bidi_type_lro: BOOLEAN is
		do
			Result := (value=pango_bidi_type_lro_low_level)
		end

	is_pango_bidi_type_nsm: BOOLEAN is
		do
			Result := (value=pango_bidi_type_nsm_low_level)
		end

	is_pango_bidi_type_on: BOOLEAN is
		do
			Result := (value=pango_bidi_type_on_low_level)
		end

	is_pango_bidi_type_pdf: BOOLEAN is
		do
			Result := (value=pango_bidi_type_pdf_low_level)
		end

	is_pango_bidi_type_r: BOOLEAN is
		do
			Result := (value=pango_bidi_type_r_low_level)
		end

	is_pango_bidi_type_rle: BOOLEAN is
		do
			Result := (value=pango_bidi_type_rle_low_level)
		end

	is_pango_bidi_type_rlo: BOOLEAN is
		do
			Result := (value=pango_bidi_type_rlo_low_level)
		end

	is_pango_bidi_type_s: BOOLEAN is
		do
			Result := (value=pango_bidi_type_s_low_level)
		end

	is_pango_bidi_type_ws: BOOLEAN is
		do
			Result := (value=pango_bidi_type_ws_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_bidi_type_al_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_AL"
 			}"
 		end

	pango_bidi_type_an_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_AN"
 			}"
 		end

	pango_bidi_type_b_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_B"
 			}"
 		end

	pango_bidi_type_bn_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_BN"
 			}"
 		end

	pango_bidi_type_cs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_CS"
 			}"
 		end

	pango_bidi_type_en_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_EN"
 			}"
 		end

	pango_bidi_type_es_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ES"
 			}"
 		end

	pango_bidi_type_et_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ET"
 			}"
 		end

	pango_bidi_type_l_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_L"
 			}"
 		end

	pango_bidi_type_lre_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_LRE"
 			}"
 		end

	pango_bidi_type_lro_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_LRO"
 			}"
 		end

	pango_bidi_type_nsm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_NSM"
 			}"
 		end

	pango_bidi_type_on_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ON"
 			}"
 		end

	pango_bidi_type_pdf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_PDF"
 			}"
 		end

	pango_bidi_type_r_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_R"
 			}"
 		end

	pango_bidi_type_rle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_RLE"
 			}"
 		end

	pango_bidi_type_rlo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_RLO"
 			}"
 		end

	pango_bidi_type_s_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_S"
 			}"
 		end

	pango_bidi_type_ws_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_WS"
 			}"
 		end


end -- class PANGOBIDITYPE_ENUM
