-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_option_flag_filename_low_level | 
				g_option_flag_in_main_low_level | 
				g_option_flag_no_arg_low_level | 
				g_option_flag_noalias_low_level | 
				g_option_flag_optional_arg_low_level | 
				g_option_flag_reverse_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_option_flag_filename
		do
			value := value.bit_or(g_option_flag_filename_low_level)
		end

	unset_g_option_flag_filename
		do
			value := value.bit_xor(g_option_flag_filename_low_level)
		end

	set_g_option_flag_in_main
		do
			value := value.bit_or(g_option_flag_in_main_low_level)
		end

	unset_g_option_flag_in_main
		do
			value := value.bit_xor(g_option_flag_in_main_low_level)
		end

	set_g_option_flag_no_arg
		do
			value := value.bit_or(g_option_flag_no_arg_low_level)
		end

	unset_g_option_flag_no_arg
		do
			value := value.bit_xor(g_option_flag_no_arg_low_level)
		end

	set_g_option_flag_noalias
		do
			value := value.bit_or(g_option_flag_noalias_low_level)
		end

	unset_g_option_flag_noalias
		do
			value := value.bit_xor(g_option_flag_noalias_low_level)
		end

	set_g_option_flag_optional_arg
		do
			value := value.bit_or(g_option_flag_optional_arg_low_level)
		end

	unset_g_option_flag_optional_arg
		do
			value := value.bit_xor(g_option_flag_optional_arg_low_level)
		end

	set_g_option_flag_reverse
		do
			value := value.bit_or(g_option_flag_reverse_low_level)
		end

	unset_g_option_flag_reverse
		do
			value := value.bit_xor(g_option_flag_reverse_low_level)
		end

feature {ANY} -- Queries
	is_g_option_flag_filename: BOOLEAN
		do
			Result := (value=g_option_flag_filename_low_level)
		end

	is_g_option_flag_in_main: BOOLEAN
		do
			Result := (value=g_option_flag_in_main_low_level)
		end

	is_g_option_flag_no_arg: BOOLEAN
		do
			Result := (value=g_option_flag_no_arg_low_level)
		end

	is_g_option_flag_noalias: BOOLEAN
		do
			Result := (value=g_option_flag_noalias_low_level)
		end

	is_g_option_flag_optional_arg: BOOLEAN
		do
			Result := (value=g_option_flag_optional_arg_low_level)
		end

	is_g_option_flag_reverse: BOOLEAN
		do
			Result := (value=g_option_flag_reverse_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_flag_filename_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_FILENAME"
 			}"
 		end

	g_option_flag_in_main_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_IN_MAIN"
 			}"
 		end

	g_option_flag_no_arg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NO_ARG"
 			}"
 		end

	g_option_flag_noalias_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NOALIAS"
 			}"
 		end

	g_option_flag_optional_arg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_OPTIONAL_ARG"
 			}"
 		end

	g_option_flag_reverse_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_REVERSE"
 			}"
 		end


end -- class GOPTION_FLAGS_ENUM
