class MENU_DEMO
insert GTK 
create {ANY} make
feature {ANY}
	make
		local label: STRING
		do
			gtk.initialize 
			create window.make
			window.set_title (window_title)
			create menu_bar.make
			create file_menu.with_label (file_label)
			create edit_menu.with_label (edit_label)
			create view_menu.with_label (view_label)
			
			create file_submenu.make
			create edit_submenu.make
			create view_submenu.make

			create open_menu.with_label (open_label)
			create save_menu.with_label (save_label)
			create file_menu_separator.make
			create quit_menu.with_label (quit_label)

			create view_all_menu.with_label (view_all_label)
			create view_some_menu.with_label (view_some_label)
			
			window.add (menu_bar)
			menu_bar.append (file_menu)
			menu_bar.append (edit_menu)
			menu_bar.append (view_menu)

			file_menu.set_submenu (file_submenu)
			edit_menu.set_submenu (edit_submenu)
			view_menu.set_submenu (view_submenu)

			file_submenu.append (open_menu)
			file_submenu.append (save_menu)
			file_submenu.append (file_menu_separator)
			file_submenu.append (quit_menu)

			edit_submenu.append (view_all_menu)
			edit_submenu.append (view_some_menu)
			window.show_all
			
			print ("Testing CONST_STRING using GTK_MENU.label feature%N")
			edit_submenu.set_title("Edit submenu")
			label := edit_submenu.title
			label.prepend ("edit_submenu.label='")
			label.append  ("'.%N")
			print (label)
			
			
			gtk.run_main_loop 
		end

feature {ANY} -- Widgets
	window: GTK_WINDOW
	menu_bar: GTK_MENU_BAR
	
	file_menu, edit_menu, view_menu: GTK_MENU_ITEM

	file_submenu, edit_submenu, view_submenu: GTK_MENU

	open_menu,save_menu,quit_menu: GTK_MENU_ITEM
	file_menu_separator: GTK_SEPARATOR_MENU_ITEM

	view_all_menu, view_some_menu: GTK_MENU_ITEM
feature {ANY} -- Labels
	window_title: STRING is "Menu demo"
	
	file_label: STRING is "File"
	edit_label: STRING is "Edit"
	view_label: STRING is "View"

	open_label: STRING is "Open"
	save_label: STRING is "Save"
	quit_label: STRING is "Quit"

	view_all_label: STRING is "View all"
	view_some_label: STRING is "View some"
end


