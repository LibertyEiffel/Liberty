-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_FONT_MASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (family_low_level | 
				variant_external_low_level | 
				weight_low_level | 
				stretch_low_level | 
				size_low_level | 
				gravity_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_family is
		do
			value := value.bit_or(family_low_level)
		end

	unset_family is
		do
			value := value.bit_xor(family_low_level)
		end

	set_variant_external is
		do
			value := value.bit_or(variant_external_low_level)
		end

	unset_variant_external is
		do
			value := value.bit_xor(variant_external_low_level)
		end

	set_weight is
		do
			value := value.bit_or(weight_low_level)
		end

	unset_weight is
		do
			value := value.bit_xor(weight_low_level)
		end

	set_stretch is
		do
			value := value.bit_or(stretch_low_level)
		end

	unset_stretch is
		do
			value := value.bit_xor(stretch_low_level)
		end

	set_size is
		do
			value := value.bit_or(size_low_level)
		end

	unset_size is
		do
			value := value.bit_xor(size_low_level)
		end

	set_gravity is
		do
			value := value.bit_or(gravity_low_level)
		end

	unset_gravity is
		do
			value := value.bit_xor(gravity_low_level)
		end

feature {ANY} -- Queries
	is_family: BOOLEAN is
		do
			Result := (value=family_low_level)
		end

	is_variant_external: BOOLEAN is
		do
			Result := (value=variant_external_low_level)
		end

	is_weight: BOOLEAN is
		do
			Result := (value=weight_low_level)
		end

	is_stretch: BOOLEAN is
		do
			Result := (value=stretch_low_level)
		end

	is_size: BOOLEAN is
		do
			Result := (value=size_low_level)
		end

	is_gravity: BOOLEAN is
		do
			Result := (value=gravity_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	family_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_FAMILY"
 			}"
 		end

	variant_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_VARIANT"
 			}"
 		end

	weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_WEIGHT"
 			}"
 		end

	stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_STRETCH"
 			}"
 		end

	size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_SIZE"
 			}"
 		end

	gravity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PANGO_FONT_MASK_GRAVITY"
 			}"
 		end


end -- class PANGO_FONT_MASK_ENUM
