indexing
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
	-- before using them with that buffer. (TODO: Translate this into
	-- proper preconditions)

	-- GTK_TEXT_BUFFER's `create_tag' is the best way to create
	-- tags. (TODO: translate gtk-demo from C to Eiffel for numerous
	-- examples).

	-- The "invisible" property was not implemented for GTK+ 2.0; it's
	-- planned to be implemented in future releases.

	-- TODO: Most properties are still not implemented with strongly
	-- typed setters and getters. Meanwhile for most of them you can
	-- use G_OBJECT.get_property/set_property.


inherit G_OBJECT

insert
	PANGO_WEIGHT
	GTK

creation dummy, make, with_name, from_external_pointer

feature -- Creation
	dummy_gobject: POINTER is
		do
			Result:=gtk_text_tag_new(default_pointer)
		end

	make is
			-- Create a nameless GtkTextTag
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer(gtk_text_tag_new(default_pointer))
		end

	with_name (a_name: STRING) is
			-- Creates a GtkTextTag. Configure the tag using object
			-- arguments, i.e. using G_OBJECT.set().
		require
			gtk_initialized: gtk.is_initialized
			name_not_void: a_name /=Void
		do
			from_external_pointer(gtk_text_tag_new (a_name.to_external))
		end

feature
	priority: INTEGER is
			-- the tag priority.
		do
			Result := gtk_text_tag_get_priority (handle)
		end

	set_priority (a_priority: INTEGER) is
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
	
feature -- The "background" property

	set_background (a_color: STRING) is
			-- Background color as a string.
		require color_not_void: a_color /= Void
		do
			set_string_property(background_property_name,a_color)
		end

	set_background_color (a_color: GDK_COLOR) is
			-- Set the background color from a (possibly unallocated?)
			-- GdkColor.
		require color_not_void: a_color /= Void
		do
			set_pointer_property(background_gdk_property_name,a_color.handle)
		end
	
	background: GDK_COLOR is
			-- The background color (property "background-gdk" GdkColor:
			-- Read / Write)
		local ptr: POINTER
		do
			ptr:=pointer_property_from_pspec(background_gdk_pspec)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		ensure not_void: Result /= Void
		end
		
feature -- TODO: The "background-full-height" property

--    "background-full-height" gboolean              : Read / Write

--    Whether the background color fills the entire line height or only the height of the
--    tagged characters.

--    Default value: FALSE


feature -- TODO: The "background-full-height-set" property

--    "background-full-height-set" gboolean              : Read / Write

--    Whether this tag affects background height.

--    Default value: FALSE


feature -- TODO: The "background-set" property

--    "background-set"       gboolean              : Read / Write

--    Whether this tag affects the background color.

--    Default value: FALSE


feature -- TODO: The "background-stipple" property

--    "background-stipple"   GdkPixmap             : Read / Write

--    Bitmap to use as a mask when drawing the text background.


feature -- TODO: The "background-stipple-set" property

--    "background-stipple-set" gboolean              : Read / Write

--    Whether this tag affects the background stipple.

--    Default value: FALSE


feature -- TODO: The "direction" property

--    "direction"            GtkTextDirection      : Read / Write

--    Text direction, e.g. right-to-left or left-to-right.

--    Default value: GTK_TEXT_DIR_NONE


feature --   The "editable" property
	is_editable: BOOLEAN is
			-- Can the text be modified by the user? (property "editable"
			-- gboolean : Read / Write). Default value: TRUE
		do
			Result:=boolean_property_from_pspec(editable_pspec)
		end

	set_editable (a_setting: BOOLEAN) is
		do
			set_boolean_property(editable_property_name,a_setting)
		ensure set: is_editable = a_setting
		end
	

feature -- TODO: The "editable-set" property

--    "editable-set"         gboolean              : Read / Write

--    Whether this tag affects text editability.

--    Default value: FALSE


feature -- TODO: The "family" property

