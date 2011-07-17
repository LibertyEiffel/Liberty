class EXAMPLE1
--
-- This example show how to use background periodic job
--
	
inherit
	GRAPHIC
	
creation {ANY}
	make
	
feature {}
	make is
		local
			toplevel_window: TOPLEVEL_WINDOW; clock_window: SUB_WINDOW
		do
			create toplevel_window
			-- The default layout is column.
			create clock_window.make_layout(toplevel_window, create {KITCHEN_CLOCK})
			clock_window.set_x_expand(True)
			clock_window.set_y_expand(True)
			clock_window.map
			
			toplevel_window.child_attach(create {HORIZONTAL_LINE})
			
			add_controls(toplevel_window)
			toplevel_window.set_title("Background example")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			vision.start
		end

	add_controls (window: WINDOW) is
		local
			container: CONTAINER; layout: ROW_LAYOUT; exit_button: BUTTON
		do
			create layout
			create container.make_layout(window, layout)
			container.set_x_expand(True)
			layout.set_border(5)
			layout.set_spacing(5)
			layout.insert_button_space
			create exit_button.with_label(container, U"Exit")
			exit_button.when_left_clicked(agent vision.loop_stack.break)
		end

end -- class EXAMPLE1
