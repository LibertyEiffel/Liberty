-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class SYNCHRONIZATION_SCOPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cross_thread_low_level)  or else
				(a_value = single_thread_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cross_thread
		do
			value := cross_thread_low_level
		end

	set_single_thread
		do
			value := single_thread_low_level
		end

feature {ANY} -- Queries
	is_cross_thread: BOOLEAN
		do
			Result := (value=cross_thread_low_level)
		end

	is_single_thread: BOOLEAN
		do
			Result := (value=single_thread_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cross_thread_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CrossThread"
 			}"
 		end

	single_thread_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SingleThread"
 			}"
 		end


end -- class SYNCHRONIZATION_SCOPE_ENUM
