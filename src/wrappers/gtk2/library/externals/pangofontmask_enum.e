-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOFONTMASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (pango_font_mask_family_low_level | 
				pango_font_mask_size_low_level | 
				pango_font_mask_stretch_low_level | 
				pango_font_mask_style_low_level | 
				pango_font_mask_variant_low_level | 
				pango_font_mask_weight_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_pango_font_mask_family is
		do
			value := value.bit_or(pango_font_mask_family_low_level)
		end

	unset_pango_font_mask_family is
		do
			value := value.bit_xor(pango_font_mask_family_low_level)
		end

	set_pango_font_mask_size is
		do
			value := value.bit_or(pango_font_mask_size_low_level)
		end

	unset_pango_font_mask_size is
		do
			value := value.bit_xor(pango_font_mask_size_low_level)
		end

	set_pango_font_mask_stretch is
		do
			value := value.bit_or(pango_font_mask_stretch_low_level)
		end

	unset_pango_font_mask_stretch is
		do
			value := value.bit_xor(pango_font_mask_stretch_low_level)
		end

	set_pango_font_mask_style is
		do
			value := value.bit_or(pango_font_mask_style_low_level)
		end

	unset_pango_font_mask_style is
		do
			value := value.bit_xor(pango_font_mask_style_low_level)
		end

	set_pango_font_mask_variant is
		do
			value := value.bit_or(pango_font_mask_variant_low_level)
		end

	unset_pango_font_mask_variant is
		do
			value := value.bit_xor(pango_font_mask_variant_low_level)
		end

	set_pango_font_mask_weight is
		do
			value := value.bit_or(pango_font_mask_weight_low_level)
		end

	unset_pango_font_mask_weight is
		do
			value := value.bit_xor(pango_font_mask_weight_low_level)
		end

feature {ANY} -- Queries
	is_pango_font_mask_family: BOOLEAN is
		do
			Result := (value=pango_font_mask_family_low_level)
		end

	is_pango_font_mask_size: BOOLEAN is
		do
			Result := (value=pango_font_mask_size_low_level)
		end

	is_pango_font_mask_stretch: BOOLEAN is
		do
			Result := (value=pango_font_mask_stretch_low_level)
		end

	is_pango_font_mask_style: BOOLEAN is
		do
			Result := (value=pango_font_mask_style_low_level)
		end

	is_pango_font_mask_variant: BOOLEAN is
		do
			Result := (value=pango_font_mask_variant_low_level)
		end

	is_pango_font_mask_weight: BOOLEAN is
		do
			Result := (value=pango_font_mask_weight_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_font_mask_family_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_FAMILY"
 			}"
 		end

	pango_font_mask_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_SIZE"
 			}"
 		end

	pango_font_mask_stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_STRETCH"
 			}"
 		end

	pango_font_mask_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_STYLE"
 			}"
 		end

	pango_font_mask_variant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_VARIANT"
 			}"
 		end

	pango_font_mask_weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_WEIGHT"
 			}"
 		end


end -- class PANGOFONTMASK_ENUM
