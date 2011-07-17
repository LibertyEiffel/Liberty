class KITCHEN_CLOCK
--
-- An old style kitchen clock.
--
	
inherit
	GRAPHIC
	LAYOUT
		redefine set_container
		end

creation {ANY}
	default_create

feature {}
	pen1, pen2: DRAW_KIT

feature {ANY}
	w: WINDOW

	set_container (c: CONTAINER) is
		local
			update: SIMPLE_PERIODIC_JOB
		do
			check
				c /= Void
			end
			w ::= c
			container := c
			create pen1
			create pen2
			pen2.set_line_width(5)
			pen2.set_color(magenta_color)
			w.set_background_color(white_color)
			w.set_requisition(10, 10, 30, 30)
			create update.set_work(agent redraw, Void, 1, 1.0)
			vision.loop_stack.add_job(update)
		end

	redo_layout (x, y: INTEGER) is
		local
			i: INTEGER; widget: WIDGET
		do
			from
				i := container.child.upper
			until
				i < container.child.lower
			loop
				widget := container.child.item(i)
				if not widget.valid_width(widget.width) or else not widget.valid_height(widget.height) then
					widget.set_geometry(0, 20, widget.std_width, widget.std_height)
				end
				i := i - 1
			end
		end

	update_requisition is
		do
			w.set_requisition(w.min_width, w.min_height, w.std_width, w.std_height)
		end

feature {CONTAINER}
	expose_paint is
		do
			draw
		end

feature {}
	draw is
		local
			time: TIME; angle: REAL_64; english_string: STRING
		do
			pen1.set_drawable(w)
			pen2.set_drawable(w)
			english_string := once " ... local private persistant buffer ... "
			time.update
			angle := (time.second - 15) / 60 * 2 * 3.1415926
			pen2.line(w.width // 2,
						 w.height // 2,
						 w.width // 2 + (w.width / 2 * angle.cos).floor.force_to_integer_32,
						 w.height // 2 + (w.height / 2 * angle.sin).floor.force_to_integer_32)
			angle := ((time.hour - 3) / 12 + time.minute / (60 * 12)) * 2 * 3.1415926
			pen1.line(w.width // 2,
						 w.height // 2,
						 w.width // 2 + (w.width / 4 * angle.cos).floor.force_to_integer_32,
						 w.height // 2 + (w.height / 4 * angle.sin).floor.force_to_integer_32)
			angle := (time.minute - 15) / 60 * 2 * 3.1415926
			pen1.line(w.width // 2,
						 w.height // 2,
						 w.width // 2 + (w.width / 2 * angle.cos).floor.force_to_integer_32,
						 w.height // 2 + (w.height / 2 * angle.sin).floor.force_to_integer_32)
			english_string.clear_count
			time_formatter.set_time(time)
			time_formatter.append_in(english_string)
			unicode_string.clear_count
			if unicode_string.utf8_decode_from(english_string) then
				pen2.put_string(unicode_string, 0, 0)
			end
		end

	time_formatter: TIME_FORMATTER is
		once
			create {TIME_IN_ENGLISH}Result
		end

	redraw: BOOLEAN is
		do
			w.clear
			Result := True
		end

	unicode_string: UNICODE_STRING is
		once
			create Result.make(0)
		end

end -- class KITCHEN_CLOCK
