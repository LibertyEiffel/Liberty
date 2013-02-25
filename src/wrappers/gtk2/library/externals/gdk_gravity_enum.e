-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_GRAVITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = north_west_low_level)  or else
				(a_value = north_low_level)  or else
				(a_value = north_east_low_level)  or else
				(a_value = west_low_level)  or else
				(a_value = center_low_level)  or else
				(a_value = east_low_level)  or else
				(a_value = south_west_low_level)  or else
				(a_value = south_low_level)  or else
				(a_value = south_east_low_level)  or else
				(a_value = static_low_level) )
		end

feature -- Setters
	default_create,
	set_north_west is
		do
			value := north_west_low_level
		end

	set_north is
		do
			value := north_low_level
		end

	set_north_east is
		do
			value := north_east_low_level
		end

	set_west is
		do
			value := west_low_level
		end

	set_center is
		do
			value := center_low_level
		end

	set_east is
		do
			value := east_low_level
		end

	set_south_west is
		do
			value := south_west_low_level
		end

	set_south is
		do
			value := south_low_level
		end

	set_south_east is
		do
			value := south_east_low_level
		end

	set_static is
		do
			value := static_low_level
		end

feature -- Queries
	north_west: BOOLEAN is
		do
			Result := (value=north_west_low_level)
		end

	north: BOOLEAN is
		do
			Result := (value=north_low_level)
		end

	north_east: BOOLEAN is
		do
			Result := (value=north_east_low_level)
		end

	west: BOOLEAN is
		do
			Result := (value=west_low_level)
		end

	center: BOOLEAN is
		do
			Result := (value=center_low_level)
		end

	east: BOOLEAN is
		do
			Result := (value=east_low_level)
		end

	south_west: BOOLEAN is
		do
			Result := (value=south_west_low_level)
		end

	south: BOOLEAN is
		do
			Result := (value=south_low_level)
		end

	south_east: BOOLEAN is
		do
			Result := (value=south_east_low_level)
		end

	static: BOOLEAN is
		do
			Result := (value=static_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH_WEST"
 			}"
 		end

	north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH"
 			}"
 		end

	north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH_EAST"
 			}"
 		end

	west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_WEST"
 			}"
 		end

	center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_CENTER"
 			}"
 		end

	east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_EAST"
 			}"
 		end

	south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH_WEST"
 			}"
 		end

	south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH"
 			}"
 		end

	south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH_EAST"
 			}"
 		end

	static_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_STATIC"
 			}"
 		end


end -- class GDK_GRAVITY_ENUM
