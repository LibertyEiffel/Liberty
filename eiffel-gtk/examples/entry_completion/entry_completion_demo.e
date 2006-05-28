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

	set_up_completion is
		require entry_not_void: entry/=Void
		do
			create completion.make
			entry.set_completion (completion)
			completion.set_model (programmers)
		end


feature -- Programmers' model columns
	name_column_n: INTEGER is 0
	proficiency_column_n: INTEGER is 1
	columns_n: INTEGER is 2

feature -- labels
	title_string: STRING is "Completion entry demo"
	
feature -- Widgets
	window: GTK_WINDOW
	entry_box: GTK_HBOX
	entry_label: GTK_LABEL
	entry: GTK_ENTRY
	
feature -- Objects
	completion: GTK_ENTRY_COMPLETION
	programmers_array: FAST_ARRAY[TUPLE[STRING,INTEGER]] is
			-- Programmers name and Eiffelliness level
		do
			Result:= ( { FAST_ARRAY[TUPLE[STRING,INTEGER]]
							 << [ "Jose Bollo", {INTEGER_32 95} ],
								 [ "Oliver Elphick", {INTEGER_32 95} ],
								 [ "Raphael Mack", {INTEGER_32 95} ],
								 [ "Paolo Redaelli", {INTEGER_32 12} ],
								 [ "Dominique Colnet", {INTEGER_32 100} ] >> } )
		end
							  
	
	programmers: GTK_LIST_STORE is
			-- tree model with some data set
		local iter: GTK_TREE_ITER; i:INTEGER
		once 
			create Result.make (<<g_type_string, g_type_uint>>)
			-- TODO: change design to remove explicit reference to g_type_*; it's
			-- ugly, or better it feels mostly unEiffelish to me. Paolo 2006-05-28
			
			-- Append three rows and fill in some data
			create iter.make_from_model (Result)
			iter.start

			from i:=programmers_array.lower until i>=programmers_array.upper
			loop
				Result.append (iter)
				Result.set_string (iter, name_column_n, programmers_array.item(i).item_1)
				Result.set_natural (iter, proficiency_column_n, programmers_array.item(i).item_2)
				i:=i+1
			end
		end
end


