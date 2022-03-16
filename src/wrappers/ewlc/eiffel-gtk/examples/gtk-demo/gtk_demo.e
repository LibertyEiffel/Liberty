note
	description: "Gtk demo."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK team
					
					This program is free software; you can redistribute it and/or
					modify it under the terms of the GNU General Public License
					as published by the Free Software Foundation; either version 2.0 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTK_DEMO

insert
	GTK
	G_TYPES
	GTK_STANDARD_ENUMERATIONS
	PANGO_STYLE
	-- Eventually insert this - when it will be implemented:
	-- PANGO_STANDARD_ENUMERATIONS

create {ANY} make

feature {ANY} -- Buffers
	info_buffer, source_buffer: GTK_TEXT_BUFFER
	current_file: STRING

feature {ANY} -- column numbers
  title_column: INTEGER is 0
  filename_column: INTEGER is 1
  italic_column: INTEGER is 2
  columns_number: INTEGER is 3

feature {ANY} -- labels text
	window_title: STRING is "GTK+ Code Demos"
	info_label_string: STRING is "_Info"
	source_label_string: STRING is "_Source"
	
feature {ANY} -- widgets
	window: GTK_WINDOW
		once 
			create Result.make -- a new toplevel window
			Result.set_title (window_title);
			Result.connect_to_destroy_signal (agent quit)
			Result.add (hbox)

			-- TODO: provide Eiffel syntax highlighting
			Result.set_default_size (600, 400)			
		end

   hbox: GTK_HBOX
		once 
			create Result.make (False, 0)
			Result.pack_start (demo_list, False, False, 0)
			Result.pack_start (notebook, True, True, 0)
		end

   notebook: GTK_NOTEBOOK
		once 
			create Result.make
			Result.append_page (text_from (info_buffer),
									  create {GTK_LABEL}.with_mnemonic 
									  (info_label_string))
			Result.append_page (source_widget_from (source_buffer),
									  create {GTK_LABEL}.with_mnemonic (source_label_string));
		end

   tag: GTK_TEXT_TAG

	demo_list: GTK_TREE_VIEW
		local
			tree_view: GTK_TREE_VIEW
			selection: GTK_TREE_SELECTION;
			cell: GTK_CELL_RENDERER_TEXT;
			column: GTK_TREE_VIEW_COLUMN;
			-- box: GTK_NOTEBOOK
			label: GTK_LABEL;
			scrolled_window: GTK_SCROLLED_WINDOW
		once
			create tree_view.with_model (model)
			selection := tree_view.selection -- Short-cut to avoid retrieving the selection everytime
			selection.set_browse_mode
			tree_view.set_size_request (200, -1)
					
			create cell.make
			cell.set_style (pango_style_italic)
			
			create column.with_attributes ("Widget (double click for demo)", cell,
													 <<["text",title_column], ["style_set",italic_column]>>)
			tree_view.append_column (column)
			
			-- Why should I select the first? Let the user do it.
			-- tree_iter := model.get_iterator_first
			-- selection.select_iter (tree_iter)
			
			selection.connect_to_changed_signal (agent selection_callback)
			tree_view.connect_to_row_activated_signal (agent row_activated_callback)
			-- Note: changed and row_activated signals should receive
			-- model somehow. In C it is passed throught the data
			-- gpointer argument. In Eiffel this is not needed, since it 
			-- is already available as a feature of Current's GTK_DEMO.

			tree_view.expand_all -- collapse_all
			tree_view.set_headers_visible
			
			create scrolled_window.make (Void,Void)
			Result.set_policy(gtk_policy_never,gtk_policy_automatic)	
			
			Result.add (tree_view)
			
			create label.with_label ("Widget (double click for demo)")
			
			notebook.append_page (scrolled_window, label)
			
			tree_view.grab_focus
		end
														 
	setup_default_icon
		local
			pixbuf, transparent: GDK_PIXBUF
			list: G_LIST [GDK_PIXBUF]
		do

			debug print ("TODO: implement and use find_file; it requires GLib's g_file%N") end
			
			--   filename = demo_find_file ("gtk-logo-rgb.gif", &err);
			--   if (filename)
			create pixbuf.from_file ("gtk-logo-rgb.gif")
			
			-- Ignoring this error (not handling G_ERROR once it is
			-- implemented above) would probably be reasonable for most
			-- apps.  We're just showing off.

			--       GList *list;      
			--       GdkPixbuf *transparent;
			
			-- The gtk-logo-rgb icon has a white background, make it transparent
			debug print("TODO: transparent := pixbuf.add_alpha (True, 0xff, 0xff, 0xff)%N") end
			transparent := pixbuf
			
			create list.empty
			list.append (transparent)
			debug print("TODO: gtk_window_set_default_icon_list (list)%N") end
			gtk.set_default_icon_list (list)
		end

