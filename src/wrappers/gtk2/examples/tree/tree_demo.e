note
	description: "Tree example translated to Eiffel from C"
	copyright: "Copyright (c) 2003-2004 Tim-Philipp Müller <tim at centricular dot net>, Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	original_version_url: "http://scentric.net/tutorial/treeview-tutorial.html"

class TREE_DEMO

	-- Tree and List Widget Overview -- Overview of GtkTreeModel,
	-- GtkTreeView, and other associated widgets

	-- Overview: To create a tree or list in GTK+, use the GtkTreeModel
	-- interface in conjunction with the GtkTreeView widget. This
	-- widget is designed around a Model/View/Controller design and
	-- consists of four major parts:

	--   The tree view widget (GtkTreeView)
	--   The view column (GtkTreeViewColumn)
	--   The cell renderers (GtkCellRenderer etc.)
	--   The model interface (GtkTreeModel)
	
	-- The View is composed of the first three objects, while the last
	-- is the Model. One of the prime benefits of the MVC design is
	-- that multiple views can be created of a single model. For
	-- example, a model mapping the file system could be created for a
	-- file manager. Many views could be created to display various
	-- parts of the file system, but only one copy need be kept in
	-- memory.

	-- The purpose of the cell renderers is to provide extensibility to
	-- the widget and to allow multiple ways of rendering the same type
	-- of data. For example, consider how to render a boolean
	-- variable. Should it render it as a string of "True" or "False",
	-- "On" or "Off", or should it be rendered as a checkbox?
	
	-- Creating a model: GTK+ provides two simple models that can be
	-- used: the GtkListStore and the GtkTreeStore. GtkListStore is
	-- used to model list widgets, while the GtkTreeStore models
	-- trees. It is possible to develop a new type of model, but the
	-- existing models should be satisfactory for all but the most
	-- specialized of situations. Creating the model is quite simple:
	
	-- GtkListStore *store = gtk_list_store_new (2, G_TYPE_STRING,
	-- G_TYPE_BOOLEAN);
	
	-- This creates a list store with two columns: a string column and
	-- a boolean column. Typically the 2 is never passed directly like
	-- that; usually an enum is created wherein the different columns
	-- are enumerated, followed by a token that represents the total
	-- number of columns. The next example will illustrate this, only
	-- using a tree store instead of a list store. Creating a tree
	-- store operates almost exactly the same.
	
	-- enum
	-- {
	--    TITLE_COLUMN,
	--    AUTHOR_COLUMN,
	--    CHECKED_COLUMN,
	--    N_COLUMNS
	-- };
	--
	-- GtkTreeStore *store = gtk_tree_store_new (N_COLUMNS,       /* Total number of columns */
	--                                           G_TYPE_STRING,   /* Book title              */
	--                                           G_TYPE_STRING,   /* Author                  */
	--                                           G_TYPE_BOOLEAN); /* Is checked out?         */

	-- Adding data to the model is done using gtk_tree_store_set() or
	-- gtk_list_store_set(), depending upon which sort of model was
	-- created. To do this, a GtkTreeIter must be acquired. The
	-- iterator points to the location where data will be added.

	-- Once an iterator has been acquired, gtk_tree_store_set() is used
	-- to apply data to the part of the model that the iterator points
	-- to. Consider the following example:

	-- GtkTreeIter   iter;
	--
	-- gtk_tree_store_append (store, &iter, NULL);  /* Acquire an iterator */
	--
	-- gtk_tree_store_set (store, &iter,
	--                     TITLE_COLUMN, "The Principle of Reason",
	--                     AUTHOR_COLUMN, "Martin Heidegger",
	--                     CHECKED_COLUMN, FALSE,
	--                     -1);

	-- Notice that the last argument is -1. This is always done because
	-- this is a variable-argument function and it needs to know when
	-- to stop processing arguments. It can be used to set the data in
	-- any or all columns in a given row.

	-- The third argument to gtk_tree_store_append() is the parent
	-- iterator. It is used to add a row to a GtkTreeStore as a child
	-- of an existing row. This means that the new row will only be
	-- visible when its parent is visible and in its expanded
	-- state. Consider the following example:

	-- GtkTreeIter iter1;  /* Parent iter */
	-- GtkTreeIter iter2;  /* Child iter  */
	--
	-- gtk_tree_store_append (store, &iter1, NULL);  /* Acquire a top-level iterator */
	-- gtk_tree_store_set (store, &iter1,
	--                     TITLE_COLUMN, "The Art of Computer Programming",
	--                     AUTHOR_COLUMN, "Donald E. Knuth",
	--                     CHECKED_COLUMN, FALSE,
	--                     -1);
	--
	-- gtk_tree_store_append (store, &iter2, &iter1);  /* Acquire a child iterator */
	-- gtk_tree_store_set (store, &iter2,
	--                     TITLE_COLUMN, "Volume 1: Fundamental Algorithms",
	--                     -1);
	--
	-- gtk_tree_store_append (store, &iter2, &iter1);
	-- gtk_tree_store_set (store, &iter2,
	--                     TITLE_COLUMN, "Volume 2: Seminumerical Algorithms",
	--                     -1);
	--
	-- gtk_tree_store_append (store, &iter2, &iter1);
	-- gtk_tree_store_set (store, &iter2,
	--                     TITLE_COLUMN, "Volume 3: Sorting and Searching",
	--                     -1);

	-- Creating the view component: While there are several different
	-- models to choose from, there is only one view widget to deal
	-- with. It works with either the list or the tree store.  Setting
	-- up a GtkTreeView is not a difficult matter. It needs a
	-- GtkTreeModel to know where to retrieve its data from.

	-- GtkWidget *tree;
	--
	-- tree = gtk_tree_view_new_with_model (GTK_TREE_MODEL (store));

	-- Columns and cell renderers: Once the GtkTreeView widget has a
	-- model, it will need to know how to display the model. It does
	-- this with columns and cell renderers.

	-- Cell renderers are used to draw the data in the tree model in a
	-- way. There are a number of cell renderers that come with GTK+
	-- 2.x, including the GtkCellRendererText, GtkCellRendererPixbuf
	-- and the GtkCellRendererToggle.  It is relatively easy to write a
	-- custom renderer.

	-- A GtkTreeViewColumn is the object that GtkTreeView uses to
	-- organize the vertical columns in the tree view. It needs to know
	-- the name of the column to label for the user, what type of cell
	-- renderer to use, and which piece of data to retrieve from the
	-- model for a given row.

	-- GtkCellRenderer *renderer;
	-- GtkTreeViewColumn *column;
	--
	-- renderer = gtk_cell_renderer_text_new ();
	-- column = gtk_tree_view_column_new_with_attributes ("Author",
	--                                                    renderer,
	--                                                    "text", AUTHOR_COLUMN,
	--                                                    NULL);
	-- gtk_tree_view_append_column (GTK_TREE_VIEW (tree), column);
	--
	--   At this point, all the steps in creating a displayable tree have been
	--   covered. The model is created, data is stored in it, a tree view is
	--   created and columns are added to it.
	--
	--   --------------------------------------------------------------------------
	--
	-- Selection handling: Most applications will need to not only deal with displaying data, but
	--   also receiving input events from users. To do this, simply get a reference
	--   to a selection object and connect to the "changed" signal.

	-- /* Prototype for selection handler callback */
	-- static void tree_selection_changed_cb (GtkTreeSelection *selection, gpointer data);
	--
	-- /* Setup the selection handler */
	-- GtkTreeSelection *select;
	--
	-- select = gtk_tree_view_get_selection (GTK_TREE_VIEW (tree));
	-- gtk_tree_selection_set_mode (select, GTK_SELECTION_SINGLE);
	-- g_signal_connect (G_OBJECT (select), "changed",
	--                   G_CALLBACK (tree_selection_changed_cb),
	--                   NULL);

	--   Then to retrieve data for the row selected:

	-- static void
	-- tree_selection_changed_cb (GtkTreeSelection *selection, gpointer data)
	-- {
	--         GtkTreeIter iter;
	--         GtkTreeModel *model;
	--         gchar *author;
	--
	--         if (gtk_tree_selection_get_selected (selection, &model, &iter))
	--         {
	--                 gtk_tree_model_get (model, &iter, AUTHOR_COLUMN, &author, -1);
	--
	--                 g_print ("You selected a book by <link linkend="s"><literal>s</literal></link>\n", author);
	--
	--                 g_free (author);
	--         }
	-- }

	-- Simple Example: Here is a simple example of using a GtkTreeView
	-- widget in context of the other widgets. It simply creates a
	-- simple model and view, and puts them together. Note that the
	-- model is never populated with data - that is left as an exercise
	-- for the reader. More information can be found on this in the
	-- GtkTreeModel section.

	-- enum
	-- {
	--    TITLE_COLUMN,
	--    AUTHOR_COLUMN,
	--    CHECKED_COLUMN,
	--    N_COLUMNS
	-- };
	--
	-- void
	-- setup_tree (void)
	-- {
	--    GtkTreeStore *store;
	--    GtkWidget *tree;
	--    GtkTreeViewColumn *column;
	--    GtkCellRenderer *renderer;
	--
	--    /* Create a model.  We are using the store model for now, though we
	--     * could use any other GtkTreeModel */
	--    store = gtk_tree_store_new (N_COLUMNS,
	--                                G_TYPE_STRING,
	--                                G_TYPE_STRING,
	--                                G_TYPE_BOOLEAN);
	--
	--    /* custom function to fill the model with data */
	--    populate_tree_model (store);
	--
	--    /* Create a view */
	--    tree = gtk_tree_view_new_with_model (GTK_TREE_MODEL (store));
	--
	--    /* The view now holds a reference.  We can get rid of our own
	--     * reference */
	--    g_object_unref (G_OBJECT (store));
	--
	--    /* Create a cell render and arbitrarily make it red for demonstration
	--     * purposes */
	--    renderer = gtk_cell_renderer_text_new ();
	--    g_object_set (G_OBJECT (renderer),
	--                  "foreground", "red",
	--                  NULL);
	--
	--    /* Create a column, associating the "text" attribute of the
	--     * cell_renderer to the first column of the model */
	--    column = gtk_tree_view_column_new_with_attributes ("Author", renderer,
	--                                                       "text", AUTHOR_COLUMN,
	--                                                       NULL);
	--
	--    /* Add the column to the view. */
	--    gtk_tree_view_append_column (GTK_TREE_VIEW (tree), column);
	--
	--    /* Second column.. title of the book. */
	--    renderer = gtk_cell_renderer_text_new ();
	--    column = gtk_tree_view_column_new_with_attributes ("Title",
	--                                                       renderer,
	--                                                       "text", TITLE_COLUMN,
	--                                                       NULL);
	--    gtk_tree_view_append_column (GTK_TREE_VIEW (tree), column);
	--
	--    /* Last column.. whether a book is checked out. */
	--    renderer = gtk_cell_renderer_toggle_new ();
	--    column = gtk_tree_view_column_new_with_attributes ("Checked out",
	--                                                       renderer,
	--                                                       "active", CHECKED_COLUMN,
	--                                                       NULL);
	--    gtk_tree_view_append_column (GTK_TREE_VIEW (tree), column);
	--
	--    /* Now we can manipulate the view just like any other GTK widget */
	--    ...
	-- }
	--

