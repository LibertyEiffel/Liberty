note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "2.0.1"

class GTK_SOURCE_STYLE

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_STYLE_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceLanguageManager (previous)
	--   Link: GtkSourceStyleScheme (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev  Up  Home            GtkSourceView 2 Reference Manual           Next
	--   Top  |  Description  |  Object Hierarchy  |  Properties
	--
	--   GtkSourceStyle
	--
	--   GtkSourceStyle
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourcestyle.h>
	--
	--
	--                     GtkSourceStyle;
	-- GtkSourceStyle*     gtk_source_style_copy               (const GtkSourceStyle *style);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkSourceStyle
	--
	--Properties
	--
	--
	--   "background"               gchararray            : Read / Write / Construct Only
	--   "background-set"           gboolean              : Read / Write / Construct Only
	--   "bold"                     gboolean              : Read / Write / Construct Only
	--   "bold-set"                 gboolean              : Read / Write / Construct Only
	--   "foreground"               gchararray            : Read / Write / Construct Only
	--   "foreground-set"           gboolean              : Read / Write / Construct Only
	--   "italic"                   gboolean              : Read / Write / Construct Only
	--   "italic-set"               gboolean              : Read / Write / Construct Only
	--   "line-background"          gchararray            : Read / Write / Construct Only
	--   "line-background-set"      gboolean              : Read / Write / Construct Only
	--   "strikethrough"            gboolean              : Read / Write / Construct Only
	--   "strikethrough-set"        gboolean              : Read / Write / Construct Only
	--   "underline"                gboolean              : Read / Write / Construct Only
	--   "underline-set"            gboolean              : Read / Write / Construct Only
	--
	--Description
	--
	--Details
	--
	--  GtkSourceStyle
	--
	-- typedef struct _GtkSourceStyle GtkSourceStyle;
	--
	--   The GtkSourceStyle structure is used to describe text attributes which are
	--   set when given style is used.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_copy ()
	--
	-- GtkSourceStyle*     gtk_source_style_copy               (const GtkSourceStyle *style);
	--
	--   Creates a copy of style, that is a new GtkSourceStyle instance which has
	--   the same attributes set.
	--
	--   style :   a GtkSourceStyle structure to copy.
	--   Returns : copy of style, call g_object_unref() when you are done with it.
	--
	--   Since 2.0
	--
	--Property Details
	--
	--  The "background" property
	--
	--   "background"               gchararray            : Read / Write / Construct Only
	--
	--   Background color.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "background-set" property
	--
	--   "background-set"           gboolean              : Read / Write / Construct Only
	--
	--   Whether background color is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "bold" property
	--
	--   "bold"                     gboolean              : Read / Write / Construct Only
	--
	--   Bold.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "bold-set" property
	--
	--   "bold-set"                 gboolean              : Read / Write / Construct Only
	--
	--   Whether bold attribute is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "foreground" property
	--
	--   "foreground"               gchararray            : Read / Write / Construct Only
	--
	--   Foreground color.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "foreground-set" property
	--
	--   "foreground-set"           gboolean              : Read / Write / Construct Only
	--
	--   Whether foreground color is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "italic" property
	--
	--   "italic"                   gboolean              : Read / Write / Construct Only
	--
	--   Italic.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "italic-set" property
	--
	--   "italic-set"               gboolean              : Read / Write / Construct Only
	--
	--   Whether italic attribute is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "line-background" property
	--
	--   "line-background"          gchararray            : Read / Write / Construct Only
	--
	--   Line background color.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "line-background-set" property
	--
	--   "line-background-set"      gboolean              : Read / Write / Construct Only
	--
	--   Whether line background color is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "strikethrough" property
	--
	--   "strikethrough"            gboolean              : Read / Write / Construct Only
	--
	--   Strikethrough.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "strikethrough-set" property
	--
	--   "strikethrough-set"        gboolean              : Read / Write / Construct Only
	--
	--   Whether strikethrough attribute is set.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "underline" property
	--
	--   "underline"                gboolean              : Read / Write / Construct Only
	--
	--   Underline.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "underline-set" property
	--
	--   "underline-set"            gboolean              : Read / Write / Construct Only
	--
	--   Whether underline attribute is set.
	--
	--   Default value: FALSE

end -- class GTK_SOURCE_STYLE
