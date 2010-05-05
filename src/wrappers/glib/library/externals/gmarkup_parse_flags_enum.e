-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_PARSE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (do__not__use__this__unsupported__flag_low_level | 
				prefix__error__position_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_do__not__use__this__unsupported__flag is
		do
			value := value.bit_or(do__not__use__this__unsupported__flag_low_level)
		end

	unset_do__not__use__this__unsupported__flag is
		do
			value := value.bit_xor(do__not__use__this__unsupported__flag_low_level)
		end

	set_prefix__error__position is
		do
			value := value.bit_or(prefix__error__position_low_level)
		end

	unset_prefix__error__position is
		do
			value := value.bit_xor(prefix__error__position_low_level)
		end

feature -- Queries
	is_do__not__use__this__unsupported__flag: BOOLEAN is
		do
			Result := (value=do__not__use__this__unsupported__flag_low_level)
		end

	is_prefix__error__position: BOOLEAN is
		do
			Result := (value=prefix__error__position_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	do__not__use__this__unsupported__flag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG"
 			}"
 		end

	prefix__error__position_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_PREFIX_ERROR_POSITION"
 			}"
 		end


end -- class GMARKUP_PARSE_FLAGS_ENUM
