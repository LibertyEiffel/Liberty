class STYLE_DEMO

insert
	GTK
	GTK_STATE_TYPE

creation
	make

feature

	on_delete_event (a_gtk_object: GTK_OBJECT) is
		do
			gtk.quit
		end



	make is
		local
			style: GTK_STYLE
			pixbuf: GDK_PIXBUF
			pixmap_and_mask: TUPLE [GDK_PIXMAP, GDK_BITMAP]
		do
			gtk.initialize
			create window.make
			window.set_default_size (280, 190)
			window.connect_agent_to_destroy_signal (agent on_delete_event)

			create label.with_label ("Hello World!")

			window.set_border_width (20)

			window.add (label)

			window.show_all

			style := window.style

			create pixbuf.from_file("cartman.png")

			pixmap_and_mask := pixbuf.render_pixmap_and_mask (0)

			style.set_background_pixmap (pixmap_and_mask.first, gtk_state_normal)

			gtk.run_main_loop

		end

	window: GTK_WINDOW

	label: GTK_LABEL

end -- class STYLE_DEMO
