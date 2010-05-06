-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (hidden_low_level | 
				reverse_low_level | 
				no__arg_low_level | 
				filename_low_level | 
				optional__arg_low_level | 
				noalias_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_hidden is
		do
			value := value.bit_or(hidden_low_level)
		end

	unset_hidden is
		do
			value := value.bit_xor(hidden_low_level)
		end

	set_reverse is
		do
			value := value.bit_or(reverse_low_level)
		end

	unset_reverse is
		do
			value := value.bit_xor(reverse_low_level)
		end

	set_no__arg is
		do
			value := value.bit_or(no__arg_low_level)
		end

	unset_no__arg is
		do
			value := value.bit_xor(no__arg_low_level)
		end

	set_filename is
		do
			value := value.bit_or(filename_low_level)
		end

	unset_filename is
		do
			value := value.bit_xor(filename_low_level)
		end

	set_optional__arg is
		do
			value := value.bit_or(optional__arg_low_level)
		end

	unset_optional__arg is
		do
			value := value.bit_xor(optional__arg_low_level)
		end

	set_noalias is
		do
			value := value.bit_or(noalias_low_level)
		end

	unset_noalias is
		do
			value := value.bit_xor(noalias_low_level)
		end

feature -- Queries
	is_hidden: BOOLEAN is
		do
			Result := (value=hidden_low_level)
		end

	is_reverse: BOOLEAN is
		do
			Result := (value=reverse_low_level)
		end

	is_no__arg: BOOLEAN is
		do
			Result := (value=no__arg_low_level)
		end

	is_filename: BOOLEAN is
		do
			Result := (value=filename_low_level)
		end

	is_optional__arg: BOOLEAN is
		do
			Result := (value=optional__arg_low_level)
		end

	is_noalias: BOOLEAN is
		do
			Result := (value=noalias_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	hidden_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_HIDDEN"
 			}"
 		end

	reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_REVERSE"
 			}"
 		end

	no__arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NO_ARG"
 			}"
 		end

	filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_FILENAME"
 			}"
 		end

	optional__arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_OPTIONAL_ARG"
 			}"
 		end

	noalias_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NOALIAS"
 			}"
 		end


end -- class GOPTION_FLAGS_ENUM
