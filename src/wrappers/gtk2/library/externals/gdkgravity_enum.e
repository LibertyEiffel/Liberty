-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKGRAVITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_gravity_center_low_level)  or else
				(a_value = gdk_gravity_east_low_level)  or else
				(a_value = gdk_gravity_north_low_level)  or else
				(a_value = gdk_gravity_north_east_low_level)  or else
				(a_value = gdk_gravity_north_west_low_level)  or else
				(a_value = gdk_gravity_south_low_level)  or else
				(a_value = gdk_gravity_south_east_low_level)  or else
				(a_value = gdk_gravity_south_west_low_level)  or else
				(a_value = gdk_gravity_static_low_level)  or else
				(a_value = gdk_gravity_west_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_gravity_center is
		do
			value := gdk_gravity_center_low_level
		end

	set_gdk_gravity_east is
		do
			value := gdk_gravity_east_low_level
		end

	set_gdk_gravity_north is
		do
			value := gdk_gravity_north_low_level
		end

	set_gdk_gravity_north_east is
		do
			value := gdk_gravity_north_east_low_level
		end

	set_gdk_gravity_north_west is
		do
			value := gdk_gravity_north_west_low_level
		end

	set_gdk_gravity_south is
		do
			value := gdk_gravity_south_low_level
		end

	set_gdk_gravity_south_east is
		do
			value := gdk_gravity_south_east_low_level
		end

	set_gdk_gravity_south_west is
		do
			value := gdk_gravity_south_west_low_level
		end

	set_gdk_gravity_static is
		do
			value := gdk_gravity_static_low_level
		end

	set_gdk_gravity_west is
		do
			value := gdk_gravity_west_low_level
		end

feature {ANY} -- Queries
	is_gdk_gravity_center: BOOLEAN is
		do
			Result := (value=gdk_gravity_center_low_level)
		end

	is_gdk_gravity_east: BOOLEAN is
		do
			Result := (value=gdk_gravity_east_low_level)
		end

	is_gdk_gravity_north: BOOLEAN is
		do
			Result := (value=gdk_gravity_north_low_level)
		end

	is_gdk_gravity_north_east: BOOLEAN is
		do
			Result := (value=gdk_gravity_north_east_low_level)
		end

	is_gdk_gravity_north_west: BOOLEAN is
		do
			Result := (value=gdk_gravity_north_west_low_level)
		end

	is_gdk_gravity_south: BOOLEAN is
		do
			Result := (value=gdk_gravity_south_low_level)
		end

	is_gdk_gravity_south_east: BOOLEAN is
		do
			Result := (value=gdk_gravity_south_east_low_level)
		end

	is_gdk_gravity_south_west: BOOLEAN is
		do
			Result := (value=gdk_gravity_south_west_low_level)
		end

	is_gdk_gravity_static: BOOLEAN is
		do
			Result := (value=gdk_gravity_static_low_level)
		end

	is_gdk_gravity_west: BOOLEAN is
		do
			Result := (value=gdk_gravity_west_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_gravity_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_CENTER"
 			}"
 		end

	gdk_gravity_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_EAST"
 			}"
 		end

	gdk_gravity_north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH"
 			}"
 		end

	gdk_gravity_north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH_EAST"
 			}"
 		end

	gdk_gravity_north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_NORTH_WEST"
 			}"
 		end

	gdk_gravity_south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH"
 			}"
 		end

	gdk_gravity_south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH_EAST"
 			}"
 		end

	gdk_gravity_south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_SOUTH_WEST"
 			}"
 		end

	gdk_gravity_static_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_STATIC"
 			}"
 		end

	gdk_gravity_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAVITY_WEST"
 			}"
 		end


end -- class GDKGRAVITY_ENUM
