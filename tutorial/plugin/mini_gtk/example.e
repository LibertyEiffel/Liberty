class EXAMPLE

insert
	GTK

creation
	make

feature {}
	make is
		local
			w: GTK_WINDOW
		do
			create w.make
			w.signal_connect("destroy", agent gtk_main_quit)
			w.show
			gtk_main
		end

end -- class EXAMPLE
