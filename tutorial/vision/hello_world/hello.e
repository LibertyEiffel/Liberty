class HELLO
	-- This example show:
	-- how to create a window, chose title and colors,
	-- how to add widgets into the window,
	-- how to start and stop the event loop.

inherit
	GRAPHIC
		-- Give access to constants (vision, colors...)

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	make is
		local
			label: LABEL
		do
			create toplevel_window.default_create
			toplevel_window.set_title("Hello World")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			-- put the window on the screen; may be done later
			create label.make(U"Hello World !")
			-- windows are containers, you add widgets into them
			toplevel_window.child_attach(label)
			-- register procedure to call on user requests on 'quit'
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			-- start the event loop. The event loop executes registred
			-- behavior for user actions.
			-- It will stop when break is called (vision.loop_stack.break).
			vision.start
			io.put_string("The end%N")
		end

end -- class HELLO
