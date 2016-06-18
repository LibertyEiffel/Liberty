class TEXT_VIEW_WINDOW
inherit
	GTK_WINDOW redefine make, on_destroy end
	GTK
create {ANY} make

feature {ANY}

	make
		local
			big: GTK_TEXT_TAG
		do
			Precursor
			set_title (once "Text View demo")
			midscreen
			
			create text.make
			add (text)

			text.buffer.set_text (some_string)
			big := text.buffer.create_tag ("big", create {ARRAY[TUPLE[STRING, G_VALUE]]}.make (1, 0))
			big.set_string_property ("foreground", "blue")
			--	big.set_boolean_property ("size-set", True)
			text.buffer.apply_tag (big,
				text.buffer.iter_at_offset(0),
				text.buffer.iter_at_offset(10))

			enable_on_destroy
		end

feature {ANY} -- Widgets
	text: GTK_TEXT_VIEW

	some_string: STRING is "[
									What you see here is a text view.
									It can show multiple lines of text. It can be edited, too.
									You can put formatting and images inside it.
									]"

feature {ANY}  -- Callbacks
	on_destroy
		do
			print ("Text view demo ending%N")
			gtk.quit
		end
end
