note
	description: "GtkTextTag: A tag that can be applied to text in a GtkTextBuffer."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

class GTK_TEXT_TAG
	-- A tag that can be applied to text in a GTK_TEXT_BUFFER.

	-- You may wish to begin by reading the text widget conceptual
	-- overview which gives an overview of all the objects and data
	-- types related to the text widget and how they work together.

	-- Tags should be in the GtkTextTagTable for a given GtkTextBuffer
	-- before using them with that buffer.

	-- GTK_TEXT_BUFFER's `create_tag' is the best way to create
	-- tags. (TODO: translate gtk-demo from C to Eiffel for numerous
	-- examples).

	-- The "invisible" property was not implemented for GTK+ 2.0; it's
	-- planned to be implemented in future releases.

inherit G_OBJECT

insert
	PANGO_WEIGHT
	PANGO_STYLE
	PANGO_UNDERLINE
	GTK

create {ANY} make, with_name, from_external_pointer

feature {} -- Creation
	make
			-- Create a nameless GtkTextTag
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_text_tag_new (default_pointer))
		end

	with_name (a_name: STRING)
			-- Creates a GtkTextTag. Configure the tag using object
			-- arguments, i.e. using G_OBJECT.set().
		require
			gtk_initialized: gtk.is_initialized
			name_not_void: a_name /= Void
		do
			from_external_pointer(gtk_text_tag_new (a_name.to_external))
		ensure
			name.is_equal (a_name)
		end

feature {ANY}
	priority: INTEGER
			-- the tag priority.
		do
			Result := gtk_text_tag_get_priority (handle)
		end

	set_priority (a_priority: INTEGER)
			-- Sets the priority of a GtkTextTag. Valid priorities are
			-- start at 0 and go to one less than
			-- gtk_text_tag_table_get_size(). Each tag in a table has a
			-- unique priority; setting the priority of one tag shifts
			-- the priorities of all the other tags in the table to
			-- maintain a unique priority for each tag. Higher priority
			-- tags "win" if two tags both set the same text
			-- attribute. When adding a tag to a tag table, it will be
			-- assigned the highest priority in the table by default; so
			-- normally the precedence of a set of tags is the order in
			-- which they were added to the table, or created with
			-- gtk_text_buffer_create_tag(), which adds the tag to the
			-- buffer's table automatically.
		do
			gtk_text_tag_set_priority (handle, a_priority)
		end


	-- TODO: wrap gtk_text_tag_event ()

	--  gboolean gtk_text_tag_event (GtkTextTag *tag, GObject
	--  *event_object, GdkEvent *event, const GtkTextIter *iter);

	--    Emits the "event" signal on the GtkTextTag.
	
	--    tag :          a GtkTextTag
	--    event_object : object that received the event, such as a widget
	--    event :        the event
	--    iter :         location where the event was received
	--    Returns :      result of signal emission (whether the event was handled)
	
feature {ANY} -- TODO: Properties. Meanwhile you can use G_OBJECT.get_property/set_property
	
	--    "background"           gchararray            : Write
	