--    "family"               gchararray            : Read / Write

--    Name of the font family, e.g. Sans, Helvetica, Times, Monospace.

--    Default value: NULL


feature -- TODO: The "family-set" property

--    "family-set"           gboolean              : Read / Write

--    Whether this tag affects the font family.

--    Default value: FALSE


feature -- TODO: The "font" property

--    "font"                 gchararray            : Read / Write

--    Font description as string, e.g. \"Sans Italic 12\".

--    Note that the initial value of this property depends on the internals of
--    PangoFontDescription.

--    Default value: NULL


feature -- TODO: The "font-desc" property

--    "font-desc"            PangoFontDescription  : Read / Write

--    Font description as a PangoFontDescription struct.


feature -- The foreground color
	set_foreground (a_color: STRING) is
			-- Foreground color as a string.
		require color_not_void: a_color /= Void
		do
			set_string_property(foreground_property_name,a_color)
		end

	set_foreground_color (a_color: GDK_COLOR) is
			-- Set the foreground color from a (possibly unallocated?)
			-- GdkColor.
		require color_not_void: a_color /= Void
		do
			set_pointer_property(foreground_gdk_property_name,a_color.handle)
		end
	
	foreground: GDK_COLOR is
			-- The foreground color (property "foreground-gdk" GdkColor:
			-- Read / Write)
		local ptr: POINTER
		do
			ptr:=pointer_property_from_pspec(foreground_gdk_pspec)
			check ptr.is_not_null end
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		ensure not_void: Result /= Void
		end
		
	is_foregroud_set: BOOLEAN is
			-- Does this tag affect the foreground color? (property
			-- "foreground-set" gboolean Read Write)
		do
			Result:=boolean_property_from_pspec(foreground_set_pspec)
		end
	
	set_foreground_effect (a_setting: BOOLEAN) is
			-- Set the "foreground-set" property
		do
			set_boolean_property(foreground_set_property_name,a_setting)
		ensure set: a_setting = is_foregroud_set
		end

feature -- TODO:	The "foreground-stipple" property 

--    "foreground-stipple"   GdkPixmap             : Read / Write

--    Bitmap to use as a mask when drawing the text foreground.


feature -- TODO: The "foreground-stipple-set" property

--    "foreground-stipple-set" gboolean              : Read / Write

--    Whether this tag affects the foreground stipple.

--    Default value: FALSE


feature -- TODO: The "indent" property

	indent: INTEGER is
			-- Indent of the paragraph, in pixels. Default value: 0
		do
			Result :=integer_property_from_pspec(indent_pspec)
		end

	set_indent (an_amount: INTEGER) is
		-- Set `indent' to `an_amount'.
		do
			set_integer_property(indent_property_name,an_amount)
		ensure set: an_amount = indent
		end

feature -- TODO: The "indent-set" property

--    "indent-set"           gboolean              : Read / Write

--    Whether this tag affects indentation.

--    Default value: FALSE


feature -- TODO: The "invisible" property

--    "invisible"            gboolean              : Read / Write

--    Whether this text is hidden.

--    Note that there may still be problems with the support for invisible text, in
--    particular when navigating programmatically inside a buffer containing invisible
--    segments.

--    Default value: FALSE

--    Since 2.8


feature -- TODO: The "invisible-set" property

--    "invisible-set"        gboolean              : Read / Write

--    Whether this tag affects text visibility.

--    Default value: FALSE


