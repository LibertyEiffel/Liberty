class TEXT_INPUT
	-- Show how to use TEXT_FIELD to allow keyboard user input.

inherit
	GRAPHIC

creation {ANY}
	make

feature {}
	make is
		local
			toplevel_window: TOPLEVEL_WINDOW; first_name, last_name, display_name, email, phone: TEXT_FIELD
		do
			create toplevel_window.default_create
			toplevel_window.when_close_requested(agent vision.loop_stack.break)
			toplevel_window.set_background_color(light_grey_color)
			first_name := new_input(toplevel_window, once U"First Name:")
			last_name := new_input(toplevel_window, once U"Last Name:")
			display_name := new_input(toplevel_window, once U"Display Name:")
			email := new_input(toplevel_window, once U"Email Address:")
			phone := new_input(toplevel_window, once U"Phone Number:")
			toplevel_window.map
			vision.start
			display(once "First Name:", first_name)
			display(once "Last Name:", last_name)
			display(once "Display Name:", display_name)
			display(once "Email Address:", email)
			display(once "Phone Number:", phone)
		end

	new_input (c: CONTAINER; title: UNICODE_STRING): TEXT_FIELD is
		local
			label: LABEL; box: CONTAINER; row_layout: ROW_LAYOUT
		do
			create row_layout
			create box.make_layout(c, row_layout)
			box.set_x_expand(True)
			create label.make(title)
			box.child_attach(label)
			create Result.make(box)
		end

	display (msg: STRING; text_field: TEXT_FIELD) is
		local
			tmp: STRING
		do
			io.put_string(msg)
			io.put_string(once " %"")
			tmp := once ""
			tmp.clear_count
			text_field.text.utf8_encode_in(tmp)
			io.put_string(tmp)
			io.put_string(once "%"%N")
		end

end -- class TEXT_INPUT
