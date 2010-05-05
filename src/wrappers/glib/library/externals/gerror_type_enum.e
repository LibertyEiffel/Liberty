-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GERROR_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = unexp__eof__in__string_low_level)  or else
				(a_value = unexp__eof__in__comment_low_level)  or else
				(a_value = non__digit__in__const_low_level)  or else
				(a_value = digit__radix_low_level)  or else
				(a_value = float__radix_low_level)  or else
				(a_value = float__malformed_low_level) )
		end

feature -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_unexp__eof__in__string is
		do
			value := unexp__eof__in__string_low_level
		end

	set_unexp__eof__in__comment is
		do
			value := unexp__eof__in__comment_low_level
		end

	set_non__digit__in__const is
		do
			value := non__digit__in__const_low_level
		end

	set_digit__radix is
		do
			value := digit__radix_low_level
		end

	set_float__radix is
		do
			value := float__radix_low_level
		end

	set_float__malformed is
		do
			value := float__malformed_low_level
		end

feature -- Queries
	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	is_unexp__eof__in__string: BOOLEAN is
		do
			Result := (value=unexp__eof__in__string_low_level)
		end

	is_unexp__eof__in__comment: BOOLEAN is
		do
			Result := (value=unexp__eof__in__comment_low_level)
		end

	is_non__digit__in__const: BOOLEAN is
		do
			Result := (value=non__digit__in__const_low_level)
		end

	is_digit__radix: BOOLEAN is
		do
			Result := (value=digit__radix_low_level)
		end

	is_float__radix: BOOLEAN is
		do
			Result := (value=float__radix_low_level)
		end

	is_float__malformed: BOOLEAN is
		do
			Result := (value=float__malformed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNKNOWN"
 			}"
 		end

	unexp__eof__in__string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_STRING"
 			}"
 		end

	unexp__eof__in__comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_COMMENT"
 			}"
 		end

	non__digit__in__const_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_NON_DIGIT_IN_CONST"
 			}"
 		end

	digit__radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_DIGIT_RADIX"
 			}"
 		end

	float__radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_RADIX"
 			}"
 		end

	float__malformed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_MALFORMED"
 			}"
 		end


end -- class GERROR_TYPE_ENUM
