indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class HELLO

inherit GTK_MAIN
	
creation	make
feature
	on_clicked (a_button: GTK_BUTTON) is
		require valid_button: a_button /= Void 
		do
			print (once "Button `")
			print (a_button.label)
			print (once "' clicked%N")
		end
			
feature {NONE} -- creation
	make is
		do
			initialize_gtk
			create window.make
			create button.with_label (label)
			window.set_title (title)
			window.add (button)
			button.connect_agent_to_clicked_signal (agent on_clicked)
			button.show
			window.show
			print ("button is at: "+button.to_pointer.to_string+"%N")
			gtk_main
		end
feature -- Disposing
	
feature
	window: MY_WINDOW
			-- the window
	title: STRING is "Wow my first Eiffel window!"
			-- window title
	button: GTK_BUTTON -- MY_BUTTON
			-- the button
	label: STRING is "Hello world from eiffel-gtk!"
			-- button's label

end
	
	
	
