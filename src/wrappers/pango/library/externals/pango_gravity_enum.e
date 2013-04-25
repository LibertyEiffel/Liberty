-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_GRAVITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = south_low_level)  or else
				(a_value = east_low_level)  or else
				(a_value = north_low_level)  or else
				(a_value = west_low_level)  or else
				(a_value = auto_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_south is
		do
			value := south_low_level
		end

	set_east is
		do
			value := east_low_level
		end

	set_north is
		do
			value := north_low_level
		end

	set_west is
		do
			value := west_low_level
		end

	set_auto is
		do
			value := auto_low_level
		end

feature {ANY} -- Queries
	is_south: BOOLEAN is
		do
			Result := (value=south_low_level)
		end

	is_east: BOOLEAN is
		do
			Result := (value=east_low_level)
		end

	is_north: BOOLEAN is
		do
			Result := (value=north_low_level)
		end

	is_west: BOOLEAN is
		do
			Result := (value=west_low_level)
		end

	is_auto: BOOLEAN is
		do
			Result := (value=auto_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_SOUTH"
 			}"
 		end

	east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_EAST"
 			}"
 		end

	north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_NORTH"
 			}"
 		end

	west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_WEST"
 			}"
 		end

	auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_AUTO"
 			}"
 		end


end -- class PANGO_GRAVITY_ENUM
