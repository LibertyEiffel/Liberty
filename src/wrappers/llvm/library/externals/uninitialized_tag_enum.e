-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class UNINITIALIZED_TAG_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = uninitialized_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_uninitialized is
		do
			value := uninitialized_low_level
		end

feature {ANY} -- Queries
	is_uninitialized: BOOLEAN is
		do
			Result := (value=uninitialized_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	uninitialized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "uninitialized"
 			}"
 		end


end -- class UNINITIALIZED_TAG_ENUM
