class LESSON01

inherit
	GRAPHIC
	
creation
	make

feature{ANY}
	
	-- WORLD is a sample GL_WIDGET.
	-- It corresponds to the common OpenGL setup in these tutorials
	world : WORLD

	make is
		local
			win: TOPLEVEL_WINDOW
			exit : BUTTON
		do
			create win.default_create
			win.set_title("Lesson 01")
			win.set_background_color(white_color)
			win.map

			create world.make(win)

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
