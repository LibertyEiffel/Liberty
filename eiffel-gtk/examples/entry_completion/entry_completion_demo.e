class ENTRY_COMPLETION_DEMO
inherit GTK_MAIN
creation make
feature
	make is
		do
			initialize_gtk
			create_window
			window.show_all
			window.connect_agent_to_destroy_signal (agent on_destroy_window(?))
			gtk_main
		end
	on_destroy_window (an_obj: GTK_OBJECT) is
		local a_win: GTK_WINDOW
		do
			a_win ::= an_obj
			print ("Quitting%N")
			gtk_quit
		end
feature
	create_window is
		do
			create window.make
			window.set_title (title_string)
			window.midscreen

			create entry_box.make (True,10)
			create entry_label.with_label ("Programmer's name:")
			create entry.make
			entry_box.pack_start_defaults (entry_label)
			entry_box.pack_start_defaults (entry)
			window.add(entry_box)
		end
feature -- labels
	title_string: STRING is "Completion entry demo"
	
feature -- Widgets
	window: GTK_WINDOW
	entry_box: GTK_HBOX
	entry_label: GTK_LABEL
	entry: PROGRAMMERS_ENTRY
	
feature -- Objects
	completion: GTK_ENTRY_COMPLETION
end