insert
	GTK -- to initialize the Gimp ToolKit
	G_TYPES
		-- TODO: This class is necessary when creating GTK_LIST_STOREs,
		-- since it requires explicit reference to g_type_*; it's ugly,
		-- or better it feels mostly unEiffelish to me. Paolo 2005-06-12
	
	WRAPPER_HANDLER -- required to check for some bug in the
		-- implementation and accessing wrappers' handles
	
	GTK_STOCK_ITEMS
	
	GLIB_MESSAGE_LOGGING

	GDK_TYPE_EXTERNALS -- To store GDK_PIXMAPS into the store. TODO:
			-- give the end-user a better interface.
	
create {ANY} make
	
feature {ANY} -- Columns
	name_column_n: INTEGER is 0
	nick_column_n: INTEGER is 1
	flag_column_n: INTEGER is 1
	columns_n: INTEGER is 3

feature {ANY}
	developers: FAST_ARRAY[TUPLE[STRING,STRING]] is
		once
			Result:= {FAST_ARRAY[TUPLE[STRING,STRING]]
			<< ["Pierre-Nicolas", "eif_pini"],
				["Anthony Lenton", "elachuni"],
				["jose bollo", "jobo"],
				["Natalia B. Bidart", "nessa"],
				["Oliver Elphick", "oliver_elphick"],
				["Raphael Mack", "ramack"],
				["Daniel F Moisset", "trixx"]
				["Paolo Redaelli", "tybor"],
				["Walter Alini", "walteralini"] >>
		}
		end

