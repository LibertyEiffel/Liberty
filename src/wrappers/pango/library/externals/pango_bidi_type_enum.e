-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_BIDI_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = l_low_level)  or else
				(a_value = lre_low_level)  or else
				(a_value = lro_low_level)  or else
				(a_value = r_low_level)  or else
				(a_value = al_low_level)  or else
				(a_value = rle_low_level)  or else
				(a_value = rlo_low_level)  or else
				(a_value = pdf_low_level)  or else
				(a_value = en_low_level)  or else
				(a_value = es_low_level)  or else
				(a_value = et_low_level)  or else
				(a_value = an_low_level)  or else
				(a_value = cs_low_level)  or else
				(a_value = nsm_low_level)  or else
				(a_value = bn_low_level)  or else
				(a_value = b_low_level)  or else
				(a_value = s_low_level)  or else
				(a_value = ws_low_level)  or else
				(a_value = on_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_l is
		do
			value := l_low_level
		end

	set_lre is
		do
			value := lre_low_level
		end

	set_lro is
		do
			value := lro_low_level
		end

	set_r is
		do
			value := r_low_level
		end

	set_al is
		do
			value := al_low_level
		end

	set_rle is
		do
			value := rle_low_level
		end

	set_rlo is
		do
			value := rlo_low_level
		end

	set_pdf is
		do
			value := pdf_low_level
		end

	set_en is
		do
			value := en_low_level
		end

	set_es is
		do
			value := es_low_level
		end

	set_et is
		do
			value := et_low_level
		end

	set_an is
		do
			value := an_low_level
		end

	set_cs is
		do
			value := cs_low_level
		end

	set_nsm is
		do
			value := nsm_low_level
		end

	set_bn is
		do
			value := bn_low_level
		end

	set_b is
		do
			value := b_low_level
		end

	set_s is
		do
			value := s_low_level
		end

	set_ws is
		do
			value := ws_low_level
		end

	set_on is
		do
			value := on_low_level
		end

feature {ANY} -- Queries
	is_l: BOOLEAN is
		do
			Result := (value=l_low_level)
		end

	is_lre: BOOLEAN is
		do
			Result := (value=lre_low_level)
		end

	is_lro: BOOLEAN is
		do
			Result := (value=lro_low_level)
		end

	is_r: BOOLEAN is
		do
			Result := (value=r_low_level)
		end

	is_al: BOOLEAN is
		do
			Result := (value=al_low_level)
		end

	is_rle: BOOLEAN is
		do
			Result := (value=rle_low_level)
		end

	is_rlo: BOOLEAN is
		do
			Result := (value=rlo_low_level)
		end

	is_pdf: BOOLEAN is
		do
			Result := (value=pdf_low_level)
		end

	is_en: BOOLEAN is
		do
			Result := (value=en_low_level)
		end

	is_es: BOOLEAN is
		do
			Result := (value=es_low_level)
		end

	is_et: BOOLEAN is
		do
			Result := (value=et_low_level)
		end

	is_an: BOOLEAN is
		do
			Result := (value=an_low_level)
		end

	is_cs: BOOLEAN is
		do
			Result := (value=cs_low_level)
		end

	is_nsm: BOOLEAN is
		do
			Result := (value=nsm_low_level)
		end

	is_bn: BOOLEAN is
		do
			Result := (value=bn_low_level)
		end

	is_b: BOOLEAN is
		do
			Result := (value=b_low_level)
		end

	is_s: BOOLEAN is
		do
			Result := (value=s_low_level)
		end

	is_ws: BOOLEAN is
		do
			Result := (value=ws_low_level)
		end

	is_on: BOOLEAN is
		do
			Result := (value=on_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	l_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_L"
 			}"
 		end

	lre_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_LRE"
 			}"
 		end

	lro_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_LRO"
 			}"
 		end

	r_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_R"
 			}"
 		end

	al_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_AL"
 			}"
 		end

	rle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_RLE"
 			}"
 		end

	rlo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_RLO"
 			}"
 		end

	pdf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_PDF"
 			}"
 		end

	en_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_EN"
 			}"
 		end

	es_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ES"
 			}"
 		end

	et_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ET"
 			}"
 		end

	an_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_AN"
 			}"
 		end

	cs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_CS"
 			}"
 		end

	nsm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_NSM"
 			}"
 		end

	bn_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_BN"
 			}"
 		end

	b_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_B"
 			}"
 		end

	s_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_S"
 			}"
 		end

	ws_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_WS"
 			}"
 		end

	on_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_BIDI_TYPE_ON"
 			}"
 		end


end -- class PANGO_BIDI_TYPE_ENUM
