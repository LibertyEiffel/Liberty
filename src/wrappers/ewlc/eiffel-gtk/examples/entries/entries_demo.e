class ENTRIES_DEMO
insert GTK
creation make
feature
	make is
		do
			gtk.initialize
			create window.make
			window.show_all
			gtk.run_main_loop
		end
	window: ENTRIES_WINDOW
end