feature {ANY} 
	model: GTK_TREE_STORE is
			-- tree model with some data set
		local
			top_level, child: GTK_TREE_ITER

			developer_iter: ITERATOR[TUPLE[STRING,STRING]]
		once 
			create Result.make (<<g_type_string, g_type_string, gdk_type_pixbuf>>)
			-- TODO: change design to remove explicit reference to g_type_*; it's
			-- ugly, or better it feels mostly unEiffelish to me. Paolo 2005-06-01
			
			create top_level.make_from_model (Result)
			create child.make_from_model (Result)

			-- Append an empty top-level row to the tree store.
			-- Top_Level will point to the new row
			Result.append (top_level, Void)
			Result.set_string (top_level, name_column_n, "ISE developers")
			
			-- Append another empty top-level row to the tree store.
			-- Top_Level will point to the new row 
			Result.append(top_level, Void)
			Result.set_string (top_level, name_column_n, "SmartEiffel developers")

			-- Append a child to the row we just added.
			-- Child will point to the new row
			Result.append(top_level, Void)
			Result.set_string (top_level, name_column_n, "Eiffel-libraries developers")

			-- Get the first row, and add a child to it as well (could
			-- have been done right away earlier of course, this is just
			-- for demonstration purposes)
			
			child := Result.get_iterator_first
			if child = Void then
				glib_error("Oops, we should have a first row in the tree store!\n")
			else
				developer_iter := developers.get_new_iterator
				from developer_iter.start
				until developer_iter.is_off
				loop
					Result.append (child, top_level)

					Result.set_string (child, name_column_n, developer_iter.item.item_1)
					Result.set_string (child, nick_column_n, developer_iter.item.item_2)

					developer_iter.next
				end
			end
		end
	
	text_renderer, flag_renderer: GTK_CELL_RENDERER

	name_column, nick_column, nationality_column: GTK_TREE_VIEW_COLUMN

	view: GTK_TREE_VIEW is
		once
			create {GTK_CELL_RENDERER_TEXT} text_renderer.make
			create {GTK_CELL_RENDERER_PIXBUF} flag_renderer.make
			
			create name_column.make
			name_column.set_title ("Name")
			name_column.pack_start (text_renderer, True)
			name_column.add_attribute (text_renderer, "text", name_column_n)
												
			create nick_column.make
			nick_column.set_title ("Nick")
			nick_column.pack_start (text_renderer, True)
			nick_column.add_attribute (text_renderer, "text", nick_column_n)

			create nationality_column.make
			nick_column.set_title ("Nationality")
			nick_column.pack_start (text_renderer, True)
			nick_column.pack_start (flag_renderer, True)
			nick_column.add_attribute (text_renderer, "text", flag_column_n)
			
			
			create Result.make
			Result.insert_column (name_column, name_column_n)
			Result.insert_column (nick_column, nick_column_n)
			
			Result.set_model (model)

			-- TODO: Original C example here insert a g_object_unref
			-- (model); /* destroy model automatically with view */ I'm
			-- not sure, but it shouldn't be necessary. Shall we insert
			-- it? Paolo 2005-06-12
		end

	window: GTK_WINDOW

	vbox: GTK_VBOX

	button_box: GTK_HBOX

	add_button, remove_button, quit_button: GTK_BUTTON
	
