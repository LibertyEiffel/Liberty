note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class CALLBACK_HELLO

inherit
	GTK
	G_SIGNALS
	
create {ANY}	make
	
feature {} -- creation
	make is
		do
			gtk.initialize
			create window.make
			create destroy_callback.make
			destroy_callback.connect(window, agent on_destroy)
			create button.with_label (label)
			window.set_title (title)
			window.add (button)
			button.show
			window.show
			print ("button is at: "+button.to_pointer.to_string+"%N")
			gtk.run_main_loop
		end

feature {ANY}
	destroy_callback: DESTROY_CALLBACK 
			-- 
	window: GTK_WINDOW
			-- the window
	title: STRING is "Wow my first Eiffel window!"
			-- window title
	button: MY_BUTTON
			-- the button
	label: STRING is "Hello world\nfrom eiffel-gtk!"
			-- button's label
feature {ANY} -- callbacks
	on_destroy (a_gobject: G_OBJECT) is
		do
			print ("A gobject is being destroyed. And we quit%N")
			check
				gobject_is_the_window: a_gobject.handle = window.handle
			end
			gtk.quit
		end

end
	
	
	
