-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTHREAD_PRIORITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = low_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = high_low_level)  or else
				(a_value = urgent_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_low is
		do
			value := low_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_high is
		do
			value := high_low_level
		end

	set_urgent is
		do
			value := urgent_low_level
		end

feature {ANY} -- Queries
	is_low: BOOLEAN is
		do
			Result := (value=low_low_level)
		end

	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_high: BOOLEAN is
		do
			Result := (value=high_low_level)
		end

	is_urgent: BOOLEAN is
		do
			Result := (value=urgent_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	low_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_LOW"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_NORMAL"
 			}"
 		end

	high_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_HIGH"
 			}"
 		end

	urgent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_URGENT"
 			}"
 		end


end -- class GTHREAD_PRIORITY_ENUM