feature {}  -- Creation
	
	make is
			-- Run the demo
		local selection: GTK_TREE_SELECTION
		do
			gtk.initialize_gtk
						
			-- Create a GTK window toplevel window
			create window.make
			window.set_title (window_title)

			-- It is a good idea to do this for all windows
			window.connect_agent_to_destroy_signal (agent on_destroy)

			view.show

			create add_button.from_stock (gtk_stock_add)
			create remove_button.from_stock (gtk_stock_remove)
			create quit_button.from_stock (gtk_stock_quit)
			create button_box.make(False,0) -- i.e. unhomogeneous, no spacing
			button_box.add(add_button)
			button_box.add(remove_button)
			button_box.add(quit_button)

			add_button.connect_agent_to_clicked_signal (agent add_clicked)
			remove_button.connect_agent_to_clicked_signal (agent remove_clicked)
			quit_button.connect_agent_to_clicked_signal (agent quit_clicked)

			create vbox.make(False,0) -- i.e. unhomogeneous, no spacing
			vbox.add(view)
			vbox.add(button_box)
			
			window.add (vbox)
			window.show_all

			selection := view.selection
			selection.set_single_mode
			selection.set_select_function (agent on_select)
			gtk.run_main_loop
		end

feature {ANY}
	traverse_model is
		require valid_model: model /= Void
		local iter:  GTK_TREE_ITER
		do
			print ("Iterating over names%N")
			create iter.make_from_model (model)	  
			from iter.start
			until not iter.is_valid
			loop -- print each name ...
				print (model.value (iter, name_column_n).string)
				-- Note: Is "model.value" clear enough or "model.value_at" would be clearer?
				iter.next -- Move to next row
				if iter.is_valid then print (", ")
				else print ("%N")
				end
			end
		end
	
	paths_demo is
		local path: GTK_TREE_PATH
		do
			print ("Tree paths demo:%N")
			create path.make_first
			print ("First: ") print (path.to_string) print ("%N")
			create path.from_string ("1:3:2")
			print ("From string: ") print (path.to_string) print ("%N")
		end

