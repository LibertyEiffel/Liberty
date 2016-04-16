note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class HELLO

insert 
	GTK
	EXCEPTIONS

create {ANY}	make
	
feature {} -- creation
	make is
		local i: INTEGER; window: MY_WINDOW
		do
			gtk.initialize
			from i:=eiffel_windows_count until i=0 loop
				create window.make
				window.set_title ("Window n."+i.out)
				window.show
				i := i - 1
			end
			from i:=c_windows_count until i=0 loop
				c_window
				i:=i-1
			end
			gtk.toplevels.do_all(agent print_window_label)
			gtk.run_main_loop
		end

	print_window_label (a_window: GTK_WINDOW) is
		require a_window/=Void
		do
			print(a_window.title)
		end
feature {ANY}
	eiffel_windows_count: INTEGER is 3
	c_windows_count: INTEGER is 2
	
	-- windows: COLLECTION[GTK_WINDOW]
	
	c_window is
			-- Create and show a GtkWindow from the C language
		external "C inline use <gtk/gtk.h>"
		alias "[
				 /* create a GtkWindow at C level */
				 GtkWindow *win = gtk_window_new(GTK_WINDOW_TOPLEVEL);
				 gtk_window_set_title(win, "This windows is C created." );
				 gtk_widget_show(GTK_WIDGET(win));
				 printf("Creating a GtkWindow from C at %p\n",win);
				]"
		ensure gtk.toplevels.count > old gtk.toplevels.count
		end
end
	
	
	
