-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CMP_RESULT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cmp_equal_low_level)  or else
				(a_value = cmp_greater_than_low_level)  or else
				(a_value = cmp_less_than_low_level)  or else
				(a_value = cmp_unordered_low_level) )
		end

feature -- Setters
	default_create,
	set_cmp_equal is
		do
			value := cmp_equal_low_level
		end

	set_cmp_greater_than is
		do
			value := cmp_greater_than_low_level
		end

	set_cmp_less_than is
		do
			value := cmp_less_than_low_level
		end

	set_cmp_unordered is
		do
			value := cmp_unordered_low_level
		end

feature -- Queries
	is_cmp_equal: BOOLEAN is
		do
			Result := (value=cmp_equal_low_level)
		end

	is_cmp_greater_than: BOOLEAN is
		do
			Result := (value=cmp_greater_than_low_level)
		end

	is_cmp_less_than: BOOLEAN is
		do
			Result := (value=cmp_less_than_low_level)
		end

	is_cmp_unordered: BOOLEAN is
		do
			Result := (value=cmp_unordered_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cmp_equal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "cmpEqual"
 			}"
 		end

	cmp_greater_than_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "cmpGreaterThan"
 			}"
 		end

	cmp_less_than_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "cmpLessThan"
 			}"
 		end

	cmp_unordered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "cmpUnordered"
 			}"
 		end


end -- class CMP_RESULT_ENUM
