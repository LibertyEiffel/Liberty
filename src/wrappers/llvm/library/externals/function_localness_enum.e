-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FUNCTION_LOCALNESS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = fl_no_low_level)  or else
				(a_value = fl_unknown_low_level)  or else
				(a_value = fl_yes_low_level) )
		end

feature -- Setters
	default_create,
	set_fl_no is
		do
			value := fl_no_low_level
		end

	set_fl_unknown is
		do
			value := fl_unknown_low_level
		end

	set_fl_yes is
		do
			value := fl_yes_low_level
		end

feature -- Queries
	is_fl_no: BOOLEAN is
		do
			Result := (value=fl_no_low_level)
		end

	is_fl_unknown: BOOLEAN is
		do
			Result := (value=fl_unknown_low_level)
		end

	is_fl_yes: BOOLEAN is
		do
			Result := (value=fl_yes_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fl_no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_No"
 			}"
 		end

	fl_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_Unknown"
 			}"
 		end

	fl_yes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_Yes"
 			}"
 		end


end -- class FUNCTION_LOCALNESS_ENUM
