note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder
					
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

class GTK_SOURCE_STYLE_SCHEME

inherit
	(SHARED_?)C_STRUCT

insert
	GTK_SOURCE_STYLE_SCHEME_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceStyle (previous)
	--   Link: GtkSourceStyleSchemeManager (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev  Up  Home            GtkSourceView 2 Reference Manual           Next
	--   Top  |  Description  |  Object Hierarchy  |  Properties
	--
	--   GtkSourceStyleScheme
	--
	--   GtkSourceStyleScheme -- Object controlling apperance of GtkSourceView
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourcestylescheme.h>
	--
	--
	--                     GtkSourceStyleScheme;
	-- const gchar*        gtk_source_style_scheme_get_id      (GtkSourceStyleScheme *scheme);
	-- const gchar*        gtk_source_style_scheme_get_name    (GtkSourceStyleScheme *scheme);
	-- const gchar*        gtk_source_style_scheme_get_description
	--                                                         (GtkSourceStyleScheme *scheme);
	-- const gchar*        gtk_source_style_scheme_get_authors (GtkSourceStyleScheme *scheme);
	-- const gchar*        gtk_source_style_scheme_get_filename
	--                                                         (GtkSourceStyleScheme *scheme);
	-- GtkSourceStyle*     gtk_source_style_scheme_get_style   (GtkSourceStyleScheme *scheme,
	--                                                          const gchar *style_id);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkSourceStyleScheme
	--
	--Properties
	--
	--
	--   "description"              gchararray            : Read
	--   "filename"                 gchararray            : Read
	--   "id"                       gchararray            : Read / Write / Construct Only
	--   "name"                     gchararray            : Read
	--
	--Description
	--
	--   GtkSourceStyleScheme contains all the text styles to be used in
	--   GtkSourceView and GtkSourceBuffer. For instance, it contains text styles
	--   for syntax highlighting, it may contain foreground and background color
	--   for non-highlighted text, etc.
	--
	--   Style schemes are stored in XML files. The format of scheme file is the
	--   following.
	--
	--   The toplevel tag in a style scheme file is <style-scheme>. It has the
	--   following attributes:
	--
	--   id (mandatory)           Identifier for the style scheme. This is must be
	--                            unique among style schemes.
	--   name (mandatory)         Name of the style scheme. This is the name of the
	--                            scheme to display to user, e.g. in a preferences
	--                            dialog.
	--   _name                    This is the same as name attribute, except it
	--                            will be translated. name and _name may not be
	--                            used simultaneously.
	--   parent-scheme (optional) Style schemes may have <em>parent</em> schemes:
	--                            all styles but those specified in the scheme will
	--                            be taken from the parent scheme. In this way a
	--                            scheme may be customized without copying all its
	--                            content.
	--   version (mandatory)      Style scheme format identifier. At the moment it
	--                            must be "1.0".
	--
	--   style-scheme tag may contain the following tags:
	--
	--   author       Name of the style scheme author.
	--   description  Description of the style scheme.
	--   _description Same as description except it will be localized.
	--   color tags   These define color names to be used in style tags. It has two
	--                attributes: name and value. value is the hexadecimal color
	--                specification like "#000000" or named color understood by Gdk
	--                prefixed with "#", e.g. "#beige".
	--   style tags   See below for their format description.
	--
	--   Each style tag describes a single element of style scheme (it corresponds
	--   to GtkSourceStyle object). It has the following attributes:
	--
	--   name (mandatory) Name of the style. It can be anything, syntax
	--                    highlighting uses <em>lang-id:style-id</em>, and there
	--                    are few special styles which are used to control general
	--                    appearance of the text. Style scheme may contain other
	--                    names to be used in an application. For instance, it may
	--                    define color to highlight compilation errors in a build
	--                    log or a color for bookmarks.
	--   foreground       Foreground color. It may be name defined in one of color
	--                    tags, or value in hexadecimal format, e.g. "#000000", or
	--                    symbolic name understood by Gdk, prefixed with "#", e.g.
	--                    "#magenta" or "#darkred".
	--   background       Background color.
	--   italic           "true" or "false"
	--   bold             "true" or "false"
	--   underline        "true" or "false"
	--   strikethrough    "true" or "false"
	--
	--   The following are names of styles which control GtkSourceView appearance:
	--
	--   text                Default style of text.
	--   selection           Style of selected text.
	--   selection-unfocused Style of selected text when the widget doesn't have
	--                       input focus.
	--   cursor              Text cursor style. Only foreground attribute is used
	--                       for this style
	--   secondary-cursor    Secondary cursor style (used in bidi text). Only
	--                       foreground attribute is used for this style. If this
	--                       is not set while "cursor" is, then a color between
	--                       text background and cursor colors is chosen, so it is
	--                       enough to use "cursor" style only.
	--   current-line        Current line style. Only background attribute is used
	--   line-numbers        Text and background colors for the left margin, on
	--                       which line numbers are drawn
	--   bracket-match       Style to use for matching brackets.
	--   bracket-mismatch    Style to use for mismatching brackets.
	--
	--Details
	--
	--  GtkSourceStyleScheme
	--
	-- typedef struct _GtkSourceStyleScheme GtkSourceStyleScheme;
	--
	--   GtkSourceStyleScheme structure contains only private members and should
	--   not be accessed directly.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_id ()
	--
	-- const gchar*        gtk_source_style_scheme_get_id      (GtkSourceStyleScheme *scheme);
	--
	--   scheme :  a GtkSourceStyleScheme.
	--   Returns : scheme id.
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_name ()
	--
	-- const gchar*        gtk_source_style_scheme_get_name    (GtkSourceStyleScheme *scheme);
	--
	--   scheme :  a GtkSourceStyleScheme.
	--   Returns : scheme name.
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_description ()
	--
	-- const gchar*        gtk_source_style_scheme_get_description
	--                                                         (GtkSourceStyleScheme *scheme);
	--
	--   scheme :  a GtkSourceStyleScheme.
	--   Returns : scheme description (if defined) or NULL.
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_authors ()
	--
	-- const gchar*        gtk_source_style_scheme_get_authors (GtkSourceStyleScheme *scheme);
	--
	--   scheme :  a GtkSourceStyleScheme.
	--   Returns : a NULL-terminated array containing the scheme authors or NULL if
	--             no author is specified by the style scheme.
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_filename ()
	--
	-- const gchar*        gtk_source_style_scheme_get_filename
	--                                                         (GtkSourceStyleScheme *scheme);
	--
	--   scheme :  a GtkSourceStyleScheme.
	--   Returns : scheme file name if the scheme was created parsing a style
	--             scheme file or NULL in the other cases.
	--
	--   Since 2.0
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_style_scheme_get_style ()
	--
	-- GtkSourceStyle*     gtk_source_style_scheme_get_style   (GtkSourceStyleScheme *scheme,
	--                                                          const gchar *style_id);
	--
	--   scheme :   a GtkSourceStyleScheme.
	--   style_id : id of the style to retrieve.
	--   Returns :  style which corresponds to style_id in the scheme, or NULL when
	--              no style with this name found. It is owned by scheme and may
	--              not be unref'ed.
	--
	--   Since 2.0
	--
	--Property Details
	--
	--  The "description" property
	--
	--   "description"              gchararray            : Read
	--
	--   Style scheme description.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "filename" property
	--
	--   "filename"                 gchararray            : Read
	--
	--   Style scheme filename or NULL.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "id" property
	--
	--   "id"                       gchararray            : Read / Write / Construct Only
	--
	--   Style scheme id, a unique string used to identify the style scheme in
	--   GtkSourceStyleSchemeManager.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name" property
	--
	--   "name"                     gchararray            : Read
	--
	--   Style scheme name, a translatable string to present to user.
	--
	--   Default value: NULL
	--
	--See Also
	--
	--   GtkSourceStyle, GtkSourceStyleManager

end -- class GTK_SOURCE_STYLE_SCHEME
