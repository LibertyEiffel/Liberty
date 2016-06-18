class STYLE_DEMO

insert
	ANY
	GTK
	GTK_STATE_TYPE
	PANGO_CONSTANTS
	PANGO_WRAP_MODE

create {ANY}
	make

feature {ANY}

	on_delete_event (a_gtk_object: GTK_OBJECT)
		do
			gtk.quit
		end



	make
		local
			style: GTK_STYLE
			pixbuf: GDK_PIXBUF
			pixmap: GDK_PIXMAP
			gc: GDK_GC
			color: GDK_COLOR
			layout: PANGO_LAYOUT
			msg, font, fgcolor: STRING
			size: TUPLE [INTEGER, INTEGER]
			live_width, live_height: INTEGER
			scale: REAL
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

			live_width := 1024
			live_height := 768

			msg := "Arrepentidos ahora que estais a tiempo, hijos de Hebron"

			font := "Arial 12 Bold"

			fgcolor := "#ff0000"

			layout := window.create_pango_layout ("")

			layout.set_width (live_width)

			layout.set_wrap (pango_wrap_word_char)
			layout.set_markup ("<span foreground='" + fgcolor + "' font_desc='" + font + "'>" + msg + "</span>")

			size := layout.size

			create pixbuf.make (True, size.first // pango_scale, size.second // pango_scale)

			--pixbuf.fill (0)

			pixmap := pixbuf.render_pixmap_and_mask (0).first

			pixmap.draw_layout (gc, 0, 0, layout)

			create pixbuf.from_drawable (pixmap, 0, 0, pixmap.width, pixmap.height)
			
			scale := (pixbuf.width * 100) / live_width -- Esto no funciona si el layout es más apaisado que el viewer
			
			-- previewer.set_overlay (pixbuf, scale, 50, 50)

			style.set_background_pixmap (pixmap, gtk_state_normal)

			gtk.run_main_loop

		end

	window: GTK_WINDOW

	label: GTK_LABEL


end -- class STYLE_DEMO
