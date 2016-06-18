note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class HELLO

insert GTK_MAIN
	
create {ANY}	make
	
feature {ANY}
	on_clicked (a_button: GTK_BUTTON)
		require valid_button: a_button /= Void 
		do
			print (once "Button `")
			print (a_button.label)
			print (once "' clicked%N")
		end
			
feature {} -- creation
	make
		local 
			w1,w2: GTK_WIDGET; win: GTK_WINDOW; b: GTK_BUTTON 
			rw: GTK_WINDOW; rb: GTK_BUTTON
		do 
			initialize
			create window.make
			create button.with_label (label)
			window.set_title (title)
			window.add (button)
			button.connect_agent_to_clicked_signal (agent on_clicked)
			button.show
			window.show
			debug
				print ("button is at: "+button.to_pointer.to_string+"%N")
			end
			check
--				window = r.wrapper(window.handle)
         end
			
			run_main_loop -- instead of "gtk_main"
		end
feature {ANY} -- Disposing
	
feature {ANY}
	window: MY_WINDOW
			-- the window
	title: STRING is "Wow my first Eiffel window!"
			-- window title
	button: MY_BUTTON
			-- the button
	label: STRING is "Hello world from eiffel-gtk!"
			-- button's label

end
	
	
	
