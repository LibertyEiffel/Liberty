-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GASCII_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_ascii_alnum is
		do
			value := value.bit_or(g_ascii_alnum_low_level)
		end

	unset_g_ascii_alnum is
		do
			value := value.bit_xor(g_ascii_alnum_low_level)
		end

	set_g_ascii_cntrl is
		do
			value := value.bit_or(g_ascii_cntrl_low_level)
		end

	unset_g_ascii_cntrl is
		do
			value := value.bit_xor(g_ascii_cntrl_low_level)
		end

	set_g_ascii_digit is
		do
			value := value.bit_or(g_ascii_digit_low_level)
		end

	unset_g_ascii_digit is
		do
			value := value.bit_xor(g_ascii_digit_low_level)
		end

	set_g_ascii_graph is
		do
			value := value.bit_or(g_ascii_graph_low_level)
		end

	unset_g_ascii_graph is
		do
			value := value.bit_xor(g_ascii_graph_low_level)
		end

	set_g_ascii_lower is
		do
			value := value.bit_or(g_ascii_lower_low_level)
		end

	unset_g_ascii_lower is
		do
			value := value.bit_xor(g_ascii_lower_low_level)
		end

	set_g_ascii_print is
		do
			value := value.bit_or(g_ascii_print_low_level)
		end

	unset_g_ascii_print is
		do
			value := value.bit_xor(g_ascii_print_low_level)
		end

	set_g_ascii_punct is
		do
			value := value.bit_or(g_ascii_punct_low_level)
		end

	unset_g_ascii_punct is
		do
			value := value.bit_xor(g_ascii_punct_low_level)
		end

	set_g_ascii_space is
		do
			value := value.bit_or(g_ascii_space_low_level)
		end

	unset_g_ascii_space is
		do
			value := value.bit_xor(g_ascii_space_low_level)
		end

	set_g_ascii_upper is
		do
			value := value.bit_or(g_ascii_upper_low_level)
		end

	unset_g_ascii_upper is
		do
			value := value.bit_xor(g_ascii_upper_low_level)
		end

	set_g_ascii_xdigit is
		do
			value := value.bit_or(g_ascii_xdigit_low_level)
		end

	unset_g_ascii_xdigit is
		do
			value := value.bit_xor(g_ascii_xdigit_low_level)
		end

feature -- Queries
	is_g_ascii_alnum: BOOLEAN is
		do
			Result := (value=g_ascii_alnum_low_level)
		end

	is_g_ascii_cntrl: BOOLEAN is
		do
			Result := (value=g_ascii_cntrl_low_level)
		end

	is_g_ascii_digit: BOOLEAN is
		do
			Result := (value=g_ascii_digit_low_level)
		end

	is_g_ascii_graph: BOOLEAN is
		do
			Result := (value=g_ascii_graph_low_level)
		end

	is_g_ascii_lower: BOOLEAN is
		do
			Result := (value=g_ascii_lower_low_level)
		end

	is_g_ascii_print: BOOLEAN is
		do
			Result := (value=g_ascii_print_low_level)
		end

	is_g_ascii_punct: BOOLEAN is
		do
			Result := (value=g_ascii_punct_low_level)
		end

	is_g_ascii_space: BOOLEAN is
		do
			Result := (value=g_ascii_space_low_level)
		end

	is_g_ascii_upper: BOOLEAN is
		do
			Result := (value=g_ascii_upper_low_level)
		end

	is_g_ascii_xdigit: BOOLEAN is
		do
			Result := (value=g_ascii_xdigit_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_ascii_alnum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_ALNUM"
 			}"
 		end

	g_ascii_cntrl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_CNTRL"
 			}"
 		end

	g_ascii_digit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_DIGIT"
 			}"
 		end

	g_ascii_graph_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_GRAPH"
 			}"
 		end

	g_ascii_lower_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_LOWER"
 			}"
 		end

	g_ascii_print_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PRINT"
 			}"
 		end

	g_ascii_punct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PUNCT"
 			}"
 		end

	g_ascii_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_SPACE"
 			}"
 		end

	g_ascii_upper_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_UPPER"
 			}"
 		end

	g_ascii_xdigit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_XDIGIT"
 			}"
 		end


end -- class GASCII_TYPE_ENUM
