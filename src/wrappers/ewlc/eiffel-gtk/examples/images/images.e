class IMAGES

inherit 
	GTK_MAIN

create {ANY} 
	make

feature {ANY}
	
	image: GTK_IMAGE

	window : GTK_WINDOW
	
	make is
			-- Make
		do
			initialize_gtk							
			create window.make
			window.set_title ("Images demo")
			window.set_default_size (200,200)
			window.midscreen
			create image.from_file("./test.png")
			window.add (image)
			window.show_all
			gtk_main
		end
end
