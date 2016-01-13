-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GMARKUP_PARSE_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (do_not_use_this_unsupported_flag_low_level | 
				ignore_qualified_low_level | 
				prefix_error_position_low_level | 
				treat_cdata_as_text_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_do_not_use_this_unsupported_flag
               do
                       value := value.bit_or(do_not_use_this_unsupported_flag_low_level)
               end

	unset_do_not_use_this_unsupported_flag
               do
                       value := value.bit_xor(do_not_use_this_unsupported_flag_low_level)
               end

	set_ignore_qualified
               do
                       value := value.bit_or(ignore_qualified_low_level)
               end

	unset_ignore_qualified
               do
                       value := value.bit_xor(ignore_qualified_low_level)
               end

	set_prefix_error_position
               do
                       value := value.bit_or(prefix_error_position_low_level)
               end

	unset_prefix_error_position
               do
                       value := value.bit_xor(prefix_error_position_low_level)
               end

	set_treat_cdata_as_text
               do
                       value := value.bit_or(treat_cdata_as_text_low_level)
               end

	unset_treat_cdata_as_text
               do
                       value := value.bit_xor(treat_cdata_as_text_low_level)
               end

feature {ANY} -- Queries
       is_do_not_use_this_unsupported_flag: BOOLEAN
               do
                       Result := (value=do_not_use_this_unsupported_flag_low_level)
               end

       is_ignore_qualified: BOOLEAN
               do
                       Result := (value=ignore_qualified_low_level)
               end

       is_prefix_error_position: BOOLEAN
               do
                       Result := (value=prefix_error_position_low_level)
               end

       is_treat_cdata_as_text: BOOLEAN
               do
                       Result := (value=treat_cdata_as_text_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     do_not_use_this_unsupported_flag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG"
                       }"
               end

     ignore_qualified_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_IGNORE_QUALIFIED"
                       }"
               end

     prefix_error_position_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_PREFIX_ERROR_POSITION"
                       }"
               end

     treat_cdata_as_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_TREAT_CDATA_AS_TEXT"
                       }"
               end


end -- class GMARKUP_PARSE_FLAGS_ENUM
