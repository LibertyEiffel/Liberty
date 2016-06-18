
class ANOTHER_STATUS_BAR_DEMO
insert GTK
create {ANY} make

feature {ANY} -- GUI elements
	window: GTK_WINDOW
	push_button,pop_button: GTK_BUTTON
	statusbar: GTK_STATUS_BAR

feature {ANY} -- Initialisation
	make
		do
			gtk.initialize
			create window.make
			window.set_title (window_title)
			window.connect_agent_to_destroy_signal (agent on_destroy)

			create push_button.with_label ("Push a message")
			create pop_button.with_label ("Pop last message")
			create statusbar.make
			statusbar.set_homogeneous -- To show the actual message; otherwise the window will be reduced too much.

			statusbar.push (startup_message)
			-- Connect "clicked" signals of the buttons to callbacks
			push_button.connect_agent_to_clicked_signal (agent on_push_clicked (?))
			pop_button.connect_agent_to_clicked_signal (agent on_pop_clicked (?))
			--	Pack and show all our widgets
			push_button.show; pop_button.show
			statusbar.pack_start(push_button,False,False,0)
			statusbar.pack_start(pop_button,False,False,0)
			statusbar.show
			window.add(statusbar)
			window.show

			-- Run the GTK main loop
			gtk.run_main_loop
		end

feature {ANY} counter: INTEGER
feature {ANY} -- Agents

	on_push_clicked (a_button: GTK_BUTTON)
		do
			counter:=counter+1
			print ("Pushing message n."+counter.out+"%N")
			statusbar.push("This is message number "+counter.out)
		end
	on_pop_clicked (a_button: GTK_BUTTON)
		do
			if statusbar.is_empty then
				print ("Statusbar empty: cannot pop any message%N")
			else
				print ("Popping last message%N")
				statusbar.pop
			end
		end

	on_destroy (a_gtk_object: GTK_OBJECT)
		do
			print ("on destroy has been called%N")
			gtk.quit
		end

feature {ANY} -- Constants
	window_title: STRING is "Eiffel GTK Staturbar demo"
	startup_message: STRING is  "Startup message"
end
