class EXAMPLE3

inherit
	GRAPHIC
	
creation
	make

feature{ANY}

	world : WORLD
	pyramid : PYRAMID

	win: TOPLEVEL_WINDOW

	angle : REAL
	
	make is
		local
			anim : SIMPLE_PERIODIC_JOB
		do
			create win.default_create
			win.set_title("MyLe")
			win.set_background_color(white_color)
			win.map

			create world.make(win)
			create pyramid.make_with_position(0, 0, -6)
			world.add_opaque_object(pyramid)

			win.when_close_requested(agent finish_program)

			create anim.set_work(agent turn, Void, 1, 0.02)
			vision.loop_stack.add_job(anim)

			vision.start
		end

	turn : BOOLEAN is
		do
			angle := angle + 3
			pyramid.turn(angle, -3*angle)
			world.display_gl
			Result := True
		end
		
	finish_program is
		do
			vision.loop_stack.break
		end
end
