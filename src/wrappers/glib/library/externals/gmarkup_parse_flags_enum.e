-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_PARSE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (use_this_unsupported_flag_low_level | 
				error_position_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_use_this_unsupported_flag is
		do
			value := value.bit_or(use_this_unsupported_flag_low_level)
		end

	unset_use_this_unsupported_flag is
		do
			value := value.bit_xor(use_this_unsupported_flag_low_level)
		end

	set_error_position is
		do
			value := value.bit_or(error_position_low_level)
		end

	unset_error_position is
		do
			value := value.bit_xor(error_position_low_level)
		end

feature -- Queries
	is_use_this_unsupported_flag: BOOLEAN is
		do
			Result := (value=use_this_unsupported_flag_low_level)
		end

	is_error_position: BOOLEAN is
		do
			Result := (value=error_position_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	use_this_unsupported_flag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG"
 			}"
 		end

	error_position_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_PREFIX_ERROR_POSITION"
 			}"
 		end


end -- class GMARKUP_PARSE_FLAGS_ENUM
