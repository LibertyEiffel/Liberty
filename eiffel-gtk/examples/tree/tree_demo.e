indexing
	description: "Tree example translated to Eiffel from C"
	copyright: "Copyright (c) 2003-2004 Tim-Philipp Müller <tim at centricular dot net>, Copyright (c) 2005, Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	original_version_url: "http://scentric.net/tutorial/treeview-tutorial.html"

class TREE_DEMO

inherit
	GTK
	G_TYPES
		-- TODO: This class is necessary when creating GTK_LIST_STOREs,
		-- since it requires explicit reference to g_type_*; it's ugly,
		-- or better it feels mostly unEiffelish to me. Paolo 2005-06-12
	
insert
	WRAPPER_HANDLER -- required to check for some bug in the implementation and accessing wrappers' handles
	GTK_STOCK_ITEMS
	GLIB_MESSAGE_LOGGING
	
creation make
	
feature -- Columns
	name_column_n: INTEGER is 0
	nick_column_n: INTEGER is 1
	columns_n: INTEGER is 2

feature
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

feature 
	model: GTK_TREE_STORE is
			-- tree model with some data set
		local
			top_level, child: GTK_TREE_ITER

			developer_iter: ITERATOR[TUPLE[STRING,STRING]]
		once 
			create Result.make (<<g_type_string, g_type_string>>)
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
	
	renderer: GTK_CELL_RENDERER

	name_column, nick_column: GTK_TREE_VIEW_COLUMN

	view: GTK_TREE_VIEW is
		once
			create {GTK_CELL_RENDERER_TEXT} renderer.make
			
			create name_column.make
			name_column.set_title ("Name")
			name_column.pack_start (renderer, True)
			name_column.add_attribute (renderer, "text", name_column_n)
												
			create nick_column.make
			nick_column.set_title ("Nick")
			nick_column.pack_start (renderer, True)
			nick_column.add_attribute (renderer, "text", nick_column_n)

			create Result.make
			Result.insert_column (name_column, name_column_n)
			Result.insert_column (nick_column, nick_column_n)
			-- Note: both xxx_column_n was -1. Paolo 2005-06-12
			
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

feature
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

feature -- Agents
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
				print ("Enabling buttons.%N")
				add_button.set_sensitive
				remove_button.set_sensitive
			else
				print ("Disabling buttons.%N")				
				add_button.unset_sensitive
				remove_button.unset_sensitive
			end
			
			print ("Path '") print (a_path.to_string)
			if path_selected then print ("' is selected")
			else print ("' is de-selected")
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
								
feature -- Constants
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
