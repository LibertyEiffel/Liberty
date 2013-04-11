-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ICON_LOOKUP_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (no_svg_low_level | 
				use_builtin_low_level | 
				generic_fallback_low_level | 
				force_size_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_no_svg is
		do
			value := value.bit_or(no_svg_low_level)
		end

	unset_no_svg is
		do
			value := value.bit_xor(no_svg_low_level)
		end

	set_use_builtin is
		do
			value := value.bit_or(use_builtin_low_level)
		end

	unset_use_builtin is
		do
			value := value.bit_xor(use_builtin_low_level)
		end

	set_generic_fallback is
		do
			value := value.bit_or(generic_fallback_low_level)
		end

	unset_generic_fallback is
		do
			value := value.bit_xor(generic_fallback_low_level)
		end

	set_force_size is
		do
			value := value.bit_or(force_size_low_level)
		end

	unset_force_size is
		do
			value := value.bit_xor(force_size_low_level)
		end

feature {ANY} -- Queries
	is_no_svg: BOOLEAN is
		do
			Result := (value=no_svg_low_level)
		end

	is_use_builtin: BOOLEAN is
		do
			Result := (value=use_builtin_low_level)
		end

	is_generic_fallback: BOOLEAN is
		do
			Result := (value=generic_fallback_low_level)
		end

	is_force_size: BOOLEAN is
		do
			Result := (value=force_size_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no_svg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_NO_SVG"
 			}"
 		end

	use_builtin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_USE_BUILTIN"
 			}"
 		end

	generic_fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_GENERIC_FALLBACK"
 			}"
 		end

	force_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_FORCE_SIZE"
 			}"
 		end


end -- class GTK_ICON_LOOKUP_FLAGS_ENUM
