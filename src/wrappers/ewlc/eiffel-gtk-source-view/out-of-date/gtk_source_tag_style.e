note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GtkSourceView developers
					
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

	wrapped_version: "1.8.5"

class GTK_SOURCE_TAG_STYLE

inherit SHARED_C_STRUCT redefine copy, free end

create {ANY} dummy, from_external_pointer

feature {} -- Creation
	--
	--  GTK_TYPE_SOURCE_TAG_STYLE
	--
	-- #define             GTK_TYPE_SOURCE_TAG_STYLE
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_tag_style_get_type ()
	--
	-- GType               gtk_source_tag_style_get_type       (void);
	--
	--   Retrieves the GType object which is associated with the GtkSourceTagStyle
	--   class.
	--
	--   Returns : the GType associated with GtkSourceTagStyle.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_tag_style_new ()
	--
	-- GtkSourceTagStyle*  gtk_source_tag_style_new            (void);
	--
	--   Creates a new tag style object.
	--
	--   Returns : a new GtkSourceTagStyle.

feature {ANY}
	copy (another: like Current)
			-- Makes a copy of the given style.
		do
			from_external_pointer(gtk_source_tag_style_copy(handle))
		end

feature {} -- External calls
	-- #include <gtksourceview/gtksourcetagstyle.h>
	--                     ;
	-- enum                GtkSourceTagStyleMask;
	-- #define             GTK_TYPE_SOURCE_TAG_STYLE
	gtk_source_tag_style_get_type: INTEGER
		external "C use <gtksourceview/gtksourcetagstyle.h>"
		end

	gtk_source_tag_style_new: POINTER
			-- GtkSourceTagStyle* gtk_source_tag_style_new (void);
		external "C use <gtksourceview/gtksourcetagstyle.h>"
		end
	
	gtk_source_tag_style_copy (a_style: POINTER): POINTER
			-- GtkSourceTagStyle* gtk_source_tag_style_copy (const
			-- GtkSourceTagStyle *style);
		external "C use <gtksourceview/gtksourcetagstyle.h>"
		end

	free (a_style: POINTER)
			-- void gtk_source_tag_style_free (GtkSourceTagStyle *style);
		external "C use <gtksourceview/gtksourcetagstyle.h>"
		alias "gtk_source_tag_style_free"
		end

feature {} -- GtkSourceTagStyle Structure getter/setter calls
	-- get_$field (a_struct: POINTER): $type is
	-- external "C struct $struct get $field use <$include>"
	-- end

	-- set_$field (a_struct: POINTER; a_$field: $type) is
	-- external "C struct $struct set $field use <$include>"
	-- end

	-- typedef struct {
	--         /* readonly */
	--         gboolean is_default;
	--
	--         guint mask;
	--
	--         GdkColor foreground;
	--         GdkColor background;
	--
	--         gboolean italic;
	--         gboolean bold;
	--         gboolean underline;
	--         gboolean strikethrough;
	--
	--         /* Reserved for future expansion */
	--         guint8 reserved[16];
	-- } GtkSourceTagStyle;


feature {} --  enum GtkSourceTagStyleMask
	-- typedef enum {
	--         GTK_SOURCE_TAG_STYLE_USE_BACKGROUND = 1 < < 0,     /*< nick=use_background >*/
	--         GTK_SOURCE_TAG_STYLE_USE_FOREGROUND = 1 < < 1      /*< nick=use_foreground >*/
	-- } GtkSourceTagStyleMask;

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtksourceview/gtksourcetagstyle.h>"
		alias "sizeof(GtkSourceTagStyle)"
		end
end -- class GTK_SOURCE_TAG_STYLE
