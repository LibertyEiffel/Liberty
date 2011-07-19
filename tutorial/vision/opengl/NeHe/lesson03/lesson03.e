class LESSON03

inherit
	GRAPHIC
	
creation
	make

feature{ANY}
	
	world : WORLD
	triangle : TRIANGLE
	square : SQUARE

	make is
		local
			win: TOPLEVEL_WINDOW
			exit : BUTTON
		do
			create win.default_create
			win.set_title("Lesson 03")
			win.set_background_color(white_color)
			win.map

			create world.make(win)
			create triangle.make_with_position(-1.5, 0.0, -6.0)
			world.add_opaque_object(triangle)
			create square.make_with_position(1.5, 0, -6)
			world.add_opaque_object(square)

			create exit.with_label(win, U"Exit")
			exit.when_left_clicked(agent finish_program)
			win.when_close_requested(agent finish_program)

			vision.start
		end

	finish_program is
		do
			vision.loop_stack.break
		end
end
