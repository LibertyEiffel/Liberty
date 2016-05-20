-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CLAUSE_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = catch_low_level)  or else
				(a_value = filter_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_catch is
		do
			value := catch_low_level
		end

	set_filter is
		do
			value := filter_low_level
		end

feature {ANY} -- Queries
	is_catch: BOOLEAN is
		do
			Result := (value=catch_low_level)
		end

	is_filter: BOOLEAN is
		do
			Result := (value=filter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	catch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Catch"
 			}"
 		end

	filter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Filter"
 			}"
 		end


end -- class CLAUSE_TYPE_ENUM
