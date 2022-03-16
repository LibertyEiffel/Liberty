note
	description: "GtkTextAttributes."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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
class GTK_TEXT_ATTRIBUTES
	
inherit G_STRUCT

create {ANY} from_external_pointer

	-- TODO: wrap this structure for real

feature {} -- Creation

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextAttributes)"
		end

feature {ANY} -- Access

	font: PANGO_FONT_DESCRIPTION
		do
			create Result.from_external_pointer (gtk_text_attributes_get_font (handle))
		end

	--   gtk_text_attributes_new ()

	--  GtkTextAttributes* gtk_text_attributes_new  (void);

	--    Creates a GtkTextAttributes, which describes a set of properties on some text.

	--    Returns : a new GtkTextAttributes

	--    -------------------------------------------------------------------------------------

	--   gtk_text_attributes_copy ()

	--  GtkTextAttributes* gtk_text_attributes_copy (GtkTextAttributes *src);

	--    Copies src and returns a new GtkTextAttributes.

	--    src :     a GtkTextAttributes to be copied
	--    Returns : a copy of src

	--    -------------------------------------------------------------------------------------

	--   gtk_text_attributes_copy_values ()

	--  void        gtk_text_attributes_copy_values (GtkTextAttributes *src,
	--                                               GtkTextAttributes *dest);

	--    Copies the values from src to dest so that dest has the same values as src. Frees
	--    existing values in dest.

	--    src :  a GtkTextAttributes
	--    dest : another GtkTextAttributes

	--    -------------------------------------------------------------------------------------

	--   gtk_text_attributes_unref ()

	--  void        gtk_text_attributes_unref       (GtkTextAttributes *values);

	--    Decrements the reference count on values, freeing the structure if the reference
	--    count reaches 0.

	--    values : a GtkTextAttributes

	--    -------------------------------------------------------------------------------------

	--   gtk_text_attributes_ref ()

	--  GtkTextAttributes* gtk_text_attributes_ref  (GtkTextAttributes *values);

	--    Increments the reference count on values.

	--    values :  a GtkTextAttributes
	--    Returns : the GtkTextAttributes that were passed in

feature {} -- External calls
	gtk_text_attributes_new: POINTER is -- GtkTextAttributes* 
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_attributes_copy (a_src_gtktextattributes: POINTER): POINTER is -- GtkTextAttributes*
		external "C use <gtk/gtk.h>"
		end

	gtk_text_attributes_copy_values (src_gtktextattributes, dest_gtktextattributes: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_text_attributes_unref (gtktextattributes_values: POINTER) is -- void
		external "C use <gtk/gtk.h>"
		end

	gtk_text_attributes_ref (gtktextattributes_values: POINTER) is -- GtkTextAttributes*
		external "C use <gtk/gtk.h>"
		end

	
feature {} -- Structure accessing
	--   GtkTextAttributes
	
	--  typedef struct {
	--    GtkTextAppearance appearance;
	
	--    GtkJustification justification;
	--    GtkTextDirection direction;

	--    /* Individual chunks of this can be set/unset as a group */

	gtk_text_attributes_get_font (a_text_attr: POINTER): POINTER
		external "C struct GtkTextAttributes get font use <gtk/gtk.h>"
		end

	--    gdouble font_scale;

	--    gint left_margin;

	--    gint indent;

	--    gint right_margin;

	--    gint pixels_above_lines;

	--    gint pixels_below_lines;

	--    gint pixels_inside_wrap;

	--    PangoTabArray *tabs;

	--    GtkWrapMode wrap_mode;        /* How to handle wrap-around for this tag.
	--                                   * Must be GTK_WRAPMODE_CHAR,
	--                                   * GTK_WRAPMODE_NONE, GTK_WRAPMODE_WORD
	--                                   */
	
	--    PangoLanguage *language;

	--    /* hide the text  */
	--    guint invisible : 1;
	
	--    /* Background is fit to full line height rather than
	--     * baseline +/- ascent/descent (font height)
	--     */
	--    guint bg_full_height : 1;

	--    /* can edit this text */
	--    guint editable : 1;

	--    /* colors are allocated etc. */
	--    guint realized : 1;
	--  } GtkTextAttributes;

	--    Using GtkTextAttributes directly should rarely be necessary. It's primarily useful
	--    with gtk_text_iter_get_attributes(). As with most GTK+ structs, the fields in this
	--    struct should only be read, never modified directly.

	--    GtkTextAppearance appearance;   pointer to sub-struct containing certain attributes
	--    GtkJustification justification;
	--    GtkTextDirection direction;
	--    PangoFontDescription *font;
	--    gdouble font_scale;
	--    gint left_margin;
	--    gint indent;
	--    gint right_margin;
	--    gint pixels_above_lines;
	--    gint pixels_below_lines;
	--    gint pixels_inside_wrap;
	--    PangoTabArray *tabs;
	--    GtkWrapMode wrap_mode;
	--    PangoLanguage *language;
	--    guint invisible : 1;
	--    guint bg_full_height : 1;
	--    guint editable : 1;
	--    guint realized : 1;

end
