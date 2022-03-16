note
	description: "GtkLabel -- A widget that displays a small to medium amount of text."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_LABEL
	-- The GTK_LABEL widget displays a small amount of text. As the name
	-- implies, most labels are used to label another widget such as a
	-- GTK_BUTTON, a GTK_MENU_ITEM, or a GTK_OPTION_MENU.

	-- Mnemonics: Labels may contain mnemonics. Mnemonics are
	-- underlined characters in the label, used for keyboard
	-- navigation. Mnemonics are created by providing a string with an
	-- underscore before the mnemonic character, such as "_File", to
	-- the `make_with_mnemonic' or `set_text_with_mnemonic' features.

	-- Mnemonics automatically activate any activatable widget the
	-- label is inside, such as a GtkButton; if the label is not inside
	-- the mnemonic's target widget, you have to tell the label about
	-- the target using `set_mnemonic_widget'. Here's a simple example
	-- where the label is inside a button: 

	--   -- Pressing Alt+H will activate this button 
	--   create button.make
	--   create label.with_mnemonic ("_Hello")
	--   button.add (label)
	
	-- There's a convenience function to create buttons with a mnemonic label already inside:

	--   -- Pressing Alt+H will activate this button 
	--   create button.with_mnemonic ("_Hello")
	
	-- To create a mnemonic for a widget alongside the label, such as a
	-- GTK_ENTRY, you have to point the label at the entry with
	-- `set_mnemonic_widget':

	--   /* Pressing Alt+H will focus the entry */
	--   entry = gtk_entry_new ();
	--   label = gtk_label_new_with_mnemonic ("_Hello");
	--   gtk_label_set_mnemonic_widget (GTK_LABEL (label), entry);
	
	-- Markup (styled text):
	
	-- To make it easy to format text in a label (changing colors,
	-- fonts, etc.), label text can be provided in a simple markup
	-- format. Here's how to create a label with a small font:

	--   label = gtk_label_new (NULL);
	--   gtk_label_set_markup (GTK_LABEL (label), "<small>Small text</small>");

	-- (See complete documentation of available tags in the Pango
	-- manual.)

	-- The markup passed to `set_markup' must be valid; for example,
	-- literal </>/& characters must be escaped as &lt;, &gt;, and
	-- &amp;. If you pass text obtained from the user, file, or a
	-- network to `set_markup', you'll want to escape it with (TODO)
	-- g_markup_escape_text() or g_markup_printf_escaped().

	-- Markup strings are just a convenient way to set the
	-- PangoAttrList on a label; `set_attributes' may be a simpler way
	-- to set attributes in some cases. Be careful though;
	-- PangoAttrList tends to cause internationalization problems,
	-- unless you're applying attributes to the entire string
	-- (i.e. unless you set the range of each attribute to [0,
	-- G_MAXINT)). The reason is that specifying the start_index and
	-- end_index for a PangoAttribute requires knowledge of the exact
	-- string being displayed, so translations will cause problems.
	
	-- Selectable labels: Labels can be made selectable with
	-- gtk_label_set_selectable(). Selectable labels allow the user to
	-- copy the label contents to the clipboard. Only labels that
	-- contain useful-to-copy information - such as error messages -
	-- should be made selectable.
	
	-- Text layout: a label can contain any number of paragraphs, but
	-- will have performance problems if it contains more than a small
	-- number. Paragraphs are separated by newlines or other paragraph
	-- separators understood by Pango.
	
	-- Labels can automatically wrap text if you call `set_line_wrap'.

	-- `set_justify' sets how the lines in a label align with one
	-- another. If you want to set how the label as a whole aligns in
	-- its available space, see `set_alignment' (from GTK_MISC).

inherit
	GTK_MISC
		-- Implemented Interfaces: GtkLabel implements
		-- AtkImplementorIface.

insert GTK_LABEL_EXTERNALS
	
create {ANY} empty, with_label, with_mnemonic, with_markup_label, from_external_pointer

