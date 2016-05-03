class TABLE_DEMO
inherit GTK_MAIN
create {ANY} make
feature {ANY}
	make is
		do
			initialize_gtk								
			create window.make
			window.set_title (window_title)
			create table.make (3,3, False)
			window.add(table)
			create big_label.with_markup_label (big_label_text) 
			create vertical_label.with_markup_label (vertical_label_text) 
			vertical_label.set_angle (90.0)
			create horizontal_label.with_markup_label (horizontal_label_text) 
			create small_label.with_markup_label (small_label_text)
			
			table.attach_defaults (big_label, 0,1,1,2)
			table.attach_defaults (vertical_label, 2,3,0,2) 
			table.attach_defaults (horizontal_label, 0,2,2,3)
			table.attach_defaults (small_label, 2,3,2,3)
			
			window.show_all
			gtk_main
		end

	window: GTK_WINDOW
	window_title: STRING is "Table example"
	table: GTK_TABLE
	big_label, vertical_label, horizontal_label, small_label: GTK_LABEL
	
	big_label_text: STRING is "<span size =%"x-large%"><b>Big label</b></span>" 
	vertical_label_text: STRING is "<b>Vertical label</b>" 
	horizontal_label_text: STRING is "<b>Horizontal label</b>" 
	small_label_text: STRING is "<small>Small label</small>"
end