--    "background-full-height" gboolean              : Read / Write
--    "background-full-height-set" gboolean              : Read / Write
--    "background-gdk"       GdkColor              : Read / Write
--    "background-set"       gboolean              : Read / Write
--    "background-stipple"   GdkPixmap             : Read / Write
--    "background-stipple-set" gboolean              : Read / Write
--    "direction"            GtkTextDirection      : Read / Write
--    "editable"             gboolean              : Read / Write
--    "editable-set"         gboolean              : Read / Write
--    "family"               gchararray            : Read / Write
--    "family-set"           gboolean              : Read / Write
--    "font"                 gchararray            : Read / Write
--    "font-desc"            PangoFontDescription  : Read / Write
--    "foreground"           gchararray            : Write
--    "foreground-gdk"       GdkColor              : Read / Write
--    "foreground-set"       gboolean              : Read / Write
--    "foreground-stipple"   GdkPixmap             : Read / Write
--    "foreground-stipple-set" gboolean              : Read / Write
--    "indent"               gint                  : Read / Write
--    "indent-set"           gboolean              : Read / Write
--    "invisible"            gboolean              : Read / Write
--    "invisible-set"        gboolean              : Read / Write
--    "justification"        GtkJustification      : Read / Write
--    "justification-set"    gboolean              : Read / Write
--    "language"             gchararray            : Read / Write
--    "language-set"         gboolean              : Read / Write
--    "left-margin"          gint                  : Read / Write
--    "left-margin-set"      gboolean              : Read / Write
--    "name"                 gchararray            : Read / Write / Construct Only
--    "paragraph-background" gchararray            : Write
--    "paragraph-background-gdk" GdkColor              : Read / Write
--    "paragraph-background-set" gboolean              : Read / Write
--    "pixels-above-lines"   gint                  : Read / Write
--    "pixels-above-lines-set" gboolean              : Read / Write
--    "pixels-below-lines"   gint                  : Read / Write
--    "pixels-below-lines-set" gboolean              : Read / Write
--    "pixels-inside-wrap"   gint                  : Read / Write
--    "pixels-inside-wrap-set" gboolean              : Read / Write
--    "right-margin"         gint                  : Read / Write
--    "right-margin-set"     gboolean              : Read / Write
--    "rise"                 gint                  : Read / Write
--    "rise-set"             gboolean              : Read / Write
--    "scale"                gdouble               : Read / Write
--    "scale-set"            gboolean              : Read / Write
--    "size"                 gint                  : Read / Write
--    "size-points"          gdouble               : Read / Write
--    "size-set"             gboolean              : Read / Write
--    "stretch"              PangoStretch          : Read / Write
--    "stretch-set"          gboolean              : Read / Write
--    "strikethrough"        gboolean              : Read / Write
--    "strikethrough-set"    gboolean              : Read / Write
--    "style"                PangoStyle            : Read / Write
--    "style-set"            gboolean              : Read / Write
--    "tabs"                 PangoTabArray         : Read / Write
--    "tabs-set"             gboolean              : Read / Write
--    "underline"            PangoUnderline        : Read / Write
--    "underline-set"        gboolean              : Read / Write
--    "variant"              PangoVariant          : Read / Write
--    "variant-set"          gboolean              : Read / Write
--    "weight"               gint                  : Read / Write
--    "weight-set"           gboolean              : Read / Write
--    "wrap-mode"            GtkWrapMode           : Read / Write
--    "wrap-mode-set"        gboolean              : Read / Write

-- Property Details

--   The "background" property

--    "background"           gchararray            : Write

--    Background color as a string.

--    Default value: NULL

--    -------------------------------------------------------------------------------------

--   The "background-full-height" property

--    "background-full-height" gboolean              : Read / Write

--    Whether the background color fills the entire line height or only the height of the
--    tagged characters.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "background-full-height-set" property

--    "background-full-height-set" gboolean              : Read / Write

--    Whether this tag affects background height.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "background-gdk" property

--    "background-gdk"       GdkColor              : Read / Write

--    Background color as a (possibly unallocated) GdkColor.

--    -------------------------------------------------------------------------------------

--   The "background-set" property

--    "background-set"       gboolean              : Read / Write

--    Whether this tag affects the background color.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "background-stipple" property

--    "background-stipple"   GdkPixmap             : Read / Write

--    Bitmap to use as a mask when drawing the text background.

--    -------------------------------------------------------------------------------------

--   The "background-stipple-set" property

--    "background-stipple-set" gboolean              : Read / Write

--    Whether this tag affects the background stipple.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "direction" property

--    "direction"            GtkTextDirection      : Read / Write

--    Text direction, e.g. right-to-left or left-to-right.

--    Default value: GTK_TEXT_DIR_NONE