feature {} -- Creation

	empty
			-- Creates a new empty label
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_label_new(default_pointer))
		end

	with_label (a_label: STRING)
			-- Creates a new label with the given text inside it.
		require
			gtk_initialized: gtk.is_initialized
			valid_label: a_label/=Void
		do
			-- In gtk_label_new You can pass Void to get an empty label
			-- widget.w
			from_external_pointer (gtk_label_new(a_label.to_external))
		end

	with_mnemonic (a_label: STRING)
			-- Creates a new GtkLabel, containing the text in
			-- `a_label'. If characters in `a_label' are preceded by an
			-- underscore, they are underlined. If you need a literal
			-- underscore character in a label, use `__' (two
			-- underscores). The first underlined character represents a
			-- keyboard accelerator called a mnemonic. The mnemonic key
			-- can be used to activate another widget, chosen
			-- automatically, or explicitly using
			-- `GTK_LABEL.set_mnemonic_widget'. If
			-- `GTK_LABEL.set_mnemonic_widget' is not called, then the
			-- first activatable ancestor of the GtkLabel will be chosen
			-- as the mnemonic widget. For instance, if the label is
			-- inside a button or menu item, the button or menu item will
			-- automatically become the mnemonic widget and be activated
			-- by the mnemonic.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label/=Void
		do
			from_external_pointer (gtk_label_new_with_mnemonic(a_label.to_external))
		end

	with_markup_label (a_label: STRING)
			-- Creates a new GtkLabel, containing the text in
			-- `a_label', formatted using Pango markup language.
		require
			gtk_initialized: gtk.is_initialized
			label_not_void: a_label/=Void
		do
			from_external_pointer (gtk_label_new(a_label.to_external))
			use_markup
		ensure is_marked_up
		end

feature {ANY}
	set_text (a_string: STRING)
			-- Sets the text within the GtkLabel widget. It overwrites
			-- any text that was there before. This will also clear any
			-- previously set mnemonic accelerators.
		require valid_string: a_string/=Void
		do
			gtk_label_set_text (handle,a_string.to_external)
		end

	-- TODO: wrap gtk_label_set_attributes ()void
	-- gtk_label_set_attributes (GtkLabel *label, PangoAttrList
	-- *attrs); Sets a PangoAttrList; the attributes in the list are
	-- applied to the label text. The attributes set with this function
	-- will be ignored if the "use_underline" property or the
	-- "use_markup" property is TRUE. label : a GtkLabelattrs : a
	-- PangoAttrList

	set_markup (a_string: STRING)
			-- Parses `a_string' which is marked up with the Pango text
			-- markup language, setting the label's text and attribute
			-- list based on the parse results. TODO: Eiffelize this "If
			-- the str is external data, you may need to escape it with
			-- g_markup_escape_text() or g_markup_printf_escaped(): char
			-- *markup; markup = g_markup_printf_escaped ("<span
			-- style=\"italic\">%s</span>", str); gtk_label_set_markup
			-- (GTK_LABEL (label), markup); g_free (markup);"
		require valid_string: a_string/=Void
		do
			gtk_label_set_markup (handle,a_string.to_external)
		end

	set_markup_with_mnemonic (a_string: STRING)
			-- Parses `a_string' which is marked up with the Pango text
			-- markup language, setting the label's text and attribute
			-- list based on the parse results. If characters in
			-- `a_string' are preceded by an underscore, they are
			-- underlined indicating that they represent a keyboard
			-- accelerator called a mnemonic.

			-- The mnemonic key can be used to activate another widget,
			-- chosen automatically, or explicitly using
			-- `set_mnemonic_widget'.
		require valid_string: a_string/=Void
		do
			gtk_label_set_markup_with_mnemonic (handle, a_string.to_external)
		end

	set_pattern (a_pattern: STRING)
			--	The pattern of underlines you want under the existing text
			--	within the GtkLabel widget. For example if the current
			--	text of the label says "FooBarBaz" passing a pattern of
			--	"___ ___" will underline "Foo" and "Baz" but not "Bar".
		require valid_pattern: a_pattern/=Void
		do
			gtk_label_set_pattern (handle, a_pattern.to_external)
		end

