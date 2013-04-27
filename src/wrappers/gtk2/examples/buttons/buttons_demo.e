class BUTTONS_DEMO
insert 
	-- TODO: Implement GTK_APPLICATION, with no undefined features; GTK
	-- has undefined features. Currently ANY must be inserted alongside
	-- with GTK in all effective classes otherwise they will contain
	-- undefined features, making them actually deferred.
	GTK 
	ANY 

create {ANY} make
feature {ANY}
	make is
		do
			gtk.initialize -- instead of "initialize_gtk"
			create window.make
			window.show_all
			gtk.run_main_loop -- instead of "gtk_main"
		end
	window: BUTTONS_WINDOW
end


