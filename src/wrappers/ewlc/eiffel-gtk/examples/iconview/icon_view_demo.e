note
	description: "IconView example"
	copyright: "Copyright (c) 2003-2004 Tim-Philipp Müller <tim at centricular dot net>, Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	original_version_url: "http://scentric.net/tutorial/treeview-tutorial.html"

class ICON_VIEW_DEMO

inherit
	GTK
	GDK_TYPE_EXTERNALS
	G_TYPES
	WRAPPER_HANDLER

create {ANY} make

feature {ANY} -- Columns

	pix_col_n: INTEGER is 2
	text_col_n: INTEGER is 3

feature {ANY}

	model: GTK_LIST_STORE is
			-- icon model with some data set
		once
			create Result.make (<<g_type_int, -- this is column 0
			                      g_type_int, -- this is column 1
			                      gdk_type_pixbuf, g_type_string,  -- these are columns 2 and 3
			                      g_type_int  -- this is column 4
			                    >>)
			-- We can have as many columns as we need.
			-- But at least we need a gdk_type_pixbuf
			-- column and a g_type_string column.
		ensure
			Result /= Void
		end

	view: GTK_ICON_VIEW is
			-- icon view, this has to have two columns
		once
			create Result.with_model (model)
			Result.set_pixbuf_column (pix_col_n)
			Result.set_text_column (text_col_n)
			Result.set_item_width (30)
		ensure
			Result /= Void
		end

feature {}  -- Creation

	make is
			-- Run the demo
		local
			window: GTK_WINDOW
			iter: GTK_TREE_ITER
			pixbuf: GDK_PIXBUF
			text: STRING
		do
			gtk.initialize_gtk
			
			-- Create a GTK window toplevel window
			create window.make
			window.set_title (once "This is a nice window title")
			
			-- It is a good idea to do this for all windows
			window.connect_agent_to_destroy_signal (agent on_destroy)
			
			 -- the following three lines are not necessary when working with glade
			view.show
			window.add (view)
			window.show
			
			-- here we add things to the icon model, and those things will
			-- be shown "automagically" on the icon view
			create iter.from_model (model)
			
			model.append (iter)
			create pixbuf.from_file_at_size ("./image1.png", 32, 32)
				check pixbuf.is_valid end
			set_pixbuf_and_string (model, iter, pix_col_n, pixbuf, text_col_n, once "This is image 1")
			
			model.append (iter)
			create pixbuf.from_file_at_size ("./image2.png", 32, 32)
				check pixbuf.is_valid end
			set_pixbuf_and_string (model, iter, pix_col_n, pixbuf, text_col_n, once "This is image 2")
			
			gtk.run_main_loop
		end

feature {ANY} -- Agents

	on_destroy (a_gtk_object: GTK_OBJECT) is
		do
			gtk.quit
		end

feature {ANY} -- Helper -- we need this 'cause we can wrap this directly (it uses varargs)

	set_pixbuf_and_string (a_list_store: GTK_LIST_STORE; an_iter: GTK_TREE_ITER;
	                       pixbuf_column: INTEGER; a_pixbuf: GDK_PIXBUF;
	                       text_column: INTEGER; a_string: STRING) is
		do
			gtk_list_store_set_pixbuf_and_string (a_list_store.handle, an_iter.handle,
			                                      pixbuf_column, a_pixbuf.handle,
			                                      text_column, a_string.to_external, -1)
		end

feature {} -- Low level

	gtk_list_store_set_pixbuf_and_string (a_gtk_list_store, a_gtk_tree_iter: POINTER;
	                                      pixbuf_column: INTEGER; a_gdk_pixbuf: POINTER;
	                                      text_column: INTEGER; a_string: POINTER; a_minus_one: INTEGER) is
		external "C use <gtk/gtk.h>"
		alias "gtk_list_store_set"
		end

end -- class ICON_VIEW_DEMO
