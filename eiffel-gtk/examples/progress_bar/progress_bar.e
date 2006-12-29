class PROGRESS_BAR

inherit 
	GTK

creation 
	make

feature
	
	bar: GTK_PROGRESS_BAR

	pulse: GTK_BUTTON
	
	hbox: GTK_HBOX
	
	window: GTK_WINDOW
	
	make is
			-- Make
		do
			gtk.initialize							
			create window.make
			window.set_title ("Progress Bar")
			window.midscreen

			create bar.make
			bar.set_text ("A simple example of a progress bar")
			bar.set_fraction (0.35)

			create hbox.make (False, 2)
			hbox.pack_start_defaults (bar)

			create pulse.with_label("Pulse!")
			pulse.connect_agent_to_clicked_signal(agent clicked)
			hbox.pack_end_defaults (pulse)
			
			window.add (hbox)
			window.show_all
			gtk.run_main_loop
		end

	clicked (a_button: GTK_BUTTON) is
		do
			bar.pulse
		end
end
