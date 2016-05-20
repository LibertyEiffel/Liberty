class CALENDAR_DEMO
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
			build
			window.show_all
			gtk.run_main_loop -- instead of "gtk_main"
		end

	window: GTK_WINDOW
	calendar: GTK_CALENDAR
	window_title: STRING is "Calendar demo"

	build is
		do
			create window.make
			create calendar.make
			window.set_title (window_title)
			window.midscreen
			window.add (calendar)
			window.connect_to_destroy_signal(agent on_quit)
		end

	on_quit(a_widget: GTK_OBJECT) is
		do
			print ("Choosen date is "+calendar.date.to_string+"%N")
			gtk.quit
		end
end


