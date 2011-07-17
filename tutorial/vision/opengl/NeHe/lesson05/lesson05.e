class LESSON05

inherit
	GRAPHIC
	
creation
	make

feature{ANY}
	
	world : WORLD
	pyramid : PYRAMID
	cube : CUBE

	make is
		local
			win: TOPLEVEL_WINDOW
			exit : BUTTON
			anim : SIMPLE_PERIODIC_JOB
		do
			create win.default_create
			win.set_title("Lesson 05")
			win.set_background_color(white_color)
			win.map

			create world.make(win)
			create pyramid.make_with_position(-1.5, 0.0, -6.0)
			world.add_opaque_object(pyramid)
			create cube.make_with_position(1.5, 0, -6)
			world.add_opaque_object(cube)

			create exit.with_label(win, U"Exit")
			exit.when_left_clicked(agent finish_program)
			win.when_close_requested(agent finish_program)

			create anim.set_work(agent pyramid.anim(world), Void, 1, 0.01)
			vision.loop_stack.add_job(anim)

			create anim.set_work(agent cube.anim(world), Void, 1, 0.01)
			vision.loop_stack.add_job(anim)

			vision.start
		end

	finish_program is
		do
			vision.loop_stack.break
		end
end
