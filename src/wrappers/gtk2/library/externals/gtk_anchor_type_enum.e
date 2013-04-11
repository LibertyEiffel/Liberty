-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ANCHOR_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = center_low_level)  or else
				(a_value = north_low_level)  or else
				(a_value = north_west_low_level)  or else
				(a_value = north_east_low_level)  or else
				(a_value = south_low_level)  or else
				(a_value = south_west_low_level)  or else
				(a_value = south_east_low_level)  or else
				(a_value = west_low_level)  or else
				(a_value = east_low_level)  or else
				(a_value = n_low_level)  or else
				(a_value = nw_low_level)  or else
				(a_value = ne_low_level)  or else
				(a_value = s_low_level)  or else
				(a_value = sw_low_level)  or else
				(a_value = se_low_level)  or else
				(a_value = w_low_level)  or else
				(a_value = e_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_center is
		do
			value := center_low_level
		end

	set_north is
		do
			value := north_low_level
		end

	set_north_west is
		do
			value := north_west_low_level
		end

	set_north_east is
		do
			value := north_east_low_level
		end

	set_south is
		do
			value := south_low_level
		end

	set_south_west is
		do
			value := south_west_low_level
		end

	set_south_east is
		do
			value := south_east_low_level
		end

	set_west is
		do
			value := west_low_level
		end

	set_east is
		do
			value := east_low_level
		end

	set_n is
		do
			value := n_low_level
		end

	set_nw is
		do
			value := nw_low_level
		end

	set_ne is
		do
			value := ne_low_level
		end

	set_s is
		do
			value := s_low_level
		end

	set_sw is
		do
			value := sw_low_level
		end

	set_se is
		do
			value := se_low_level
		end

	set_w is
		do
			value := w_low_level
		end

	set_e is
		do
			value := e_low_level
		end

feature {ANY} -- Queries
	center: BOOLEAN is
		do
			Result := (value=center_low_level)
		end

	north: BOOLEAN is
		do
			Result := (value=north_low_level)
		end

	north_west: BOOLEAN is
		do
			Result := (value=north_west_low_level)
		end

	north_east: BOOLEAN is
		do
			Result := (value=north_east_low_level)
		end

	south: BOOLEAN is
		do
			Result := (value=south_low_level)
		end

	south_west: BOOLEAN is
		do
			Result := (value=south_west_low_level)
		end

	south_east: BOOLEAN is
		do
			Result := (value=south_east_low_level)
		end

	west: BOOLEAN is
		do
			Result := (value=west_low_level)
		end

	east: BOOLEAN is
		do
			Result := (value=east_low_level)
		end

	n: BOOLEAN is
		do
			Result := (value=n_low_level)
		end

	nw: BOOLEAN is
		do
			Result := (value=nw_low_level)
		end

	ne: BOOLEAN is
		do
			Result := (value=ne_low_level)
		end

	s: BOOLEAN is
		do
			Result := (value=s_low_level)
		end

	sw: BOOLEAN is
		do
			Result := (value=sw_low_level)
		end

	se: BOOLEAN is
		do
			Result := (value=se_low_level)
		end

	w: BOOLEAN is
		do
			Result := (value=w_low_level)
		end

	e: BOOLEAN is
		do
			Result := (value=e_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_CENTER"
 			}"
 		end

	north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH"
 			}"
 		end

	north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH_WEST"
 			}"
 		end

	north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH_EAST"
 			}"
 		end

	south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH"
 			}"
 		end

	south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH_WEST"
 			}"
 		end

	south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH_EAST"
 			}"
 		end

	west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_WEST"
 			}"
 		end

	east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_EAST"
 			}"
 		end

	n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_N"
 			}"
 		end

	nw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NW"
 			}"
 		end

	ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NE"
 			}"
 		end

	s_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_S"
 			}"
 		end

	sw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SW"
 			}"
 		end

	se_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SE"
 			}"
 		end

	w_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_W"
 			}"
 		end

	e_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_E"
 			}"
 		end


end -- class GTK_ANCHOR_TYPE_ENUM
