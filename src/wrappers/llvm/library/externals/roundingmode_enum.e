-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ROUNDINGMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nearesttiestoeven_low_level)  or else
				(a_value = towardnegative_low_level)  or else
				(a_value = towardzero_low_level)  or else
				(a_value = nearesttiestoaway_low_level) )
		end

feature -- Setters
	default_create,
	set_nearesttiestoeven is
		do
			value := nearesttiestoeven_low_level
		end

	set_towardnegative is
		do
			value := towardnegative_low_level
		end

	set_towardzero is
		do
			value := towardzero_low_level
		end

	set_nearesttiestoaway is
		do
			value := nearesttiestoaway_low_level
		end

feature -- Queries
	is_nearesttiestoeven: BOOLEAN is
		do
			Result := (value=nearesttiestoeven_low_level)
		end

	is_towardnegative: BOOLEAN is
		do
			Result := (value=towardnegative_low_level)
		end

	is_towardzero: BOOLEAN is
		do
			Result := (value=towardzero_low_level)
		end

	is_nearesttiestoaway: BOOLEAN is
		do
			Result := (value=nearesttiestoaway_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nearesttiestoeven_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "rmNearestTiesToEven"
 			}"
 		end

	towardnegative_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "rmTowardNegative"
 			}"
 		end

	towardzero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "rmTowardZero"
 			}"
 		end

	nearesttiestoaway_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "rmNearestTiesToAway"
 			}"
 		end


end -- class ROUNDINGMODE_ENUM