--    -------------------------------------------------------------------------------------

--   The "editable" property

--    "editable"             gboolean              : Read / Write

--    Whether the text can be modified by the user.

--    Default value: TRUE

--    -------------------------------------------------------------------------------------

--   The "editable-set" property

--    "editable-set"         gboolean              : Read / Write

--    Whether this tag affects text editability.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "family" property

--    "family"               gchararray            : Read / Write

--    Name of the font family, e.g. Sans, Helvetica, Times, Monospace.

--    Default value: NULL

--    -------------------------------------------------------------------------------------

--   The "family-set" property

--    "family-set"           gboolean              : Read / Write

--    Whether this tag affects the font family.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} --   The "font" property

	set_font (a_font: STRING)
		require
			a_font /= Void
		do
			set_string_property (font_property_name, a_font)
		end

	font: STRING
			-- Font description as string, e.g. "Sans Italic 12".
			-- Note that the initial value of this property depends on the
			-- internals of PangoFontDescription.
			-- Default value: Void
		local
			font_ptr: POINTER
		do
			g_object_get_one_property (handle, font_property_name.to_external, $font_ptr, default_pointer)
			if font_ptr.is_not_null then
				create Result.from_external (font_ptr)
			end
		end

--    -------------------------------------------------------------------------------------

--   The "font-desc" property

--    "font-desc"            PangoFontDescription  : Read / Write

--    Font description as a PangoFontDescription struct.

--    -------------------------------------------------------------------------------------

feature {ANY} --   The "foreground" property          gchararray : Write

	set_foreground (a_foreground: STRING)
			-- Foreground color as a string.
			-- Default value: NULL
		require
			a_foreground /= Void
		do
			set_string_property (foreground_property_name, a_foreground)
		end

--    -------------------------------------------------------------------------------------

--   The "foreground-gdk" property

--    "foreground-gdk"       GdkColor              : Read / Write

--    Foreground color as a (possibly unallocated) GdkColor.

--    -------------------------------------------------------------------------------------

--   The "foreground-set" property

--    "foreground-set"       gboolean              : Read / Write

--    Whether this tag affects the foreground color.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "foreground-stipple" property

--    "foreground-stipple"   GdkPixmap             : Read / Write

--    Bitmap to use as a mask when drawing the text foreground.

--    -------------------------------------------------------------------------------------

--   The "foreground-stipple-set" property

--    "foreground-stipple-set" gboolean              : Read / Write

--    Whether this tag affects the foreground stipple.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "indent" property

--    "indent"               gint                  : Read / Write

--    Amount to indent the paragraph, in pixels.

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "indent-set" property

--    "indent-set"           gboolean              : Read / Write

--    Whether this tag affects indentation.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "invisible" property

--    "invisible"            gboolean              : Read / Write

--    Whether this text is hidden.

--    Note that there may still be problems with the support for invisible text, in
--    particular when navigating programmatically inside a buffer containing invisible
--    segments.

--    Default value: FALSE

--    Since 2.8

--    -------------------------------------------------------------------------------------

--   The "invisible-set" property

--    "invisible-set"        gboolean              : Read / Write

--    Whether this tag affects text visibility.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "justification" property

--    "justification"        GtkJustification      : Read / Write

--    Left, right, or center justification.

--    Default value: GTK_JUSTIFY_LEFT

--    -------------------------------------------------------------------------------------

--   The "justification-set" property

--    "justification-set"    gboolean              : Read / Write

--    Whether this tag affects paragraph justification.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "language" property

--    "language"             gchararray            : Read / Write

--    The language this text is in, as an ISO code. Pango can use this as a hint when
--    rendering the text. If not set, an appropriate default will be used.

--    Note that the initial value of this property depends on the current locale, see also
--    gtk_get_default_language().

--    Default value: NULL

--    -------------------------------------------------------------------------------------

--   The "language-set" property

