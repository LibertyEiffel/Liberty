-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class FUNCTION_CLASS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = c94_low_level)  or else
				(a_value = c99_math_complex_low_level)  or else
				(a_value = c99_misc_low_level)  or else
				(a_value = sincos_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_c94
               do
                       value := c94_low_level
               end

	set_c99_math_complex
               do
                       value := c99_math_complex_low_level
               end

	set_c99_misc
               do
                       value := c99_misc_low_level
               end

	set_sincos
               do
                       value := sincos_low_level
               end

feature {ANY} -- Queries
       is_c94: BOOLEAN
               do
                       Result := (value=c94_low_level)
               end

       is_c99_math_complex: BOOLEAN
               do
                       Result := (value=c99_math_complex_low_level)
               end

       is_c99_misc: BOOLEAN
               do
                       Result := (value=c99_misc_low_level)
               end

       is_sincos: BOOLEAN
               do
                       Result := (value=sincos_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     c94_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "function_c94"
                       }"
               end

     c99_math_complex_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "function_c99_math_complex"
                       }"
               end

     c99_misc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "function_c99_misc"
                       }"
               end

     sincos_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "function_sincos"
                       }"
               end


end -- class FUNCTION_CLASS_ENUM
