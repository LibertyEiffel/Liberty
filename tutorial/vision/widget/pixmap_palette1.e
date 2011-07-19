class PIXMAP_PALETTE1
	-- Draw color palette on pixmap.
	-- Mouse wheel is used to change blue value.
	-- Drawing progress may not be seen because it is done on the pixmap
	-- (out of the screen). Counter part is instant refresh because it's
	-- only a copy on the screen of already build image.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	make is
		local
			pixmap: PIXMAP
		do
			create toplevel_window.default_create
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.set_background_color(black_color)
			toplevel_window.map
			create draw_kit
			create pixmap.make(25, 25)
			pixmap.set_shrink(True)
			draw_palette(pixmap, 0)
			toplevel_window.child_attach(pixmap)
			toplevel_window.when_wheel_up(agent shift(pixmap, 25))
			toplevel_window.when_wheel_down(agent shift(pixmap, -25))
			toplevel_window.when_geometry_change(agent resize(pixmap, ?, ?, ?, ?))
			toplevel_window.set_shrink(True)
			vision.start
		end

	resize (p: PIXMAP; x, y, w, h: INTEGER) is
		do
			p.make(w, h)
			draw_palette(p, blue)
		end

	blue: INTEGER

	shift (p: PIXMAP; offset: INTEGER) is
		local
			blue_value: INTEGER
		do
			blue_value := blue + offset
			if blue_value > 255 then
				blue_value := 255
			elseif blue_value < 0 then
				blue_value := 0
			end
			if blue_value /= blue then
				blue := blue_value
				draw_palette(p, blue)
				toplevel_window.refresh
			end
		end

	draw_kit: DRAW_KIT

	draw_palette (p: PIXMAP; blue_value: INTEGER) is
		require
			p /= Void
			blue_value.in_range(0, 255)
		local
			red, green: INTEGER; color: COLOR; x, y: INTEGER; w, h: INTEGER
		do
			draw_kit.set_drawable(p)
			w := (p.width / 256).ceiling.force_to_integer_32
			h := (p.height / 256).ceiling.force_to_integer_32
			from
				red := 0
			until
				red > 255
			loop
				y := (p.height * red / 256).floor.force_to_integer_32
				from
					green := 0
				until
					green > 255
				loop
					x := (p.width * green / 256).floor.force_to_integer_32
					create color.like_rgb_8(red, green, blue_value)
					draw_kit.set_color(color)
					draw_kit.fill_rectangle(x, y, w, h)
					green := green + 1
				end
				red := red + 1
			end
		end

end -- class PIXMAP_PALETTE1