feature {ANY} -- Agents
	add_clicked (a_button: GTK_BUTTON) is
		do

		end

	remove_clicked (a_button: GTK_BUTTON) is
		do
			
		end

	quit_clicked (a_button: GTK_BUTTON) is
		do
			window.destroy
		end

	on_destroy (a_gtk_object: GTK_OBJECT) is
		do
			print ("Tree demo is quitting.%N")
			paths_demo
			print ("Traversing model:%N")
			traverse_model
			print ("Using GTK_TREE_MODEL.for_each to print its content:%N")
			print ("TODO: in tree_demo on_destroy model.for_each (agent print_person)%N")
			print ("If GTK_TREE_MODEL.for_each is implemented correctly you should see above each person's name and age.%N")
			gtk.quit
		end

	print_person (a_model: GTK_TREE_MODEL; a_path: GTK_TREE_PATH; an_iter: GTK_TREE_ITER): BOOLEAN is
		do
			check	right_model: a_model = model end
			print ("Person (code: ")
			print (a_path.to_string) print (") name '")
			print (a_model.value_at (an_iter, name_column_n).string)
			print ("' nick ")
			print (a_model.value_at (an_iter, nick_column_n).natural.out)
			print ("%N")
			Result := False -- i.e. go on
		end
			
	on_select (a_selection: GTK_TREE_SELECTION; a_model: GTK_TREE_MODEL; a_path: GTK_TREE_PATH; path_selected: BOOLEAN): BOOLEAN is
		do
			if a_selection.is_node_selected then
				print ("A selected row is being de-selected. Disabling buttons.%N")				
				add_button.set_sensitive(False)
				remove_button.set_sensitive(False)
			else
				print ("A de-selected row is being selected. Enabling buttons.%N")
				add_button.set_sensitive(True)
				remove_button.set_sensitive(True)
			end
			
			print ("Path '") print (a_path.to_string)
			if path_selected then print ("' is being selected")
			else print ("' is being de-selected")
			end
			
			debug
				if a_model = Void 
				 then print ("; no model passed but we're sure that out GTK_LIST_STORE at"+model.to_pointer.out+" has handle="+model.handle.out)
				else print (".")
				end
			end
			print ("%N")
			Result := True -- i.e. effectively select the picked button.
		end
								
