class EXAMPLE1

inherit
	GRAPHIC
	
creation
	make

feature{ANY}
	
	world : WORLD
	pyramid : PYRAMID

	rot : REAL

	make is
		local
			win: TOPLEVEL_WINDOW
			exit : BUTTON
		do
			create win.default_create
			win.set_title("GL Test")
			win.set_background_color(white_color)
			win.map

			create world.make(win)
			create pyramid.make_with_position(0, 0, -6)
			world.add_opaque_object(pyramid)

			create exit.with_label(win, U"Click: Exit  |  Move: Turn")
			exit.when_pointer_move(agent turn)
			exit.when_left_clicked(agent finish_program)

			win.when_close_requested(agent finish_program)

			vision.start
		end

	turn is
		do
			rot := rot + 2
			pyramid.turn(rot, -3*rot)
			world.display_gl
		end

	finish_program is
		do
			vision.loop_stack.break
		end
end