feature -- "justification" property
	justification: INTEGER is 
			-- "justification" property; left, right, or center
			-- justification. Default value: `gtk_justify_left'
		do
			ensure valid: is_valid_gtk_justification(Result)
		end

	set_justification (a_justification: INTEGER) is
		require valid: is_valid_gtk_justification(a_justification)
		do
			set_enum_property(justification_property_name,a_justification)
		end

feature -- TODO: The "justification-set" property

--    "justification-set"    gboolean              : Read / Write

--    Whether this tag affects paragraph justification.

--    Default value: FALSE


feature -- TODO: The "language" property

--    "language"             gchararray            : Read / Write

--    The language this text is in, as an ISO code. Pango can use this as a hint when
--    rendering the text. If not set, an appropriate default will be used.

--    Note that the initial value of this property depends on the current locale, see also
--    gtk_get_default_language().

--    Default value: NULL


feature -- TODO: The "language-set" property

--    "language-set"         gboolean              : Read / Write

--    Whether this tag affects the language the text is rendered as.

--    Default value: FALSE


feature -- TODO: The "left-margin" property
	left_margin: INTEGER is
			-- Width of the left margin in pixels.  (property
			-- "left-margin" gint Read-Write) Default value: 0
		do
			Result := integer_property_from_pspec(left_margin_pspec)
		end

	set_left_margin (a_margin: INTEGER) is
		require valid_margin: a_margin >= 0
		do
			set_integer_property(left_margin_property_name, a_margin)
		end

feature -- TODO: The "left-margin-set" property

--    "left-margin-set"      gboolean              : Read / Write

--    Whether this tag affects the left margin.

--    Default value: FALSE


feature --   The "name" property
	name: STRING is
			-- Name used to refer to the text tag. Void for anonymous
			-- tags. (Property "name" gchararray : Read / Write /
			-- Construct Only) Default value: Void
		do
			Result:=string_property_from_pspec(name_pspec)
		end
	


feature -- TODO: The "paragraph-background" property

--    "paragraph-background" gchararray            : Write

--    The paragraph background color as a string.

--    Default value: NULL

--    Since 2.8


feature -- TODO: The "paragraph-background-gdk" property

--    "paragraph-background-gdk" GdkColor              : Read / Write

--    The paragraph background color as a as a (possibly unallocated) GdkColor.

--    Since 2.8


feature -- TODO: The "paragraph-background-set" property

--    "paragraph-background-set" gboolean              : Read / Write

--    Whether this tag affects the paragraph background color.

--    Default value: FALSE

feature -- The "pixels-above-lines" property
	pixels_above_lines: INTEGER is
			-- Pixels of blank space above paragraphs; default is 0;
			-- gint read-write property: "pixels-above-lines"
		do
			Result:=integer_property_from_pspec(pixels_above_lines_pspec)
		ensure valid: Result >= 0
		end
	
	set_pixels_above_lines (a_value: INTEGER) is
			-- Set `pixels_above_lines' to `a_value'
		require valid: a_value >= 0
		do
			set_integer_property(pixels_above_lines_property_name,a_value)
		ensure set: a_value = pixels_above_lines
		end

feature -- TODO: The "pixels-above-lines-set" property

--    "pixels-above-lines-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels above lines.

--    Default value: FALSE


feature -- TODO: The "pixels-below-lines" property
	pixels_below_lines: INTEGER is
			-- Pixels of blank space below paragraphs; default is 0;
			-- gint read-write property: "pixels-below-lines"
		do
			Result:=integer_property_from_pspec(pixels_below_lines_pspec)
		ensure valid: Result >= 0
		end
	
	set_pixels_below_lines (a_value: INTEGER) is
			-- Set `pixels_below_lines' to `a_value'
		require valid: a_value >= 0
		do
			set_integer_property(pixels_below_lines_property_name,a_value)
		ensure set: a_value = pixels_below_lines
		end

feature -- TODO: The "pixels-below-lines-set" property

--    "pixels-below-lines-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels above lines.

--    Default value: FALSE


feature -- TODO: The "pixels-inside-wrap" property

--    "pixels-inside-wrap"   gint                  : Read / Write

--    Pixels of blank space between wrapped lines in a paragraph.

--    Allowed values: >= 0

--    Default value: 0


feature -- TODO: The "pixels-inside-wrap-set" property

--    "pixels-inside-wrap-set" gboolean              : Read / Write

