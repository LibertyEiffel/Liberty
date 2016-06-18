-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_ASCII_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
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
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_alnum
		do
			value := value.bit_or(g_ascii_alnum)
		end

	unset_alnum
		do
			value := value.bit_xor(g_ascii_alnum)
		end

	set_alpha
		do
			value := value.bit_or(g_ascii_alpha)
		end

	unset_alpha
		do
			value := value.bit_xor(g_ascii_alpha)
		end

	set_cntrl
		do
			value := value.bit_or(g_ascii_cntrl)
		end

	unset_cntrl
		do
			value := value.bit_xor(g_ascii_cntrl)
		end

	set_digit
		do
			value := value.bit_or(g_ascii_digit)
		end

	unset_digit
		do
			value := value.bit_xor(g_ascii_digit)
		end

	set_graph
		do
			value := value.bit_or(g_ascii_graph)
		end

	unset_graph
		do
			value := value.bit_xor(g_ascii_graph)
		end

	set_lower
		do
			value := value.bit_or(g_ascii_lower)
		end

	unset_lower
		do
			value := value.bit_xor(g_ascii_lower)
		end

	set_print
		do
			value := value.bit_or(g_ascii_print)
		end

	unset_print
		do
			value := value.bit_xor(g_ascii_print)
		end

	set_punct
		do
			value := value.bit_or(g_ascii_punct)
		end

	unset_punct
		do
			value := value.bit_xor(g_ascii_punct)
		end

	set_space
		do
			value := value.bit_or(g_ascii_space)
		end

	unset_space
		do
			value := value.bit_xor(g_ascii_space)
		end

	set_upper
		do
			value := value.bit_or(g_ascii_upper)
		end

	unset_upper
		do
			value := value.bit_xor(g_ascii_upper)
		end

	set_xdigit
		do
			value := value.bit_or(g_ascii_xdigit)
		end

	unset_xdigit
		do
			value := value.bit_xor(g_ascii_xdigit)
		end


feature {ANY} -- Queries
	is_alnum: BOOLEAN
		do
			Result := (value &g_ascii_alnum).to_boolean
		end

	is_alpha: BOOLEAN
		do
			Result := (value &g_ascii_alpha).to_boolean
		end

	is_cntrl: BOOLEAN
		do
			Result := (value &g_ascii_cntrl).to_boolean
		end

	is_digit: BOOLEAN
		do
			Result := (value &g_ascii_digit).to_boolean
		end

	is_graph: BOOLEAN
		do
			Result := (value &g_ascii_graph).to_boolean
		end

	is_lower: BOOLEAN
		do
			Result := (value &g_ascii_lower).to_boolean
		end

	is_print: BOOLEAN
		do
			Result := (value &g_ascii_print).to_boolean
		end

	is_punct: BOOLEAN
		do
			Result := (value &g_ascii_punct).to_boolean
		end

	is_space: BOOLEAN
		do
			Result := (value &g_ascii_space).to_boolean
		end

	is_upper: BOOLEAN
		do
			Result := (value &g_ascii_upper).to_boolean
		end

	is_xdigit: BOOLEAN
		do
			Result := (value &g_ascii_xdigit).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_ascii_alnum: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_ALNUM"
		end

	g_ascii_alpha: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_ALPHA"
		end

	g_ascii_cntrl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_CNTRL"
		end

	g_ascii_digit: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_DIGIT"
		end

	g_ascii_graph: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_GRAPH"
		end

	g_ascii_lower: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_LOWER"
		end

	g_ascii_print: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_PRINT"
		end

	g_ascii_punct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_PUNCT"
		end

	g_ascii_space: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_SPACE"
		end

	g_ascii_upper: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_UPPER"
		end

	g_ascii_xdigit: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ASCII_XDIGIT"
		end


end

