class FIXED_WIDGETS
--
-- This example show how standards layouts (row/column) handle fixed size widgets.
--
-- See also WIDGET for more information on size.
--
	
inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	layouts: ARRAY[ROW_LAYOUT]

	make is
		local
			container: CONTAINER; one, two, three: UNICODE_STRING
		do
			one := U"Button ONE"
			two := U"Button TWO"
			three := U"Button THREE"
			create toplevel_window
			-- The default layout is column.
			toplevel_window.set_title("Buttons example")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map
			create layouts.make(1, 0)
			
			-- First line: 3 buttons, automatically spaced
			container := new_container
			new_button(container, one)
			new_button(container, two)
			new_button(container, three)
			
			-- Second line: 1 space before the 3 buttons
			container := new_container
			layouts.last.insert_button_space
			new_button(container, one)
			new_button(container, two)
			new_button(container, three)
			
			-- Third line: 2 spaces (at the begining and at the end)
			container := new_container
			layouts.last.insert_button_space
			new_button(container, one)
			new_button(container, two)
			new_button(container, three)
			layouts.last.insert_button_space
			
			-- Fourth line: 1 space to separate buttons in 2 groups
			container := new_container
			new_button(container, one)
			layouts.last.insert_button_space
			new_button(container, two)
			new_button(container, three)
			toplevel_window.when_left_down(agent increase_border)
			toplevel_window.when_right_down(agent increase_spacing)
			toplevel_window.when_middle_down(agent vision.loop_stack.break)
			
			vision.start
			io.put_string("The end%N")
		end

	new_container: CONTAINER is
		local
			layout: ROW_LAYOUT
		do
			create layout
			layouts.add_last(layout)
			create Result.make_layout(toplevel_window, layout)
			Result.set_x_expand(True)
			Result.set_y_expand(True)
		end

	increase_border is
		local
			i: INTEGER
		do
			from
				i := layouts.lower
			until
				i > layouts.upper
			loop
				layouts.item(i).set_border(layouts.item(i).border + 1)
				i := i + 1
			end
		end

	increase_spacing is
		local
			i: INTEGER
		do
			from
				i := layouts.lower
			until
				i > layouts.upper
			loop
				layouts.item(i).set_spacing(layouts.item(i).spacing + 1)
				i := i + 1
			end
		end

	new_button (container: CONTAINER; text: UNICODE_STRING) is
		local
			button: BUTTON
		do
			create button.with_label(container, text)
			button.when_left_clicked(agent io.put_string(once "Left click on %"" + text.to_utf8 + once "%"%N"))
			button.when_right_clicked(agent vision.loop_stack.break)
		end

end -- class FIXED_WIDGETS
