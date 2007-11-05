indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class HELLO

insert 
	GTK
	EXCEPTIONS

creation	make
	
feature {} -- creation
	make is
		local i: INTEGER; window: MY_WINDOW
		do
			gtk.initialize
			create {ARRAY[MY_WINDOW]} windows.make(1,10)
			from i:=windows_count until i=0
			loop
				create window.make
				window.set_title ("Window n."+i.out)
				window.show
				windows.put(window,i)
				i := i - 1
			end
			test
			gtk.run_main_loop
		end

	test is
		local test_counter: INTEGER
		do
			if test_counter<1 then
				if gtk.toplevels.count /= windows_count 
				 then raise("The dummy GtkWindow archetype has not been freed.")
				else io.put_line("Dummy GtkWindow successfully freed.")
				end
			end
			c_window
			if test_counter<2 then 
				if gtk.toplevels.count /= windows_count+1 then
					raise("A GtkWindow created by a C function is not listed in gtk.toplevels.")
				else io.put_line("A GtkWindow created by a C function is successfully listed in gtk.toplevels.")
				end
			end
		rescue
			test_counter := test_counter+1
			retry
		end
	
feature
	windows_count: INTEGER is 3
	
	windows: COLLECTION[GTK_WINDOW]
	
	c_window is
			-- Create and show a GtkWindow from the C language
		external "C inline use <gtk/gtk.h>"
		alias "[
				 /* create a GtkWindow at C level */
				 GtkWindow *win = gtk_window_new(GTK_WINDOW_TOPLEVEL);
				 gtk_window_set_title(win, "This windows is C created." );
				 gtk_widget_show(GTK_WIDGET(win));
				]"
		ensure gtk.toplevels.count > old gtk.toplevels.count
		end
end
	
	
	
