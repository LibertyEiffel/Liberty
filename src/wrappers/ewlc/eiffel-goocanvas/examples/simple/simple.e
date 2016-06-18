class
	SIMPLE
insert
	GTK 
	ANY 

create {ANY} make
feature {ANY}
	make
		do
			gtk.initialize -- instead of "initialize_gtk"
			create window.make
			window.show_all
			gtk.run_main_loop -- instead of "gtk_main"
		end
		
	window: MAIN_WINDOW
end


