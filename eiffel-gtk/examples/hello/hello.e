indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class HELLO

inherit
	GTK_MAIN
	G_SIGNALS
	
creation	make
	
feature {NONE} -- creation
	make is
		do
			initialize_gtk
			create window.make
			create button.with_label (label)
			window.set_title (title)
			window.add (button)
			button.show
			window.show
			print ("button is at: "+button.to_pointer.to_string+"%N")
			gtk_main
		end

feature
	window: MY_WINDOW
			-- the window
	title: STRING is "Wow my first Eiffel window!"
			-- window title
	button: MY_BUTTON
			-- the button
	label: STRING is "Hello world\nfrom eiffel-gtk!"
			-- button's label

end
	
	
	
