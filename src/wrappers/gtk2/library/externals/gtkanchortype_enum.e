-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKANCHORTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_anchor_center_low_level)  or else
				(a_value = gtk_anchor_e_low_level)  or else
				(a_value = gtk_anchor_east_low_level)  or else
				(a_value = gtk_anchor_n_low_level)  or else
				(a_value = gtk_anchor_ne_low_level)  or else
				(a_value = gtk_anchor_north_low_level)  or else
				(a_value = gtk_anchor_north_east_low_level)  or else
				(a_value = gtk_anchor_north_west_low_level)  or else
				(a_value = gtk_anchor_nw_low_level)  or else
				(a_value = gtk_anchor_s_low_level)  or else
				(a_value = gtk_anchor_se_low_level)  or else
				(a_value = gtk_anchor_south_low_level)  or else
				(a_value = gtk_anchor_south_east_low_level)  or else
				(a_value = gtk_anchor_south_west_low_level)  or else
				(a_value = gtk_anchor_sw_low_level)  or else
				(a_value = gtk_anchor_w_low_level)  or else
				(a_value = gtk_anchor_west_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_anchor_center is
		do
			value := gtk_anchor_center_low_level
		end

	set_gtk_anchor_e is
		do
			value := gtk_anchor_e_low_level
		end

	set_gtk_anchor_east is
		do
			value := gtk_anchor_east_low_level
		end

	set_gtk_anchor_n is
		do
			value := gtk_anchor_n_low_level
		end

	set_gtk_anchor_ne is
		do
			value := gtk_anchor_ne_low_level
		end

	set_gtk_anchor_north is
		do
			value := gtk_anchor_north_low_level
		end

	set_gtk_anchor_north_east is
		do
			value := gtk_anchor_north_east_low_level
		end

	set_gtk_anchor_north_west is
		do
			value := gtk_anchor_north_west_low_level
		end

	set_gtk_anchor_nw is
		do
			value := gtk_anchor_nw_low_level
		end

	set_gtk_anchor_s is
		do
			value := gtk_anchor_s_low_level
		end

	set_gtk_anchor_se is
		do
			value := gtk_anchor_se_low_level
		end

	set_gtk_anchor_south is
		do
			value := gtk_anchor_south_low_level
		end

	set_gtk_anchor_south_east is
		do
			value := gtk_anchor_south_east_low_level
		end

	set_gtk_anchor_south_west is
		do
			value := gtk_anchor_south_west_low_level
		end

	set_gtk_anchor_sw is
		do
			value := gtk_anchor_sw_low_level
		end

	set_gtk_anchor_w is
		do
			value := gtk_anchor_w_low_level
		end

	set_gtk_anchor_west is
		do
			value := gtk_anchor_west_low_level
		end

feature {ANY} -- Queries
	is_gtk_anchor_center: BOOLEAN is
		do
			Result := (value=gtk_anchor_center_low_level)
		end

	is_gtk_anchor_e: BOOLEAN is
		do
			Result := (value=gtk_anchor_e_low_level)
		end

	is_gtk_anchor_east: BOOLEAN is
		do
			Result := (value=gtk_anchor_east_low_level)
		end

	is_gtk_anchor_n: BOOLEAN is
		do
			Result := (value=gtk_anchor_n_low_level)
		end

	is_gtk_anchor_ne: BOOLEAN is
		do
			Result := (value=gtk_anchor_ne_low_level)
		end

	is_gtk_anchor_north: BOOLEAN is
		do
			Result := (value=gtk_anchor_north_low_level)
		end

	is_gtk_anchor_north_east: BOOLEAN is
		do
			Result := (value=gtk_anchor_north_east_low_level)
		end

	is_gtk_anchor_north_west: BOOLEAN is
		do
			Result := (value=gtk_anchor_north_west_low_level)
		end

	is_gtk_anchor_nw: BOOLEAN is
		do
			Result := (value=gtk_anchor_nw_low_level)
		end

	is_gtk_anchor_s: BOOLEAN is
		do
			Result := (value=gtk_anchor_s_low_level)
		end

	is_gtk_anchor_se: BOOLEAN is
		do
			Result := (value=gtk_anchor_se_low_level)
		end

	is_gtk_anchor_south: BOOLEAN is
		do
			Result := (value=gtk_anchor_south_low_level)
		end

	is_gtk_anchor_south_east: BOOLEAN is
		do
			Result := (value=gtk_anchor_south_east_low_level)
		end

	is_gtk_anchor_south_west: BOOLEAN is
		do
			Result := (value=gtk_anchor_south_west_low_level)
		end

	is_gtk_anchor_sw: BOOLEAN is
		do
			Result := (value=gtk_anchor_sw_low_level)
		end

	is_gtk_anchor_w: BOOLEAN is
		do
			Result := (value=gtk_anchor_w_low_level)
		end

	is_gtk_anchor_west: BOOLEAN is
		do
			Result := (value=gtk_anchor_west_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_anchor_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_CENTER"
 			}"
 		end

	gtk_anchor_e_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_E"
 			}"
 		end

	gtk_anchor_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_EAST"
 			}"
 		end

	gtk_anchor_n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_N"
 			}"
 		end

	gtk_anchor_ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NE"
 			}"
 		end

	gtk_anchor_north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH"
 			}"
 		end

	gtk_anchor_north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH_EAST"
 			}"
 		end

	gtk_anchor_north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NORTH_WEST"
 			}"
 		end

	gtk_anchor_nw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_NW"
 			}"
 		end

	gtk_anchor_s_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_S"
 			}"
 		end

	gtk_anchor_se_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SE"
 			}"
 		end

	gtk_anchor_south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH"
 			}"
 		end

	gtk_anchor_south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH_EAST"
 			}"
 		end

	gtk_anchor_south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SOUTH_WEST"
 			}"
 		end

	gtk_anchor_sw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_SW"
 			}"
 		end

	gtk_anchor_w_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_W"
 			}"
 		end

	gtk_anchor_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ANCHOR_WEST"
 			}"
 		end


end -- class GTKANCHORTYPE_ENUM
