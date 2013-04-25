-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_CAP_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = not_last_low_level)  or else
				(a_value = butt_low_level)  or else
				(a_value = round_low_level)  or else
				(a_value = projecting_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_not_last is
		do
			value := not_last_low_level
		end

	set_butt is
		do
			value := butt_low_level
		end

	set_round is
		do
			value := round_low_level
		end

	set_projecting is
		do
			value := projecting_low_level
		end

feature {ANY} -- Queries
	not_last: BOOLEAN is
		do
			Result := (value=not_last_low_level)
		end

	butt: BOOLEAN is
		do
			Result := (value=butt_low_level)
		end

	round: BOOLEAN is
		do
			Result := (value=round_low_level)
		end

	projecting: BOOLEAN is
		do
			Result := (value=projecting_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	not_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CAP_NOT_LAST"
 			}"
 		end

	butt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CAP_BUTT"
 			}"
 		end

	round_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CAP_ROUND"
 			}"
 		end

	projecting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CAP_PROJECTING"
 			}"
 		end


end -- class GDK_CAP_STYLE_ENUM
