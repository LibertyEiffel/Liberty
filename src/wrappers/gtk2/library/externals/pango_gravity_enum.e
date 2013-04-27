-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_GRAVITY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_gravity_auto_low_level)  or else
				(a_value = pango_gravity_east_low_level)  or else
				(a_value = pango_gravity_north_low_level)  or else
				(a_value = pango_gravity_south_low_level)  or else
				(a_value = pango_gravity_west_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_gravity_auto is
		do
			value := pango_gravity_auto_low_level
		end

	set_pango_gravity_east is
		do
			value := pango_gravity_east_low_level
		end

	set_pango_gravity_north is
		do
			value := pango_gravity_north_low_level
		end

	set_pango_gravity_south is
		do
			value := pango_gravity_south_low_level
		end

	set_pango_gravity_west is
		do
			value := pango_gravity_west_low_level
		end

feature -- Queries
	is_pango_gravity_auto: BOOLEAN is
		do
			Result := (value=pango_gravity_auto_low_level)
		end

	is_pango_gravity_east: BOOLEAN is
		do
			Result := (value=pango_gravity_east_low_level)
		end

	is_pango_gravity_north: BOOLEAN is
		do
			Result := (value=pango_gravity_north_low_level)
		end

	is_pango_gravity_south: BOOLEAN is
		do
			Result := (value=pango_gravity_south_low_level)
		end

	is_pango_gravity_west: BOOLEAN is
		do
			Result := (value=pango_gravity_west_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_gravity_auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_AUTO"
 			}"
 		end

	pango_gravity_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_EAST"
 			}"
 		end

	pango_gravity_north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_NORTH"
 			}"
 		end

	pango_gravity_south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_SOUTH"
 			}"
 		end

	pango_gravity_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_GRAVITY_WEST"
 			}"
 		end


end -- class PANGO_GRAVITY_ENUM
