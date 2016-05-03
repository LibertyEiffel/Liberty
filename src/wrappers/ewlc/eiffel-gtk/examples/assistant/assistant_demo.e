class ASSISTANT_DEMO
insert 
	-- TODO: Implement GTK_APPLICATION, with no undefined features; GTK
	-- has undefined features. Currently ANY must be inserted alongside
	-- with GTK in all effective classes otherwise they will contain
	-- undefined features, making them actually deferred.
	GTK 
	ANY 

create {ANY} make
feature {ANY}
	make is
		do
			gtk.initialize
			create assistant.make
			
			create front_label.with_markup_label
			("<span size='xx-large'>Welcome to the SmartEiffel Integrated Development Enviroment!</span>\n<span size='large'>Please choose the behaviour you prefers in the following pages.</span>")
			front_label.set_fill_justify
			front_label.set_line_wrap

			create table.make (2,2,True) 
			create label1.with_label("Foo-ness:")
			create label2.with_label("Bar-ness:")
			create entry1.make entry1.set_text("Absolutely foo!")
			create entry2.make entry2.set_text("No bars at all!")
			table.attach_defaults(label1, 0,1,0,1)
			table.attach_defaults(entry1, 1,2,0,1)
			table.attach_defaults(label2, 0,1,1,2)
			table.attach_defaults(entry2, 1,2,1,2)			

			create font_chooser.make
			create color_chooser.make
			
			assistant.append(front_label) 
			assistant.append(table)
			assistant.append(font_chooser)
			assistant.append(color_chooser)

			assistant.set_page_type(front_label, gtk_assistant_page_intro)
			assistant.set_page_type(table,gtk_assistant_page_content)
			assistant.set_page_type(font_chooser,gtk_assistant_page_content)
			assistant.set_page_type(color_chooser,gtk_assistant_page_confirm)

			assistant.set_page_title(front_label,"SmartEiffel IDE: first time settings")
			assistant.set_page_title(table,"Foo and bar-ness")
			assistant.set_page_title(font_chooser,"Default font")
			assistant.set_page_title(color_chooser,"Default color")

			assistant.set_page_complete(front_label,True)
			assistant.set_page_complete(table,True)
			assistant.set_page_complete(font_chooser,True)
			assistant.set_page_complete(color_chooser,True)
			
			assistant.show_all
			gtk.run_main_loop
		end

	front_label, label1, label2: GTK_LABEL
	table: GTK_TABLE
	entry1,entry2: GTK_ENTRY
	font_chooser: GTK_FONT_SELECTION
	color_chooser: GTK_COLOR_SELECTION
	assistant: GTK_ASSISTANT
end


