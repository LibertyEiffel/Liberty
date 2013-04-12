-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_option_flag_filename_low_level | 
				g_option_flag_in_main_low_level | 
				g_option_flag_no_arg_low_level | 
				g_option_flag_noalias_low_level | 
				g_option_flag_optional_arg_low_level | 
				g_option_flag_reverse_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_g_option_flag_filename is
		do
			value := value.bit_or(g_option_flag_filename_low_level)
		end

	unset_g_option_flag_filename is
		do
			value := value.bit_xor(g_option_flag_filename_low_level)
		end

	set_g_option_flag_in_main is
		do
			value := value.bit_or(g_option_flag_in_main_low_level)
		end

	unset_g_option_flag_in_main is
		do
			value := value.bit_xor(g_option_flag_in_main_low_level)
		end

	set_g_option_flag_no_arg is
		do
			value := value.bit_or(g_option_flag_no_arg_low_level)
		end

	unset_g_option_flag_no_arg is
		do
			value := value.bit_xor(g_option_flag_no_arg_low_level)
		end

	set_g_option_flag_noalias is
		do
			value := value.bit_or(g_option_flag_noalias_low_level)
		end

	unset_g_option_flag_noalias is
		do
			value := value.bit_xor(g_option_flag_noalias_low_level)
		end

	set_g_option_flag_optional_arg is
		do
			value := value.bit_or(g_option_flag_optional_arg_low_level)
		end

	unset_g_option_flag_optional_arg is
		do
			value := value.bit_xor(g_option_flag_optional_arg_low_level)
		end

	set_g_option_flag_reverse is
		do
			value := value.bit_or(g_option_flag_reverse_low_level)
		end

	unset_g_option_flag_reverse is
		do
			value := value.bit_xor(g_option_flag_reverse_low_level)
		end

feature -- Queries
	is_g_option_flag_filename: BOOLEAN is
		do
			Result := (value=g_option_flag_filename_low_level)
		end

	is_g_option_flag_in_main: BOOLEAN is
		do
			Result := (value=g_option_flag_in_main_low_level)
		end

	is_g_option_flag_no_arg: BOOLEAN is
		do
			Result := (value=g_option_flag_no_arg_low_level)
		end

	is_g_option_flag_noalias: BOOLEAN is
		do
			Result := (value=g_option_flag_noalias_low_level)
		end

	is_g_option_flag_optional_arg: BOOLEAN is
		do
			Result := (value=g_option_flag_optional_arg_low_level)
		end

	is_g_option_flag_reverse: BOOLEAN is
		do
			Result := (value=g_option_flag_reverse_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_flag_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_FILENAME"
 			}"
 		end

	g_option_flag_in_main_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_IN_MAIN"
 			}"
 		end

	g_option_flag_no_arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NO_ARG"
 			}"
 		end

	g_option_flag_noalias_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_NOALIAS"
 			}"
 		end

	g_option_flag_optional_arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_OPTIONAL_ARG"
 			}"
 		end

	g_option_flag_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_OPTION_FLAG_REVERSE"
 			}"
 		end


end -- class GOPTION_FLAGS_ENUM