feature {ANY} -- Justification
	set_left_justify
			-- Makes the lines in the text of the label left-aligned. If
			-- you instead want to set the alignment of the label as a
			-- whole, use `GTK_MISC.set_alignment' instead. Has no effect
			-- on labels containing only a single line.
		do
			gtk_label_set_justify (handle,gtk_justify_left)
		end

	set_right_justify
			-- Makes the lines in the text of the label right-aligned. If
			-- you instead want to set the alignment of the label as a
			-- whole, use `GTK_MISC.set_alignment' instead. Has no effect
			-- on labels containing only a single line.
		do
			gtk_label_set_justify (handle,gtk_justify_left)
		end

	set_center_justify
			-- Makes the lines in the text of the label center-aligned. If
			-- you instead want to set the alignment of the label as a
			-- whole, use `GTK_MISC.set_alignment' instead. Has no effect
			-- on labels containing only a single line.
		do
			gtk_label_set_justify (handle,gtk_justify_center)
		end

	set_fill_justify
			-- Makes the lines in the text of the label distributed
			-- across the label. If you instead want to set the alignment
			-- of the label as a whole, use `GTK_MISC.set_alignment'
			-- instead. Has no effect on labels containing only a single
			-- line.
		do
			gtk_label_set_justify (handle,gtk_justify_fill)
		end

	is_justify_left: BOOLEAN
			-- Is the text placed at the left edge of the label?
		do
			Result:=(gtk_label_get_justify(handle)=gtk_justify_left)
		end
	
	is_justify_right: BOOLEAN
			-- Is the text placed at the right edge of the label?
		do
			Result:=(gtk_label_get_justify(handle)=gtk_justify_right)
		end
	
	is_justify_center: BOOLEAN
			-- Is the text placed at the center of the label?
		do
			Result:=(gtk_label_get_justify(handle)=gtk_justify_center)
		end
	
	is_justify_fill: BOOLEAN
			-- Is the text distribuited across the label?
		do
			Result:=(gtk_label_get_justify(handle)=gtk_justify_fill)
		end
	
feature {ANY} -- width desired or maximum
	-- TODO: wrap gtk_label_set_ellipsize () void
	-- gtk_label_set_ellipsize (GtkLabel *label, PangoEllipsizeMode
	-- mode);Sets the mode used to ellipsize (add an ellipsis: "...")
	-- to the text if there is not enough space to render the entire
	-- string.label : a GtkLabelmode : a PangoEllipsizeMode

	set_desired_width (n_chars: INTEGER)
			-- Sets the desired width in characters of label to `n_chars' characters.
		do
			gtk_label_set_width_chars (handle, n_chars)
		end

	set_max_width (n_chars: INTEGER)
			-- Sets the desired maximum width in characters of label to `n_chars'.
		do
			gtk_label_set_max_width_chars (handle, n_chars)
		end

	width_chars: INTEGER
			-- the desired width of label, in characters. See `set_desired_width'.
		do
			Result := (gtk_label_get_width_chars(handle))
		end

	max_width: INTEGER
			-- the desired maximum width of label, in characters. See `width_chars'.
		do
			Result:=gtk_label_get_max_width_chars(handle)
		end

feature {ANY} -- Line wrap
	set_line_wrap
			-- Toggles line wrapping within the GtkLabel widget. It
			-- breaks lines if text exceeds the widget's size.
		do
			gtk_label_set_line_wrap (handle, 1)
		end

	unset_line_wrap
			-- Toggles line wrapping within the GtkLabel widget. It lets
			-- the text get cut off by the edge of the widget if it
			-- exceeds the widget size.
		do
			gtk_label_set_line_wrap (handle, 0)
		end

	-- TODO: wrap gtk_label_get_layout_offsets () void
	-- gtk_label_get_layout_offsets (GtkLabel *label, gint *x, gint
	-- *y); Obtains the coordinates where the label will draw the
	-- PangoLayout representing the text in the label; useful to
	-- convert mouse events into coordinates inside the PangoLayout,
	-- e.g. to take some action if some part of the label is
	-- clicked. Of course you will need to create a GtkEventBox to
	-- receive the events, and pack the label inside it, since labels
	-- are a GTK_NO_WINDOW widget. Remember when using the PangoLayout
	-- functions you need to convert to and from pixels using
	-- PANGO_PIXELS() or PANGO_SCALE. label : a GtkLabel x : location
	-- to store X offset of layout, or NULL y : location to store Y
	-- offset of layout, or NULL
	
feature {ANY} -- mnemonic
	mnemonic_keyval: INTEGER
			-- The keyval usable for accelerators, or GDK_VoidSymbol. If
			-- the label has been set so that it has an mnemonic key this
			-- function returns the keyval used for the mnemonic
			-- accelerator. If there is no mnemonic set up it returns
			-- GDK_VoidSymbol.
		do
			Result:=gtk_label_get_mnemonic_keyval (handle)
		end

