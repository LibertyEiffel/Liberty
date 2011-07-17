class FREE_DRAWING1
	-- This example show how to draw without adding widgets.
	-- NOTE that you are allowed to draw ONLY in response to expose events.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	draw_kit: DRAW_KIT

	toplevel_window: TOPLEVEL_WINDOW

	make is
		local
			label: LABEL
		do
			create toplevel_window
			-- The default layout is column.
			toplevel_window.set_title("Free Drawing")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			create label.make(U"Background-label")
			toplevel_window.child_attach(label)
			create draw_kit
			draw_kit.set_line_width(3)
			-- This drawing is registred after the container who draw
			-- the label, so they will be drawn after (above).
			toplevel_window.when_expose(agent draw_figure)
			vision.start
		end

	draw_figure is
		do
			-- Draw_kit need to be set for each expose event
			draw_kit.set_drawable(toplevel_window)
			-- Note that you may have one draw_kit (one pen) per color
			draw_kit.set_color(red_color)
			draw_kit.line(10, 10, 100, 100)
			draw_kit.line(10, 100, 250, 150)
			draw_kit.set_color(blue_color)
			draw_kit.rectangle(10, 50, 100, 100)
			draw_kit.fill_rectangle(100, 100, 100, 50)
			draw_kit.set_color(yellow_color)
			draw_kit.put_string(U"Cool!", 100, 100)
		end

end -- class FREE_DRAWING1