--    Whether this tag affects the number of pixels between wrapped lines.

--    Default value: FALSE


feature -- TODO: The "right-margin" property

--    "right-margin"         gint                  : Read / Write

--    Width of the right margin in pixels.

--    Allowed values: >= 0

--    Default value: 0


feature -- TODO: The "right-margin-set" property

--    "right-margin-set"     gboolean              : Read / Write

--    Whether this tag affects the right margin.

--    Default value: FALSE


feature -- The "rise" property
	--    "rise"                 gint                  : Read / Write

	rise: INTEGER is
			-- Offset of text above the baseline (below the baseline
			-- if rise is negative) in Pango units. Default value: 0
		do
			Result := integer_property (rise_property_name)
		end

	set_rise (a_rise: INTEGER) is
			-- The "rise" property
		do
			set_integer_property (rise_property_name, a_rise)
		end


feature -- TODO: The "rise-set" property

--    "rise-set"             gboolean              : Read / Write

--    Whether this tag affects the rise.

--    Default value: FALSE


feature --   The "scale" property

	scale: REAL is 
			-- Font size as a scale factor relative to the default font
			-- size. This properly adapts to theme changes etc. so is
			-- recommended. Pango predefines some scales such as
			-- PANGO_SCALE_X_LARGE. Default value: 1
		do
			Result:=real_property_from_pspec(scale_pspec)
		ensure valid: Result >= 0
		end

	set_scale (a_scale: REAL) is
		require valid_scale: a_scale >= 0
		do
			set_real_property(scale_property_name,a_scale)
		end


feature -- TODO: The "scale-set" property

--    "scale-set"            gboolean              : Read / Write

--    Whether this tag scales the font size by a factor.

--    Default value: FALSE


feature --   The "size" property

	set_size (a_size: INTEGER) is
			-- Set "size" property (gint Read / Write)
		require valid_size: a_size >= 0
		do
			set_integer_property (size_property_name, a_size)
		end

	size: INTEGER is
			--    Font size in Pango units.
		do
			g_object_get_one_property (handle, size_property_name.to_external, $Result, default_pointer)
		end

feature -- TODO: The "size-points" property

--    "size-points"          gdouble               : Read / Write

--    Font size in points.

--    Allowed values: >= 0

--    Default value: 0


feature -- TODO: The "size-set" property

--    "size-set"             gboolean              : Read / Write

--    Whether this tag affects the font size.

--    Default value: FALSE


feature -- TODO: The "stretch" property

--    "stretch"              PangoStretch          : Read / Write

--    Font stretch as a PangoStretch, e.g. PANGO_STRETCH_CONDENSED.

--    Default value: PANGO_STRETCH_NORMAL


feature -- TODO: The "stretch-set" property

--    "stretch-set"          gboolean              : Read / Write

--    Whether this tag affects the font stretch.

--    Default value: FALSE


feature -- TODO: The "strikethrough" property

--    "strikethrough"        gboolean              : Read / Write

--    Whether to strike through the text.

--    Default value: FALSE


feature -- TODO: The "strikethrough-set" property

--    "strikethrough-set"    gboolean              : Read / Write

--    Whether this tag affects strikethrough.

--    Default value: FALSE


feature --   The "style" property

--    "style"                PangoStyle            : Read / Write

--    Font style as a PangoStyle, e.g. PANGO_STYLE_ITALIC.

	set_style (a_style: INTEGER) is
		do
		end
--    Default value: PANGO_STYLE_NORMAL


feature -- TODO: The "style-set" property

--    "style-set"            gboolean              : Read / Write

--    Whether this tag affects the font style.

--    Default value: FALSE


feature -- TODO: The "tabs" property

--    "tabs"                 PangoTabArray         : Read / Write

--    Custom tabs for this text.


feature -- TODO: The "tabs-set" property

--    "tabs-set"             gboolean              : Read / Write

