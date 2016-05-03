-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLT_CATEGORY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = infinity_low_level)  or else
				(a_value = na_n_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = zero_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_infinity is
		do
			value := infinity_low_level
		end

	set_na_n is
		do
			value := na_n_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_zero is
		do
			value := zero_low_level
		end

feature {ANY} -- Queries
	is_infinity: BOOLEAN is
		do
			Result := (value=infinity_low_level)
		end

	is_na_n: BOOLEAN is
		do
			Result := (value=na_n_low_level)
		end

	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_zero: BOOLEAN is
		do
			Result := (value=zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	infinity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcInfinity"
 			}"
 		end

	na_n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNaN"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNormal"
 			}"
 		end

	zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcZero"
 			}"
 		end


end -- class FLT_CATEGORY_ENUM
