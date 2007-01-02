class TEXT_DEMO
insert GTK 
creation make
feature
	make is
		do
			gtk.initialize -- instead of "initialize_gtk"
			create window.make
			window.show_all
			start := window.text.buffer.iter_at_offset(0)
			gtk.run_main_loop -- instead of "gtk_main"
		end
	window: TEXT_VIEW_WINDOW
	start: GTK_TEXT_ITER
end


