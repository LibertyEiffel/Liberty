class PROGRESS_BAR

inherit 
	GTK_MAIN

creation 
	make

feature
	
	bar: GTK_PROGRESS_BAR

	window : GTK_WINDOW
	
	make is
			-- Make
		do
			initialize_gtk							
			create window.make
			window.set_title ("Progress Bar")
			window.midscreen
			create bar.make
			bar.set_text ("A simple example of a progress bar")
			bar.set_fraction (0.35)
			window.add (bar)
			window.show_all
			gtk_main
		end
end