--    Whether this tag affects tabs.

--    Default value: FALSE


feature -- TODO: The "underline" property

--    "underline"            PangoUnderline        : Read / Write

--    Style of underline for this text.

--    Default value: PANGO_UNDERLINE_NONE


feature -- TODO: The "underline-set" property

--    "underline-set"        gboolean              : Read / Write

--    Whether this tag affects underlining.

--    Default value: FALSE


feature -- TODO: The "variant" property

--    "variant"              PangoVariant          : Read / Write

--    Font variant as a PangoVariant, e.g. PANGO_VARIANT_SMALL_CAPS.

--    Default value: PANGO_VARIANT_NORMAL


feature -- TODO: The "variant-set" property

--    "variant-set"          gboolean              : Read / Write

--    Whether this tag affects the font variant.

--    Default value: FALSE


feature --   The "weight" property

	set_weight (a_weight: INTEGER) is
			-- Set the font weight (property "weight", a read-write
			-- gint)
		require
			valid: a_weight >= 0
			-- the precondition "is_valid_pango_weight (a_weight)" is too
			-- much, because the weight can be any non-negative value
		do
			set_integer_property (weight_property_name, a_weight)
		end

	weight: INTEGER is
			-- Font weight as an integer, see predefined values in
			-- PANGO_WEIGHT; for example, pango_weight_bold. Default
			-- value: 400
		do
			g_object_get_one_property (handle, weight_property_name.to_external, $Result, default_pointer)
		ensure valid: is_valid_pango_weight (Result)
		end
	

feature -- TODO: The "weight-set" property

--    "weight-set"           gboolean              : Read / Write

--    Whether this tag affects the font weight.

--    Default value: FALSE


feature --   The "wrap-mode" property
	-- "wrap-mode" GtkWrapMode : Read / Write

	wrap_mode: INTEGER is
			-- Whether to wrap lines never, at word boundaries, or at
			-- character boundaries. Default value: `gtk_wrap_none'
		obsolete "integer_property should be enum"
		do
			Result := integer_property (wrap_mode_property_name)
		ensure valid: is_valid_gtk_wrap_mode (Result)
		end
	
	set_wrap_mode (a_mode: INTEGER) is
			-- Set `wrap-mode' property.
		require valid_mode: is_valid_gtk_wrap_mode (a_mode)
		do
			set_integer_property (wrap_mode_property_name, a_mode)
		end

feature -- TODO: The "wrap-mode-set" property

--    "wrap-mode-set"        gboolean              : Read / Write

--    Whether this tag affects line wrap mode.

--    Default value: FALSE

feature -- TODO: Signals


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

