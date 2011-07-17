class CHECK_BUTTON_DEMO
	-- Show how to use CHECK_BUTTON.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		local
			toplevel_window: TOPLEVEL_WINDOW; check_button: CHECK_BUTTON
		do
			create toplevel_window.default_create
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.set_background_color(white_color)
			create check_button.with_label(toplevel_window, U"I'm happy")
			check_button.when_value_change(agent print_state)
			toplevel_window.map
			vision.start
		end

	print_state (happy: BOOLEAN) is
		do
			if happy then
				io.put_string(once "I'm happy%N")
			else
				io.put_string(once "I'm not happy%N")
			end
		end

end -- class CHECK_BUTTON_DEMO
