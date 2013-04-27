-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLT_CATEGORY_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = fc_infinity_low_level)  or else
				(a_value = fc_na_n_low_level)  or else
				(a_value = fc_normal_low_level)  or else
				(a_value = fc_zero_low_level) )
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = infinity_low_level)  or else
				(a_value = na_n_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = zero_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_fc_infinity is
		do
			value := fc_infinity_low_level
		end

	set_fc_na_n is
		do
			value := fc_na_n_low_level
		end

	set_fc_normal is
		do
			value := fc_normal_low_level
		end

	set_fc_zero is
		do
			value := fc_zero_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_fc_infinity: BOOLEAN is
=======
feature {ANY} -- Queries
	infinity: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=fc_infinity_low_level)
		end

	is_fc_na_n: BOOLEAN is
		do
			Result := (value=fc_na_n_low_level)
		end

	is_fc_normal: BOOLEAN is
		do
			Result := (value=fc_normal_low_level)
		end

	is_fc_zero: BOOLEAN is
		do
			Result := (value=fc_zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fc_infinity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcInfinity"
 			}"
 		end

	fc_na_n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNaN"
 			}"
 		end

	fc_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcNormal"
 			}"
 		end

	fc_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fcZero"
 			}"
 		end


end -- class FLT_CATEGORY_ENUM
