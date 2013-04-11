-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RC_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (fg_low_level | 
				text_low_level | 
				base_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_fg is
		do
			value := value.bit_or(fg_low_level)
		end

	unset_fg is
		do
			value := value.bit_xor(fg_low_level)
		end

	set_text is
		do
			value := value.bit_or(text_low_level)
		end

	unset_text is
		do
			value := value.bit_xor(text_low_level)
		end

	set_base is
		do
			value := value.bit_or(base_low_level)
		end

	unset_base is
		do
			value := value.bit_xor(base_low_level)
		end

feature {ANY} -- Queries
	is_fg: BOOLEAN is
		do
			Result := (value=fg_low_level)
		end

	is_text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	is_base: BOOLEAN is
		do
			Result := (value=base_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_FG"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_TEXT"
 			}"
 		end

	base_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_BASE"
 			}"
 		end


end -- class GTK_RC_FLAGS_ENUM
