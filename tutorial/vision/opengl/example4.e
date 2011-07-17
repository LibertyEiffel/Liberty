class EXAMPLE4

inherit
	GRAPHIC
	
creation
	make

feature{ANY}

	world : INTERACTIVE_WORLD
	pyramid : PYRAMID

	win: FULLSCREEN_WINDOW

	angle : REAL
	
	make is
		local
			anim : SIMPLE_PERIODIC_JOB
		do
			create win
			win.map

			create world.make_interactive(win, agent finish_program)
			create pyramid.make_with_position(0, 0, -6)
			world.add_opaque_object(pyramid)

			win.when_close_requested(agent finish_program)

			create anim.set_work(agent turn, Void, 1, 0.01)
			vision.loop_stack.add_job(anim)

			vision.start
		end

	turn : BOOLEAN is
		do
			angle := angle + 2
			pyramid.turn(angle, -angle)
			world.display_gl
			Result := True
		end
		
	finish_program is
		do
			vision.loop_stack.break
			win.destroy
		end
end
