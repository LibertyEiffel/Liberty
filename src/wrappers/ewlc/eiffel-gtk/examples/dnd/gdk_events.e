class GDK_EVENTS

insert
	ANY
	GTK
	GDK_EVENT_MASK

create {ANY}
	make

feature {ANY}

	on_delete_event (a_gtk_object: GTK_OBJECT)
		do
			gtk.quit
		end

	motion_notified (an_event_motion: GDK_EVENT_MOTION; a_widget: GTK_WIDGET): BOOLEAN
		do
			print ("(" + an_event_motion.x.to_string + ", " + an_event_motion.y.to_string + ")%N")
		end

	make
		local
			event_box: GTK_EVENT_BOX
		do
			gtk.initialize
			-- Create and configure window
			create window.make
			window.set_default_size (280, 190)
			window.connect_agent_to_destroy_signal (agent on_delete_event)
			window.set_border_width (20)

			-- Create and configure event box
			create event_box.make
			window.add (event_box)
			event_box.add_events (gdk_button1_motion_mask) -- If you want hints: .bit_or (gdk_pointer_motion_hint_mask))
			event_box.connect_agent_to_motion_notify_event_signal (agent motion_notified)

			create label.with_markup_label ("<span font_desc='Sans Italic Bold 20'>Hello World!</span>")
			event_box.add (label)

			window.show_all

			gtk.run_main_loop

		end

	window: GTK_WINDOW

	label: GTK_LABEL

end -- class GDK_EVENTS
