-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_ASCII_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_ascii_alnum | 
				g_ascii_alpha | 
				g_ascii_cntrl | 
				g_ascii_digit | 
				g_ascii_graph | 
				g_ascii_lower | 
				g_ascii_print | 
				g_ascii_punct | 
				g_ascii_space | 
				g_ascii_upper | 
				g_ascii_xdigit)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_alnum is
		do
			value := value.bit_or(g_ascii_alnum)
		end

	unset_alnum is
		do
			value := value.bit_xor(g_ascii_alnum)
		end

	set_alpha is
		do
			value := value.bit_or(g_ascii_alpha)
		end

	unset_alpha is
		do
			value := value.bit_xor(g_ascii_alpha)
		end

	set_cntrl is
		do
			value := value.bit_or(g_ascii_cntrl)
		end

	unset_cntrl is
		do
			value := value.bit_xor(g_ascii_cntrl)
		end

	set_digit is
		do
			value := value.bit_or(g_ascii_digit)
		end

	unset_digit is
		do
			value := value.bit_xor(g_ascii_digit)
		end

	set_graph is
		do
			value := value.bit_or(g_ascii_graph)
		end

	unset_graph is
		do
			value := value.bit_xor(g_ascii_graph)
		end

	set_lower is
		do
			value := value.bit_or(g_ascii_lower)
		end

	unset_lower is
		do
			value := value.bit_xor(g_ascii_lower)
		end

	set_print is
		do
			value := value.bit_or(g_ascii_print)
		end

	unset_print is
		do
			value := value.bit_xor(g_ascii_print)
		end

	set_punct is
		do
			value := value.bit_or(g_ascii_punct)
		end

	unset_punct is
		do
			value := value.bit_xor(g_ascii_punct)
		end

	set_space is
		do
			value := value.bit_or(g_ascii_space)
		end

	unset_space is
		do
			value := value.bit_xor(g_ascii_space)
		end

	set_upper is
		do
			value := value.bit_or(g_ascii_upper)
		end

	unset_upper is
		do
			value := value.bit_xor(g_ascii_upper)
		end

	set_xdigit is
		do
			value := value.bit_or(g_ascii_xdigit)
		end

	unset_xdigit is
		do
			value := value.bit_xor(g_ascii_xdigit)
		end


feature {ANY} -- Queries
	is_alnum: BOOLEAN is
		do
			Result := (value &g_ascii_alnum).to_boolean
		end

	is_alpha: BOOLEAN is
		do
			Result := (value &g_ascii_alpha).to_boolean
		end

	is_cntrl: BOOLEAN is
		do
			Result := (value &g_ascii_cntrl).to_boolean
		end

	is_digit: BOOLEAN is
		do
			Result := (value &g_ascii_digit).to_boolean
		end

	is_graph: BOOLEAN is
		do
			Result := (value &g_ascii_graph).to_boolean
		end

	is_lower: BOOLEAN is
		do
			Result := (value &g_ascii_lower).to_boolean
		end

	is_print: BOOLEAN is
		do
			Result := (value &g_ascii_print).to_boolean
		end

	is_punct: BOOLEAN is
		do
			Result := (value &g_ascii_punct).to_boolean
		end

	is_space: BOOLEAN is
		do
			Result := (value &g_ascii_space).to_boolean
		end

	is_upper: BOOLEAN is
		do
			Result := (value &g_ascii_upper).to_boolean
		end

	is_xdigit: BOOLEAN is
		do
			Result := (value &g_ascii_xdigit).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_ascii_alnum: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_ALNUM"
		end

	g_ascii_alpha: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_ALPHA"
		end

	g_ascii_cntrl: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_CNTRL"
		end

	g_ascii_digit: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_DIGIT"
		end

	g_ascii_graph: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_GRAPH"
		end

	g_ascii_lower: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_LOWER"
		end

	g_ascii_print: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_PRINT"
		end

	g_ascii_punct: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_PUNCT"
		end

	g_ascii_space: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_SPACE"
		end

	g_ascii_upper: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_UPPER"
		end

	g_ascii_xdigit: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_XDIGIT"
		end


end