feature {} -- Creation
	make
		do
			gtk.initialize
			
			setup_default_icon
			window.show_all
			--   load_file (testgtk_demos[0].filename);
			gtk.run_main_loop
		end

	find_file (a_base_filename: STRING): STRING
			-- Looks for `a_base_filename' first in the current directory, then in the
			-- location GTK+ where it will be installed on make install,
			-- returns the first file found. If `a_base_filename' is not found 
			-- it is Void; `error' will be set accordingly
		require a_base_filename /=Void
		do
			--   if (g_file_test ("gtk-logo-rgb.gif", G_FILE_TEST_EXISTS) &&
			--       g_file_test (base, G_FILE_TEST_EXISTS))
			--     return g_strdup (base);
			--   else
			--     {
			--       char *filename = g_build_filename (DEMOCODEDIR, base, NULL);
			--       if (!g_file_test (filename, G_FILE_TEST_EXISTS))
			-- 	{
			-- 	  g_set_error (err, G_FILE_ERROR, G_FILE_ERROR_NOENT,
			-- 		       "Cannot find demo data file \"%s\"", base);
			-- 	  g_free (filename);
			-- 	  return NULL;
			-- 	}
			--       return filename;
			--     }
			-- }
		ensure implemented: False
		end
	
	window_closed_callback (a_window: GTK_WINDOW)
		do
			--   CallbackData *cbdata = data;
			--   GtkTreeIter iter;
			--   gboolean italic;
			
			--   gtk_tree_model_get_iter (cbdata->model, &iter, cbdata->path);
			--   gtk_tree_model_get (GTK_TREE_MODEL (cbdata->model), &iter,
			-- 		      ITALIC_COLUMN, &italic,
			-- 		      -1);
			--   if (italic)
			--     gtk_tree_store_set (GTK_TREE_STORE (cbdata->model), &iter,
			-- 			ITALIC_COLUMN, !italic,
			-- 			-1);
			
			--   gtk_tree_path_free (cbdata->path);
			--   g_free (cbdata);
		end


	-- void
	-- load_file (const gchar *filename)
	-- {
	--   FILE *file;
	--   GtkTextIter start, end;
	--   char *full_filename;
	--   GError *err = NULL;
	--   GString *buffer = g_string_new (NULL);
	--   int state = 0;
	--   gboolean in_para = 0;

	--   if (current_file && !strcmp (current_file, filename))
	--     {
	--       g_string_free (buffer, TRUE);
	--       return;
	--     }

	--   g_free (current_file);
	--   current_file = g_strdup (filename);
  
	--   gtk_text_buffer_get_bounds (info_buffer, &start, &end);
	--   gtk_text_buffer_delete (info_buffer, &start, &end);

	--   gtk_text_buffer_get_bounds (source_buffer, &start, &end);
	--   gtk_text_buffer_delete (source_buffer, &start, &end);

	--   full_filename = demo_find_file (filename, &err);
	--   if (!full_filename)
	--     {
	--       g_warning ("%s", err->message);
	--       g_error_free (err);
	--       return;
	--     }

	--   file = g_fopen (full_filename, "r");

	--   if (!file)
	--     g_warning ("Cannot open %s: %s\n", full_filename, g_strerror (errno));

	--   g_free (full_filename);

	--   if (!file)
	--     return;

	--   gtk_text_buffer_get_iter_at_offset (info_buffer, &start, 0);
	--   while (read_line (file, buffer))
	--     {
	--       gchar *p = buffer->str;
	--       gchar *q;
	--       gchar *r;
      
	--       switch (state)
	-- 	{
	-- 	case 0:
	-- 	  /* Reading title */
	-- 	  while (*p == '/' || *p == '*' || g_ascii_isspace (*p))
	-- 	    p++;
	-- 	  r = p;
	-- 	  while (*r != '/' && strlen (r))
	-- 	    r++;
	-- 	  if (strlen (r) > 0)
	-- 	    p = r + 1;
	-- 	  q = p + strlen (p);
	-- 	  while (q > p && g_ascii_isspace (*(q - 1)))
	-- 	    q--;

	-- 	  if (q > p)
	-- 	    {
	-- 	      int len_chars = g_utf8_pointer_to_offset (p, q);

	-- 	      end = start;

	-- 	      g_assert (strlen (p) >= q - p);
	-- 	      gtk_text_buffer_insert (info_buffer, &end, p, q - p);
	-- 	      start = end;

	-- 	      gtk_text_iter_backward_chars (&start, len_chars);
	-- 	      gtk_text_buffer_apply_tag_by_name (info_buffer, "title", &start, &end);

	-- 	      start = end;
	      
	-- 	      state++;
	-- 	    }
	-- 	  break;
	    
	-- 	case 1:
	-- 	  /* Reading body of info section */
	-- 	  while (g_ascii_isspace (*p))
	-- 	    p++;
	-- 	  if (*p == '*' && *(p + 1) == '/')
	-- 	    {
	-- 	      gtk_text_buffer_get_iter_at_offset (source_buffer, &start, 0);
	-- 	      state++;
	-- 	    }
	-- 	  else
	-- 	    {
	-- 	      int len;
	      
	-- 	      while (*p == '*' || g_ascii_isspace (*p))
	-- 		p++;

	-- 	      len = strlen (p);
	-- 	      while (g_ascii_isspace (*(p + len - 1)))
	-- 		len--;
	      
	-- 	      if (len > 0)
	-- 		{
	-- 		  if (in_para)
	-- 		    gtk_text_buffer_insert (info_buffer, &start, " ", 1);

	-- 		  g_assert (strlen (p) >= len);
	-- 		  gtk_text_buffer_insert (info_buffer, &start, p, len);
	-- 		  in_para = 1;
	-- 		}
	-- 	      else
	-- 		{
	-- 		  gtk_text_buffer_insert (info_buffer, &start, "\n", 1);
	-- 		  in_para = 0;
	-- 		}
	-- 	    }
	-- 	  break;

	-- 	case 2:
	-- 	  /* Skipping blank lines */
	-- 	  while (g_ascii_isspace (*p))
	-- 	    p++;
	-- 	  if (*p)
	-- 	    {
	-- 	      p = buffer->str;
	-- 	      state++;
	-- 	      /* Fall through */
	-- 	    }
	-- 	  else
	-- 	    break;
	  
	-- 	case 3:
	-- 	  /* Reading program body */
	-- 	  gtk_text_buffer_insert (source_buffer, &start, p, -1);
	-- 	  gtk_text_buffer_insert (source_buffer, &start, "\n", 1);
	-- 	  break;
	-- 	}
	--     }

	--   fontify ();

	--   g_string_free (buffer, TRUE);
	-- }

	row_activated_callback (a_path: GTK_TREE_PATH;
									a_column: GTK_TREE_VIEW_COLUMN;
									a_tree_view: GTK_TREE_VIEW)
		do
			-- {
			--   GtkTreeIter iter;
			--   gboolean italic;
			--   GDoDemoFunc func;
			--   GtkWidget *window;
			--   GtkTreeModel *model;

			--   model = gtk_tree_view_get_model (tree_view);
			
			--   gtk_tree_model_get_iter (model, &iter, path);
			--   gtk_tree_model_get (GTK_TREE_MODEL (model),
			-- 		      &iter,
			-- 		      FUNC_COLUMN, &func,
			-- 		      ITALIC_COLUMN, &italic,
			-- 		      -1);
			
			--   if (func)
			--     {
			--       gtk_tree_store_set (GTK_TREE_STORE (model),
			-- 			  &iter,
			-- 			  ITALIC_COLUMN, !italic,
			-- 			  -1);
			--       window = (func) (gtk_widget_get_toplevel (GTK_WIDGET (tree_view)));
			
			--       if (window != NULL)
			-- 	{
			-- 	  CallbackData *cbdata;
			
			-- 	  cbdata = g_new (CallbackData, 1);
			-- 	  cbdata->model = model;
			-- 	  cbdata->path = gtk_tree_path_copy (path);
			
			-- 	  g_signal_connect (window, "destroy",
			-- 			    G_CALLBACK (window_closed_cb), cbdata);
			-- 	}
			--     }
			-- }
		end
	
	selection_callback (a_selection: GTK_TREE_SELECTION)
		local iter: GTK_TREE_ITER
		do
			debug print ("selection_callback unimplemented%N") end
			-- demo := model.value(iter, demo_column)
			-- notebook
			if a_selection.is_node_selected then
				print("TODO: load_file (model.value (iter, filename_column))")
			end
		end

	text_from (a_buffer: GTK_TEXT_BUFFER): GTK_SCROLLED_WINDOW
		local
			text_view: GTK_TEXT_VIEW
			buffer: GTK_TEXT_BUFFER
		do
			-- static GtkWidget *
			-- create_text (GtkTextBuffer **buffer,
			-- 	     gboolean        is_source)
			-- {
			--   GtkWidget *scrolled_window;
			--   GtkWidget *text_view;
			--   PangoFontDescription *font_desc;

			create Result.make (Void,Void)
			Result.set_policy (gtk_policy_automatic,
									 gtk_policy_automatic)
			Result.set_shadow_type (gtk_shadow_in)

			create text_view.make
			create buffer.make
			text_view.set_buffer (buffer)
			text_view.set_uneditable
			text_view.set_cursor_invisible
			text_view.set_wrap_mode (gtk_wrap_word) -- Make text a little nicer
			-- TODO: text_view.set_pixels_above_lines (2)
			-- TODO: text_view.set_pixels_below_lines (2)

			Result.add (text_view)
		end

	source_widget_from (a_buffer: GTK_TEXT_BUFFER): GTK_SCROLLED_WINDOW
		local
			text_view: GTK_TEXT_VIEW
			buffer: GTK_TEXT_BUFFER
		do
			-- static GtkWidget *
			-- create_text (GtkTextBuffer **buffer,
			-- 	     gboolean        is_source)
			-- {
			--   GtkWidget *scrolled_window;
			--   GtkWidget *text_view;
			--   PangoFontDescription *font_desc;

			create Result.make (Void,Void)
			Result.set_policy (gtk_policy_automatic,gtk_policy_automatic)
			Result.set_shadow_type (gtk_shadow_in)

			create text_view.make
			create buffer.make
			text_view.set_buffer (buffer)
			text_view.set_uneditable
			text_view.set_cursor_invisible
			Result.add (text_view)

			-- Note: original C program used monospace font to display
			-- source. Eiffel are better viewed with proportional fonts.

			-- font_desc = pango_font_description_from_string ("monospace");
			-- gtk_widget_modify_font (text_view, font_desc);
			-- pango_font_description_free (font_desc);

			text_view.set_wrap_mode (gtk_wrap_none)
		ensure implemented: Result /= Void
		end

feature {ANY} -- Demos
	
	model: GTK_TREE_STORE
		local
			demo, subdemo: DEMO;
			demos_iterator, child_iterator: ITERATOR [DEMO];
			tree_iter, subtree_iter: GTK_TREE_ITER;			
		once
			create Result.make (<<g_type_string, g_type_string, g_type_boolean>>)

			from 
				demos_iterator := demos.get_new_iterator
				demos_iterator.start 
				create tree_iter.make_from_model (Result)
				create subtree_iter.make_from_model (Result)
			until demos_iterator.is_off
			loop
				demo := demos_iterator.item
				debug print ("Adding "+demo.name+" demo%N") end
				Result.append (tree_iter, Void)
				Result.set_string (tree_iter, title_column, demo.name)
				Result.set_string (tree_iter, filename_column, demo.filename)
				-- Ahhh! A pointer to a function into a model!
				-- FUNC_COLUMN, d->func,
				-- This should be replaced with a proper Eiffel object
				-- stored somewhere.
				Result.set_boolean (tree_iter, italic_column, False)
				
				if demo.has_children then
					from
						child_iterator := demo.subdemos.get_new_iterator
						child_iterator.start
					until child_iterator.is_off
					loop 
						subdemo := child_iterator.item
						Result.append (subtree_iter, tree_iter)
						Result.set_string (subtree_iter, title_column, subdemo.name)
						Result.set_string (subtree_iter, filename_column, subdemo.filename)
						-- aaargh! another FUNC_COLUMN, subdemo->func,
						Result.set_boolean (subtree_iter, italic_column, False)
						child_iterator.next
					end -- loop over children
				end -- has childres
				demos_iterator.next
			end -- loop over demos
		end
	
	demos:  LINKED_LIST [DEMO]
		once
			Result := {LINKED_LIST[DEMO] << application_window,
													  -- button_box,
													  -- change_display,
													  -- color_selector,
													  -- dialog,
													  -- drawing_area,
													  -- entry_completion,
													  expander
													  -- icon_views,
													  -- "Icon View Basics", "iconview.e",
													  -- "Editing and Drag-and-Drop", 
													  --"iconview_edit.e",
													  -- images,
													  -- menus,
													  -- paned
													  -- TODO: pixbufs
													  -- rotated_text size_groups
													  -- stock_browser text_demos
													  -- [hypertext, multipleviews]
													  -- tree_demos
													  -- [editable_cells,
													  -- list_store, tree_store]
													  -- ui_manager
													  >>}
		end


feature {ANY} 	-- demos singletons 
	application_window: APP_WINDOW is once create Result.make end
	expander: EXPANDER is once create Result.make end
	
feature {ANY} -- callbacks
	quit (an_object: GTK_OBJECT)
		do
			print (once "Quitting Eiffel Gtk-demo applicaiton%N")
			gtk.quit
		end
end -- GTK_DEMO
