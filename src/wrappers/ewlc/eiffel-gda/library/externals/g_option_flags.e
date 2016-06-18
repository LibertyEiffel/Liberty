-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_OPTION_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
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
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_hidden
		do
			value := value.bit_or(g_option_flag_hidden)
		end

	unset_hidden
		do
			value := value.bit_xor(g_option_flag_hidden)
		end

	set_in_main
		do
			value := value.bit_or(g_option_flag_in_main)
		end

	unset_in_main
		do
			value := value.bit_xor(g_option_flag_in_main)
		end

	set_reverse
		do
			value := value.bit_or(g_option_flag_reverse)
		end

	unset_reverse
		do
			value := value.bit_xor(g_option_flag_reverse)
		end

	set_no_arg
		do
			value := value.bit_or(g_option_flag_no_arg)
		end

	unset_no_arg
		do
			value := value.bit_xor(g_option_flag_no_arg)
		end

	set_filename
		do
			value := value.bit_or(g_option_flag_filename)
		end

	unset_filename
		do
			value := value.bit_xor(g_option_flag_filename)
		end

	set_optional_arg
		do
			value := value.bit_or(g_option_flag_optional_arg)
		end

	unset_optional_arg
		do
			value := value.bit_xor(g_option_flag_optional_arg)
		end

	set_noalias
		do
			value := value.bit_or(g_option_flag_noalias)
		end

	unset_noalias
		do
			value := value.bit_xor(g_option_flag_noalias)
		end


feature {ANY} -- Queries
	is_hidden: BOOLEAN
		do
			Result := (value &g_option_flag_hidden).to_boolean
		end

	is_in_main: BOOLEAN
		do
			Result := (value &g_option_flag_in_main).to_boolean
		end

	is_reverse: BOOLEAN
		do
			Result := (value &g_option_flag_reverse).to_boolean
		end

	is_no_arg: BOOLEAN
		do
			Result := (value &g_option_flag_no_arg).to_boolean
		end

	is_filename: BOOLEAN
		do
			Result := (value &g_option_flag_filename).to_boolean
		end

	is_optional_arg: BOOLEAN
		do
			Result := (value &g_option_flag_optional_arg).to_boolean
		end

	is_noalias: BOOLEAN
		do
			Result := (value &g_option_flag_noalias).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_flag_hidden: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_HIDDEN"
		end

	g_option_flag_in_main: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_IN_MAIN"
		end

	g_option_flag_reverse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_REVERSE"
		end

	g_option_flag_no_arg: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_NO_ARG"
		end

	g_option_flag_filename: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_FILENAME"
		end

	g_option_flag_optional_arg: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_OPTIONAL_ARG"
		end

	g_option_flag_noalias: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_FLAG_NOALIAS"
		end


end

