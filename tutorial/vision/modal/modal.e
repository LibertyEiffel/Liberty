class MODAL
	-- This example show how to make modal windows.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		do
			new_window(0)
			io.put_string("The end%N")
		end

	new_window (level: INTEGER) is
		local
			message: LABEL; line: HORIZONTAL_LINE; new, quit: BUTTON; win: TOPLEVEL_WINDOW
			layout: COLUMN_LAYOUT; txt: UNICODE_STRING
		do
			if level > 0 then
				vision.new_loop
			end
			create layout
			create win.make(layout)
			layout.set_border(5)
			layout.set_spacing(5)
			win.set_title("Hello World - " + level.to_string)
			win.set_background_color(white_color)
			win.map
			txt := U"Hello World ! level = "
			level.append_in_unicode(txt)
			create message.make(txt)
			win.child_attach(message)
			create line
			win.child_attach(line)
			create new.with_label(win, U"New window")
			new.when_left_clicked(agent new_window(level + 1))
			create quit.with_label(win, U"Exit")
			quit.when_left_clicked(agent win.unmap)
			quit.when_left_clicked(agent vision.loop_stack.break)
			quit.when_right_down(agent win.set_background_color(black_color))
			quit.when_right_up(agent win.set_background_color(white_color))
			vision.start
		end

end -- class MODAL
