-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_UPDATE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = continuous_low_level)  or else
				(a_value = discontinuous_low_level)  or else
				(a_value = delayed_low_level) )
		end

feature -- Setters
	default_create,
	set_continuous is
		do
			value := continuous_low_level
		end

	set_discontinuous is
		do
			value := discontinuous_low_level
		end

	set_delayed is
		do
			value := delayed_low_level
		end

feature -- Queries
	is_continuous: BOOLEAN is
		do
			Result := (value=continuous_low_level)
		end

	is_discontinuous: BOOLEAN is
		do
			Result := (value=discontinuous_low_level)
		end

	is_delayed: BOOLEAN is
		do
			Result := (value=delayed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	continuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_CONTINUOUS"
 			}"
 		end

	discontinuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_DISCONTINUOUS"
 			}"
 		end

	delayed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_DELAYED"
 			}"
 		end


end -- class GTK_UPDATE_TYPE_ENUM
