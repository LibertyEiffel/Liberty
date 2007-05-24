class TOOL_BAR_DEMO

insert 
	GTK
	GTK_STOCK_ITEMS
creation make

feature -- GUI elements
	window: GTK_WINDOW
	new_button, open_button,close_button,quit_button: GTK_TOOL_BUTTON
	separator: GTK_SEPARATOR_TOOL_ITEM
	menu_item: GTK_MENU_TOOL_BUTTON
	menu: GTK_MENU
	find_foo, find_bar: GTK_MENU_ITEM
	toolbar: GTK_TOOLBAR

feature -- Initialisation
	make is
		do
			gtk.initialize
			create window.make
			window.set_title (window_title)
			window.connect_agent_to_destroy_signal (agent on_destroy)

			create new_button.from_stock(gtk_stock_new) 
			create open_button.from_stock(gtk_stock_open)
			create close_button.from_stock(gtk_stock_close)
			create quit_button.from_stock(gtk_stock_quit)
			create separator.make
			create menu_item.from_stock(gtk_stock_find)
			
			create menu.make
			create find_foo.with_label("Find foo")
			create find_bar.with_label("Find bar")
						
			menu_item.set_menu(menu)
			menu.append(find_foo)
			menu.append(find_bar)

			quit_button.connect_agent_to_clicked_signal(agent on_destroy)

			create toolbar.make
			toolbar.append (new_button)
			toolbar.append (open_button)
			toolbar.append (close_button)
			toolbar.append (quit_button) 
			toolbar.append (separator)
			toolbar.append (menu_item)
			window.add(toolbar)
			window.show_all

			gtk.run_main_loop
		end

feature -- Agents
	on_destroy (a_gtk_object: GTK_OBJECT) is
		do
			print ("on destroy has been called%N")
			gtk.quit
		end

feature -- Constants
	window_title: STRING is "Eiffel GTK Toolbar demo"
end
