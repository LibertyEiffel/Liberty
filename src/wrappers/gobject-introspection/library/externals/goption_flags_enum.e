-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (filename_low_level | 
				hidden_low_level | 
				in_main_low_level | 
				no_arg_low_level | 
				noalias_low_level | 
				optional_arg_low_level | 
				reverse_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_filename
		do
			value := value.bit_or(filename_low_level)
		end

	unset_filename
		do
			value := value.bit_xor(filename_low_level)
		end

	set_hidden
		do
			value := value.bit_or(hidden_low_level)
		end

	unset_hidden
		do
			value := value.bit_xor(hidden_low_level)
		end

	set_in_main
		do
			value := value.bit_or(in_main_low_level)
		end

	unset_in_main
		do
			value := value.bit_xor(in_main_low_level)
		end

	set_no_arg
		do
			value := value.bit_or(no_arg_low_level)
		end

	unset_no_arg
		do
			value := value.bit_xor(no_arg_low_level)
		end

	set_noalias
		do
			value := value.bit_or(noalias_low_level)
		end

	unset_noalias
		do
			value := value.bit_xor(noalias_low_level)
		end

	set_optional_arg
		do
			value := value.bit_or(optional_arg_low_level)
		end

	unset_optional_arg
		do
			value := value.bit_xor(optional_arg_low_level)
		end

	set_reverse
		do
			value := value.bit_or(reverse_low_level)
		end

	unset_reverse
		do
			value := value.bit_xor(reverse_low_level)
		end

feature {ANY} -- Queries
	is_filename: BOOLEAN
		do
			Result := (value=filename_low_level)
		end

	is_hidden: BOOLEAN
		do
			Result := (value=hidden_low_level)
		end

	is_in_main: BOOLEAN
		do
			Result := (value=in_main_low_level)
		end

	is_no_arg: BOOLEAN
		do
			Result := (value=no_arg_low_level)
		end

	is_noalias: BOOLEAN
		do
			Result := (value=noalias_low_level)
		end

	is_optional_arg: BOOLEAN
		do
			Result := (value=optional_arg_low_level)
		end

	is_reverse: BOOLEAN
		do
			Result := (value=reverse_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	filename_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_FILENAME"
 			}"
 		end

	hidden_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_HIDDEN"
 			}"
 		end

	in_main_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_IN_MAIN"
 			}"
 		end

	no_arg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NO_ARG"
 			}"
 		end

	noalias_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NOALIAS"
 			}"
 		end

	optional_arg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_OPTIONAL_ARG"
 			}"
 		end

	reverse_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_REVERSE"
 			}"
 		end


end -- class GOPTION_FLAGS_ENUM
