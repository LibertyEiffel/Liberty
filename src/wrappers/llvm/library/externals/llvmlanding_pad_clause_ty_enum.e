-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMLANDING_PAD_CLAUSE_TY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = catch_low_level)  or else
				(a_value = filter_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_catch
		do
			value := catch_low_level
		end

	set_filter
		do
			value := filter_low_level
		end

feature {ANY} -- Queries
	is_catch: BOOLEAN
		do
			Result := (value=catch_low_level)
		end

	is_filter: BOOLEAN
		do
			Result := (value=filter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	catch_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLandingPadCatch"
 			}"
 		end

	filter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLandingPadFilter"
 			}"
 		end


end -- class LLVMLANDING_PAD_CLAUSE_TY_ENUM
