note
	description: "GtkCellRendererText Renders text in a cell."
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

class GTK_CELL_RENDERER_TEXT
	-- A GtkCellRendererText renders a given text in its cell, using
	-- the font, color and style information provided by its
	-- properties. The text will be ellipsized if it is too long and
	-- the ellipsize property allows it.

	-- If the mode is GTK_CELL_RENDERER_MODE_EDITABLE, the
	-- GtkCellRendererText allows to edit its text using an entry.

inherit GTK_CELL_RENDERER

insert
	PANGO_STYLE
	GTK_CELL_RENDERER_TEXT_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererText)"
		end

feature {} -- Creation

	make is
			-- Creates a new GtkCellRendererText. Adjust how text is
			-- drawn using object properties. Object properties can be
			-- set globally (with `G_OBJECT.set'). Also, with
			-- GtkTreeViewColumn, you can bind a property to a value in a
			-- GtkTreeModel. For example, you can bind the "text"
			-- property on the cell renderer to a string value in the
			-- model, thus rendering a different string in each row of
			-- the GtkTreeView
		do
			from_external_pointer (gtk_cell_renderer_text_new)
		end

feature {ANY}
	set_fixed_height_from_font (number_of_rows: INTEGER) is
			-- Sets the height of a renderer to explicitly be determined
			-- by the "font" and "y_pad" property set on it. Further
			-- changes in these properties do not affect the height, so
			-- they must be accompanied by a subsequent call to this
			-- function. Using this function is unflexible, and should
			-- really only be used if calculating the size of a cell is
			-- too slow (ie, a massive number of cells displayed). If
			-- number_of_rows is -1, then the fixed height is unset, and
			-- the height is determined by the properties again.
		require valid_number_of_rows: number_of_rows >= -1
		do
			gtk_cell_renderer_text_set_fixed_height_from_font (handle,number_of_rows)
		end

feature {ANY} -- Property Details
-- The "attributes" property

--   "attributes"           PangoAttrList         : Read / Write

-- A list of style attributes to apply to the text of the renderer.
-- The "background" property

--   "background"           gchararray            : Write

-- Background color as a string.

-- Default value: NULL
-- The "background-gdk" property

--   "background-gdk"       GdkColor              : Read / Write

-- Background color as a GdkColor.
-- The "background-set" property

--   "background-set"       gboolean              : Read / Write

-- Whether this tag affects the background color.

-- Default value: FALSE
-- The "editable" property

--   "editable"             gboolean              : Read / Write

-- Whether the text can be modified by the user.

-- Default value: FALSE
-- The "editable-set" property

--   "editable-set"         gboolean              : Read / Write

-- Whether this tag affects text editability.

-- Default value: FALSE
-- The "ellipsize" property

--   "ellipsize"            PangoEllipsizeMode    : Read / Write

-- Specifies the preferred place to ellipsize the string, if the cell renderer does not have enough room to display the entire string. Setting it to PANGO_ELLIPSIZE_NONE turns off ellipsizing. See the wrap-width property for another way of making the text fit into a given width.

-- Default value: PANGO_ELLIPSIZE_NONE

-- Since 2.6
-- The "ellipsize-set" property

--   "ellipsize-set"        gboolean              : Read / Write

-- Whether this tag affects the ellipsize mode.

-- Default value: FALSE
-- The "family" property

--   "family"               gchararray            : Read / Write

-- Name of the font family, e.g. Sans, Helvetica, Times, Monospace.

-- Default value: NULL
-- The "family-set" property

--   "family-set"           gboolean              : Read / Write

-- Whether this tag affects the font family.

-- Default value: FALSE
-- The "font" property

--   "font"                 gchararray            : Read / Write

-- Font description as a string.

-- Default value: NULL
-- The "font-desc" property

--   "font-desc"            PangoFontDescription  : Read / Write

-- Font description as a PangoFontDescription struct.
-- The "foreground" property

--   "foreground"           gchararray            : Write

-- Foreground color as a string.

-- Default value: NULL
-- The "foreground-gdk" property

--   "foreground-gdk"       GdkColor              : Read / Write

-- Foreground color as a GdkColor.
-- The "foreground-set" property

--   "foreground-set"       gboolean              : Read / Write

-- Whether this tag affects the foreground color.

-- Default value: FALSE
-- The "language" property

--   "language"             gchararray            : Read / Write

-- The language this text is in, as an ISO code. Pango can use this as a hint when rendering the text. If you don't understand this parameter, you probably don't need it.

-- Default value: NULL
-- The "language-set" property

--   "language-set"         gboolean              : Read / Write

-- Whether this tag affects the language the text is rendered as.

-- Default value: FALSE
-- The "markup" property

--   "markup"               gchararray            : Write

-- Marked up text to render.

-- Default value: NULL
-- The "rise" property

--   "rise"                 gint                  : Read / Write

-- Offset of text above the baseline (below the baseline if rise is negative).

-- Allowed values: >= -2147483647

-- Default value: 0
-- The "rise-set" property

--   "rise-set"             gboolean              : Read / Write

-- Whether this tag affects the rise.

-- Default value: FALSE
-- The "scale" property

--   "scale"                gdouble               : Read / Write

-- Font scaling factor.

-- Allowed values: >= 0

-- Default value: 1
-- The "scale-set" property

--   "scale-set"            gboolean              : Read / Write

-- Whether this tag scales the font size by a factor.

-- Default value: FALSE
-- The "single-paragraph-mode" property

--   "single-paragraph-mode" gboolean              : Read / Write

-- Whether or not to keep all text in a single paragraph.

-- Default value: FALSE
-- The "size" property

--   "size"                 gint                  : Read / Write

-- Font size.

-- Allowed values: >= 0

-- Default value: 0
-- The "size-points" property

--   "size-points"          gdouble               : Read / Write

-- Font size in points.

-- Allowed values: >= 0

-- Default value: 0
-- The "size-set" property

--   "size-set"             gboolean              : Read / Write

-- Whether this tag affects the font size.

-- Default value: FALSE
-- The "stretch" property

--   "stretch"              PangoStretch          : Read / Write

-- Font stretch.

-- Default value: PANGO_STRETCH_NORMAL
-- The "stretch-set" property

--   "stretch-set"          gboolean              : Read / Write

-- Whether this tag affects the font stretch.

-- Default value: FALSE
-- The "strikethrough" property

--   "strikethrough"        gboolean              : Read / Write

-- Whether to strike through the text.

-- Default value: FALSE
-- The "strikethrough-set" property

--   "strikethrough-set"    gboolean              : Read / Write

-- Whether this tag affects strikethrough.

-- Default value: FALSE

feature {ANY} -- The "style" property
	--   "style"                PangoStyle            : Read / Write

	style: INTEGER is
			-- Font style. Default value: PANGO_STYLE_NORMAL
		do
			Result:= property(style_property_name).integer
		ensure is_valid_pango_style (Result)
		end

	set_style (a_style: INTEGER) is
		require valid_style: is_valid_pango_style (a_style)
		do
			set_enum_property (style_property_name, a_style)
		end

feature {ANY} -- The "style-set" property
	--   "style-set"            gboolean              : Read / Write

	is_style_set: BOOLEAN is
			-- Does this tag affect the font style? Default value: False
		do
			Result:= boolean_property (style_set_property_name)
		end

	enable_style is
			-- Makes current tag affects the font style
		do
			set_boolean_property (style_set_property_name, True)
		ensure enabled: is_style_set
		end

	disable_style is
			-- Makes current tag not to affect the font style
		do
			set_boolean_property (style_set_property_name,False)
		ensure disabled: not is_style_set
		end

feature {ANY} -- The "text" property
	--   "text"                 gchararray            : Read / Write
	-- Default value: NULL

	text: STRING is
			-- Text to render.
		do
			--create Result.from_external (property (text_property_name).string)
			Result := property (text_property_name).string
		end

	set_text (a_text: STRING) is
		require text_not_void: a_text /= Void
		do
			set_property (text_property_name, create {G_VALUE}.from_string (a_text))
		ensure set: text.is_equal (a_text)
		end


feature {ANY} -- The "underline" property

--   "underline"            PangoUnderline        : Read / Write

-- Style of underline for this text.

-- Default value: PANGO_UNDERLINE_NONE
-- The "underline-set" property

--   "underline-set"        gboolean              : Read / Write

-- Whether this tag affects underlining.

-- Default value: FALSE
-- The "variant" property

--   "variant"              PangoVariant          : Read / Write

-- Font variant.

-- Default value: PANGO_VARIANT_NORMAL
-- The "variant-set" property

--   "variant-set"          gboolean              : Read / Write

-- Whether this tag affects the font variant.

-- Default value: FALSE
-- The "weight" property

--   "weight"               gint                  : Read / Write

-- Font weight.

-- Allowed values: >= 0

-- Default value: 400
-- The "weight-set" property

--   "weight-set"           gboolean              : Read / Write

-- Whether this tag affects the font weight.

-- Default value: FALSE
-- The "width-chars" property

--   "width-chars"          gint                  : Read / Write

-- The desired width of the cell, in characters. If this property is set to -1, the width will be calculated automatically, otherwise the cell will request either 3 characters or the property value, whichever is greater.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
-- The "wrap-mode" property

--   "wrap-mode"            PangoWrapMode         : Read / Write

-- Specifies how to break the string into multiple lines, if the cell renderer does not have enough room to display the entire string. This property has no effect unless the wrap-width property is set.

-- Default value: PANGO_WRAP_CHAR

-- Since 2.8
-- The "wrap-width" property

--   "wrap-width"           gint                  : Read / Write

-- Specifies the width at which the text is wrapped. The wrap-mode property can be used to influence at what character positions the line breaks can be placed. Setting wrap-width to -1 turns wrapping off.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.8

feature {ANY} -- "edited"

	edited_signal_name: STRING is "edited"
		-- "edited"
		-- void        user_function                  (GtkCellRendererText *cellrenderertext,
		--                                             gchar *arg1,
		--                                             gchar *arg2,
		--                                             gpointer user_data);

	enable_on_edited is
			-- Connects "edited" signal to `on_edited' feature.
		do
			connect (Current, edited_signal_name, $on_edited)
		end

	on_edited: INTEGER is
		do
		end

	connect_agent_to_edited_signal (a_procedure: PROCEDURE[ANY, TUPLE [STRING, STRING, GTK_CELL_RENDERER_TEXT]]) is
			-- cellrenderertext : 	the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			edited_callback: EDITED_CALLBACK
		do
			create edited_callback.make
			edited_callback.connect (Current, a_procedure)
		end

feature {ANY} -- Properties name strings

	alignment_property_name: STRING is "alignment"
	attributes_property_name: STRING is "attributes"
	background_property_name: STRING is "background"
	background_gdk_property_name: STRING is "background-gdk"
	background_set_property_name: STRING is "background-set"
	editable_property_name: STRING is "editable"
	editable_set_property_name: STRING is "editable-set"
	ellipsize_property_name: STRING is "ellipsize"
	ellipsize_set_property_name: STRING is "ellipsize-set"
	family_property_name: STRING is "family"
	family_set_property_name: STRING is "family-set"
	font_property_name: STRING is "font"
	font_desc_property_name: STRING is "font-desc"
	foreground_property_name: STRING is "foreground"
	foreground_gdk_property_name: STRING is "foreground-gdk"
	foreground_set_property_name: STRING is "foreground-set"
	language_property_name: STRING is "language"
	language_set_property_name: STRING is "language-set"
	markup_property_name: STRING is "markup"
	rise_property_name: STRING is "rise"
	rise_set_property_name: STRING is "rise-set"
	scale_property_name: STRING is "scale"
	scale_set_property_name: STRING is "scale-set"
	single_paragraph_mode_property_name: STRING is "single-paragraph-mode"
	size_property_name: STRING is "size"
	size_points_property_name: STRING is "size-points"
	size_set_property_name: STRING is "size-set"
	stretch_property_name: STRING is "stretch"
	stretch_set_property_name: STRING is "stretch-set"
	strikethrough_property_name: STRING is "strikethrough"
	strikethrough_set_property_name: STRING is "strikethrough-set"
	style_property_name: STRING is "style"
	style_set_property_name: STRING is "style-set"
	text_property_name: STRING is "text"
	underline_property_name: STRING is "underline"
	underline_set_property_name: STRING is "underline-set"
	variant_property_name: STRING is "variant"
	variant_set_property_name: STRING is "variant-set"
	weight_property_name: STRING is "weight"
	weight_set_property_name: STRING is "weight-set"
	width_chars_property_name: STRING is "width-chars"
	wrap_mode_property_name: STRING is "wrap-mode"
	wrap_width_property_name: STRING is "wrap-width"

end -- class GTK_CELL_RENDERER_TEXT
