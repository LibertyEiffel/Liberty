class WINDOW_PALETTE1
	-- Draw color palette on sub_window.
	-- Mouse wheel is used to change blue value.
	-- Color rectangle drawing appears on the fly on the screen.
	-- Drawing is uninterruptible.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	sub_window: SUB_WINDOW

	make is
		local
			toplevel_window: TOPLEVEL_WINDOW
		do
			create toplevel_window.default_create
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.set_background_color(black_color)
			toplevel_window.map
			toplevel_window.set_shrink(True)
			create draw_kit
			create sub_window.make(toplevel_window)
			sub_window.set_shrink(True)
			sub_window.set_expand(True)
			sub_window.map
			sub_window.when_wheel_up(agent shift(sub_window, 25))
			sub_window.when_wheel_down(agent shift(sub_window, -25))
			sub_window.when_expose(agent update(sub_window))
			vision.start
		end

	update (w: WINDOW) is
		do
			draw_palette(w, blue)
		end

	blue: INTEGER

	shift (w: WINDOW; offset: INTEGER) is
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
				w.refresh
			end
		end

	draw_kit: DRAW_KIT

	draw_palette (w: WINDOW; blue_value: INTEGER) is
		require
			w /= Void
			blue_value.in_range(0, 255)
		local
			red, green: INTEGER; max_red, max_green: INTEGER; color: COLOR; x, y: INTEGER
			width, height: INTEGER; area: RECT
		do
			draw_kit.set_drawable(w)
			-- This line is very important here. As w internal characteristic change on each call (while signaling expose), you HAVE TO reassign the window to the draw_kit.
			area := vision.expose_area.intersect(w.area)
			if not area.is_empty then
				width := (w.width / 256).ceiling.force_to_integer_32
				height := (w.height / 256).ceiling.force_to_integer_32
				from
					red := scale_from_pos(area.y, w.height, 256)
					max_red := scale_from_pos(area.y + area.height - 1, w.height, 256)
					max_green := scale_from_pos(area.x + area.width - 1, w.width, 256)
				until
					red > max_red -- red increase to the bottom
				loop
					y := (w.height * red / 256).floor.force_to_integer_32
					from
						green := scale_from_pos(area.x, w.width, 256)
					until
						green > max_green -- green increase to the right
					loop
						x := (w.width * green / 256).floor.force_to_integer_32
						create color.like_rgb_8(red, green, blue_value)
						draw_kit.set_color(color)
						draw_kit.fill_rectangle(x, y, width, height)
						green := green + 1
					end
					red := red + 1
				end
			end
		end

	scale_from_pos (pos, nb_pos, nb_scale: INTEGER): INTEGER is
			-- Search nearest inferior scale. Scale position can be
			-- computed like this: ((scale*nb_pos)/nb_scale).floor.force_to_integer_32
			-- This is equivalent to (scale * nb_pos) // nb_scale
			-- scale range from 0 to nb_scale-1
		require
			pos.in_range(0, nb_pos - 1)
		do
			Result := (pos * nb_scale / nb_pos).floor.force_to_integer_32
			if ((Result + 1) * nb_pos / nb_scale).floor.force_to_integer_32 <= pos then
				Result := Result + 1
			end
		ensure
			Result.in_range(0, nb_scale - 1)
		end

end -- class WINDOW_PALETTE1