--    "language-set"         gboolean              : Read / Write

--    Whether this tag affects the language the text is rendered as.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "left-margin" property

--    "left-margin"          gint                  : Read / Write

--    Width of the left margin in pixels.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "left-margin-set" property

--    "left-margin-set"      gboolean              : Read / Write

--    Whether this tag affects the left margin.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} -- The "name" property

	name: STRING
			-- Name used to refer to the text tag. Void for anonymous tags.
			-- Default value: Void
		local
			name_ptr: POINTER
		do
			g_object_get_one_property (handle, name_property_name.to_external, $name_ptr, default_pointer)
			if name_ptr.is_not_null then
				create Result.from_external (name_ptr)
			end
		end

--    -------------------------------------------------------------------------------------

--   The "paragraph-background" property

--    "paragraph-background" gchararray            : Write

--    The paragraph background color as a string.

--    Default value: NULL

--    Since 2.8

--    -------------------------------------------------------------------------------------

--   The "paragraph-background-gdk" property

--    "paragraph-background-gdk" GdkColor              : Read / Write

--    The paragraph background color as a as a (possibly unallocated) GdkColor.

--    Since 2.8

--    -------------------------------------------------------------------------------------

--   The "paragraph-background-set" property

--    "paragraph-background-set" gboolean              : Read / Write

--    Whether this tag affects the paragraph background color.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "pixels-above-lines" property

--    "pixels-above-lines"   gint                  : Read / Write

--    Pixels of blank space above paragraphs.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "pixels-above-lines-set" property

--    "pixels-above-lines-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels above lines.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "pixels-below-lines" property

--    "pixels-below-lines"   gint                  : Read / Write

--    Pixels of blank space below paragraphs.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "pixels-below-lines-set" property

--    "pixels-below-lines-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels above lines.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "pixels-inside-wrap" property

--    "pixels-inside-wrap"   gint                  : Read / Write

--    Pixels of blank space between wrapped lines in a paragraph.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "pixels-inside-wrap-set" property

--    "pixels-inside-wrap-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels between wrapped lines.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "right-margin" property

--    "right-margin"         gint                  : Read / Write

--    Width of the right margin in pixels.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "right-margin-set" property

--    "right-margin-set"     gboolean              : Read / Write

--    Whether this tag affects the right margin.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} -- The "rise" property
	--    "rise"                 gint                  : Read / Write

	rise: INTEGER
			-- Offset of text above the baseline (below the baseline
			-- if rise is negative) in Pango units. Default value: 0
		do
			Result := integer_property (rise_property_name)
		end

	set_rise (a_rise: INTEGER)
			-- The "rise" property
		do
			set_integer_property (rise_property_name, a_rise)
		end

--    -------------------------------------------------------------------------------------

--   The "rise-set" property

--    "rise-set"             gboolean              : Read / Write

--    Whether this tag affects the rise.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} --   The "scale" property
	--    "scale"                gdouble               : Read / Write

	scale: REAL
			-- Font size as a scale factor relative to the default font
			-- size. This properly adapts to theme changes etc. so is
			-- recommended. Pango predefines some scales such as
			-- PANGO_SCALE_X_LARGE. Default value: 1
		do

		ensure valid: Result >= 0
		end

	set_scale (a_scale: REAL)
		require valid_scale: a_scale >= 0
		do
		end


--    -------------------------------------------------------------------------------------

--   The "scale-set" property

--    "scale-set"            gboolean              : Read / Write

--    Whether this tag scales the font size by a factor.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} --   The "size" property
	--    "size"                 gint                  : Read / Write

	set_size (a_size: INTEGER)
			-- Set "size" property
		require valid_size: a_size >= 0
		do
			set_integer_property (size_property_name, a_size)
		end

	size: INTEGER
			--    Font size in Pango units.
		do
			g_object_get_one_property (handle, size_property_name.to_external, $Result, default_pointer)
		end

--   The "size-points" property