feature {} -- Parameter specifications 
	background_pspec: G_PARAM_SPEC is
		require has_property (background_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_property_name.to_external))
		end

	background_full_height_pspec: G_PARAM_SPEC is
		require has_property (background_full_height_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_full_height_property_name.to_external))
		end

	background_full_height_set_pspec: G_PARAM_SPEC is
		require has_property (background_full_height_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_full_height_set_property_name.to_external))
		end

	background_gdk_pspec: G_PARAM_SPEC is
		require has_property (background_gdk_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_gdk_property_name.to_external))
		end

	background_set_pspec: G_PARAM_SPEC is
		require has_property (background_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_set_property_name.to_external))
		end

	background_stipple_pspec: G_PARAM_SPEC is
		require has_property (background_stipple_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_stipple_property_name.to_external))
		end

	background_stipple_set_pspec: G_PARAM_SPEC is
		require has_property (background_stipple_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),background_stipple_set_property_name.to_external))
		end

	direction_pspec: G_PARAM_SPEC is
		require has_property (direction_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),direction_property_name.to_external))
		end

	editable_pspec: G_PARAM_SPEC is
		require has_property (editable_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),editable_property_name.to_external))
		end

	editable_set_pspec: G_PARAM_SPEC is
		require has_property (editable_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),editable_set_property_name.to_external))
		end

	family_pspec: G_PARAM_SPEC is
		require has_property (family_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),family_property_name.to_external))
		end

	family_set_pspec: G_PARAM_SPEC is
		require has_property (family_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),family_set_property_name.to_external))
		end

	font_pspec: G_PARAM_SPEC is
		require has_property (font_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),font_property_name.to_external))
		end

	font_desc_pspec: G_PARAM_SPEC is
		require has_property (font_desc_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),font_desc_property_name.to_external))
		end

	foreground_pspec: G_PARAM_SPEC is
		require has_property (foreground_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),foreground_property_name.to_external))
		end

	foreground_gdk_pspec: G_PARAM_SPEC is
		require has_property (foreground_gdk_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),foreground_gdk_property_name.to_external))
		end

	foreground_set_pspec: G_PARAM_SPEC is
		require has_property (foreground_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),foreground_set_property_name.to_external))
		end

	foreground_stipple_pspec: G_PARAM_SPEC is
		require has_property (foreground_stipple_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),foreground_stipple_property_name.to_external))
		end

	foreground_stipple_set_pspec: G_PARAM_SPEC is
		require has_property (foreground_stipple_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),foreground_stipple_set_property_name.to_external))
		end

	indent_pspec: G_PARAM_SPEC is
		require has_property (indent_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),indent_property_name.to_external))
		end

	indent_set_pspec: G_PARAM_SPEC is
		require has_property (indent_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),indent_set_property_name.to_external))
		end

	invisible_pspec: G_PARAM_SPEC is
		require has_property (invisible_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),invisible_property_name.to_external))
		end

	invisible_set_pspec: G_PARAM_SPEC is
		require has_property (invisible_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),invisible_set_property_name.to_external))
		end

	justification_pspec: G_PARAM_SPEC is
		require has_property (justification_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),justification_property_name.to_external))
		end

	justification_set_pspec: G_PARAM_SPEC is
		require has_property (justification_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),justification_set_property_name.to_external))
		end

	language_pspec: G_PARAM_SPEC is
		require has_property (language_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),language_property_name.to_external))
		end

	language_set_pspec: G_PARAM_SPEC is
		require has_property (language_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),language_set_property_name.to_external))
		end

	left_margin_pspec: G_PARAM_SPEC is
		require has_property (left_margin_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),left_margin_property_name.to_external))
		end

	left_margin_set_pspec: G_PARAM_SPEC is
		require has_property (left_margin_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),left_margin_set_property_name.to_external))
		end

	name_pspec: G_PARAM_SPEC is
		require has_property (name_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),name_property_name.to_external))
		end

	paragraph_background_pspec: G_PARAM_SPEC is
		require has_property (paragraph_background_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),paragraph_background_property_name.to_external))
		end

	paragraph_background_gdk_pspec: G_PARAM_SPEC is
		require has_property (paragraph_background_gdk_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),paragraph_background_gdk_property_name.to_external))
		end

	paragraph_background_set_pspec: G_PARAM_SPEC is
		require has_property (paragraph_background_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),paragraph_background_set_property_name.to_external))
		end

	pixels_above_lines_pspec: G_PARAM_SPEC is
		require has_property (pixels_above_lines_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_above_lines_property_name.to_external))
		end

	pixels_above_lines_set_pspec: G_PARAM_SPEC is
		require has_property (pixels_above_lines_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_above_lines_set_property_name.to_external))
		end

	pixels_below_lines_pspec: G_PARAM_SPEC is
		require has_property (pixels_below_lines_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_below_lines_property_name.to_external))
		end

	pixels_below_lines_set_pspec: G_PARAM_SPEC is
		require has_property (pixels_below_lines_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_below_lines_set_property_name.to_external))
		end

	pixels_inside_wrap_pspec: G_PARAM_SPEC is
		require has_property (pixels_inside_wrap_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_inside_wrap_property_name.to_external))
		end

	pixels_inside_wrap_set_pspec: G_PARAM_SPEC is
		require has_property (pixels_inside_wrap_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),pixels_inside_wrap_set_property_name.to_external))
		end

	right_margin_pspec: G_PARAM_SPEC is
		require has_property (right_margin_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),right_margin_property_name.to_external))
		end

	right_margin_set_pspec: G_PARAM_SPEC is
		require has_property (right_margin_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),right_margin_set_property_name.to_external))
		end

	rise_pspec: G_PARAM_SPEC is
		require has_property (rise_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),rise_property_name.to_external))
		end

	rise_set_pspec: G_PARAM_SPEC is
		require has_property (rise_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),rise_set_property_name.to_external))
		end

	scale_pspec: G_PARAM_SPEC is
		require has_property (scale_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),scale_property_name.to_external))
		end

	scale_set_pspec: G_PARAM_SPEC is
		require has_property (scale_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),scale_set_property_name.to_external))
		end

	size_pspec: G_PARAM_SPEC is
		require has_property (size_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),size_property_name.to_external))
		end

	size_points_pspec: G_PARAM_SPEC is
		require has_property (size_points_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),size_points_property_name.to_external))
		end

	size_set_pspec: G_PARAM_SPEC is
		require has_property (size_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),size_set_property_name.to_external))
		end

	stretch_pspec: G_PARAM_SPEC is
		require has_property (stretch_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),stretch_property_name.to_external))
		end

	stretch_set_pspec: G_PARAM_SPEC is
		require has_property (stretch_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),stretch_set_property_name.to_external))
		end

	strikethrough_pspec: G_PARAM_SPEC is
		require has_property (strikethrough_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),strikethrough_property_name.to_external))
		end

	strikethrough_set_pspec: G_PARAM_SPEC is
		require has_property (strikethrough_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),strikethrough_set_property_name.to_external))
		end

	style_pspec: G_PARAM_SPEC is
		require has_property (style_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),style_property_name.to_external))
		end

	style_set_pspec: G_PARAM_SPEC is
		require has_property (style_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),style_set_property_name.to_external))
		end

	tabs_pspec: G_PARAM_SPEC is
		require has_property (tabs_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),tabs_property_name.to_external))
		end

	tabs_set_pspec: G_PARAM_SPEC is
		require has_property (tabs_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),tabs_set_property_name.to_external))
		end

	underline_pspec: G_PARAM_SPEC is
		require has_property (underline_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),underline_property_name.to_external))
		end

	underline_set_pspec: G_PARAM_SPEC is
		require has_property (underline_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),underline_set_property_name.to_external))
		end

	variant_pspec: G_PARAM_SPEC is
		require has_property (variant_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),variant_property_name.to_external))
		end

	variant_set_pspec: G_PARAM_SPEC is
		require has_property (variant_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),variant_set_property_name.to_external))
		end

	weight_pspec: G_PARAM_SPEC is
		require has_property (weight_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),weight_property_name.to_external))
		end

	weight_set_pspec: G_PARAM_SPEC is
		require has_property (weight_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),weight_set_property_name.to_external))
		end

	wrap_mode_pspec: G_PARAM_SPEC is
		require has_property (wrap_mode_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),wrap_mode_property_name.to_external))
		end

	wrap_mode_set_pspec: G_PARAM_SPEC is
		require has_property (wrap_mode_set_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),wrap_mode_set_property_name.to_external))
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextTag)"
		end

feature {} -- External calls
	gtk_text_tag_new (a_const_name: POINTER): POINTER is -- GtkTextTag*
		external "C use <gtk/gtk.h>"
		end
	gtk_text_tag_get_priority (a_gtktexttag: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_set_priority (a_gtktexttag: POINTER; a_priority: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_tag_event (a_gtktexttag, an_event_object, a_gdkevent,  a_const_gtktextiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
