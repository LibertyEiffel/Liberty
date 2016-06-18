class PROGRESS_BAR

inherit 
	GTK

create {ANY} 
	make

feature {ANY}
	
	bar: GTK_PROGRESS_BAR

	pulse: GTK_BUTTON
	
	hbox: GTK_HBOX
	
	window: GTK_WINDOW
	
	make
			-- Make
		local i: ITERATOR[G_PARAM_SPEC]
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
			print ("Window has "+window.properties.count.out+" properties: ")
			from
				i:=window.properties.get_new_iterator;
				i.start
			until i.is_off loop
				std_output.put_string(i.item.name) std_output.put_string(once " - ")
				std_output.put_string(i.item.nick) std_output.put_string(once ":* ")
				print (i.item.blurb) std_output.put_new_line
				i.next
			end
			window.show_all
			gtk.run_main_loop
		end

	clicked (a_button: GTK_BUTTON)
		do
			bar.pulse
		end
end
