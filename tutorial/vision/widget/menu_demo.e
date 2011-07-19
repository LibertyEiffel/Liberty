class MENU_DEMO

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		local
			toplevel_window, help_window: TOPLEVEL_WINDOW; menu_bar: MENU_BAR; help_label: LABEL
		do
			create help_window
			create label.make(U"Waiting...")
			help_window.set_background_color(white_color)
			help_window.child_attach(create {LABEL}.make(U"This is the %
                                                       %help Window"))
			help_window.when_close_requested(agent help_window.unmap)
			help_window.when_close_requested(agent vision.loop_stack.break)
			create toplevel_window
			toplevel_window.set_background_color(white_color)
			create menu_bar.make(toplevel_window)
			menu_bar.add_text_entry(U"File", file_menu)
			menu_bar.add_text_entry(U"Edit", edit_menu)
			menu_bar.add_space
			create help_label.make(U"Help")
			menu_bar.add_entry(help_label, agent show(help_window))
			menu_bar.map
			label.set_expand(True)
			toplevel_window.child_attach(label)
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.map
			vision.start
		end

feature {}
	label: LABEL

	show (toplevel_window: TOPLEVEL_WINDOW) is
		do
			vision.new_loop
			toplevel_window.map
		end

	file_menu: MENU is
		do
			create Result.make
			Result.add_text_entry(U"Open", agent label.set_text(U"Open"))
			Result.add_text_entry(U"Save", agent label.set_text(U"Save"))
			Result.add_space
			Result.add_text_entry(U"Exit", agent vision.loop_stack.break)
		end

	edit_menu: MENU is
		do
			create Result.make
			Result.add_text_entry(U"Undo", agent label.set_text(U"Undo"))
			Result.add_space
			Result.add_text_entry(U"Copy", agent label.set_text(U"Copy"))
			Result.add_text_entry(U"Paste", agent label.set_text(U"Paste"))
		end

end -- class MENU_DEMO
