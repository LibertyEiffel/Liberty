class FREE_DRAWING2
	-- This example show how to do free style draw, using dedicated
	-- layout (DIAGRAM).

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		local
			toplevel_window: TOPLEVEL_WINDOW; diagram: SUB_WINDOW; horizontal_line: HORIZONTAL_LINE
		do
			create toplevel_window
			-- The default layout is column.
			create diagram.make_layout(toplevel_window, create {DIAGRAM})
			diagram.map
			create horizontal_line
			toplevel_window.child_attach(horizontal_line)
			add_controls(toplevel_window)
			toplevel_window.set_title(once "Drawing example")
			toplevel_window.set_background_color(white_color)
			toplevel_window.set_x_expand(False)
			toplevel_window.set_y_expand(False)
			toplevel_window.map
			vision.start
		end

	add_controls (w: WINDOW) is
		local
			controls: CONTAINER; layout: ROW_LAYOUT; quit: BUTTON
		do
			create layout
			create controls.make_layout(w, layout)
			controls.set_x_expand(True)
			layout.set_border(5)
			layout.set_spacing(5)
			layout.insert_button_space
			create quit.with_label(controls, U"Exit")
			quit.when_left_clicked(agent vision.loop_stack.break)
		end

end -- class FREE_DRAWING2
