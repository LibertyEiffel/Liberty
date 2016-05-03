
class STATUS_BAR_DEMO
insert GTK
create {ANY} make

feature {ANY} -- GUI elements
	window: GTK_WINDOW
	hbox: GTK_HBOX
	vbox: GTK_VBOX
	push_button,pop_button: GTK_BUTTON
	statusbar: GTK_STATUS_BAR

feature {ANY} -- Initialisation
	make is
		do
			gtk.initialize
			create window.make
			window.set_title (window_title)
			window.connect_agent_to_destroy_signal (agent on_destroy)

			create push_button.with_label ("Push a message")
			create pop_button.with_label ("Pop last message")
			create statusbar.make
			statusbar.push (startup_message)
			create vbox.make(True,5)
			create hbox.make(True,5)
			-- Connect "clicked" signals of the buttons to callbacks
			push_button.connect_agent_to_clicked_signal (agent on_push_clicked (?))
			pop_button.connect_agent_to_clicked_signal (agent on_pop_clicked (?))
			--	Pack and show all our widgets
			push_button.show; pop_button.show
			hbox.pack_start(push_button,True,True,10)
			hbox.pack_start(pop_button,True,True,10)
			hbox.show
			vbox.pack_start(hbox,True,True,0)
			statusbar.show
			vbox.pack_start(statusbar,True,True,0)
			vbox.show
			window.add(vbox)
			window.show

			gtk.run_main_loop
		end

feature {ANY} counter: INTEGER
feature {ANY} -- Agents

	on_push_clicked (a_button: GTK_BUTTON) is
		do
			counter:=counter+1
			print ("Pushing message n."+counter.out+"%N")
			statusbar.push("This is message number "+counter.out)
		end
	on_pop_clicked (a_button: GTK_BUTTON) is
		do
			if statusbar.is_empty then
				print ("Statusbar empty: cannot pop any message%N")
			else
				print ("Popping last message%N")
				statusbar.pop
			end
		end

	on_destroy (a_gtk_object: GTK_OBJECT) is
		do
			print ("on destroy has been called%N")
			gtk.quit
		end

feature {ANY} -- Constants
	window_title: STRING is "Eiffel GTK Staturbar demo"
	startup_message: STRING is  "Startup message"
end
