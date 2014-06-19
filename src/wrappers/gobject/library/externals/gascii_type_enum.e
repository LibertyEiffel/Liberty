-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GASCII_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_ascii_alnum_low_level | 
				g_ascii_cntrl_low_level | 
				g_ascii_digit_low_level | 
				g_ascii_graph_low_level | 
				g_ascii_lower_low_level | 
				g_ascii_print_low_level | 
				g_ascii_punct_low_level | 
				g_ascii_space_low_level | 
				g_ascii_upper_low_level | 
				g_ascii_xdigit_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_ascii_alnum
		do
			value := value.bit_or(g_ascii_alnum_low_level)
		end

	unset_g_ascii_alnum
		do
			value := value.bit_xor(g_ascii_alnum_low_level)
		end

	set_g_ascii_cntrl
		do
			value := value.bit_or(g_ascii_cntrl_low_level)
		end

	unset_g_ascii_cntrl
		do
			value := value.bit_xor(g_ascii_cntrl_low_level)
		end

	set_g_ascii_digit
		do
			value := value.bit_or(g_ascii_digit_low_level)
		end

	unset_g_ascii_digit
		do
			value := value.bit_xor(g_ascii_digit_low_level)
		end

	set_g_ascii_graph
		do
			value := value.bit_or(g_ascii_graph_low_level)
		end

	unset_g_ascii_graph
		do
			value := value.bit_xor(g_ascii_graph_low_level)
		end

	set_g_ascii_lower
		do
			value := value.bit_or(g_ascii_lower_low_level)
		end

	unset_g_ascii_lower
		do
			value := value.bit_xor(g_ascii_lower_low_level)
		end

	set_g_ascii_print
		do
			value := value.bit_or(g_ascii_print_low_level)
		end

	unset_g_ascii_print
		do
			value := value.bit_xor(g_ascii_print_low_level)
		end

	set_g_ascii_punct
		do
			value := value.bit_or(g_ascii_punct_low_level)
		end

	unset_g_ascii_punct
		do
			value := value.bit_xor(g_ascii_punct_low_level)
		end

	set_g_ascii_space
		do
			value := value.bit_or(g_ascii_space_low_level)
		end

	unset_g_ascii_space
		do
			value := value.bit_xor(g_ascii_space_low_level)
		end

	set_g_ascii_upper
		do
			value := value.bit_or(g_ascii_upper_low_level)
		end

	unset_g_ascii_upper
		do
			value := value.bit_xor(g_ascii_upper_low_level)
		end

	set_g_ascii_xdigit
		do
			value := value.bit_or(g_ascii_xdigit_low_level)
		end

	unset_g_ascii_xdigit
		do
			value := value.bit_xor(g_ascii_xdigit_low_level)
		end

feature {ANY} -- Queries
	is_g_ascii_alnum: BOOLEAN
		do
			Result := (value=g_ascii_alnum_low_level)
		end

	is_g_ascii_cntrl: BOOLEAN
		do
			Result := (value=g_ascii_cntrl_low_level)
		end

	is_g_ascii_digit: BOOLEAN
		do
			Result := (value=g_ascii_digit_low_level)
		end

	is_g_ascii_graph: BOOLEAN
		do
			Result := (value=g_ascii_graph_low_level)
		end

	is_g_ascii_lower: BOOLEAN
		do
			Result := (value=g_ascii_lower_low_level)
		end

	is_g_ascii_print: BOOLEAN
		do
			Result := (value=g_ascii_print_low_level)
		end

	is_g_ascii_punct: BOOLEAN
		do
			Result := (value=g_ascii_punct_low_level)
		end

	is_g_ascii_space: BOOLEAN
		do
			Result := (value=g_ascii_space_low_level)
		end

	is_g_ascii_upper: BOOLEAN
		do
			Result := (value=g_ascii_upper_low_level)
		end

	is_g_ascii_xdigit: BOOLEAN
		do
			Result := (value=g_ascii_xdigit_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_ascii_alnum_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_ALNUM"
 			}"
 		end

	g_ascii_cntrl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_CNTRL"
 			}"
 		end

	g_ascii_digit_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_DIGIT"
 			}"
 		end

	g_ascii_graph_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_GRAPH"
 			}"
 		end

	g_ascii_lower_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_LOWER"
 			}"
 		end

	g_ascii_print_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PRINT"
 			}"
 		end

	g_ascii_punct_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PUNCT"
 			}"
 		end

	g_ascii_space_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_SPACE"
 			}"
 		end

	g_ascii_upper_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_UPPER"
 			}"
 		end

	g_ascii_xdigit_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_XDIGIT"
 			}"
 		end


end -- class GASCII_TYPE_ENUM
