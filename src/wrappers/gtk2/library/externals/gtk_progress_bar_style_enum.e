-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PROGRESS_BAR_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = continuous_low_level)  or else
				(a_value = discrete_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_continuous is
		do
			value := continuous_low_level
		end

	set_discrete is
		do
			value := discrete_low_level
		end

feature {ANY} -- Queries
	continuous: BOOLEAN is
		do
			Result := (value=continuous_low_level)
		end

	discrete: BOOLEAN is
		do
			Result := (value=discrete_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	continuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_CONTINUOUS"
 			}"
 		end

	discrete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_DISCRETE"
 			}"
 		end


end -- class GTK_PROGRESS_BAR_STYLE_ENUM
