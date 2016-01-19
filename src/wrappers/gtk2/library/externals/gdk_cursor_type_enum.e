-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_CURSOR_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_arrow_low_level)  or else
				(a_value = gdk_based_arrow_down_low_level)  or else
				(a_value = gdk_based_arrow_up_low_level)  or else
				(a_value = gdk_blank_cursor_low_level)  or else
				(a_value = gdk_boat_low_level)  or else
				(a_value = gdk_bogosity_low_level)  or else
				(a_value = gdk_bottom_left_corner_low_level)  or else
				(a_value = gdk_bottom_right_corner_low_level)  or else
				(a_value = gdk_bottom_side_low_level)  or else
				(a_value = gdk_bottom_tee_low_level)  or else
				(a_value = gdk_box_spiral_low_level)  or else
				(a_value = gdk_center_ptr_low_level)  or else
				(a_value = gdk_circle_low_level)  or else
				(a_value = gdk_clock_low_level)  or else
				(a_value = gdk_coffee_mug_low_level)  or else
				(a_value = gdk_cross_low_level)  or else
				(a_value = gdk_cross_reverse_low_level)  or else
				(a_value = gdk_crosshair_low_level)  or else
				(a_value = gdk_cursor_is_pixmap_low_level)  or else
				(a_value = gdk_diamond_cross_low_level)  or else
				(a_value = gdk_dot_low_level)  or else
				(a_value = gdk_dotbox_low_level)  or else
				(a_value = gdk_double_arrow_low_level)  or else
				(a_value = gdk_draft_large_low_level)  or else
				(a_value = gdk_draft_small_low_level)  or else
				(a_value = gdk_draped_box_low_level)  or else
				(a_value = gdk_exchange_low_level)  or else
				(a_value = gdk_fleur_low_level)  or else
				(a_value = gdk_gobbler_low_level)  or else
				(a_value = gdk_gumby_low_level)  or else
				(a_value = gdk_hand1_low_level)  or else
				(a_value = gdk_hand2_low_level)  or else
				(a_value = gdk_heart_low_level)  or else
				(a_value = gdk_icon_low_level)  or else
				(a_value = gdk_iron_cross_low_level)  or else
				(a_value = gdk_last_cursor_low_level)  or else
				(a_value = gdk_left_ptr_low_level)  or else
				(a_value = gdk_left_side_low_level)  or else
				(a_value = gdk_left_tee_low_level)  or else
				(a_value = gdk_leftbutton_low_level)  or else
				(a_value = gdk_ll_angle_low_level)  or else
				(a_value = gdk_lr_angle_low_level)  or else
				(a_value = gdk_man_low_level)  or else
				(a_value = gdk_middlebutton_low_level)  or else
				(a_value = gdk_mouse_low_level)  or else
				(a_value = gdk_pencil_low_level)  or else
				(a_value = gdk_pirate_low_level)  or else
				(a_value = gdk_plus_low_level)  or else
				(a_value = gdk_question_arrow_low_level)  or else
				(a_value = gdk_right_ptr_low_level)  or else
				(a_value = gdk_right_side_low_level)  or else
				(a_value = gdk_right_tee_low_level)  or else
				(a_value = gdk_rightbutton_low_level)  or else
				(a_value = gdk_rtl_logo_low_level)  or else
				(a_value = gdk_sailboat_low_level)  or else
				(a_value = gdk_sb_down_arrow_low_level)  or else
				(a_value = gdk_sb_h_double_arrow_low_level)  or else
				(a_value = gdk_sb_left_arrow_low_level)  or else
				(a_value = gdk_sb_right_arrow_low_level)  or else
				(a_value = gdk_sb_up_arrow_low_level)  or else
				(a_value = gdk_sb_v_double_arrow_low_level)  or else
				(a_value = gdk_shuttle_low_level)  or else
				(a_value = gdk_sizing_low_level)  or else
				(a_value = gdk_spider_low_level)  or else
				(a_value = gdk_spraycan_low_level)  or else
				(a_value = gdk_star_low_level)  or else
				(a_value = gdk_target_low_level)  or else
				(a_value = gdk_tcross_low_level)  or else
				(a_value = gdk_top_left_arrow_low_level)  or else
				(a_value = gdk_top_left_corner_low_level)  or else
				(a_value = gdk_top_right_corner_low_level)  or else
				(a_value = gdk_top_side_low_level)  or else
				(a_value = gdk_top_tee_low_level)  or else
				(a_value = gdk_trek_low_level)  or else
				(a_value = gdk_ul_angle_low_level)  or else
				(a_value = gdk_umbrella_low_level)  or else
				(a_value = gdk_ur_angle_low_level)  or else
				(a_value = gdk_watch_low_level)  or else
				(a_value = gdk_x_cursor_low_level)  or else
				(a_value = gdk_xterm_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_arrow is
		do
			value := gdk_arrow_low_level
		end

	set_gdk_based_arrow_down is
		do
			value := gdk_based_arrow_down_low_level
		end

	set_gdk_based_arrow_up is
		do
			value := gdk_based_arrow_up_low_level
		end

	set_gdk_blank_cursor is
		do
			value := gdk_blank_cursor_low_level
		end

	set_gdk_boat is
		do
			value := gdk_boat_low_level
		end

	set_gdk_bogosity is
		do
			value := gdk_bogosity_low_level
		end

	set_gdk_bottom_left_corner is
		do
			value := gdk_bottom_left_corner_low_level
		end

	set_gdk_bottom_right_corner is
		do
			value := gdk_bottom_right_corner_low_level
		end

	set_gdk_bottom_side is
		do
			value := gdk_bottom_side_low_level
		end

	set_gdk_bottom_tee is
		do
			value := gdk_bottom_tee_low_level
		end

	set_gdk_box_spiral is
		do
			value := gdk_box_spiral_low_level
		end

	set_gdk_center_ptr is
		do
			value := gdk_center_ptr_low_level
		end

	set_gdk_circle is
		do
			value := gdk_circle_low_level
		end

	set_gdk_clock is
		do
			value := gdk_clock_low_level
		end

	set_gdk_coffee_mug is
		do
			value := gdk_coffee_mug_low_level
		end

	set_gdk_cross is
		do
			value := gdk_cross_low_level
		end

	set_gdk_cross_reverse is
		do
			value := gdk_cross_reverse_low_level
		end

	set_gdk_crosshair is
		do
			value := gdk_crosshair_low_level
		end

	set_gdk_cursor_is_pixmap is
		do
			value := gdk_cursor_is_pixmap_low_level
		end

	set_gdk_diamond_cross is
		do
			value := gdk_diamond_cross_low_level
		end

	set_gdk_dot is
		do
			value := gdk_dot_low_level
		end

	set_gdk_dotbox is
		do
			value := gdk_dotbox_low_level
		end

	set_gdk_double_arrow is
		do
			value := gdk_double_arrow_low_level
		end

	set_gdk_draft_large is
		do
			value := gdk_draft_large_low_level
		end

	set_gdk_draft_small is
		do
			value := gdk_draft_small_low_level
		end

	set_gdk_draped_box is
		do
			value := gdk_draped_box_low_level
		end

	set_gdk_exchange is
		do
			value := gdk_exchange_low_level
		end

	set_gdk_fleur is
		do
			value := gdk_fleur_low_level
		end

	set_gdk_gobbler is
		do
			value := gdk_gobbler_low_level
		end

	set_gdk_gumby is
		do
			value := gdk_gumby_low_level
		end

	set_gdk_hand1 is
		do
			value := gdk_hand1_low_level
		end

	set_gdk_hand2 is
		do
			value := gdk_hand2_low_level
		end

	set_gdk_heart is
		do
			value := gdk_heart_low_level
		end

	set_gdk_icon is
		do
			value := gdk_icon_low_level
		end

	set_gdk_iron_cross is
		do
			value := gdk_iron_cross_low_level
		end

	set_gdk_last_cursor is
		do
			value := gdk_last_cursor_low_level
		end

	set_gdk_left_ptr is
		do
			value := gdk_left_ptr_low_level
		end

	set_gdk_left_side is
		do
			value := gdk_left_side_low_level
		end

	set_gdk_left_tee is
		do
			value := gdk_left_tee_low_level
		end

	set_gdk_leftbutton is
		do
			value := gdk_leftbutton_low_level
		end

	set_gdk_ll_angle is
		do
			value := gdk_ll_angle_low_level
		end

	set_gdk_lr_angle is
		do
			value := gdk_lr_angle_low_level
		end

	set_gdk_man is
		do
			value := gdk_man_low_level
		end

	set_gdk_middlebutton is
		do
			value := gdk_middlebutton_low_level
		end

	set_gdk_mouse is
		do
			value := gdk_mouse_low_level
		end

	set_gdk_pencil is
		do
			value := gdk_pencil_low_level
		end

	set_gdk_pirate is
		do
			value := gdk_pirate_low_level
		end

	set_gdk_plus is
		do
			value := gdk_plus_low_level
		end

	set_gdk_question_arrow is
		do
			value := gdk_question_arrow_low_level
		end

	set_gdk_right_ptr is
		do
			value := gdk_right_ptr_low_level
		end

	set_gdk_right_side is
		do
			value := gdk_right_side_low_level
		end

	set_gdk_right_tee is
		do
			value := gdk_right_tee_low_level
		end

	set_gdk_rightbutton is
		do
			value := gdk_rightbutton_low_level
		end

	set_gdk_rtl_logo is
		do
			value := gdk_rtl_logo_low_level
		end

	set_gdk_sailboat is
		do
			value := gdk_sailboat_low_level
		end

	set_gdk_sb_down_arrow is
		do
			value := gdk_sb_down_arrow_low_level
		end

	set_gdk_sb_h_double_arrow is
		do
			value := gdk_sb_h_double_arrow_low_level
		end

	set_gdk_sb_left_arrow is
		do
			value := gdk_sb_left_arrow_low_level
		end

	set_gdk_sb_right_arrow is
		do
			value := gdk_sb_right_arrow_low_level
		end

	set_gdk_sb_up_arrow is
		do
			value := gdk_sb_up_arrow_low_level
		end

	set_gdk_sb_v_double_arrow is
		do
			value := gdk_sb_v_double_arrow_low_level
		end

	set_gdk_shuttle is
		do
			value := gdk_shuttle_low_level
		end

	set_gdk_sizing is
		do
			value := gdk_sizing_low_level
		end

	set_gdk_spider is
		do
			value := gdk_spider_low_level
		end

	set_gdk_spraycan is
		do
			value := gdk_spraycan_low_level
		end

	set_gdk_star is
		do
			value := gdk_star_low_level
		end

	set_gdk_target is
		do
			value := gdk_target_low_level
		end

	set_gdk_tcross is
		do
			value := gdk_tcross_low_level
		end

	set_gdk_top_left_arrow is
		do
			value := gdk_top_left_arrow_low_level
		end

	set_gdk_top_left_corner is
		do
			value := gdk_top_left_corner_low_level
		end

	set_gdk_top_right_corner is
		do
			value := gdk_top_right_corner_low_level
		end

	set_gdk_top_side is
		do
			value := gdk_top_side_low_level
		end

	set_gdk_top_tee is
		do
			value := gdk_top_tee_low_level
		end

	set_gdk_trek is
		do
			value := gdk_trek_low_level
		end

	set_gdk_ul_angle is
		do
			value := gdk_ul_angle_low_level
		end

	set_gdk_umbrella is
		do
			value := gdk_umbrella_low_level
		end

	set_gdk_ur_angle is
		do
			value := gdk_ur_angle_low_level
		end

	set_gdk_watch is
		do
			value := gdk_watch_low_level
		end

	set_gdk_x_cursor is
		do
			value := gdk_x_cursor_low_level
		end

	set_gdk_xterm is
		do
			value := gdk_xterm_low_level
		end

feature -- Queries
	is_gdk_arrow: BOOLEAN is
		do
			Result := (value=gdk_arrow_low_level)
		end

	is_gdk_based_arrow_down: BOOLEAN is
		do
			Result := (value=gdk_based_arrow_down_low_level)
		end

	is_gdk_based_arrow_up: BOOLEAN is
		do
			Result := (value=gdk_based_arrow_up_low_level)
		end

	is_gdk_blank_cursor: BOOLEAN is
		do
			Result := (value=gdk_blank_cursor_low_level)
		end

	is_gdk_boat: BOOLEAN is
		do
			Result := (value=gdk_boat_low_level)
		end

	is_gdk_bogosity: BOOLEAN is
		do
			Result := (value=gdk_bogosity_low_level)
		end

	is_gdk_bottom_left_corner: BOOLEAN is
		do
			Result := (value=gdk_bottom_left_corner_low_level)
		end

	is_gdk_bottom_right_corner: BOOLEAN is
		do
			Result := (value=gdk_bottom_right_corner_low_level)
		end

	is_gdk_bottom_side: BOOLEAN is
		do
			Result := (value=gdk_bottom_side_low_level)
		end

	is_gdk_bottom_tee: BOOLEAN is
		do
			Result := (value=gdk_bottom_tee_low_level)
		end

	is_gdk_box_spiral: BOOLEAN is
		do
			Result := (value=gdk_box_spiral_low_level)
		end

	is_gdk_center_ptr: BOOLEAN is
		do
			Result := (value=gdk_center_ptr_low_level)
		end

	is_gdk_circle: BOOLEAN is
		do
			Result := (value=gdk_circle_low_level)
		end

	is_gdk_clock: BOOLEAN is
		do
			Result := (value=gdk_clock_low_level)
		end

	is_gdk_coffee_mug: BOOLEAN is
		do
			Result := (value=gdk_coffee_mug_low_level)
		end

	is_gdk_cross: BOOLEAN is
		do
			Result := (value=gdk_cross_low_level)
		end

	is_gdk_cross_reverse: BOOLEAN is
		do
			Result := (value=gdk_cross_reverse_low_level)
		end

	is_gdk_crosshair: BOOLEAN is
		do
			Result := (value=gdk_crosshair_low_level)
		end

	is_gdk_cursor_is_pixmap: BOOLEAN is
		do
			Result := (value=gdk_cursor_is_pixmap_low_level)
		end

	is_gdk_diamond_cross: BOOLEAN is
		do
			Result := (value=gdk_diamond_cross_low_level)
		end

	is_gdk_dot: BOOLEAN is
		do
			Result := (value=gdk_dot_low_level)
		end

	is_gdk_dotbox: BOOLEAN is
		do
			Result := (value=gdk_dotbox_low_level)
		end

	is_gdk_double_arrow: BOOLEAN is
		do
			Result := (value=gdk_double_arrow_low_level)
		end

	is_gdk_draft_large: BOOLEAN is
		do
			Result := (value=gdk_draft_large_low_level)
		end

	is_gdk_draft_small: BOOLEAN is
		do
			Result := (value=gdk_draft_small_low_level)
		end

	is_gdk_draped_box: BOOLEAN is
		do
			Result := (value=gdk_draped_box_low_level)
		end

	is_gdk_exchange: BOOLEAN is
		do
			Result := (value=gdk_exchange_low_level)
		end

	is_gdk_fleur: BOOLEAN is
		do
			Result := (value=gdk_fleur_low_level)
		end

	is_gdk_gobbler: BOOLEAN is
		do
			Result := (value=gdk_gobbler_low_level)
		end

	is_gdk_gumby: BOOLEAN is
		do
			Result := (value=gdk_gumby_low_level)
		end

	is_gdk_hand1: BOOLEAN is
		do
			Result := (value=gdk_hand1_low_level)
		end

	is_gdk_hand2: BOOLEAN is
		do
			Result := (value=gdk_hand2_low_level)
		end

	is_gdk_heart: BOOLEAN is
		do
			Result := (value=gdk_heart_low_level)
		end

	is_gdk_icon: BOOLEAN is
		do
			Result := (value=gdk_icon_low_level)
		end

	is_gdk_iron_cross: BOOLEAN is
		do
			Result := (value=gdk_iron_cross_low_level)
		end

	is_gdk_last_cursor: BOOLEAN is
		do
			Result := (value=gdk_last_cursor_low_level)
		end

	is_gdk_left_ptr: BOOLEAN is
		do
			Result := (value=gdk_left_ptr_low_level)
		end

	is_gdk_left_side: BOOLEAN is
		do
			Result := (value=gdk_left_side_low_level)
		end

	is_gdk_left_tee: BOOLEAN is
		do
			Result := (value=gdk_left_tee_low_level)
		end

	is_gdk_leftbutton: BOOLEAN is
		do
			Result := (value=gdk_leftbutton_low_level)
		end

	is_gdk_ll_angle: BOOLEAN is
		do
			Result := (value=gdk_ll_angle_low_level)
		end

	is_gdk_lr_angle: BOOLEAN is
		do
			Result := (value=gdk_lr_angle_low_level)
		end

	is_gdk_man: BOOLEAN is
		do
			Result := (value=gdk_man_low_level)
		end

	is_gdk_middlebutton: BOOLEAN is
		do
			Result := (value=gdk_middlebutton_low_level)
		end

	is_gdk_mouse: BOOLEAN is
		do
			Result := (value=gdk_mouse_low_level)
		end

	is_gdk_pencil: BOOLEAN is
		do
			Result := (value=gdk_pencil_low_level)
		end

	is_gdk_pirate: BOOLEAN is
		do
			Result := (value=gdk_pirate_low_level)
		end

	is_gdk_plus: BOOLEAN is
		do
			Result := (value=gdk_plus_low_level)
		end

	is_gdk_question_arrow: BOOLEAN is
		do
			Result := (value=gdk_question_arrow_low_level)
		end

	is_gdk_right_ptr: BOOLEAN is
		do
			Result := (value=gdk_right_ptr_low_level)
		end

	is_gdk_right_side: BOOLEAN is
		do
			Result := (value=gdk_right_side_low_level)
		end

	is_gdk_right_tee: BOOLEAN is
		do
			Result := (value=gdk_right_tee_low_level)
		end

	is_gdk_rightbutton: BOOLEAN is
		do
			Result := (value=gdk_rightbutton_low_level)
		end

	is_gdk_rtl_logo: BOOLEAN is
		do
			Result := (value=gdk_rtl_logo_low_level)
		end

	is_gdk_sailboat: BOOLEAN is
		do
			Result := (value=gdk_sailboat_low_level)
		end

	is_gdk_sb_down_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_down_arrow_low_level)
		end

	is_gdk_sb_h_double_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_h_double_arrow_low_level)
		end

	is_gdk_sb_left_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_left_arrow_low_level)
		end

	is_gdk_sb_right_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_right_arrow_low_level)
		end

	is_gdk_sb_up_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_up_arrow_low_level)
		end

	is_gdk_sb_v_double_arrow: BOOLEAN is
		do
			Result := (value=gdk_sb_v_double_arrow_low_level)
		end

	is_gdk_shuttle: BOOLEAN is
		do
			Result := (value=gdk_shuttle_low_level)
		end

	is_gdk_sizing: BOOLEAN is
		do
			Result := (value=gdk_sizing_low_level)
		end

	is_gdk_spider: BOOLEAN is
		do
			Result := (value=gdk_spider_low_level)
		end

	is_gdk_spraycan: BOOLEAN is
		do
			Result := (value=gdk_spraycan_low_level)
		end

	is_gdk_star: BOOLEAN is
		do
			Result := (value=gdk_star_low_level)
		end

	is_gdk_target: BOOLEAN is
		do
			Result := (value=gdk_target_low_level)
		end

	is_gdk_tcross: BOOLEAN is
		do
			Result := (value=gdk_tcross_low_level)
		end

	is_gdk_top_left_arrow: BOOLEAN is
		do
			Result := (value=gdk_top_left_arrow_low_level)
		end

	is_gdk_top_left_corner: BOOLEAN is
		do
			Result := (value=gdk_top_left_corner_low_level)
		end

	is_gdk_top_right_corner: BOOLEAN is
		do
			Result := (value=gdk_top_right_corner_low_level)
		end

	is_gdk_top_side: BOOLEAN is
		do
			Result := (value=gdk_top_side_low_level)
		end

	is_gdk_top_tee: BOOLEAN is
		do
			Result := (value=gdk_top_tee_low_level)
		end

	is_gdk_trek: BOOLEAN is
		do
			Result := (value=gdk_trek_low_level)
		end

	is_gdk_ul_angle: BOOLEAN is
		do
			Result := (value=gdk_ul_angle_low_level)
		end

	is_gdk_umbrella: BOOLEAN is
		do
			Result := (value=gdk_umbrella_low_level)
		end

	is_gdk_ur_angle: BOOLEAN is
		do
			Result := (value=gdk_ur_angle_low_level)
		end

	is_gdk_watch: BOOLEAN is
		do
			Result := (value=gdk_watch_low_level)
		end

	is_gdk_x_cursor: BOOLEAN is
		do
			Result := (value=gdk_x_cursor_low_level)
		end

	is_gdk_xterm: BOOLEAN is
		do
			Result := (value=gdk_xterm_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ARROW"
 			}"
 		end

	gdk_based_arrow_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BASED_ARROW_DOWN"
 			}"
 		end

	gdk_based_arrow_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BASED_ARROW_UP"
 			}"
 		end

	gdk_blank_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BLANK_CURSOR"
 			}"
 		end

	gdk_boat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOAT"
 			}"
 		end

	gdk_bogosity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOGOSITY"
 			}"
 		end

	gdk_bottom_left_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_LEFT_CORNER"
 			}"
 		end

	gdk_bottom_right_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_RIGHT_CORNER"
 			}"
 		end

	gdk_bottom_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_SIDE"
 			}"
 		end

	gdk_bottom_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_TEE"
 			}"
 		end

	gdk_box_spiral_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOX_SPIRAL"
 			}"
 		end

	gdk_center_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CENTER_PTR"
 			}"
 		end

	gdk_circle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CIRCLE"
 			}"
 		end

	gdk_clock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLOCK"
 			}"
 		end

	gdk_coffee_mug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COFFEE_MUG"
 			}"
 		end

	gdk_cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSS"
 			}"
 		end

	gdk_cross_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSS_REVERSE"
 			}"
 		end

	gdk_crosshair_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSHAIR"
 			}"
 		end

	gdk_cursor_is_pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CURSOR_IS_PIXMAP"
 			}"
 		end

	gdk_diamond_cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DIAMOND_CROSS"
 			}"
 		end

	gdk_dot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOT"
 			}"
 		end

	gdk_dotbox_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOTBOX"
 			}"
 		end

	gdk_double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOUBLE_ARROW"
 			}"
 		end

	gdk_draft_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAFT_LARGE"
 			}"
 		end

	gdk_draft_small_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAFT_SMALL"
 			}"
 		end

	gdk_draped_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAPED_BOX"
 			}"
 		end

	gdk_exchange_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXCHANGE"
 			}"
 		end

	gdk_fleur_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FLEUR"
 			}"
 		end

	gdk_gobbler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GOBBLER"
 			}"
 		end

	gdk_gumby_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GUMBY"
 			}"
 		end

	gdk_hand1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HAND1"
 			}"
 		end

	gdk_hand2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HAND2"
 			}"
 		end

	gdk_heart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HEART"
 			}"
 		end

	gdk_icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ICON"
 			}"
 		end

	gdk_iron_cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IRON_CROSS"
 			}"
 		end

	gdk_last_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LAST_CURSOR"
 			}"
 		end

	gdk_left_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_PTR"
 			}"
 		end

	gdk_left_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_SIDE"
 			}"
 		end

	gdk_left_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_TEE"
 			}"
 		end

	gdk_leftbutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFTBUTTON"
 			}"
 		end

	gdk_ll_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LL_ANGLE"
 			}"
 		end

	gdk_lr_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LR_ANGLE"
 			}"
 		end

	gdk_man_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MAN"
 			}"
 		end

	gdk_middlebutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MIDDLEBUTTON"
 			}"
 		end

	gdk_mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOUSE"
 			}"
 		end

	gdk_pencil_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PENCIL"
 			}"
 		end

	gdk_pirate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIRATE"
 			}"
 		end

	gdk_plus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PLUS"
 			}"
 		end

	gdk_question_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_QUESTION_ARROW"
 			}"
 		end

	gdk_right_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_PTR"
 			}"
 		end

	gdk_right_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_SIDE"
 			}"
 		end

	gdk_right_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_TEE"
 			}"
 		end

	gdk_rightbutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHTBUTTON"
 			}"
 		end

	gdk_rtl_logo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RTL_LOGO"
 			}"
 		end

	gdk_sailboat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SAILBOAT"
 			}"
 		end

	gdk_sb_down_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_DOWN_ARROW"
 			}"
 		end

	gdk_sb_h_double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_H_DOUBLE_ARROW"
 			}"
 		end

	gdk_sb_left_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_LEFT_ARROW"
 			}"
 		end

	gdk_sb_right_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_RIGHT_ARROW"
 			}"
 		end

	gdk_sb_up_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_UP_ARROW"
 			}"
 		end

	gdk_sb_v_double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_V_DOUBLE_ARROW"
 			}"
 		end

	gdk_shuttle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SHUTTLE"
 			}"
 		end

	gdk_sizing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SIZING"
 			}"
 		end

	gdk_spider_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SPIDER"
 			}"
 		end

	gdk_spraycan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SPRAYCAN"
 			}"
 		end

	gdk_star_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STAR"
 			}"
 		end

	gdk_target_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TARGET"
 			}"
 		end

	gdk_tcross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TCROSS"
 			}"
 		end

	gdk_top_left_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_LEFT_ARROW"
 			}"
 		end

	gdk_top_left_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_LEFT_CORNER"
 			}"
 		end

	gdk_top_right_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_RIGHT_CORNER"
 			}"
 		end

	gdk_top_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_SIDE"
 			}"
 		end

	gdk_top_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_TEE"
 			}"
 		end

	gdk_trek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TREK"
 			}"
 		end

	gdk_ul_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UL_ANGLE"
 			}"
 		end

	gdk_umbrella_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UMBRELLA"
 			}"
 		end

	gdk_ur_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UR_ANGLE"
 			}"
 		end

	gdk_watch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WATCH"
 			}"
 		end

	gdk_x_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_X_CURSOR"
 			}"
 		end

	gdk_xterm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_XTERM"
 			}"
 		end


end -- class GDK_CURSOR_TYPE_ENUM
