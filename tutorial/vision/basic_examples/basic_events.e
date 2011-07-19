class BASIC_EVENTS
	-- This example show:
	-- how to add widgets into the window,
	-- how to use COLUMN_LAYOUT and it's border and spacing,
	-- how to register procedure to be called for each user action.

inherit
	GRAPHIC
		-- Give access to constants (vision, colors...)

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	column_layout: COLUMN_LAYOUT

	make is
		local
			label: LABEL; horizontal_line: HORIZONTAL_LINE; button: BUTTON
		do
			create column_layout
			create toplevel_window.make(column_layout)
			-- minimal space between the border and objects inside
			column_layout.set_border(5)
			-- minimal space between each object inside
			column_layout.set_spacing(5)
			toplevel_window.set_title("Hello World")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			-- put the window on the screen; may be done later
			-- register procedure to call on user requests on 'toplevel_window'
			toplevel_window.when_wheel_up(agent border(1))
			toplevel_window.when_wheel_down(agent border(-1))
			create label.make(U"Hello World ! Please, use the wheel.")
			toplevel_window.when_left_down(agent label.set_text(U"Hello World !"))
			toplevel_window.when_right_down(agent label.set_text(U"Use the wheel"))
			-- windows are containers, you add widgets into them
			toplevel_window.child_attach(label)
			create horizontal_line
			toplevel_window.child_attach(horizontal_line)
			create button.with_label(toplevel_window, U"Exit")
			-- register procedure to call on user requests on 'quit'
			button.when_left_clicked(agent vision.loop_stack.break)
			button.when_right_down(agent background(black_color))
			button.when_right_up(agent background(white_color))
			-- start the event loop. The event loop executes registred
			-- behavior for user actions.
			-- It will stop when break is called (vision.loop_stack.break).
			vision.start
			io.put_string("The end%N")
		end

feature {}
	background (c: COLOR) is
		do
			toplevel_window.set_background_color(c)
			toplevel_window.refresh
		end

	border (i: INTEGER) is
		do
			if column_layout.border + i >= 0 then
				column_layout.set_border(column_layout.border + i)
			end
		end

end -- class BASIC_EVENTS
