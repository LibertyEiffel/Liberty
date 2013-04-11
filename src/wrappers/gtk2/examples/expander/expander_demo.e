class EXPANDER_DEMO
insert GTK
creation make
feature {ANY}
	make is
		do
			gtk.initialize
			create window.make
			window.show_all
			gtk.run_main_loop
		end
	window: MY_WINDOW
end


