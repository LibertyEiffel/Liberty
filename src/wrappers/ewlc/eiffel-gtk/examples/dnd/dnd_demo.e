class DND_DEMO

insert
	ANY
	GTK
	GTK_DEST_DEFAULTS
	GDK_DRAG_ACTION
	GDK_MODIFIER_TYPE

create {ANY}
	make

feature {ANY}

	on_delete_event (a_gtk_object: GTK_OBJECT)
		do
			gtk.quit
		end

	on_button1_drag_begin (a_gdk_drag_context: GDK_DRAG_CONTEXT; a_gtk_widget: GTK_WIDGET)
		do
			print ("Let the dragging begin! Nothing to do here...%N")
		end

	on_button1_drag_data_get (a_gdk_drag_context: GDK_DRAG_CONTEXT; a_selection: GTK_SELECTION_DATA; a_info, a_time: INTEGER; a_gtk_widget: GTK_WIDGET)
		do
		end

	make
		local
			hbox: GTK_HBOX
			pixbuf: GDK_PIXBUF
		do
			gtk.initialize
			create window.make
			window.set_default_size (280, 190)
			window.set_title ("Drag me!")
			window.connect_agent_to_destroy_signal (agent on_delete_event)
			window.set_border_width (20)
			create hbox.make (True, 5)
			window.add (hbox)

			-- Create First button, set up as drag source
			create button1.with_label("Drag me!")
			hbox.pack_start (button1, True, True, 5)
			button1.set_drag_source (gdk_button1_mask, gdk_action_copy)
			button1.drag_source_add_text_targets
			create pixbuf.from_file ("icon.png")
			button1.drag_source_set_icon_pixbuf (pixbuf)

			-- Create second button, set up as drag destination
			create button2.with_label ("Drop me :-)")
			hbox.pack_start (button2, True, True, 5)
			button2.set_drag_destination (gtk_dest_default_motion.bit_or (gtk_dest_default_drop),
									gdk_action_copy)
			button2.drag_dest_add_text_targets
			window.show_all

			-- Connect signals
			button1.connect_agent_to_drag_begin_signal (agent on_button1_drag_begin)
			button1.connect_agent_to_drag_data_get_signal (agent on_button1_drag_data_get)


			gtk.run_main_loop

		end

	window: GTK_WINDOW

	button1, button2: GTK_BUTTON

end -- class STYLE_DEMO