--    "size-points"          gdouble               : Read / Write

--    Font size in points.

--    Allowed values: >= 0

--    Default value: 0

--    -------------------------------------------------------------------------------------

--   The "size-set" property

--    "size-set"             gboolean              : Read / Write

--    Whether this tag affects the font size.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "stretch" property

--    "stretch"              PangoStretch          : Read / Write

--    Font stretch as a PangoStretch, e.g. PANGO_STRETCH_CONDENSED.

--    Default value: PANGO_STRETCH_NORMAL

--    -------------------------------------------------------------------------------------

--   The "stretch-set" property

--    "stretch-set"          gboolean              : Read / Write

--    Whether this tag affects the font stretch.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "strikethrough" property

--    "strikethrough"        gboolean              : Read / Write

--    Whether to strike through the text.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "strikethrough-set" property

--    "strikethrough-set"    gboolean              : Read / Write

--    Whether this tag affects strikethrough.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

feature {ANY} --   The "style" property

	set_style (a_style: INTEGER)
		require
			valid: is_valid_pango_style (a_style)
		do
			set_enum_property (style_property_name, a_style)
		end

	style: INTEGER
			-- Font style as a PANGO_STYLE, see predefined values in
			-- PANGO_WEIGHT; for example, pango_style_normal.
			-- Default value: PANGO_STYLE_NORMAL
		do
			g_object_get_one_property (handle, style_property_name.to_external, $Result, default_pointer)
		ensure
			valid: is_valid_pango_style (Result)
		end
	
--    -------------------------------------------------------------------------------------

--   The "style-set" property

--    "style-set"            gboolean              : Read / Write

--    Whether this tag affects the font style.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "tabs" property

--    "tabs"                 PangoTabArray         : Read / Write

--    Custom tabs for this text.

--    -------------------------------------------------------------------------------------

--   The "tabs-set" property

--    "tabs-set"             gboolean              : Read / Write

--    Whether this tag affects tabs.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

	set_underline (an_underline: INTEGER)
		require
			valid: is_valid_pango_underline (an_underline)
		do
			set_enum_property (underline_property_name, an_underline)
		end

	underline: INTEGER
			--    Style of underline for this text.
			--    Default value: pango_underline_none
		do
			g_object_get_one_property (handle, underline_property_name.to_external, $Result, default_pointer)
		ensure
			valid: is_valid_pango_underline (Result)
		end

--    -------------------------------------------------------------------------------------

--   The "underline-set" property

--    "underline-set"        gboolean              : Read / Write

--    Whether this tag affects underlining.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

--   The "variant" property

--    "variant"              PangoVariant          : Read / Write

--    Font variant as a PangoVariant, e.g. PANGO_VARIANT_SMALL_CAPS.

--    Default value: PANGO_VARIANT_NORMAL

--    -------------------------------------------------------------------------------------

--   The "variant-set" property

--    "variant-set"          gboolean              : Read / Write

--    Whether this tag affects the font variant.

--    Default value: FALSE

--    -------------------------------------------------------------------------------------

	set_weight (a_weight: INTEGER)
		require
			valid: is_valid_pango_weight (a_weight)
		do
			set_integer_property (weight_property_name, a_weight)
		end

	weight: INTEGER
			-- Font weight as an integer, see predefined values in
			-- PANGO_WEIGHT; for example, pango_weight_bold.
			-- Default value: 400
		do
			g_object_get_one_property (handle, weight_property_name.to_external, $Result, default_pointer)
		ensure
			valid: is_valid_pango_weight (Result)
		end
	
--    -------------------------------------------------------------------------------------