feature {ANY} -- Seletability
	is_selectable: BOOLEAN
			-- Can the user copy text from the label?
		do
			Result := gtk_label_get_selectable (handle).to_boolean
		end

	set_selectable
			-- Makes the label selectable to allow the user to select
			-- text from the it, for copy-and-paste.
		do
			gtk_label_set_selectable (handle,1)
		end
			
	set_unselectable
			-- Makes the label not selectable.
		do
			gtk_label_set_selectable (handle,0)
		end

feature {ANY} -- Text label
	text: STRING
			-- the text from a label widget, as displayed on the
			-- screen. This does not include any embedded underlines
			-- indicating mnemonics or Pango markup. (See
			-- `GTK_LABEL.get_label')
		do
			--	gtk_label_get_text returns the internal string used by the
			--	label, and must not be modified, hence
			--	STRING.from_external_copy
			create Result.from_external_copy(gtk_label_get_text(handle))
		end

	label: STRING
			-- the text from a label widget including any embedded underlines indicating mnemonics and Pango markup. (`text')
		do
			create Result.from_external_copy (gtk_label_get_label(handle))
			-- using from_external_copy since the returned but
			-- gtk_label_get_label is owned by the widget and must not be
			-- modified or freed.
		end

	set_label (a_string: STRING)
			-- Sets the label's text from `a_string'. The label is
			-- interpreted as including embedded underlines and/or Pango
			-- markup depending on the values of is_underline_used and
			-- is_marked_up.
		require valid_string: a_string/=Void
		do
			gtk_label_set_label (handle,a_string.to_external)
		end

	set_text_with_mnemonic (a_string: STRING)
			-- Sets the label's text from `a_string'. If characters in
			-- `a_string' are preceded by an underscore, they are
			-- underlined indicating that they represent a keyboard
			-- accelerator called a mnemonic. The mnemonic key can be
			-- used to activate another widget, chosen automatically, or
			-- explicitly using `set_mnemonic_widget'.
		require valid_string: a_string/=Void
		do
			gtk_label_set_text_with_mnemonic (handle, a_string.to_external)
		end

feature {ANY} -- mnemonic widget
	set_mnemonic_widget (a_widget: GTK_WIDGET)
			-- If the label has been set so that it has an mnemonic key
			-- (using i.e. `set_markup_with_mnemonic'),
			-- `set_text_with_mnemonic', `with_mnemonic' or the
			-- "use_underline" property) the label can be associated with
			-- a widget that is the target of the mnemonic. When the
			-- label is inside a widget (like a GtkButton or a
			-- GtkNotebook tab) it is automatically associated with the
			-- correct widget, but sometimes (i.e. when the target is a
			-- GtkEntry next to the label) you need to set it explicitly
			-- using this function.

			-- The target widget will be accelerated by emitting
			-- "mnemonic_activate" on it. The default handler for this
			-- signal will activate the widget if there are no mnemonic
			-- collisions and toggle focus between the colliding widgets
			-- otherwise.
		require valid_widget: a_widget/=Void
		do
			gtk_label_set_mnemonic_widget (handle, a_widget.handle)
		end

	-- 	mnemonic_widget: GTK_WIDGET is
	-- 			--  the target of the mnemonic (keyboard shortcut) of this
	-- 			--  label. See `GTK_LABEL.set_mnemonic_widget'. Void if none
	-- 			--  has been set and the default algorithm will be used.
	-- 		local widget_ptr: POINTER
	-- 		do
	-- 			widget_ptr:=gtk_label_get_mnemonic_widget (handle)
	-- 			if widget_ptr.is_not_null
	-- 			then
	-- 				-- TODO: create the right widget, not just a generic GTK_WIDGET
	-- 				create Result.from_external_pointer (widget_ptr)
	-- 			else check Result=Void end
	-- 		end

feature {ANY} -- Other
	select_region (a_start_offset, an_end_offset: INTEGER)
		-- Selects a range of characters in the label, if the label is
		-- selectable. See `set_selectable'. If the label is not
		-- selectable, this function has no effect. If `a_start_offset'
		-- or `an_end_offset' are -1, then the end of the label will be
		-- substituted. offset are given in  characters not bytes.
		do
			gtk_label_select_region (handle, a_start_offset, an_end_offset)
		end

	-- TODO: attributes: PANGO_ATTR_LIST PangoAttrList*
	-- gtk_label_get_attributes (GtkLabel *label); Gets the attribute
	-- list that was set on the label using gtk_label_set_attributes(),
	-- if any. This function does not reflect attributes that come from
	-- the labels markup (see gtk_label_set_markup()). If you want to
	-- get the effective attributes for the label, use
	-- pango_layout_get_attribute (gtk_label_get_layout (label)). label
	-- : a GtkLabel Returns : the attribute list, or NULL if none was
	-- set.


	-- TODO: gtk_label_get_ellipsize () PangoEllipsizeMode
	-- gtk_label_get_ellipsize (GtkLabel *label); Returns the
	-- ellipsizing position of the label. See
	-- gtk_label_set_ellipsize(). label : a GtkLabel Returns :
	-- PangoEllipsizeMode

	-- TODO: gtk_label_get_layout () PangoLayout* gtk_label_get_layout
	-- (GtkLabel *label); Gets the PangoLayout used to display the
	-- label. The layout is useful to e.g. convert text positions to
	-- pixel positions, in combination with
	-- gtk_label_get_layout_offsets(). The returned layout is owned by
	-- the label so need not be freed by the caller.
	

	is_line_wrapped: BOOLEAN
			-- Is the lines of the label automatically wrapped? 
		do
			Result:=(gtk_label_get_line_wrap(handle)).to_boolean
		end

	selection_bounds: TUPLE[BOOLEAN,INTEGER,INTEGER]
			-- the selected range of characters in the label, with the
			-- format: [`is_non_empty', `a_start', `an_end'] `a_start',
			-- the start of selection, as a character offset; `an_end'
			-- the end of selection, as a character offset. 
		local is_non_empty, a_start, an_end: INTEGER
		do
			is_non_empty:=(gtk_label_get_selection_bounds (handle, $a_start, $an_end))
		end

feature {ANY} -- Markup
	use_markup
			-- Signal that the text of the label contains markup in
			-- Pango's text markup language. See `set_markup'.
		do
			gtk_label_set_use_markup (handle,1)
		end

	dont_use_markup
			-- Signal that the text of the label does not contain markup in
			-- Pango's text markup language. 
		do
			gtk_label_set_use_markup (handle,0)
		end

	is_marked_up: BOOLEAN
			-- Is the label's text interpreted as marked up with the Pango
			-- text markup language?. See `set_use_markup'.
		do
			Result:=(gtk_label_get_use_markup(handle)).to_boolean
		end

feature {ANY} -- Underline indicating mnemonic
	is_underline_used: BOOLEAN
		-- Does an embedded underline indicate a mnemonic in the label? See `set_use_underline'.
		do
			Result:=(gtk_label_get_use_underline(handle)).to_boolean
		end

	use_underline
			-- Puts an underline in the text indicating the next
			-- character used for the mnemonic accelerator key.
		do
			gtk_label_set_use_underline(handle,1)
		end

	use_no_underline
			-- Remove the undeline that indicates the character used for
			-- the mnemonic accelerator key.
		do
			gtk_label_set_use_underline(handle,1)
		end

feature {ANY} -- single line mode
	is_mode_single_line_mode: BOOLEAN
			-- Is  the label in single line mode?
		do
			Result:=(gtk_label_get_single_line_mode(handle)).to_boolean
		end

	set_single_line_mode
			-- Puts the label in single line mode.
		do
			gtk_label_set_single_line_mode  (handle,1)
		end
	
	set_multi_line_mode
			-- Puts the label in multi line mode.
		do
			gtk_label_set_single_line_mode  (handle,0)
		end

feature {ANY} -- Angle
	angle: REAL
			-- The angle of rotation for the label. See `set_angle'.
		do
			Result:=gtk_label_get_angle(handle)
		end
	
	set_angle (an_angle: REAL)
			-- Sets the angle of rotation for the label. An angle of 90
			-- reads from from bottom to top, an angle of 270, from top
			-- to bottom. The angle setting for the label is ignored if
			-- the label is selectable, wrapped, or ellipsized.
		do
			gtk_label_set_angle (handle, an_angle)
		end

feature {ANY} -- Property Details
-- The "angle" property

--   "angle"                gdouble               : Read / Write

-- The angle that the baseline of the label makes with the horizontal, in degrees, measured counterclockwise. An angle of 90 reads from from bottom to top, an angle of 270, from top to bottom. Ignored if the label is selectable, wrapped, or ellipsized.

-- Allowed values: [0,360]

-- Default value: 0

-- Since 2.6
-- The "attributes" property

--   "attributes"           PangoAttrList         : Read / Write

-- A list of style attributes to apply to the text of the label.
-- The "cursor-position" property

--   "cursor-position"      gint                  : Read

-- The current position of the insertion cursor in chars.

-- Allowed values: >= 0

-- Default value: 0
-- The "ellipsize" property

--   "ellipsize"            PangoEllipsizeMode    : Read / Write

-- The preferred place to ellipsize the string, if the label does not have enough room to display the entire string, specified as a PangoEllisizeMode.

-- Note that setting this property to a value other than PANGO_ELLIPSIZE_NONE has the side-effect that the label requests only enough space to display the ellipsis "...". In particular, this means that ellipsizing labels don't work well in notebook tabs, unless the tab's ::tab-expand property is set to TRUE. Other means to set a label's width are gtk_widget_set_size_request() and gtk_label_set_width_chars().

-- Default value: PANGO_ELLIPSIZE_NONE

-- Since 2.6
-- The "justify" property

--   "justify"              GtkJustification      : Read / Write

-- The alignment of the lines in the text of the label relative to each other. This does NOT affect the alignment of the label within its allocation. See GtkMisc::xalign for that.

-- Default value: GTK_JUSTIFY_LEFT
-- The "label" property

--   "label"                gchararray            : Read / Write

-- The text of the label.

-- Default value: NULL
-- The "max-width-chars" property

--   "max-width-chars"      gint                  : Read / Write

-- The desired maximum width of the label, in characters. If this property is set to -1, the width will be calculated automatically, otherwise the label will request space for no more than the requested number of characters. If the width-chars property is set to a positive value, then the max-width-chars property is ignored.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "mnemonic-keyval" property

--   "mnemonic-keyval"      guint                 : Read

-- The mnemonic accelerator key for this label.

-- Default value: 16777215
-- The "mnemonic-widget" property

--   "mnemonic-widget"      GtkWidget             : Read / Write

-- The widget to be activated when the label's mnemonic key is pressed.
-- The "pattern" property

--   "pattern"              gchararray            : Write

-- A string with _ characters in positions correspond to characters in the text to underline.

-- Default value: NULL
-- The "selectable" property

--   "selectable"           gboolean              : Read / Write

-- Whether the label text can be selected with the mouse.

-- Default value: FALSE
-- The "selection-bound" property

--   "selection-bound"      gint                  : Read

-- The position of the opposite end of the selection from the cursor in chars.

-- Allowed values: >= 0

-- Default value: 0
-- The "single-line-mode" property

--   "single-line-mode"     gboolean              : Read / Write

-- Whether the label is in single line mode. In single line mode, the height of the label does not depend on the actual text, it is always set to ascent + descent of the font. This can be an advantage in situations where resizing the label because of text changes would be distracting, e.g. in a statusbar.

-- Default value: FALSE

-- Since 2.6
-- The "use-markup" property

--   "use-markup"           gboolean              : Read / Write

-- The text of the label includes XML markup. See pango_parse_markup().

-- Default value: FALSE
-- The "use-underline" property

--   "use-underline"        gboolean              : Read / Write

-- If set, an underline in the text indicates the next character should be used for the mnemonic accelerator key.

-- Default value: FALSE
-- The "width-chars" property

--   "width-chars"          gint                  : Read / Write

-- The desired width of the label, in characters. If this property is set to -1, the width will be calculated automatically, otherwise the label will request either 3 characters or the property value, whichever is greater. If the width-chars property is set to a positive value, then the max-width-chars property is ignored.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "wrap" property

--   "wrap"                 gboolean              : Read / Write

-- If set, wrap lines if the text becomes too wide.

-- Default value: FALSE
-- Signal Details
-- The "copy-clipboard" signal

-- void        user_function                  (GtkLabel *label,
-- 														  gpointer  user_data)      : Run last / Action

-- label : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "move-cursor" signal

-- void        user_function                  (GtkLabel       *label,
-- 														  GtkMovementStep arg1,
-- 														  gint            arg2,
-- 														  gboolean        arg3,
-- 														  gpointer        user_data)      : Run last / Action

-- label : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- arg3 : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "populate-popup" signal

-- void        user_function                  (GtkLabel *label,
-- 														  GtkMenu  *arg1,
-- 														  gpointer  user_data)      : Run last

-- label : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkLabel)"
		end
end
