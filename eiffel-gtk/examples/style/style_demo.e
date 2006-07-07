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
			pixmap: GDK_PIXMAP
			gc: GDK_GC
			color: GDK_COLOR
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

			pixmap := pixbuf.render_pixmap_and_mask (0).first

			create gc.make (pixmap)

			pixmap.draw_line (gc, 5, 10, 10, 30)
			create color.make
			color.set_red (65535)
			gc.set_rgb_fg_color (color)

			pixmap.draw_rectangle (gc, False, 35, 9, 10, 5)

			color.set_green (5535)
			color.set_red (5535)
			gc.set_rgb_fg_color (color)

			pixmap.draw_point (gc, 0, 0)

			pixmap.draw_arc (gc, False, 5, 38, 38, 10, 0, 11520)

			style.set_background_pixmap (pixmap, gtk_state_normal)

			gtk.run_main_loop

		end

	window: GTK_WINDOW

	label: GTK_LABEL

end -- class STYLE_DEMO