feature {ANY} --   The "wrap-mode" property
	-- "wrap-mode" GtkWrapMode : Read / Write

	wrap_mode: INTEGER
			-- Whether to wrap lines never, at word boundaries, or at
			-- character boundaries. Default value: `gtk_wrap_none'
		obsolete "integer_property should be enum"
		do
			Result := integer_property (wrap_mode_property_name)
		ensure valid: is_valid_gtk_wrap_mode (Result)
		end
	
	set_wrap_mode (a_mode: INTEGER)
			-- Set `wrap-mode' property.
		require valid_mode: is_valid_gtk_wrap_mode (a_mode)
		do
			set_integer_property (wrap_mode_property_name, a_mode)
		end

feature {ANY} --   The "wrap-mode-set" property

--    "wrap-mode-set"        gboolean              : Read / Write

--    Whether this tag affects line wrap mode.

--    Default value: FALSE

feature {ANY} -- TODO: Signals


--  "event"     gboolean    user_function      (GtkTextTag  *texttag,
--                                              GObject     *arg1,
--                                              GdkEvent    *event,
--                                              GtkTextIter *arg2,
--                                              gpointer     user_data)      : Run last


-- Signal Details

--   The "event" signal

--  gboolean    user_function                  (GtkTextTag  *texttag,
--                                              GObject     *arg1,
--                                              GdkEvent    *event,
--                                              GtkTextIter *arg2,
--                                              gpointer     user_data)      : Run last

--    texttag :   the object which received the signal.
--    arg1 :
--    event :
--    arg2 :
--    user_data : user data set when the signal handler was connected.
--    Returns :

