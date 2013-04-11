-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GASCII_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (alnum_low_level | 
				cntrl_low_level | 
				digit_low_level | 
				graph_low_level | 
				lower_low_level | 
				print_low_level | 
				punct_low_level | 
				space_low_level | 
				upper_low_level | 
				xdigit_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_alnum is
		do
			value := value.bit_or(alnum_low_level)
		end

	unset_alnum is
		do
			value := value.bit_xor(alnum_low_level)
		end

	set_cntrl is
		do
			value := value.bit_or(cntrl_low_level)
		end

	unset_cntrl is
		do
			value := value.bit_xor(cntrl_low_level)
		end

	set_digit is
		do
			value := value.bit_or(digit_low_level)
		end

	unset_digit is
		do
			value := value.bit_xor(digit_low_level)
		end

	set_graph is
		do
			value := value.bit_or(graph_low_level)
		end

	unset_graph is
		do
			value := value.bit_xor(graph_low_level)
		end

	set_lower is
		do
			value := value.bit_or(lower_low_level)
		end

	unset_lower is
		do
			value := value.bit_xor(lower_low_level)
		end

	set_print is
		do
			value := value.bit_or(print_low_level)
		end

	unset_print is
		do
			value := value.bit_xor(print_low_level)
		end

	set_punct is
		do
			value := value.bit_or(punct_low_level)
		end

	unset_punct is
		do
			value := value.bit_xor(punct_low_level)
		end

	set_space is
		do
			value := value.bit_or(space_low_level)
		end

	unset_space is
		do
			value := value.bit_xor(space_low_level)
		end

	set_upper is
		do
			value := value.bit_or(upper_low_level)
		end

	unset_upper is
		do
			value := value.bit_xor(upper_low_level)
		end

	set_xdigit is
		do
			value := value.bit_or(xdigit_low_level)
		end

	unset_xdigit is
		do
			value := value.bit_xor(xdigit_low_level)
		end

feature {ANY} -- Queries
	is_alnum: BOOLEAN is
		do
			Result := (value=alnum_low_level)
		end

	is_cntrl: BOOLEAN is
		do
			Result := (value=cntrl_low_level)
		end

	is_digit: BOOLEAN is
		do
			Result := (value=digit_low_level)
		end

	is_graph: BOOLEAN is
		do
			Result := (value=graph_low_level)
		end

	is_lower: BOOLEAN is
		do
			Result := (value=lower_low_level)
		end

	is_print: BOOLEAN is
		do
			Result := (value=print_low_level)
		end

	is_punct: BOOLEAN is
		do
			Result := (value=punct_low_level)
		end

	is_space: BOOLEAN is
		do
			Result := (value=space_low_level)
		end

	is_upper: BOOLEAN is
		do
			Result := (value=upper_low_level)
		end

	is_xdigit: BOOLEAN is
		do
			Result := (value=xdigit_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	alnum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_ALNUM"
 			}"
 		end

	cntrl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_CNTRL"
 			}"
 		end

	digit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_DIGIT"
 			}"
 		end

	graph_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_GRAPH"
 			}"
 		end

	lower_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_LOWER"
 			}"
 		end

	print_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PRINT"
 			}"
 		end

	punct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_PUNCT"
 			}"
 		end

	space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_SPACE"
 			}"
 		end

	upper_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_UPPER"
 			}"
 		end

	xdigit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_ASCII_XDIGIT"
 			}"
 		end


end -- class GASCII_TYPE_ENUM
