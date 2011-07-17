class EXAMPLE


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
			toplevel_window.set_title(translator.translation("Hello world!"))
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			-- put the window on the screen; may be done later
			create label.make(unicode_translator.translation("Hello world!"))
			-- windows are containers, you add widgets into them
			toplevel_window.child_attach(label)
			-- register procedure to call on user requests on 'quit'
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			-- start the event loop. The event loop executes registred
			-- behavior for user actions.
			-- It will stop when break is called (vision.loop_stack.break).
			vision.start
			io.put_string(translator.translation("The end%N"))
		end

	translator: TRANSLATOR is
		once
			create Result.init
		end

	unicode_translator: UNICODE_TRANSLATOR is
		once
			create Result.connect_to(translator)
			translator.bind_text_domain_code_set(Result.text_domain, once "UTF-8")
		end

end -- class EXAMPLE
