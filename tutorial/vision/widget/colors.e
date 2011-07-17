class COLORS
	-- This example show COLORS from the list and produce color_list.e file

inherit
	GRAPHIC

insert
	ARGUMENTS

creation {ANY}
	make

feature {}
	scroll: SCROLL_VIEW

	make is
		local
			main_window: TOPLEVEL_WINDOW; color_list: SUB_WINDOW; line: HORIZONTAL_LINE
		do
			if argument_count /= 1 then
				io.put_string("Give the color list file name as parameter.%N")
				io.put_string("You may use SmartEiffel/lib/vision/color/small_color_list.txt%N")
			else
				create main_window
				-- The default layout is column.
				create scroll.make(main_window)
				scroll.set_x_expand(True)
				scroll.set_y_expand(True)
				scroll.map
				create color_list.make_layout(scroll, create {COLUMN_LAYOUT})
				color_list.set_x_expand(True)
				color_list.set_y_expand(True)
				color_list.set_background_color(white_color)
				color_list.layout_pause
				add_colors(color_list, argument(1))
				color_list.layout_continue
				color_list.map
				color_list.when_left_down(agent set_move(True))
				color_list.when_left_up(agent set_move(False))
				color_list.when_pointer_move(agent moving)
				create line
				main_window.child_attach(line)
				add_controls(main_window)
				main_window.set_title("Scroll example")
				main_window.set_background_color(white_color)
				main_window.map
				vision.start
			end
		end

	add_controls (w: WINDOW) is
		local
			controls: CONTAINER; layout: ROW_LAYOUT; quit: BUTTON; shift: BUTTON
		do
			create layout
			create controls.make_layout(w, layout)
			controls.set_x_expand(True)
			layout.set_border(5)
			layout.set_spacing(5)
			layout.insert_button_space
			create shift.with_label(controls, U"up")
			shift.when_left_clicked(agent scroll.vertical_shift(-50))
			create shift.with_label(controls, U"down")
			shift.when_left_clicked(agent scroll.vertical_shift(50))
			create shift.with_label(controls, U"left")
			shift.when_left_clicked(agent scroll.horizontal_shift(-20))
			create shift.with_label(controls, U"right")
			shift.when_left_clicked(agent scroll.horizontal_shift(20))
			layout.insert_button_space
			create quit.with_label(controls, U"Exit")
			quit.when_left_clicked(agent vision.loop_stack.break)
		end

	move: BOOLEAN

	click_x, click_y: INTEGER

	set_move (b: BOOLEAN) is
		do
			move := b
			click_x := vision.pointer_x_root
			click_y := vision.pointer_y_root
		end

	moving (x, y: INTEGER) is
		do
			if move then
				scroll.shift(vision.pointer_x_root - click_x, vision.pointer_y_root - click_y)
				click_x := vision.pointer_x_root
				click_y := vision.pointer_y_root
			end
		end

	add_colors (c: CONTAINER; file_name: STRING) is
		local
			txt: TEXT_FILE_READ; class_file: TEXT_FILE_WRITE; r, g, b: INTEGER
		do
			create txt.connect_to(file_name)
			if txt.is_connected then
				create class_file.connect_to("new_color_list.e")
				class_file.put_string(header)
				from
					txt.read_integer
					r := txt.last_integer
				until
					txt.end_of_input
				loop
					txt.read_integer
					g := txt.last_integer
					txt.read_integer
					b := txt.last_integer
					txt.skip_separators
					txt.read_line
					show_color(c, r, g, b, txt.last_string)
					txt.last_string.to_lower
					txt.last_string.replace_all(' ', '_')
					txt.last_string.append(once "_color")
					write(class_file, r, g, b, txt.last_string)
					txt.read_integer
					r := txt.last_integer
				end
				class_file.put_string("end%N")
				class_file.disconnect
				txt.disconnect
			end
		end

	write (output: OUTPUT_STREAM; r, g, b: INTEGER; name: STRING) is
		do
			output.put_string(once "   ")
			output.put_string(name)
			output.put_string(once ": COLOR is%N      once%N	 create Result.like_rgb_8(")
			output.put_integer(r)
			output.put_character(',')
			output.put_integer(g)
			output.put_character(',')
			output.put_integer(b)
			output.put_string(once ")%N      end%N%N")
		end

	show_color (c: CONTAINER; r, g, b: INTEGER; name: STRING) is
		local
			label: LABEL; color: COLOR; item: CONTAINER; rect: FILL_RECTANGLE
		do
			create item.make_layout(c, create {ROW_LAYOUT})
			create color.like_rgb_8(r, g, b)
			create rect.make(10, 10, 100, 30)
			rect.set_style(create {DRAW_STYLE})
			rect.style.set_color(color)
			item.set_x_expand(True)
			item.child_attach(rect)
			create label.make(create {UNICODE_STRING}.from_utf8(name))
			item.child_attach(label)
		end

	header: STRING is "[
-- This file is  free  software, which  comes  along  with  SmartEiffel. This
-- software  is  distributed  in the hope that it will be useful, but WITHOUT
-- ANY  WARRANTY;  without  even  the  implied warranty of MERCHANTABILITY or
-- FITNESS  FOR A PARTICULAR PURPOSE. You can modify it as you want, provided
-- this header is kept unaltered, and a notification of the changes is added.
-- You  are  allowed  to  redistribute  it and sell it, alone or as a part of
-- another product.
--       Copyright (C) 1994-2002 LORIA - INRIA - U.H.P. Nancy 1 - FRANCE
--          Philippe RIBET and Dominique COLNET - SmartEiffel@loria.fr
--                       http://SmartEiffel.loria.fr
--
class COLOR_LIST
--
-- THIS FILE WAS GENERATED. DON'T EDIT
--
insert
	ANY
feature {}


]"

end -- class COLORS
