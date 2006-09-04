class EXPANDER_DEMO
insert GTK
creation make
feature
	make is
		do
			gtk.initialize
			create window.make
			window.show_all
			gtk.main
		end
	window: MY_WINDOW
end


