-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKWINDOWEDGE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_window_edge_east_low_level)  or else
				(a_value = gdk_window_edge_north_low_level)  or else
				(a_value = gdk_window_edge_north_east_low_level)  or else
				(a_value = gdk_window_edge_north_west_low_level)  or else
				(a_value = gdk_window_edge_south_low_level)  or else
				(a_value = gdk_window_edge_south_east_low_level)  or else
				(a_value = gdk_window_edge_south_west_low_level)  or else
				(a_value = gdk_window_edge_west_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_window_edge_east is
		do
			value := gdk_window_edge_east_low_level
		end

	set_gdk_window_edge_north is
		do
			value := gdk_window_edge_north_low_level
		end

	set_gdk_window_edge_north_east is
		do
			value := gdk_window_edge_north_east_low_level
		end

	set_gdk_window_edge_north_west is
		do
			value := gdk_window_edge_north_west_low_level
		end

	set_gdk_window_edge_south is
		do
			value := gdk_window_edge_south_low_level
		end

	set_gdk_window_edge_south_east is
		do
			value := gdk_window_edge_south_east_low_level
		end

	set_gdk_window_edge_south_west is
		do
			value := gdk_window_edge_south_west_low_level
		end

	set_gdk_window_edge_west is
		do
			value := gdk_window_edge_west_low_level
		end

feature {ANY} -- Queries
	is_gdk_window_edge_east: BOOLEAN is
		do
			Result := (value=gdk_window_edge_east_low_level)
		end

	is_gdk_window_edge_north: BOOLEAN is
		do
			Result := (value=gdk_window_edge_north_low_level)
		end

	is_gdk_window_edge_north_east: BOOLEAN is
		do
			Result := (value=gdk_window_edge_north_east_low_level)
		end

	is_gdk_window_edge_north_west: BOOLEAN is
		do
			Result := (value=gdk_window_edge_north_west_low_level)
		end

	is_gdk_window_edge_south: BOOLEAN is
		do
			Result := (value=gdk_window_edge_south_low_level)
		end

	is_gdk_window_edge_south_east: BOOLEAN is
		do
			Result := (value=gdk_window_edge_south_east_low_level)
		end

	is_gdk_window_edge_south_west: BOOLEAN is
		do
			Result := (value=gdk_window_edge_south_west_low_level)
		end

	is_gdk_window_edge_west: BOOLEAN is
		do
			Result := (value=gdk_window_edge_west_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_window_edge_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_EAST"
 			}"
 		end

	gdk_window_edge_north_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH"
 			}"
 		end

	gdk_window_edge_north_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH_EAST"
 			}"
 		end

	gdk_window_edge_north_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_NORTH_WEST"
 			}"
 		end

	gdk_window_edge_south_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH"
 			}"
 		end

	gdk_window_edge_south_east_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH_EAST"
 			}"
 		end

	gdk_window_edge_south_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_SOUTH_WEST"
 			}"
 		end

	gdk_window_edge_west_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_EDGE_WEST"
 			}"
 		end


end -- class GDKWINDOWEDGE_ENUM
