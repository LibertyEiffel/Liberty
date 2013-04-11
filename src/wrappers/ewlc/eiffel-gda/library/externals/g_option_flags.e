-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_OPTION_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_option_flag_hidden | 
				g_option_flag_in_main | 
				g_option_flag_reverse | 
				g_option_flag_no_arg | 
				g_option_flag_filename | 
				g_option_flag_optional_arg | 
				g_option_flag_noalias)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_hidden is
		do
			value := value.bit_or(g_option_flag_hidden)
		end

	unset_hidden is
		do
			value := value.bit_xor(g_option_flag_hidden)
		end

	set_in_main is
		do
			value := value.bit_or(g_option_flag_in_main)
		end

	unset_in_main is
		do
			value := value.bit_xor(g_option_flag_in_main)
		end

	set_reverse is
		do
			value := value.bit_or(g_option_flag_reverse)
		end

	unset_reverse is
		do
			value := value.bit_xor(g_option_flag_reverse)
		end

	set_no_arg is
		do
			value := value.bit_or(g_option_flag_no_arg)
		end

	unset_no_arg is
		do
			value := value.bit_xor(g_option_flag_no_arg)
		end

	set_filename is
		do
			value := value.bit_or(g_option_flag_filename)
		end

	unset_filename is
		do
			value := value.bit_xor(g_option_flag_filename)
		end

	set_optional_arg is
		do
			value := value.bit_or(g_option_flag_optional_arg)
		end

	unset_optional_arg is
		do
			value := value.bit_xor(g_option_flag_optional_arg)
		end

	set_noalias is
		do
			value := value.bit_or(g_option_flag_noalias)
		end

	unset_noalias is
		do
			value := value.bit_xor(g_option_flag_noalias)
		end


feature {ANY} -- Queries
	is_hidden: BOOLEAN is
		do
			Result := (value &g_option_flag_hidden).to_boolean
		end

	is_in_main: BOOLEAN is
		do
			Result := (value &g_option_flag_in_main).to_boolean
		end

	is_reverse: BOOLEAN is
		do
			Result := (value &g_option_flag_reverse).to_boolean
		end

	is_no_arg: BOOLEAN is
		do
			Result := (value &g_option_flag_no_arg).to_boolean
		end

	is_filename: BOOLEAN is
		do
			Result := (value &g_option_flag_filename).to_boolean
		end

	is_optional_arg: BOOLEAN is
		do
			Result := (value &g_option_flag_optional_arg).to_boolean
		end

	is_noalias: BOOLEAN is
		do
			Result := (value &g_option_flag_noalias).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_flag_hidden: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_HIDDEN"
		end

	g_option_flag_in_main: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_IN_MAIN"
		end

	g_option_flag_reverse: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_REVERSE"
		end

	g_option_flag_no_arg: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_NO_ARG"
		end

	g_option_flag_filename: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_FILENAME"
		end

	g_option_flag_optional_arg: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_OPTIONAL_ARG"
		end

	g_option_flag_noalias: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_NOALIAS"
		end


end

