class BUTTONS_WINDOW
inherit
	GTK_WINDOW redefine make, on_destroy end
	GTK
create {ANY} make
feature {ANY} make is
		do
			Precursor
			set_title (once "Buttons demo")
			midscreen
			
			create vbox.make (True, 5)
			add (vbox)

			create main_label.with_markup_label (main_label_string)
			vbox.pack_start_defaults (main_label)
			
			create hbox.make (False, 2)
			create flag.with_label ("I use one compiler")
			create toggle.with_mnemonic ("I prefer _Free Software")
			hbox.pack_start (flag, False , False , 5)
			hbox.pack_start (toggle, True , False , 20)
			vbox.pack_start_defaults (hbox)
			create radio1.with_label (Void, "SmartEiffel")
			create radio2.with_label_from_widget (radio1, "VisualEiffel")
			create radio3.with_label_from_widget (radio1, "ISE Eiffel")
			vbox.pack_start_defaults (radio1)
			vbox.pack_start_defaults (radio2)
			vbox.pack_start_defaults (radio3)

			create smarteiffel_choosen.make 
			smarteiffel_choosen.connect (radio1, agent on_gnu_compiler_toggled (?))
			enable_on_destroy -- connect (Current, "destroy", $on_destroy)
			-- radio1.set_active	radio2.set_inactive	radio3.set_inactive
		end

feature {ANY} -- Widgets
	main_label: GTK_LABEL
	hbox: GTK_HBOX
	vbox: GTK_VBOX
	radio1,radio2,radio3: EIFFEL_COMPILER_BUTTON
	buttons: G_SLIST[GTK_RADIO_BUTTON]
	flag: GTK_CHECK_BUTTON
	toggle: GTK_TOGGLE_BUTTON

feature {ANY} -- Strings
	main_label_string: STRING is "[
											<b><big>Eiffel wrappers for GTK</big> are a work in progress</b>.
											We need volunteers. Would help us?
											]"
											
feature {ANY}  -- Callbacks
	smarteiffel_choosen: TOGGLED_CALLBACK[GTK_RADIO_BUTTON]

	on_destroy is
		do
			print ("Buttons demo ending%N")
			gtk.quit
		end

	on_gnu_compiler_toggled (a_toggle: GTK_TOGGLE_BUTTON) is
		do
			print ("on_gnu_compiler_toggled reached%N")
			if a_toggle.is_active
			then print ("You wisely chose SmartEiffel%N")
			else  print ("Then help us to make it easy to use and develop and multi-compiler%N") end
		end
	
end
	
	
	
