class EXPANDER_DEMO
insert GTK
create {ANY} make
feature {ANY}
	make
		do
			gtk.initialize
			create window.make
			window.show_all
			gtk.run_main_loop
		end
	window: MY_WINDOW
end


