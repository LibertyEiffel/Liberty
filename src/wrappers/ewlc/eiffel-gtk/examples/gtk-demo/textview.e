note
	description: "Text Widget/Multiple Views"
	long_description: "[
							 The GtkTextView widget displays a GtkTextBuffer. One GtkTextBuffer
							 can be displayed by multiple GtkTextViews. This demo has two views
							 displaying a single buffer, and shows off the widget's text
							 formatting features.
							 ]"
	copyright: "[
					Copyright (C) 2006-2017: Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
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

class TEXTVIEW

insert
	GTK
	PANGO_CONSTANTS
	PANGO_SCALES
	PANGO_WEIGHT
	PANGO_STYLE
	
create {ANY} make

feature {ANY} -- Widgets
	buffer: GTK_TEXT_BUFFER
feature {ANY} 
	make
		do 
			gtk.initialize_gtk
			create buffer.make
		end 
feature {ANY}  -- Callbacks
	-- easter_egg_callback (GtkWidget *button, Gpointer data);

feature {ANY} -- constants
	gray50_width: INTEGER is 2
	gray50_height: INTEGER is 2
			-- static char gray50_bits[] = {0x02, 0x01}; ???

feature {ANY} -- tags	
	heading: GTK_TEXT_TAG
		once
			create Result.with_name("heading")
			Result.set_weight (pango_weight_bold)
			Result.set_size (15 * pango_scale)
		end

	italic: GTK_TEXT_TAG
		once
			create Result.with_name("italic")
			Result.set_style (pango_style_italic)
		end

	bold: GTK_TEXT_TAG
		once
			create Result.with_name("bold")
			Result.set_weight ( pango_weight_bold )
		end

	big: GTK_TEXT_TAG
		once
			create Result.with_name("big")
			Result.set_size (20* 1024 -- i.e.: pango_scale ... TODO:
								  )
		end

	xx_small: GTK_TEXT_TAG
		once
			create Result.with_name("xx_small")
			Result.set_scale ( pango_scale_xx_small )
		end

	x_large: GTK_TEXT_TAG
		once
			create Result.with_name("x_large")
			-- "Extra-large", buffer.create_tag ("x-large", -- << [ "scale",
																					-- PANGO_SCALE_X_LARGE ] >> ); 
		end

	monospace: GTK_TEXT_TAG
		once
			create Result.with_name("monospace")
			--   gtk_text_buffer_create_tag (buffer, "monospace",
			-- 			      "family", "monospace", NULL);
		end

	blue_foreground: GTK_TEXT_TAG
		once
			create Result.with_name("blue_foreground")
			--   gtk_text_buffer_create_tag (buffer, "blue_foreground",
			-- 			      "foreground", "blue", NULL);  
		end

	red_background: GTK_TEXT_TAG
		once
			create Result.with_name("red_background")
			--   gtk_text_buffer_create_tag (buffer, "red_background",
			-- 			      "background", "red", NULL);
		end

	background_stipple: GTK_TEXT_TAG
		once
			create Result.with_name("background_stipple")
			--   stipple = gdk_bitmap_create_from_data (NULL,
			-- 					 gray50_bits, gray50_width,
			-- 					 gray50_height);
  
			--   gtk_text_buffer_create_tag (buffer, "background_stipple",
			-- 			      "background_stipple", stipple, NULL);
		end
	
	foreground_stipple: GTK_TEXT_TAG
		once
			create Result.with_name("foreground_stipple")
			--   gtk_text_buffer_create_tag (buffer, "foreground_stipple",
			-- 			      "foreground_stipple", stipple, NULL);

			--   g_object_unref (stipple);

			--   gtk_text_buffer_create_tag (buffer, "big_gap_before_line",
		end

	big_gap_before_line: GTK_TEXT_TAG
		once
			create Result.with_name("big_gap_before_line")
			--   gtk_text_buffer_create_tag (buffer, "big_gap_before_line",
			-- 			      "pixels_above_lines", 30, NULL);
		end

	big_gap_after_line: GTK_TEXT_TAG
		once
			create Result.with_name("big_gap_after_line")
			--   gtk_text_buffer_create_tag (buffer, "big_gap_after_line",
			-- 			      "pixels_below_lines", 30, NULL);

		end

	double_spaced_line: GTK_TEXT_TAG
		once
			create Result.with_name("double_spaced_line")
			--   gtk_text_buffer_create_tag (buffer, "double_spaced_line",
			-- 			      "pixels_inside_wrap", 10, NULL);
		end

	not_editable: GTK_TEXT_TAG
		once
			create Result.with_name("not_editable")
			--   gtk_text_buffer_create_tag (buffer, "not_editable",
			-- 			      "editable", FALSE, NULL);
		end

	word_wrap: GTK_TEXT_TAG
		once
			create Result.with_name("word_wrap")
			--   gtk_text_buffer_create_tag (buffer, "word_wrap",
			-- 			      "wrap_mode", GTK_WRAP_WORD, NULL);
		end

	char_wrap: GTK_TEXT_TAG
		once
			create Result.with_name("char_wrap")
			--   gtk_text_buffer_create_tag (buffer, "char_wrap",
			-- 			      "wrap_mode", GTK_WRAP_CHAR, NULL);
		end

	no_wrap: GTK_TEXT_TAG
		once
			create Result.with_name("no_wrap")
			--   gtk_text_buffer_create_tag (buffer, "no_wrap",
			-- 			      "wrap_mode", GTK_WRAP_NONE, NULL);
		end

	center: GTK_TEXT_TAG
		once
			create Result.with_name("center")
			--   gtk_text_buffer_create_tag (buffer, "center",
			-- 			      "justification", GTK_JUSTIFY_CENTER, NULL);
		end

	right_justify: GTK_TEXT_TAG
		once
			create Result.with_name("right_justify")
			--   gtk_text_buffer_create_tag (buffer, "right_justify",
			-- 			      "justification", GTK_JUSTIFY_RIGHT, NULL);
		end

	wide_margins: GTK_TEXT_TAG
		once
			create Result.with_name("wide_margins")
			--   gtk_text_buffer_create_tag (buffer, "wide_margins",
			-- 			      "left_margin", 50, "right_margin", 50,
			-- 			      NULL);
  
		end

	strikethrough: GTK_TEXT_TAG
		once
			create Result.with_name("strikethrough")
			--   gtk_text_buffer_create_tag (buffer, "strikethrough",
			-- 			      "strikethrough", TRUE, NULL);
		end

	underline: GTK_TEXT_TAG
		once
			create Result.with_name("underline")
			--   gtk_text_buffer_create_tag (buffer, "underline",
			-- 			      "underline", PANGO_UNDERLINE_SINGLE, NULL);

		end

	double_underline: GTK_TEXT_TAG
		once
			create Result.with_name("double_underline")
			--   gtk_text_buffer_create_tag (buffer, "double_underline",
			-- 			      "underline", PANGO_UNDERLINE_DOUBLE, NULL);		end
		end
			
	superscript: GTK_TEXT_TAG
		once
			create Result.with_name("superscript")
			
			--   gtk_text_buffer_create_tag (buffer, "superscript",
			-- 			      "rise", 10 * PANGO_SCALE,	  /* 10 pixels */
			-- 			      "size", 8 * PANGO_SCALE,	  /* 8 points */
			-- 			      NULL);
  		end

	subscript: GTK_TEXT_TAG
		once
			create Result.with_name("subscript")
			--   gtk_text_buffer_create_tag (buffer, "subscript",
			-- 			      "rise", -10 * PANGO_SCALE,   /* 10 pixels */
			-- 			      "size", 8 * PANGO_SCALE,	   /* 8 points */
			-- 			      NULL);
		end
	
	rtl_quote: GTK_TEXT_TAG
		once
			create Result.with_name("rtl_quote")
			--   gtk_text_buffer_create_tag (buffer, "rtl_quote",
			--   gtk_text_buffer_create_tag (buffer, "rtl_quote",
			-- 			      "wrap_mode", GTK_WRAP_WORD,
			-- 			      "direction", GTK_TEXT_DIR_RTL,
			-- 			      "indent", 30,
			-- 			      "left_margin", 20,
			-- 			      "right_margin", 20,
			-- 			      NULL);
			-- }
		end

	tags: GTK_TEXT_TAG_TABLE
			-- A bunch of tags. Note that it's also possible to create
			-- tags with `GTK_TEXT_TAG.make' then add them to the tag
			-- table for the buffer, `GTK_TEXT_BUFFER.create_tag' is just
			-- a convenience function. Also note that you don't have to
			-- give tags a name; pass Void for the name to create an
			-- anonymous tag.
			
			--In any real app, another useful optimization would be to
			--create a GtkTextTagTable in advance, and reuse the same tag
			--table for all the buffers with the same tag set, instead of
			--creating new copies of the same tags for every buffer.
		
			-- Tags are assigned default priorities in order of addition
			-- to the tag table.  That is, tags created later that affect
			-- the same text property affected by an earlier tag will
			-- override the earlier tag.  You can modify tag priorities
			-- with gtk_text_tag_set_priority().
		local stipple: GDK_BITMAP; 
		do
			create Result.make
			Result.add (heading)
			Result.add (italic)
			Result.add (bold)
			Result.add (big)
			Result.add (xx_small)
			Result.add (x_large)
			Result.add (monospace)
			Result.add (blue_foreground)
			Result.add (red_background)
			Result.add (background_stipple)
			Result.add (foreground_stipple)
			Result.add (big_gap_before_line)
			Result.add (big_gap_after_line)
			Result.add (double_spaced_line)
			Result.add (not_editable)
			Result.add (word_wrap)
			Result.add (char_wrap)
			Result.add (no_wrap)
			Result.add (center)
			Result.add (right_justify)
			Result.add (wide_margins)
			Result.add (strikethrough)
			Result.add (underline)
			Result.add (double_underline)
			Result.add (superscript)
			Result.add (subscript)
			Result.add (rtl_quote)
		end
	

	pixbuf: GDK_PIXBUF
		local		
			filename: STRING
		do
			-- `demo_find_file' looks in the the current directory first,
			-- so you can run gtk-demo without installing GTK, then looks
			-- in the location where the file is installed.
			
			filename := "gtk-logo-rgb.gif" -- demo_find_file ("gtk-logo-rgb.gif", Void)
			if filename /= Void then
				create Result.from_file (filename)
				
				if Result /= Void then
					-- g_printerr ("Failed to load image file gtk-logo-rgb.gif\n")
					-- exit (1)
				else 
					-- scaled: GDK_PIXBUF;

					-- TODO: scaled := pixbuf.scale_simple (32, 32, gdk_interp_bilinear)
					-- pixbuf.unref 
					-- TODO: check if the previous command is unnecessary,
					-- since the following instruction will make former pixbuf
					-- unreachable, disposable and collectable by the garbage
					-- collector. Paolo 2006-07-05
					-- pixbuf := scaled
				end
			end
		end
	
	insert_text
		local
			iter, start, end_iter: GTK_TEXT_ITER;
			anchor: GTK_TEXT_CHILD_ANCHOR;
		do
			-- get start of buffer; each insertion will revalidate the
			-- iterator to point to just after the inserted text.
				
			iter := buffer.iter_at_offset(0)
				
			buffer.insert_at (iter, "The text widget can display text with all %
											%kinds of nifty attributes. It also supports %
											%multiple views of the same buffer; this demo %
											%is showing the same buffer in two places.\n\n")
			buffer.insert_with_tags (iter, "Font styles. ", <<heading>>)
  
			buffer.insert_at (iter, "For example, you can have ")

			buffer.insert_with_tags_by_name (iter, "italic", <<"italic">>)
			buffer.insert_at (iter, ", ")
			--buffer.insert_with_tags_by_name (iter, "bold", <<"bold">>)
			--   gtk_text_buffer_insert (buffer, &iter, ", or ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "monospace (typewriter)", -1,
			-- 					    "monospace", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, ", or ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "big", -1,
			-- 					    "big", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " text. ", -1);
			--   gtk_text_buffer_insert (buffer, &iter, "It's best not to hardcode specific text sizes; you can use relative sizes as with CSS, such as ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "xx-small", -1,
			-- 					    "xx-small", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " or ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "x-large", -1,
			-- 					    "x-large", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " to ensure that your program properly adapts if the user changes the default font size.\n\n", -1);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Colors. ", -1,
			-- 					    "heading", NULL);
  
			--   gtk_text_buffer_insert (buffer, &iter, "Colors such as ", -1);  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "a blue foreground", -1,
			-- 					    "blue_foreground", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " or ", -1);  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "a red background", -1,
			-- 					    "red_background", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " or even ", -1);  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "a stippled red background", -1,
			-- 					    "red_background",
			-- 					    "background_stipple",
			-- 					    NULL);

			--   gtk_text_buffer_insert (buffer, &iter, " or ", -1);  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "a stippled blue foreground on solid red background", -1,
			-- 					    "blue_foreground",
			-- 					    "red_background",
			-- 					    "foreground_stipple",
			-- 					    NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " (select that to read it) can be used.\n\n", -1);  

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Underline, strikethrough, and rise. ", -1,
			-- 					    "heading", NULL);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "Strikethrough", -1,
			-- 					    "strikethrough", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, ", ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "underline", -1,
			-- 					    "underline", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, ", ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "double underline", -1, 
			-- 					    "double_underline", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, ", ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "superscript", -1,
			-- 					    "superscript", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, ", and ", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "subscript", -1,
			-- 					    "subscript", NULL);
			--   gtk_text_buffer_insert (buffer, &iter, " are all supported.\n\n", -1);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Images. ", -1,
			-- 					    "heading", NULL);
  
			--   gtk_text_buffer_insert (buffer, &iter, "The buffer can have images in it: ", -1);
			--   gtk_text_buffer_insert_pixbuf (buffer, &iter, pixbuf);
			--   gtk_text_buffer_insert_pixbuf (buffer, &iter, pixbuf);
			--   gtk_text_buffer_insert_pixbuf (buffer, &iter, pixbuf);
			--   gtk_text_buffer_insert (buffer, &iter, " for example.\n\n", -1);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Spacing. ", -1,
			-- 					    "heading", NULL);

			--   gtk_text_buffer_insert (buffer, &iter, "You can adjust the amount of space before each line.\n", -1);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "This line has a whole lot of space before it.\n", -1,
			-- 					    "big_gap_before_line", "wide_margins", NULL);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "You can also adjust the amount of space after each line; this line has a whole lot of space after it.\n", -1,
			-- 					    "big_gap_after_line", "wide_margins", NULL);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "You can also adjust the amount of space between wrapped lines; this line has extra space between each wrapped line in the same paragraph. To show off wrapping, some filler text: the quick brown fox jumped over the lazy dog. Blah blah blah blah blah blah blah blah blah.\n", -1,
			-- 					    "double_spaced_line", "wide_margins", NULL);

			--   gtk_text_buffer_insert (buffer, &iter, "Also note that those lines have extra-wide margins.\n\n", -1);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Editability. ", -1,
			-- 					    "heading", NULL);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "This line is 'locked down' and can't be edited by the user - just try it! You can't delete this line.\n\n", -1,
			-- 					    "not_editable", NULL);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Wrapping. ", -1,
			-- 					    "heading", NULL);

			--   gtk_text_buffer_insert (buffer, &iter,
			-- 			  "This line (and most of the others in this buffer) is word-wrapped, using the proper Unicode algorithm. Word wrap should work in all scripts and languages that GTK+ supports. Let's make this a long paragraph to demonstrate: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah\n\n", -1);  
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "This line has character-based wrapping, and can wrap between any two character glyphs. Let's make this a long paragraph to demonstrate: blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah\n\n", -1,
			-- 					    "char_wrap", NULL);
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "This line has all wrapping turned off, so it makes the horizontal scrollbar appear.\n\n\n", -1,
			-- 					    "no_wrap", NULL);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Justification. ", -1,
			-- 					    "heading", NULL);  
  
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "\nThis line has center justification.\n", -1,
			-- 					    "center", NULL);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "This line has right justification.\n", -1,
			-- 					    "right_justify", NULL);

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter,
			-- 					    "\nThis line has big wide margins. Text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text.\n", -1,
			-- 					    "wide_margins", NULL);  

			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "Internationalization. ", -1,
			-- 					    "heading", NULL);
	
			--   gtk_text_buffer_insert (buffer, &iter,
			-- 			  "You can put all sorts of Unicode text in the buffer.\n\nGerman (Deutsch S\303\274d) Gr\303\274\303\237 Gott\nGreek (\316\225\316\273\316\273\316\267\316\275\316\271\316\272\316\254) \316\223\316\265\316\271\316\254 \317\203\316\261\317\202\nHebrew	\327\251\327\234\327\225\327\235\nJapanese (\346\227\245\346\234\254\350\252\236)\n\nThe widget properly handles bidirectional text, word wrapping, DOS/UNIX/Unicode paragraph separators, grapheme boundaries, and so on using the Pango internationalization framework.\n", -1);  

			--   gtk_text_buffer_insert (buffer, &iter, "Here's a word-wrapped quote in a right-to-left language:\n", -1);
			--   gtk_text_buffer_insert_with_tags_by_name (buffer, &iter, "\331\210\331\202\330\257 \330\250\330\257\330\243 \330\253\331\204\330\247\330\253 \331\205\331\206 \330\243\331\203\330\253\330\261 \330\247\331\204\331\205\330\244\330\263\330\263\330\247\330\252 \330\252\331\202\330\257\331\205\330\247 \331\201\331\212 \330\264\330\250\331\203\330\251 \330\247\331\203\330\263\331\212\331\210\331\206 \330\250\330\261\330\247\331\205\330\254\331\207\330\247 \331\203\331\205\331\206\330\270\331\205\330\247\330\252 \331\204\330\247 \330\252\330\263\330\271\331\211 \331\204\331\204\330\261\330\250\330\255\330\214 \330\253\331\205 \330\252\330\255\331\210\331\204\330\252 \331\201\331\212 \330\247\331\204\330\263\331\206\331\210\330\247\330\252 \330\247\331\204\330\256\331\205\330\263 \330\247\331\204\331\205\330\247\330\266\331\212\330\251 \330\245\331\204\331\211 \331\205\330\244\330\263\330\263\330\247\330\252 \331\205\330\247\331\204\331\212\330\251 \331\205\331\206\330\270\331\205\330\251\330\214 \331\210\330\250\330\247\330\252\330\252 \330\254\330\262\330\241\330\247 \331\205\331\206 \330\247\331\204\331\206\330\270\330\247\331\205 \330\247\331\204\331\205\330\247\331\204\331\212 \331\201\331\212 \330\250\331\204\330\257\330\247\331\206\331\207\330\247\330\214 \331\210\331\204\331\203\331\206\331\207\330\247 \330\252\330\252\330\256\330\265\330\265 \331\201\331\212 \330\256\330\257\331\205\330\251 \331\202\330\267\330\247\330\271 \330\247\331\204\331\205\330\264\330\261\331\210\330\271\330\247\330\252 \330\247\331\204\330\265\330\272\331\212\330\261\330\251. \331\210\330\243\330\255\330\257 \330\243\331\203\330\253\330\261 \331\207\330\260\331\207 \330\247\331\204\331\205\330\244\330\263\330\263\330\247\330\252 \331\206\330\254\330\247\330\255\330\247 \331\207\331\210 \302\273\330\250\330\247\331\206\331\203\331\210\330\263\331\210\331\204\302\253 \331\201\331\212 \330\250\331\210\331\204\331\212\331\201\331\212\330\247.\n\n", -1,
			-- 						"rtl_quote", NULL);
		
			--   gtk_text_buffer_insert (buffer, &iter, "You can put widgets in the buffer: Here's a button: ", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter, " and a menu: ", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter, " and a scale: ", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter, " and an animation: ", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter, " finally a text entry: ", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter, ".\n", -1);
  
			--   gtk_text_buffer_insert (buffer, &iter, "\n\nThis demo doesn't demonstrate all the GtkTextBuffer features; it leaves out, for example: invisible/hidden text (doesn't work in GTK 2, but planned), tab stops, application-drawn areas on the sides of the widget for displaying breakpoints and such...", -1);

			--   /* Apply word_wrap tag to whole buffer */
			--   gtk_text_buffer_get_bounds (buffer, &start, &end);
			--   gtk_text_buffer_apply_tag_by_name (buffer, "word_wrap", &start, &end);

			--   g_object_unref (pixbuf);
			-- }

			-- static gboolean
			-- find_anchor (GtkTextIter *iter)
			-- {
			--   while (gtk_text_iter_forward_char (iter))
			--     {
			--       if (gtk_text_iter_get_child_anchor (iter))
			--         return TRUE;
			--     }
			--   return FALSE;
			-- }

			-- static void
			-- attach_widgets (GtkTextView *text_view)
			-- {
			--   GtkTextIter iter;
			--   GtkTextBuffer *buffer;
			--   int i;
  
			--   buffer = gtk_text_view_get_buffer (text_view);

			--   gtk_text_buffer_get_start_iter (buffer, &iter);

			--   i = 0;
			--   while (find_anchor (&iter))
			--     {
			--       GtkTextChildAnchor *anchor;
			--       GtkWidget *widget;
		
			--       anchor = gtk_text_iter_get_child_anchor (&iter);

			--       if (i == 0)
			--         {
			--           widget = gtk_button_new_with_label ("Click Me");

			--           g_signal_connect (widget, "clicked",
			--                             G_CALLBACK (easter_egg_callback),
			--                             NULL);
			--         }
			--       else if (i == 1)
			--         {
			--           widget = gtk_combo_box_new_text ();

			--           gtk_combo_box_append_text (GTK_COMBO_BOX (widget), "Option 1");
			--           gtk_combo_box_append_text (GTK_COMBO_BOX (widget), "Option 2");
			--           gtk_combo_box_append_text (GTK_COMBO_BOX (widget), "Option 3");
			--         }
			--       else if (i == 2)
			--         {
			--           widget = gtk_hscale_new (NULL);
			--           gtk_range_set_range (GTK_RANGE (widget), 0, 100);
			--           gtk_widget_set_size_request (widget, 70, -1);
			--         }
			--       else if (i == 3)
			--         {
			-- 	  gchar *filename = demo_find_file ("floppybuddy.gif", NULL);
			-- 	  widget = gtk_image_new_from_file (filename);
			-- 	  g_free (filename);
			--         }
			--       else if (i == 4)
			--         {
			--           widget = gtk_entry_new ();
			--         }
			--       else
			--         {
			--           widget = NULL; /* avoids a compiler warning */
			--           g_assert_not_reached ();
			--         }

			--       gtk_text_view_add_child_at_anchor (text_view,
			--                                          widget,
			--                                          anchor);

			--       gtk_widget_show_all (widget);

			--       ++i;
			--     }
			-- }

			-- GtkWidget *
			-- do_textview (GtkWidget *do_widget)
			-- {
			--   static GtkWidget *window = NULL;

			--   if (!window)
			--     {
			--       GtkWidget *vpaned;
			--       GtkWidget *view1;
			--       GtkWidget *view2;
			--       GtkWidget *sw;
			--       GtkTextBuffer *buffer;
		
			--       window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
			--       gtk_window_set_screen (GTK_WINDOW (window),
			-- 			     gtk_widget_get_screen (do_widget));
			--       gtk_window_set_default_size (GTK_WINDOW (window),
			-- 				   450, 450);
		
			--       g_signal_connect (window, "destroy",
			-- 			G_CALLBACK (gtk_widget_destroyed), &window);

			--       gtk_window_set_title (GTK_WINDOW (window), "TextView");
			--       gtk_container_set_border_width (GTK_CONTAINER (window), 0);

			--       vpaned = gtk_vpaned_new ();
			--       gtk_container_set_border_width (GTK_CONTAINER(vpaned), 5);
			--       gtk_container_add (GTK_CONTAINER (window), vpaned);

			--       /* For convenience, we just use the autocreated buffer from
			--        * the first text view; you could also create the buffer
			--        * by itself with gtk_text_buffer_new(), then later create
			--        * a view widget.
			--        */
			--       view1 = gtk_text_view_new ();
			--       buffer = gtk_text_view_get_buffer (GTK_TEXT_VIEW (view1));
			--       view2 = gtk_text_view_new_with_buffer (buffer);
		
			--       sw = gtk_scrolled_window_new (NULL, NULL);
			--       gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (sw),
			-- 				      GTK_POLICY_AUTOMATIC,
			-- 				      GTK_POLICY_AUTOMATIC);
			--       gtk_paned_add1 (GTK_PANED (vpaned), sw);

			--       gtk_container_add (GTK_CONTAINER (sw), view1);

			--       sw = gtk_scrolled_window_new (NULL, NULL);
			--       gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (sw),
			-- 				      GTK_POLICY_AUTOMATIC,
			-- 				      GTK_POLICY_AUTOMATIC);
			--       gtk_paned_add2 (GTK_PANED (vpaned), sw);

			--       gtk_container_add (GTK_CONTAINER (sw), view2);

			--       create_tags (buffer);
			--       insert_text (buffer);

			--       attach_widgets (GTK_TEXT_VIEW (view1));
			--       attach_widgets (GTK_TEXT_VIEW (view2));
		
			--       gtk_widget_show_all (vpaned);
			--     }

			--   if (!GTK_WIDGET_VISIBLE (window))
			--     {
			--       gtk_widget_show (window);
			--     }
			--   else
			--     {
			--       gtk_widget_destroy (window);
			--       window = NULL;
			--     }

			--   return window;
			-- }

			-- static void
			-- recursive_attach_view (int                 depth,
			--                        GtkTextView        *view,
			--                        GtkTextChildAnchor *anchor)
			-- {
			--   GtkWidget *child_view;
			--   GtkWidget *event_box;
			--   GdkColor color;
			--   GtkWidget *align;
  
			--   if (depth > 4)
			--     return;
  
			--   child_view = gtk_text_view_new_with_buffer (gtk_text_view_get_buffer (view));

			--   /* Event box is to add a black border around each child view */
			--   event_box = gtk_event_box_new ();
			--   gdk_color_parse ("black", &color);
			--   gtk_widget_modify_bg (event_box, GTK_STATE_NORMAL, &color);

			--   align = gtk_alignment_new (0.5, 0.5, 1.0, 1.0);
			--   gtk_container_set_border_width (GTK_CONTAINER (align), 1);
  
			--   gtk_container_add (GTK_CONTAINER (event_box), align);
			--   gtk_container_add (GTK_CONTAINER (align), child_view);
  
			--   gtk_text_view_add_child_at_anchor (view, event_box, anchor);

			--   recursive_attach_view (depth + 1, GTK_TEXT_VIEW (child_view), anchor);
			-- }

			-- static void
			-- easter_egg_callback (GtkWidget *button,
			--                      gpointer   data)
			-- {
			--   static GtkWidget *window = NULL;
			--   GtkTextBuffer *buffer;
			--   GtkWidget     *view;
			--   GtkTextIter    iter;
			--   GtkTextChildAnchor *anchor;
			--   GtkWidget *sw;

			--   if (window)
			--     {
			--       gtk_window_present (GTK_WINDOW (window));
			--       return;
			--     }
  
			--   buffer = gtk_text_buffer_new (NULL);

			--   gtk_text_buffer_get_start_iter (buffer, &iter);

			--   gtk_text_buffer_insert (buffer, &iter,
			--                           "This buffer is shared by a set of nested text views.\n Nested view:\n", -1);
			--   anchor = gtk_text_buffer_create_child_anchor (buffer, &iter);
			--   gtk_text_buffer_insert (buffer, &iter,
			--                           "\nDon't do this in real applications, please.\n", -1);

			--   view = gtk_text_view_new_with_buffer (buffer);
  
			--   recursive_attach_view (0, GTK_TEXT_VIEW (view), anchor);
  
			--   g_object_unref (buffer);

			--   window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
			--   sw = gtk_scrolled_window_new (NULL, NULL);
			--   gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (sw),
			--                                   GTK_POLICY_AUTOMATIC,
			--                                   GTK_POLICY_AUTOMATIC);

			--   gtk_container_add (GTK_CONTAINER (window), sw);
			--   gtk_container_add (GTK_CONTAINER (sw), view);

			--   g_object_add_weak_pointer (G_OBJECT (window),
			--                              (gpointer *) &window);

			--   gtk_window_set_default_size (GTK_WINDOW (window), 300, 400);
  
			--   gtk_widget_show_all (window);
			-- }
		end
end
