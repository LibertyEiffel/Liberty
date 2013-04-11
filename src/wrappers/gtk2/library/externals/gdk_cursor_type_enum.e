-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_CURSOR_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = x_cursor_low_level)  or else
				(a_value = arrow_low_level)  or else
				(a_value = based_arrow_down_low_level)  or else
				(a_value = based_arrow_up_low_level)  or else
				(a_value = boat_low_level)  or else
				(a_value = bogosity_low_level)  or else
				(a_value = bottom_left_corner_low_level)  or else
				(a_value = bottom_right_corner_low_level)  or else
				(a_value = bottom_side_low_level)  or else
				(a_value = bottom_tee_low_level)  or else
				(a_value = box_spiral_low_level)  or else
				(a_value = center_ptr_low_level)  or else
				(a_value = circle_low_level)  or else
				(a_value = clock_low_level)  or else
				(a_value = coffee_mug_low_level)  or else
				(a_value = cross_low_level)  or else
				(a_value = cross_reverse_low_level)  or else
				(a_value = crosshair_low_level)  or else
				(a_value = diamond_cross_low_level)  or else
				(a_value = dot_low_level)  or else
				(a_value = dotbox_low_level)  or else
				(a_value = double_arrow_low_level)  or else
				(a_value = draft_large_low_level)  or else
				(a_value = draft_small_low_level)  or else
				(a_value = draped_box_low_level)  or else
				(a_value = exchange_low_level)  or else
				(a_value = fleur_low_level)  or else
				(a_value = gobbler_low_level)  or else
				(a_value = gumby_low_level)  or else
				(a_value = hand1_low_level)  or else
				(a_value = hand2_low_level)  or else
				(a_value = heart_low_level)  or else
				(a_value = icon_low_level)  or else
				(a_value = iron_cross_low_level)  or else
				(a_value = left_ptr_low_level)  or else
				(a_value = left_side_low_level)  or else
				(a_value = left_tee_low_level)  or else
				(a_value = leftbutton_low_level)  or else
				(a_value = ll_angle_low_level)  or else
				(a_value = lr_angle_low_level)  or else
				(a_value = man_low_level)  or else
				(a_value = middlebutton_low_level)  or else
				(a_value = mouse_low_level)  or else
				(a_value = pencil_low_level)  or else
				(a_value = pirate_low_level)  or else
				(a_value = plus_low_level)  or else
				(a_value = question_arrow_low_level)  or else
				(a_value = right_ptr_low_level)  or else
				(a_value = right_side_low_level)  or else
				(a_value = right_tee_low_level)  or else
				(a_value = rightbutton_low_level)  or else
				(a_value = rtl_logo_low_level)  or else
				(a_value = sailboat_low_level)  or else
				(a_value = sb_down_arrow_low_level)  or else
				(a_value = sb_h_double_arrow_low_level)  or else
				(a_value = sb_left_arrow_low_level)  or else
				(a_value = sb_right_arrow_low_level)  or else
				(a_value = sb_up_arrow_low_level)  or else
				(a_value = sb_v_double_arrow_low_level)  or else
				(a_value = shuttle_low_level)  or else
				(a_value = sizing_low_level)  or else
				(a_value = spider_low_level)  or else
				(a_value = spraycan_low_level)  or else
				(a_value = star_low_level)  or else
				(a_value = target_low_level)  or else
				(a_value = tcross_low_level)  or else
				(a_value = top_left_arrow_low_level)  or else
				(a_value = top_left_corner_low_level)  or else
				(a_value = top_right_corner_low_level)  or else
				(a_value = top_side_low_level)  or else
				(a_value = top_tee_low_level)  or else
				(a_value = trek_low_level)  or else
				(a_value = ul_angle_low_level)  or else
				(a_value = umbrella_low_level)  or else
				(a_value = ur_angle_low_level)  or else
				(a_value = watch_low_level)  or else
				(a_value = xterm_low_level)  or else
				(a_value = last_cursor_low_level)  or else
				(a_value = blank_cursor_low_level)  or else
				(a_value = cursor_is_pixmap_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_x_cursor is
		do
			value := x_cursor_low_level
		end

	set_arrow is
		do
			value := arrow_low_level
		end

	set_based_arrow_down is
		do
			value := based_arrow_down_low_level
		end

	set_based_arrow_up is
		do
			value := based_arrow_up_low_level
		end

	set_boat is
		do
			value := boat_low_level
		end

	set_bogosity is
		do
			value := bogosity_low_level
		end

	set_bottom_left_corner is
		do
			value := bottom_left_corner_low_level
		end

	set_bottom_right_corner is
		do
			value := bottom_right_corner_low_level
		end

	set_bottom_side is
		do
			value := bottom_side_low_level
		end

	set_bottom_tee is
		do
			value := bottom_tee_low_level
		end

	set_box_spiral is
		do
			value := box_spiral_low_level
		end

	set_center_ptr is
		do
			value := center_ptr_low_level
		end

	set_circle is
		do
			value := circle_low_level
		end

	set_clock is
		do
			value := clock_low_level
		end

	set_coffee_mug is
		do
			value := coffee_mug_low_level
		end

	set_cross is
		do
			value := cross_low_level
		end

	set_cross_reverse is
		do
			value := cross_reverse_low_level
		end

	set_crosshair is
		do
			value := crosshair_low_level
		end

	set_diamond_cross is
		do
			value := diamond_cross_low_level
		end

	set_dot is
		do
			value := dot_low_level
		end

	set_dotbox is
		do
			value := dotbox_low_level
		end

	set_double_arrow is
		do
			value := double_arrow_low_level
		end

	set_draft_large is
		do
			value := draft_large_low_level
		end

	set_draft_small is
		do
			value := draft_small_low_level
		end

	set_draped_box is
		do
			value := draped_box_low_level
		end

	set_exchange is
		do
			value := exchange_low_level
		end

	set_fleur is
		do
			value := fleur_low_level
		end

	set_gobbler is
		do
			value := gobbler_low_level
		end

	set_gumby is
		do
			value := gumby_low_level
		end

	set_hand1 is
		do
			value := hand1_low_level
		end

	set_hand2 is
		do
			value := hand2_low_level
		end

	set_heart is
		do
			value := heart_low_level
		end

	set_icon is
		do
			value := icon_low_level
		end

	set_iron_cross is
		do
			value := iron_cross_low_level
		end

	set_left_ptr is
		do
			value := left_ptr_low_level
		end

	set_left_side is
		do
			value := left_side_low_level
		end

	set_left_tee is
		do
			value := left_tee_low_level
		end

	set_leftbutton is
		do
			value := leftbutton_low_level
		end

	set_ll_angle is
		do
			value := ll_angle_low_level
		end

	set_lr_angle is
		do
			value := lr_angle_low_level
		end

	set_man is
		do
			value := man_low_level
		end

	set_middlebutton is
		do
			value := middlebutton_low_level
		end

	set_mouse is
		do
			value := mouse_low_level
		end

	set_pencil is
		do
			value := pencil_low_level
		end

	set_pirate is
		do
			value := pirate_low_level
		end

	set_plus is
		do
			value := plus_low_level
		end

	set_question_arrow is
		do
			value := question_arrow_low_level
		end

	set_right_ptr is
		do
			value := right_ptr_low_level
		end

	set_right_side is
		do
			value := right_side_low_level
		end

	set_right_tee is
		do
			value := right_tee_low_level
		end

	set_rightbutton is
		do
			value := rightbutton_low_level
		end

	set_rtl_logo is
		do
			value := rtl_logo_low_level
		end

	set_sailboat is
		do
			value := sailboat_low_level
		end

	set_sb_down_arrow is
		do
			value := sb_down_arrow_low_level
		end

	set_sb_h_double_arrow is
		do
			value := sb_h_double_arrow_low_level
		end

	set_sb_left_arrow is
		do
			value := sb_left_arrow_low_level
		end

	set_sb_right_arrow is
		do
			value := sb_right_arrow_low_level
		end

	set_sb_up_arrow is
		do
			value := sb_up_arrow_low_level
		end

	set_sb_v_double_arrow is
		do
			value := sb_v_double_arrow_low_level
		end

	set_shuttle is
		do
			value := shuttle_low_level
		end

	set_sizing is
		do
			value := sizing_low_level
		end

	set_spider is
		do
			value := spider_low_level
		end

	set_spraycan is
		do
			value := spraycan_low_level
		end

	set_star is
		do
			value := star_low_level
		end

	set_target is
		do
			value := target_low_level
		end

	set_tcross is
		do
			value := tcross_low_level
		end

	set_top_left_arrow is
		do
			value := top_left_arrow_low_level
		end

	set_top_left_corner is
		do
			value := top_left_corner_low_level
		end

	set_top_right_corner is
		do
			value := top_right_corner_low_level
		end

	set_top_side is
		do
			value := top_side_low_level
		end

	set_top_tee is
		do
			value := top_tee_low_level
		end

	set_trek is
		do
			value := trek_low_level
		end

	set_ul_angle is
		do
			value := ul_angle_low_level
		end

	set_umbrella is
		do
			value := umbrella_low_level
		end

	set_ur_angle is
		do
			value := ur_angle_low_level
		end

	set_watch is
		do
			value := watch_low_level
		end

	set_xterm is
		do
			value := xterm_low_level
		end

	set_last_cursor is
		do
			value := last_cursor_low_level
		end

	set_blank_cursor is
		do
			value := blank_cursor_low_level
		end

	set_cursor_is_pixmap is
		do
			value := cursor_is_pixmap_low_level
		end

feature {ANY} -- Queries
	x_cursor: BOOLEAN is
		do
			Result := (value=x_cursor_low_level)
		end

	arrow: BOOLEAN is
		do
			Result := (value=arrow_low_level)
		end

	based_arrow_down: BOOLEAN is
		do
			Result := (value=based_arrow_down_low_level)
		end

	based_arrow_up: BOOLEAN is
		do
			Result := (value=based_arrow_up_low_level)
		end

	boat: BOOLEAN is
		do
			Result := (value=boat_low_level)
		end

	bogosity: BOOLEAN is
		do
			Result := (value=bogosity_low_level)
		end

	bottom_left_corner: BOOLEAN is
		do
			Result := (value=bottom_left_corner_low_level)
		end

	bottom_right_corner: BOOLEAN is
		do
			Result := (value=bottom_right_corner_low_level)
		end

	bottom_side: BOOLEAN is
		do
			Result := (value=bottom_side_low_level)
		end

	bottom_tee: BOOLEAN is
		do
			Result := (value=bottom_tee_low_level)
		end

	box_spiral: BOOLEAN is
		do
			Result := (value=box_spiral_low_level)
		end

	center_ptr: BOOLEAN is
		do
			Result := (value=center_ptr_low_level)
		end

	circle: BOOLEAN is
		do
			Result := (value=circle_low_level)
		end

	clock: BOOLEAN is
		do
			Result := (value=clock_low_level)
		end

	coffee_mug: BOOLEAN is
		do
			Result := (value=coffee_mug_low_level)
		end

	cross: BOOLEAN is
		do
			Result := (value=cross_low_level)
		end

	cross_reverse: BOOLEAN is
		do
			Result := (value=cross_reverse_low_level)
		end

	crosshair: BOOLEAN is
		do
			Result := (value=crosshair_low_level)
		end

	diamond_cross: BOOLEAN is
		do
			Result := (value=diamond_cross_low_level)
		end

	dot: BOOLEAN is
		do
			Result := (value=dot_low_level)
		end

	dotbox: BOOLEAN is
		do
			Result := (value=dotbox_low_level)
		end

	double_arrow: BOOLEAN is
		do
			Result := (value=double_arrow_low_level)
		end

	draft_large: BOOLEAN is
		do
			Result := (value=draft_large_low_level)
		end

	draft_small: BOOLEAN is
		do
			Result := (value=draft_small_low_level)
		end

	draped_box: BOOLEAN is
		do
			Result := (value=draped_box_low_level)
		end

	exchange: BOOLEAN is
		do
			Result := (value=exchange_low_level)
		end

	fleur: BOOLEAN is
		do
			Result := (value=fleur_low_level)
		end

	gobbler: BOOLEAN is
		do
			Result := (value=gobbler_low_level)
		end

	gumby: BOOLEAN is
		do
			Result := (value=gumby_low_level)
		end

	hand1: BOOLEAN is
		do
			Result := (value=hand1_low_level)
		end

	hand2: BOOLEAN is
		do
			Result := (value=hand2_low_level)
		end

	heart: BOOLEAN is
		do
			Result := (value=heart_low_level)
		end

	icon: BOOLEAN is
		do
			Result := (value=icon_low_level)
		end

	iron_cross: BOOLEAN is
		do
			Result := (value=iron_cross_low_level)
		end

	left_ptr: BOOLEAN is
		do
			Result := (value=left_ptr_low_level)
		end

	left_side: BOOLEAN is
		do
			Result := (value=left_side_low_level)
		end

	left_tee: BOOLEAN is
		do
			Result := (value=left_tee_low_level)
		end

	leftbutton: BOOLEAN is
		do
			Result := (value=leftbutton_low_level)
		end

	ll_angle: BOOLEAN is
		do
			Result := (value=ll_angle_low_level)
		end

	lr_angle: BOOLEAN is
		do
			Result := (value=lr_angle_low_level)
		end

	man: BOOLEAN is
		do
			Result := (value=man_low_level)
		end

	middlebutton: BOOLEAN is
		do
			Result := (value=middlebutton_low_level)
		end

	mouse: BOOLEAN is
		do
			Result := (value=mouse_low_level)
		end

	pencil: BOOLEAN is
		do
			Result := (value=pencil_low_level)
		end

	pirate: BOOLEAN is
		do
			Result := (value=pirate_low_level)
		end

	plus: BOOLEAN is
		do
			Result := (value=plus_low_level)
		end

	question_arrow: BOOLEAN is
		do
			Result := (value=question_arrow_low_level)
		end

	right_ptr: BOOLEAN is
		do
			Result := (value=right_ptr_low_level)
		end

	right_side: BOOLEAN is
		do
			Result := (value=right_side_low_level)
		end

	right_tee: BOOLEAN is
		do
			Result := (value=right_tee_low_level)
		end

	rightbutton: BOOLEAN is
		do
			Result := (value=rightbutton_low_level)
		end

	rtl_logo: BOOLEAN is
		do
			Result := (value=rtl_logo_low_level)
		end

	sailboat: BOOLEAN is
		do
			Result := (value=sailboat_low_level)
		end

	sb_down_arrow: BOOLEAN is
		do
			Result := (value=sb_down_arrow_low_level)
		end

	sb_h_double_arrow: BOOLEAN is
		do
			Result := (value=sb_h_double_arrow_low_level)
		end

	sb_left_arrow: BOOLEAN is
		do
			Result := (value=sb_left_arrow_low_level)
		end

	sb_right_arrow: BOOLEAN is
		do
			Result := (value=sb_right_arrow_low_level)
		end

	sb_up_arrow: BOOLEAN is
		do
			Result := (value=sb_up_arrow_low_level)
		end

	sb_v_double_arrow: BOOLEAN is
		do
			Result := (value=sb_v_double_arrow_low_level)
		end

	shuttle: BOOLEAN is
		do
			Result := (value=shuttle_low_level)
		end

	sizing: BOOLEAN is
		do
			Result := (value=sizing_low_level)
		end

	spider: BOOLEAN is
		do
			Result := (value=spider_low_level)
		end

	spraycan: BOOLEAN is
		do
			Result := (value=spraycan_low_level)
		end

	star: BOOLEAN is
		do
			Result := (value=star_low_level)
		end

	target: BOOLEAN is
		do
			Result := (value=target_low_level)
		end

	tcross: BOOLEAN is
		do
			Result := (value=tcross_low_level)
		end

	top_left_arrow: BOOLEAN is
		do
			Result := (value=top_left_arrow_low_level)
		end

	top_left_corner: BOOLEAN is
		do
			Result := (value=top_left_corner_low_level)
		end

	top_right_corner: BOOLEAN is
		do
			Result := (value=top_right_corner_low_level)
		end

	top_side: BOOLEAN is
		do
			Result := (value=top_side_low_level)
		end

	top_tee: BOOLEAN is
		do
			Result := (value=top_tee_low_level)
		end

	trek: BOOLEAN is
		do
			Result := (value=trek_low_level)
		end

	ul_angle: BOOLEAN is
		do
			Result := (value=ul_angle_low_level)
		end

	umbrella: BOOLEAN is
		do
			Result := (value=umbrella_low_level)
		end

	ur_angle: BOOLEAN is
		do
			Result := (value=ur_angle_low_level)
		end

	watch: BOOLEAN is
		do
			Result := (value=watch_low_level)
		end

	xterm: BOOLEAN is
		do
			Result := (value=xterm_low_level)
		end

	last_cursor: BOOLEAN is
		do
			Result := (value=last_cursor_low_level)
		end

	blank_cursor: BOOLEAN is
		do
			Result := (value=blank_cursor_low_level)
		end

	cursor_is_pixmap: BOOLEAN is
		do
			Result := (value=cursor_is_pixmap_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	x_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_X_CURSOR"
 			}"
 		end

	arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ARROW"
 			}"
 		end

	based_arrow_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BASED_ARROW_DOWN"
 			}"
 		end

	based_arrow_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BASED_ARROW_UP"
 			}"
 		end

	boat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOAT"
 			}"
 		end

	bogosity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOGOSITY"
 			}"
 		end

	bottom_left_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_LEFT_CORNER"
 			}"
 		end

	bottom_right_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_RIGHT_CORNER"
 			}"
 		end

	bottom_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_SIDE"
 			}"
 		end

	bottom_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOTTOM_TEE"
 			}"
 		end

	box_spiral_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BOX_SPIRAL"
 			}"
 		end

	center_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CENTER_PTR"
 			}"
 		end

	circle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CIRCLE"
 			}"
 		end

	clock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLOCK"
 			}"
 		end

	coffee_mug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COFFEE_MUG"
 			}"
 		end

	cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSS"
 			}"
 		end

	cross_reverse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSS_REVERSE"
 			}"
 		end

	crosshair_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CROSSHAIR"
 			}"
 		end

	diamond_cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DIAMOND_CROSS"
 			}"
 		end

	dot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOT"
 			}"
 		end

	dotbox_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOTBOX"
 			}"
 		end

	double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DOUBLE_ARROW"
 			}"
 		end

	draft_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAFT_LARGE"
 			}"
 		end

	draft_small_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAFT_SMALL"
 			}"
 		end

	draped_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAPED_BOX"
 			}"
 		end

	exchange_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXCHANGE"
 			}"
 		end

	fleur_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FLEUR"
 			}"
 		end

	gobbler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GOBBLER"
 			}"
 		end

	gumby_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GUMBY"
 			}"
 		end

	hand1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HAND1"
 			}"
 		end

	hand2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HAND2"
 			}"
 		end

	heart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HEART"
 			}"
 		end

	icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ICON"
 			}"
 		end

	iron_cross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IRON_CROSS"
 			}"
 		end

	left_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_PTR"
 			}"
 		end

	left_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_SIDE"
 			}"
 		end

	left_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFT_TEE"
 			}"
 		end

	leftbutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEFTBUTTON"
 			}"
 		end

	ll_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LL_ANGLE"
 			}"
 		end

	lr_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LR_ANGLE"
 			}"
 		end

	man_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MAN"
 			}"
 		end

	middlebutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MIDDLEBUTTON"
 			}"
 		end

	mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOUSE"
 			}"
 		end

	pencil_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PENCIL"
 			}"
 		end

	pirate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIRATE"
 			}"
 		end

	plus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PLUS"
 			}"
 		end

	question_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_QUESTION_ARROW"
 			}"
 		end

	right_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_PTR"
 			}"
 		end

	right_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_SIDE"
 			}"
 		end

	right_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHT_TEE"
 			}"
 		end

	rightbutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RIGHTBUTTON"
 			}"
 		end

	rtl_logo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RTL_LOGO"
 			}"
 		end

	sailboat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SAILBOAT"
 			}"
 		end

	sb_down_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_DOWN_ARROW"
 			}"
 		end

	sb_h_double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_H_DOUBLE_ARROW"
 			}"
 		end

	sb_left_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_LEFT_ARROW"
 			}"
 		end

	sb_right_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_RIGHT_ARROW"
 			}"
 		end

	sb_up_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_UP_ARROW"
 			}"
 		end

	sb_v_double_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SB_V_DOUBLE_ARROW"
 			}"
 		end

	shuttle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SHUTTLE"
 			}"
 		end

	sizing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SIZING"
 			}"
 		end

	spider_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SPIDER"
 			}"
 		end

	spraycan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SPRAYCAN"
 			}"
 		end

	star_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STAR"
 			}"
 		end

	target_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TARGET"
 			}"
 		end

	tcross_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TCROSS"
 			}"
 		end

	top_left_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_LEFT_ARROW"
 			}"
 		end

	top_left_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_LEFT_CORNER"
 			}"
 		end

	top_right_corner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_RIGHT_CORNER"
 			}"
 		end

	top_side_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_SIDE"
 			}"
 		end

	top_tee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TOP_TEE"
 			}"
 		end

	trek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TREK"
 			}"
 		end

	ul_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UL_ANGLE"
 			}"
 		end

	umbrella_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UMBRELLA"
 			}"
 		end

	ur_angle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UR_ANGLE"
 			}"
 		end

	watch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WATCH"
 			}"
 		end

	xterm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_XTERM"
 			}"
 		end

	last_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LAST_CURSOR"
 			}"
 		end

	blank_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BLANK_CURSOR"
 			}"
 		end

	cursor_is_pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CURSOR_IS_PIXMAP"
 			}"
 		end


end -- class GDK_CURSOR_TYPE_ENUM
