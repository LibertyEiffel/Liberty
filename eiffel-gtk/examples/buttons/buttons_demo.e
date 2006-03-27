class BUTTONS_DEMO
inherit GTK_MAIN
creation make
feature
	make is
		do
			initialize_gtk								
			create window.make
			window.show_all
			gtk_main
		end
	window: BUTTONS_WINDOW
end


