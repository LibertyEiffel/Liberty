-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_EDGE_ENUM

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
				(a_value = east_low_level)  or else
				(a_value = south_west_low_level)  or else
				(a_value = south_low_level)  or else
				(a_value = south_east_low_level) )
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

feature -- Queries
	is_north_west: BOOLEAN is
		do
			Result := (value=north_west_low_level)
		end

	is_north: BOOLEAN is
		do
			Result := (value=north_low_level)
		end

	is_north_east: BOOLEAN is
		do
			Result := (value=north_east_low_level)
		end

	is_west: BOOLEAN is
		do
			Result := (value=west_low_level)
		end

	is_east: BOOLEAN is
		do
			Result := (value=east_low_level)
		end

	is_south_west: BOOLEAN is
		do
			Result := (value=south_west_low_level)
		end

	is_south: BOOLEAN is
		do
			Result := (value=south_low_level)
		end

	is_south_east: BOOLEAN is
		do
			Result := (value=south_east_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH_WEST"
 			}"
 		end

	north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH"
 			}"
 		end

	north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH_EAST"
 			}"
 		end

	west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_WEST"
 			}"
 		end

	east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_EAST"
 			}"
 		end

	south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH_WEST"
 			}"
 		end

	south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH"
 			}"
 		end

	south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH_EAST"
 			}"
 		end


end -- class GDK_WINDOW_EDGE_ENUM
