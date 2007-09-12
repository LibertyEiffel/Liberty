class MY_WINDOW
	
inherit
	GTK_WINDOW
		redefine make, on_destroy
		end
	
creation dummy, make

feature
	make is
		do
			Precursor
			set_title (once "Expander demo")
			midscreen

			create vbox.make (False, 2)
			create statusbar.make
			create expander.make (statusbar)
			create label.with_markup_label (label_string)
			add (vbox)
			vbox.pack_start(expander,True,True,0)
			vbox.pack_end(statusbar,False,False,5)
			
			expander.add (label)
			enable_on_destroy
			show_all
		end

	on_destroy is
		do
			print ("Quitting%N")
			gtk.quit
		end
feature -- Widgets
	vbox: GTK_VBOX
	expander: MY_EXPANDER
	label: GTK_LABEL
	statusbar: GTK_STATUS_BAR
	
feature -- Strings
	label_string: STRING is "[
									 See on the <b><big>statusbar</big> below</b> the signals emitted
									 by the expander.
									 ]"
end
