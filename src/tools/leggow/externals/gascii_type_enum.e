-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GASCII_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (alnum_low_level | 
				alpha_low_level | 
				cntrl_low_level | 
				digit_low_level | 
				graph_low_level | 
				lower_low_level | 
				print_low_level | 
				punct_low_level | 
				space_low_level | 
				upper_low_level | 
				xdigit_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_alnum
               do
                       value := value.bit_or(alnum_low_level)
               end

	unset_alnum
               do
                       value := value.bit_xor(alnum_low_level)
               end

	set_alpha
               do
                       value := value.bit_or(alpha_low_level)
               end

	unset_alpha
               do
                       value := value.bit_xor(alpha_low_level)
               end

	set_cntrl
               do
                       value := value.bit_or(cntrl_low_level)
               end

	unset_cntrl
               do
                       value := value.bit_xor(cntrl_low_level)
               end

	set_digit
               do
                       value := value.bit_or(digit_low_level)
               end

	unset_digit
               do
                       value := value.bit_xor(digit_low_level)
               end

	set_graph
               do
                       value := value.bit_or(graph_low_level)
               end

	unset_graph
               do
                       value := value.bit_xor(graph_low_level)
               end

	set_lower
               do
                       value := value.bit_or(lower_low_level)
               end

	unset_lower
               do
                       value := value.bit_xor(lower_low_level)
               end

	set_print
               do
                       value := value.bit_or(print_low_level)
               end

	unset_print
               do
                       value := value.bit_xor(print_low_level)
               end

	set_punct
               do
                       value := value.bit_or(punct_low_level)
               end

	unset_punct
               do
                       value := value.bit_xor(punct_low_level)
               end

	set_space
               do
                       value := value.bit_or(space_low_level)
               end

	unset_space
               do
                       value := value.bit_xor(space_low_level)
               end

	set_upper
               do
                       value := value.bit_or(upper_low_level)
               end

	unset_upper
               do
                       value := value.bit_xor(upper_low_level)
               end

	set_xdigit
               do
                       value := value.bit_or(xdigit_low_level)
               end

	unset_xdigit
               do
                       value := value.bit_xor(xdigit_low_level)
               end

feature {ANY} -- Queries
       is_alnum: BOOLEAN
               do
                       Result := (value=alnum_low_level)
               end

       is_alpha: BOOLEAN
               do
                       Result := (value=alpha_low_level)
               end

       is_cntrl: BOOLEAN
               do
                       Result := (value=cntrl_low_level)
               end

       is_digit: BOOLEAN
               do
                       Result := (value=digit_low_level)
               end

       is_graph: BOOLEAN
               do
                       Result := (value=graph_low_level)
               end

       is_lower: BOOLEAN
               do
                       Result := (value=lower_low_level)
               end

       is_print: BOOLEAN
               do
                       Result := (value=print_low_level)
               end

       is_punct: BOOLEAN
               do
                       Result := (value=punct_low_level)
               end

       is_space: BOOLEAN
               do
                       Result := (value=space_low_level)
               end

       is_upper: BOOLEAN
               do
                       Result := (value=upper_low_level)
               end

       is_xdigit: BOOLEAN
               do
                       Result := (value=xdigit_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     alnum_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_ALNUM"
                       }"
               end

     alpha_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_ALPHA"
                       }"
               end

     cntrl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_CNTRL"
                       }"
               end

     digit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_DIGIT"
                       }"
               end

     graph_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_GRAPH"
                       }"
               end

     lower_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_LOWER"
                       }"
               end

     print_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_PRINT"
                       }"
               end

     punct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_PUNCT"
                       }"
               end

     space_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_SPACE"
                       }"
               end

     upper_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_UPPER"
                       }"
               end

     xdigit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ASCII_XDIGIT"
                       }"
               end


end -- class GASCII_TYPE_ENUM
