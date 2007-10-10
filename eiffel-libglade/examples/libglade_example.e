class LIBGLADE_EXAMPLE

inherit
	GTK
	
creation 
	make
	
feature {NONE} -- creation
	make is
		local
			x: GLADE_XML
		do
			gtk.initialize
			create x.make ("ui.xml")
			window := x.get_window ("main")
			window.connect_agent_to_delete_event_signal (agent quit)
			window.show
			gtk.run_main_loop
		end

feature -- Widgets

	window: GTK_WINDOW
			-- the window

feature -- Signal handlers

	quit (w: GTK_WIDGET; e: GDK_EVENT): BOOLEAN is
		do
			gtk.quit
		end

end
