class ENTRY_COMPLETION_DEMO
inherit GTK_MAIN
insert G_TYPE_EXTERNALS
		-- TODO: This insertion is necessary when creating the programmers,
		-- since it requires explicit reference to g_type_*; it's ugly,
		-- or better it feels mostly unEiffelish to me. Paolo 2005-06-12
creation make
feature
	make is
		do
			initialize_gtk
			create_window
			set_up_completion
			window.show_all
			gtk_main
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


