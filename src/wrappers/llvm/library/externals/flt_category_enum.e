-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLT_CATEGORY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = infinity_low_level)  or else
				(a_value = na_n_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = zero_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_infinity
		do
			value := infinity_low_level
		end

	set_na_n
		do
			value := na_n_low_level
		end

	set_normal
		do
			value := normal_low_level
		end

	set_zero
		do
			value := zero_low_level
		end

feature {ANY} -- Queries
	is_infinity: BOOLEAN
		do
			Result := (value=infinity_low_level)
		end

	is_na_n: BOOLEAN
		do
			Result := (value=na_n_low_level)
		end

	is_normal: BOOLEAN
		do
			Result := (value=normal_low_level)
		end

	is_zero: BOOLEAN
		do
			Result := (value=zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	infinity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcInfinity"
 			}"
 		end

	na_n_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNaN"
 			}"
 		end

	normal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNormal"
 			}"
 		end

	zero_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcZero"
 			}"
 		end


end -- class FLT_CATEGORY_ENUM