feature {ANY} -- Constants
	window_title: STRING is "GTK Trees!"
			-- Text top level window title
end

-- Examples from C docs.

-- To help show some common operation of a model, some examples are
-- provided. The first example shows three ways of getting the iter at
-- the location "3:2:5". While the first method shown is easier, the
-- second is much more common, as you often get paths from callbacks.

-- Example 1. Acquiring a GtkTreeIter

-- /* Three ways of getting the iter pointing to the location
--  */
-- {
--   GtkTreePath *path;
--   GtkTreeIter iter;
--   GtkTreeIter parent_iter;

--   /* get the iterator from a string */
--   gtk_tree_model_get_iter_from_string (model, &iter, "3:2:5");

--   /* get the iterator from a path */
--   path = gtk_tree_path_new_from_string ("3:2:5");
--   gtk_tree_model_get_iter (model, &iter, path);
--   gtk_tree_path_free (path);


--   /* walk the tree to find the iterator */
--   gtk_tree_model_iter_nth_child (model, &iter, NULL, 3);
--   parent_iter = iter;
--   gtk_tree_model_iter_nth_child (model, &iter, &parent_iter, 2);
--   parent_iter = iter;
--   gtk_tree_model_iter_nth_child (model, &iter, &parent_iter, 5);
-- }

-- This second example shows a quick way of iterating through a list
-- and getting a string and an integer from each row. The
-- populate_model function used below is not shown, as it is specific
-- to the GtkListStore. For information on how to write such a
-- function, see the GtkListStore documentation.

-- Example 2. Reading data from a GtkTreeModel

-- enum
-- {
--   STRING_COLUMN,
--   INT_COLUMN,
--   N_COLUMNS
-- };

-- {
--   GtkTreeModel *list_store;
--   GtkTreeIter iter;
--   gboolean valid;
--   gint row_count = 0;

--   /* make a new list_store */
--   list_store = gtk_list_store_new (N_COLUMNS, G_TYPE_STRING, G_TYPE_INT);

--   /* Fill the list store with data */
--   populate_model (list_store);

--   /* Get the first iter in the list */
--   valid = gtk_tree_model_get_iter_first (list_store, &iter);

--   while (valid)
--     {
--       /* Walk through the list, reading each row */
--       gchar *str_data;
--       gint   int_data;

--       /* Make sure you terminate calls to gtk_tree_model_get()
--        * with a '-1' value
--        */
--       gtk_tree_model_get (list_store, &iter, 
--                           STRING_COLUMN, &str_data,
--                           INT_COLUMN, &int_data,
--                           -1);

--       /* Do something with the data */
--       g_print ("Row %d: (%s,%d)\n", row_count, str_data, int_data);
--       g_free (str_data);

--       row_count ++;
--       valid = gtk_tree_model_iter_next (list_store, &iter);
--     }
-- }
