class BUTTONS_DEMO
insert GTK -- instead of "inherit GTK_MAIN"
creation make
feature
	make is
		do
			gtk.initialize -- instead of "initialize_gtk"
			create window.make
			window.show_all
			gtk.run_main_loop -- instead of "gtk_main"
		end
	window: BUTTONS_WINDOW
end


