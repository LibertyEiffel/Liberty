class LESSON06

inherit
	GRAPHIC
	
creation
	make

feature{ANY}

	world: WORLD
	cube: CUBE

	win: TOPLEVEL_WINDOW

	angle: REAL
	
	make is
		local
			anim: SIMPLE_PERIODIC_JOB
			exit: BUTTON
		do
			create win.default_create
			win.set_title("Lesson 06")
			win.set_background_color(white_color)
			win.map

			create world.make(win)
			create cube.make_with_position(0, 0, -6)
			world.add_opaque_object(cube)

			create exit.with_label(win, U"Exit")

			exit.when_left_clicked(agent finish_program)
			win.when_close_requested(agent finish_program)

			create anim.set_work(agent turn, Void, 1, 0.05)
			vision.loop_stack.add_job(anim)

			vision.start

		end

	turn : BOOLEAN is
		do
			angle := angle + 5
			cube.turn(angle)
			world.display_gl
			Result := True
		end
		
	finish_program is
		do
			vision.loop_stack.break
		end
end
