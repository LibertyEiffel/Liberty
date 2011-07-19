class ALIGN
--
-- This example show how to use ALIGNABLE_LABEL.
--

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	toplevel_window: TOPLEVEL_WINDOW

	make is
		local
			alignable_label: ALIGNABLE_LABEL; button: BUTTON
		do
			create toplevel_window
			toplevel_window.set_title("Align demo")
			toplevel_window.set_background_color(white_color)
			toplevel_window.map

			create alignable_label.make(U"Text on the left")
			alignable_label.set_alignment(left_alignment)
			toplevel_window.child_attach(alignable_label)
			
			create alignable_label.make(U"Text on the right")
			alignable_label.set_alignment(right_alignment)
			toplevel_window.child_attach(alignable_label)

			toplevel_window.child_attach(create {HORIZONTAL_LINE})

			create button.with_label(toplevel_window, U"Exit")
			button.when_left_clicked(agent vision.loop_stack.break)

			vision.start
			io.put_string("The end%N")
		end

end -- class ALIGN
