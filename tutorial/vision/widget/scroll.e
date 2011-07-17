class SCROLL
--
-- This example show SCROLL_VIEW usage.
--
	
inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	scroll_view: SCROLL_VIEW

	make is
		local
			main_window: TOPLEVEL_WINDOW; clock_window: SUB_WINDOW; line: HORIZONTAL_LINE
		do
			create main_window
			-- The default layout is column.
			create scroll_view.make(main_window)
			scroll_view.set_x_expand(True)
			scroll_view.set_y_expand(True)
			scroll_view.map
			create clock_window.make_layout(scroll_view, create {KITCHEN_CLOCK})
			clock_window.set_background_color(white_color)
			add_controls(clock_window)
			clock_window.set_x_expand(True)
			clock_window.set_y_expand(True)
			scroll_view.resize_contents(800, 800)
			clock_window.map
			clock_window.when_left_down(agent set_move(True))
			clock_window.when_left_up(agent set_move(False))
			clock_window.when_pointer_move(agent moving)
			create line
			main_window.child_attach(line)
			add_controls(main_window)
			main_window.set_title("SCROLL_VIEW example")
			main_window.set_background_color(white_color)
			main_window.map
			--main_window.paint(0,0) --TODO: suppress ?
			vision.start
		end

	add_controls (w: WINDOW) is
		local
			controls: CONTAINER; layout: ROW_LAYOUT; quit: BUTTON; shift: BUTTON
		do
			create layout
			create controls.make_layout(w, layout)
			controls.set_x_expand(True)
			layout.set_border(5)
			layout.set_spacing(5)
			layout.insert_button_space
			create shift.with_label(controls, U"up")
			shift.when_left_clicked(agent scroll_view.vertical_shift(-20))
			create shift.with_label(controls, U"down")
			shift.when_left_clicked(agent scroll_view.vertical_shift(20))
			create shift.with_label(controls, U"left")
			shift.when_left_clicked(agent scroll_view.horizontal_shift(-20))
			create shift.with_label(controls, U"right")
			shift.when_left_clicked(agent scroll_view.horizontal_shift(20))
			layout.insert_button_space
			create quit.with_label(controls, U"Exit")
			quit.when_left_clicked(agent vision.loop_stack.break)
		end

	move: BOOLEAN

	click_x, click_y: INTEGER

	set_move (b: BOOLEAN) is
		do
			move := b
			click_x := vision.pointer_x_root
			click_y := vision.pointer_y_root
		end

	moving (x, y: INTEGER) is
		do
			if move then
				scroll_view.shift(vision.pointer_x_root - click_x, vision.pointer_y_root - click_y)
				click_x := vision.pointer_x_root
				click_y := vision.pointer_y_root
			end
		end

end -- class SCROLL
