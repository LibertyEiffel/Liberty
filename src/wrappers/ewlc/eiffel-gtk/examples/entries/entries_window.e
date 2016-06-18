class ENTRIES_WINDOW
inherit
	GTK_WINDOW redefine make, on_destroy end
insert
	G_SIGNALS
	GTK
create {ANY} make
feature {ANY} make
		do
			Precursor
			check is_entries_window_a_g_object: g_is_object (handle) /= 0 end
			set_title (title_string)
			midscreen
			create vbox.make (True,10)
			create entry_box.make (True,10)
			create integer_spin_box.make (True,10)
			create real_spin_box.make (True,10)
			vbox.add (entry_box) 
			vbox.add (integer_spin_box) 
			vbox.add (real_spin_box) 
			add (vbox)

			-- Setting entry
			create entry_label.with_label ("My entry")
			entry_label.set_angle (25.0)
			entry_box.pack_start_defaults (entry_label)			
			create entry.with_label ("What a nice entry!")
			entry_box.pack_start_defaults (entry)

			-- Setting integer spin button
			create integer_spin_label.with_label ("Number of Eiffel projects")
			create integer_spin.make
			integer_spin_box.pack_start_defaults (integer_spin_label)
			integer_spin_box.pack_start_defaults (integer_spin)
			
			-- Setting integer spin button
			create real_spin_label.with_label ("Amount of non-Eiffel code (percent)")
			create real_spin.make
			real_spin_box.pack_start_defaults (real_spin_label)
			real_spin_box.pack_start_defaults (real_spin)

			enable_on_destroy
		end
feature {ANY} -- labels
	title_string: STRING is "Entries demo"
feature {ANY} -- Widgets
	vbox: GTK_VBOX
	entry_box, integer_spin_box, real_spin_box: GTK_HBOX
	entry_label, integer_spin_label, real_spin_label: GTK_LABEL
	entry: TEXT_ENTRY
	integer_spin: INTEGER_SPIN
	real_spin: REAL_SPIN
	
feature {ANY} -- Callbacks
	on_destroy
		do
			print ("Entries demo ending%N")
			gtk.quit
		end
end