feature {} -- Properties names
	
	background_property_name: STRING is "background"	
			-- gchararray : Write
	background_full_height_property_name: STRING is "background-full-height"	
			-- gboolean : Read / Write
	background_full_height_set_property_name: STRING is "background-full-height-set"	
			-- gboolean : Read / Write
	background_gdk_property_name: STRING is "background-gdk"	
			-- GdkColor : Read / Write
	background_set_property_name: STRING is "background-set"	
			-- gboolean : Read / Write
	background_stipple_property_name: STRING is "background-stipple"	
			-- GdkPixmap : Read / Write
	background_stipple_set_property_name: STRING is "background-stipple-set"
			-- gboolean : Read / Write
	direction_property_name: STRING is "direction"	
			-- GtkTextDirection : Read / Write
	editable_property_name: STRING is "editable"	
			-- gboolean : Read / Write
	editable_set_property_name: STRING is "editable-set"	
			-- gboolean : Read / Write
	family_property_name: STRING is "family"	
			-- gchararray : Read / Write
	family_set_property_name: STRING is "family-set"	
			-- gboolean : Read / Write
	font_property_name: STRING is "font"	
			-- gchararray : Read / Write
	font_desc_property_name: STRING is "font-desc"	
			-- PangoFontDescription : Read / Write
	foreground_property_name: STRING is "foreground"	
			-- gchararray : Write
	foreground_gdk_property_name: STRING is "foreground-gdk"	
			-- GdkColor : Read / Write
	foreground_set_property_name: STRING is "foreground-set"	
			-- gboolean : Read / Write
	foreground_stipple_property_name: STRING is "foreground-stipple"	
			-- GdkPixmap : Read / Write
	foreground_stipple_set_property_name: STRING is "foreground-stipple-set"	
			-- gboolean : Read / Write
	indent_property_name: STRING is "indent"	
			-- gint : Read / Write
	indent_set_property_name: STRING is "indent-set"	
			-- gboolean : Read / Write
	invisible_property_name: STRING is "invisible"	
			-- gboolean : Read / Write
	invisible_set_property_name: STRING is "invisible-set"	
			-- gboolean : Read / Write
	justification_property_name: STRING is "justification"	
			-- GtkJustification : Read / Write
	justification_set_property_name: STRING is "justification-set"	
			-- gboolean : Read / Write
	language_property_name: STRING is "language"	
			-- gchararray : Read / Write
	language_set_property_name: STRING is "language-set"	
			-- gboolean : Read / Write
	left_margin_property_name: STRING is "left-margin"	
			-- gint : Read / Write
	left_margin_set_property_name: STRING is "left-margin-set"	
			-- gboolean : Read / Write
	name_property_name: STRING is "name"	
			-- gchararray : Read / Write / Construct Only
	paragraph_background_property_name: STRING is "paragraph-background"	
			-- gchararray : Write
	paragraph_background_gdk_property_name: STRING is "paragraph-background-gdk"	
			-- GdkColor : Read / Write
	paragraph_background_set_property_name: STRING is "paragraph-background-set"	
			-- gboolean : Read / Write
	pixels_above_lines_property_name: STRING is "pixels-above-lines"	
			-- gint : Read / Write
	pixels_above_lines_set_property_name: STRING is "pixels-above-lines-set"	
			-- gboolean : Read / Write
	pixels_below_lines_property_name: STRING is "pixels-below-lines"	
			-- gint : Read / Write
	pixels_below_lines_set_property_name: STRING is "pixels-below-lines-set"	
			-- gboolean : Read / Write
	pixels_inside_wrap_property_name: STRING is "pixels-inside-wrap"	
			-- gint : Read / Write
	pixels_inside_wrap_set_property_name: STRING is "pixels-inside-wrap-set"	
			-- gboolean : Read / Write
	right_margin_property_name: STRING is "right-margin"	
			-- gint : Read / Write
	right_margin_set_property_name: STRING is "right-margin-set"	
			-- gboolean : Read / Write
	rise_property_name: STRING is "rise"	
			-- gint : Read / Write
	rise_set_property_name: STRING is "rise-set"	
			-- gboolean : Read / Write
	scale_property_name: STRING is "scale"	
			-- gdouble : Read / Write
	scale_set_property_name: STRING is "scale-set"	
			-- gboolean : Read / Write
	size_property_name: STRING is "size"	
			-- gint : Read / Write
	size_points_property_name: STRING is "size-points"	
			-- gdouble : Read / Write
	size_set_property_name: STRING is "size-set"	
			-- gboolean : Read / Write
	stretch_property_name: STRING is "stretch"	
			-- PangoStretch : Read / Write
	stretch_set_property_name: STRING is "stretch-set"	
			-- gboolean : Read / Write
	strikethrough_property_name: STRING is "strikethrough"	
			-- gboolean : Read / Write
	strikethrough_set_property_name: STRING is "strikethrough-set"	
			-- gboolean : Read / Write
	style_property_name: STRING is "style"	
			-- PangoStyle : Read / Write
	style_set_property_name: STRING is "style-set"	
			-- gboolean : Read / Write
	tabs_property_name: STRING is "tabs"	
			-- PangoTabArray : Read / Write
	tabs_set_property_name: STRING is "tabs-set"	
			-- gboolean : Read / Write
	underline_property_name: STRING is "underline"	
			-- PangoUnderline : Read / Write
	underline_set_property_name: STRING is "underline-set"	
			-- gboolean : Read / Write
	variant_property_name: STRING is "variant"	
			-- PangoVariant : Read / Write
	variant_set_property_name: STRING is "variant-set"	
			-- gboolean : Read / Write
	weight_property_name: STRING is "weight"	
			-- gint : Read / Write
	weight_set_property_name: STRING is "weight-set"
			-- gboolean : Read / Write
	wrap_mode_property_name: STRING is "wrap-mode"
			-- GtkWrapMode : Read / Write
	wrap_mode_set_property_name: STRING is "wrap-mode-set"
			-- gboolean : Read / Write

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextTag)"
		end

feature {} -- External calls
	gtk_text_tag_new (a_const_name: POINTER): POINTER is -- GtkTextTag*
		external "C use <gtk/gtk.h>"
		end
	gtk_text_tag_get_priority (a_gtktexttag: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_set_priority (a_gtktexttag: POINTER; a_priority: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_event (a_gtktexttag, an_event_object, a_gdkevent,  a_const_gtktextiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
