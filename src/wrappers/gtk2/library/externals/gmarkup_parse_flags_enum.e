-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_PARSE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (do_not_use_this_unsupported_flag_low_level | 
				prefix_error_position_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_do_not_use_this_unsupported_flag is
		do
			value := value.bit_or(do_not_use_this_unsupported_flag_low_level)
		end

	unset_do_not_use_this_unsupported_flag is
		do
			value := value.bit_xor(do_not_use_this_unsupported_flag_low_level)
		end

	set_prefix_error_position is
		do
			value := value.bit_or(prefix_error_position_low_level)
		end

	unset_prefix_error_position is
		do
			value := value.bit_xor(prefix_error_position_low_level)
		end

feature {ANY} -- Queries
	is_do_not_use_this_unsupported_flag: BOOLEAN is
		do
			Result := (value=do_not_use_this_unsupported_flag_low_level)
		end

	is_prefix_error_position: BOOLEAN is
		do
			Result := (value=prefix_error_position_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	do_not_use_this_unsupported_flag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG"
 			}"
 		end

	prefix_error_position_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_MARKUP_PREFIX_ERROR_POSITION"
 			}"
 		end


end -- class GMARKUP_PARSE_FLAGS_ENUM
