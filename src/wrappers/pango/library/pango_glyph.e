indexing
	description: "Glyph Storage -- Structures for storing information about glyphs"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, pango team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class PANGO_GLYPH
	-- TODO: largely unimplemented.

inherit WRAPPER_HANDLER

feature {ANY} 
--  #define     PANGO_SCALE
--  #define     PANGO_PIXELS                    (d)
--  #define     PANGO_PIXELS_FLOOR              (d)
--  #define     PANGO_PIXELS_CEIL               (d)
--              PangoRectangle;
--  #define     PANGO_ASCENT                    (rect)
--  #define     PANGO_DESCENT                   (rect)
--  #define     PANGO_LBEARING                  (rect)
--  #define     PANGO_RBEARING                  (rect)

--  typedef     PangoGlyph;
--  #define     PANGO_GLYPH_EMPTY
--  #define     PANGO_GLYPH_UNKNOWN_FLAG
--  #define     PANGO_GET_UNKNOWN_GLYPH         (wc)
--              PangoGlyphInfo;
--              PangoGlyphGeometry;
--  typedef     PangoGlyphUnit;
--              PangoGlyphVisAttr;
--              PangoGlyphString;
--              PangoGlyphItem;
--  #define     PANGO_TYPE_GLYPH_STRING
--  PangoGlyphString* pango_glyph_string_new    (void);
--  PangoGlyphString* pango_glyph_string_copy   (PangoGlyphString *string);
--  void        pango_glyph_string_set_size     (PangoGlyphString *string,
--                                               gint new_len);
--  void        pango_glyph_string_free         (PangoGlyphString *string);
--  void        pango_glyph_string_extents      (PangoGlyphString *glyphs,
--                                               PangoFont *font,
--                                               PangoRectangle *ink_rect,
--                                               PangoRectangle *logical_rect);
--  void        pango_glyph_string_extents_range
--                                              (PangoGlyphString *glyphs,
--                                               int start,
--                                               int end,
--                                               PangoFont *font,
--                                               PangoRectangle *ink_rect,
--                                               PangoRectangle *logical_rect);
--  int         pango_glyph_string_get_width    (PangoGlyphString *glyphs);
--  void        pango_glyph_string_index_to_x   (PangoGlyphString *glyphs,
--                                               char *text,
--                                               int length,
--                                               PangoAnalysis *analysis,
--                                               int index_,
--                                               gboolean trailing,
--                                               int *x_pos);
--  void        pango_glyph_string_x_to_index   (PangoGlyphString *glyphs,
--                                               char *text,
--                                               int length,
--                                               PangoAnalysis *analysis,
--                                               int x_pos,
--                                               int *index_,
--                                               int *trailing);
--  void        pango_glyph_string_get_logical_widths
--                                              (PangoGlyphString *glyphs,
--                                               const char *text,
--                                               int length,
--                                               int embedding_level,
--                                               int *logical_widths);
--  PangoGlyphItem* pango_glyph_item_split      (PangoGlyphItem *orig,
--                                               const char *text,
--                                               int split_index);
--  GSList*     pango_glyph_item_apply_attrs    (PangoGlyphItem *glyph_item,
--                                               const char *text,
--                                               PangoAttrList *list);
--  void        pango_glyph_item_letter_space   (PangoGlyphItem *glyph_item,
--                                               const char *text,
--                                               PangoLogAttr *log_attrs,
--                                               int letter_spacing);
--  void        pango_glyph_item_free           (PangoGlyphItem *glyph_item);


-- Description

--    pango_shape() produces a string of glyphs which can be measured or drawn
--    to the screen. The following structures are used to store information
--    about glyphs.

-- Details

--   PANGO_SCALE

--  #define PANGO_SCALE 1024

--    The PANGO_SCALE macro represents the scale between dimensions used for
--    Pango distances and device units. (The definition of device units is
--    dependent on the output device; it will typically be pixels for a screen,
--    and points for a printer.) PANGO_SCALE is currently 1024, but this may be
--    changed in the future.

--    When setting font sizes, device units are always considered to be points
--    (as in "12 point font"), rather than pixels.

--    --------------------------------------------------------------------------

--   PANGO_PIXELS()

--  #define PANGO_PIXELS(d) (((int)(d) + 512) >> 10)

--    Converts a dimension to device units by rounding.

--    d : a dimension in Pango units.

--    --------------------------------------------------------------------------

--   PANGO_PIXELS_FLOOR()

--  #define PANGO_PIXELS_FLOOR(d) (((int)(d)) >> 10)

--    Converts a dimension to device units by flooring.

--    d : a dimension in Pango units.

--    --------------------------------------------------------------------------

--   PANGO_PIXELS_CEIL()

--  #define PANGO_PIXELS_CEIL(d) (((int)(d) + 1023) >> 10)

--    Converts a dimension to device units by ceiling.

--    d : a dimension in Pango units.

--    --------------------------------------------------------------------------

--   PangoRectangle

--  typedef struct {
--    int x;
--    int y;
--    int width;
--    int height;
--  } PangoRectangle;

--    The PangoRectangle structure represents a rectangle. It is frequently used
--    to represent the logical or ink extents of a single glyph or section of
--    text. (See, for instance, pango_font_get_glyph_extents())

--    int x;      X coordinate of the left side of the rectangle.
--    int y;      Y coordinate of the the top side of the rectangle.
--    int width;  width of the rectangle.
--    int height; height of the rectangle.

--    --------------------------------------------------------------------------

--   PANGO_ASCENT()

--  #define PANGO_ASCENT(rect) (-(rect).y)

--    Extracts the ascent from a PangoRectangle representing glyph extents. The
--    ascent is the distance from the baseline to the highest point of the
--    character. This is positive if the glyph ascends above the baseline.

--    rect : a PangoRectangle

--    --------------------------------------------------------------------------

--   PANGO_DESCENT()

--  #define PANGO_DESCENT(rect) ((rect).y + (rect).height)

--    Extracts the descent from a PangoRectangle representing glyph extents. The
--    descent is the distance from the baseline to the lowest point of the
--    character. This is positive if the glyph descends below the baseline.

--    rect : a PangoRectangle

--    --------------------------------------------------------------------------

--   PANGO_LBEARING()

--  #define PANGO_LBEARING(rect) ((rect).x)

--    Extracts the left bearing from a PangoRectangle representing glyph
--    extents. The left bearing is the distance from the horizontal origin to
--    the farthest left point of the character. This is positive for characters
--    drawn completely to the right of the glyph origin.

--    rect : a PangoRectangle

--    --------------------------------------------------------------------------

--   PANGO_RBEARING()

--  #define PANGO_RBEARING(rect) ((rect).x + (rect).width)

--    Extracts the right bearing from a PangoRectangle representing glyph
--    extents. The right bearing is the distance from the horizontal origin to
--    the farthest right point of the character. This is positive except for
--    characters drawn completely to the left of the horizontal origin.

--    rect : a PangoRectangle

--    --------------------------------------------------------------------------


	pango_glyph: like empty_pango_glyph is
			-- A PangoGlyph represents a single glyph in the output form
			-- of a string. This feature is a placeholder for anchored
			-- declarations.

			-- In C "typedef guint32 PangoGlyph;" so...

			--  TODO: should be -- a NATURAL_32
		do
		end

   empty_pango_glyph: INTEGER_32 is
			-- The PANGO_GLYPH_EMPTY macro represents a PangoGlyph value
			-- that has a special meaning, which is a zero-width empty
			-- glyph. This is useful for example in shaper modules, to
			-- use as the glyph for various zero-width Unicode characters
			-- (those passing pango_is_zero_width()).

			--  #define PANGO_GLYPH_EMPTY ((PangoGlyph)0x0FFFFFFF)
		external "C macro use <pango/pango.h>"
		alias "PANGO_GLYPH_EMPTY"
		end

	--   PANGO_GLYPH_UNKNOWN_FLAG

	--  #define PANGO_GLYPH_UNKNOWN_FLAG    ((PangoGlyph)0x10000000)

	--    The PANGO_GLYPH_UNKNOWN_FLAG macro is a flag value that can be added to a
	--    gunichar value of a valid Unicode character, to produce a PangoGlyph
	--    value, representing an unknown-character glyph for the respective
	--    gunichar.

	--    --------------------------------------------------------------------------

	--   PANGO_GET_UNKNOWN_GLYPH()

	--  #define PANGO_GET_UNKNOWN_GLYPH(wc) ((PangoGlyph)(wc)|PANGO_GLYPH_UNKNOWN_FLAG)

	--    Returns a PangoGlyph value that means no glyph was found for wc. The way
	--    this unknown glyphs are rendered is backend specific. For example, a box
	--    with the hexadecimal Unicode code-point of the character written in it is
	--    what is done in the most common backends.

	--    wc : a Unicode character

	--    --------------------------------------------------------------------------

	--   PangoGlyphInfo

	--  typedef struct {
	--    PangoGlyph    glyph;
	--    PangoGlyphGeometry geometry;
	--    PangoGlyphVisAttr  attr;
	--  } PangoGlyphInfo;

	--    The PangoGlyphInfo structure represents a single glyph together with
	--    positioning information and visual attributes. It contains the following
	--    fields.

	--    PangoGlyph glyph;            the glyph itself.
	--    PangoGlyphGeometry geometry; the positional information about the glyph.
	--    PangoGlyphVisAttr attr;      the visual attributes of the glyph.

	--    --------------------------------------------------------------------------

	--   PangoGlyphGeometry

	--  typedef struct {
	--    PangoGlyphUnit width;
	--    PangoGlyphUnit x_offset;
	--    PangoGlyphUnit y_offset;
	--  } PangoGlyphGeometry;

	--    The PangoGlyphGeometry structure contains width and positioning
	--    information for a single glyph.

	--    PangoGlyphUnit width;    the logical width to use for the the character.
	--    PangoGlyphUnit x_offset; horizontal offset from nominal character
	--                             position.
	--    PangoGlyphUnit y_offset; vertical offset from nominal character position.

	--    --------------------------------------------------------------------------

	--   PangoGlyphUnit

	--  typedef gint32 PangoGlyphUnit;

	--    The PangoGlyphUnit type is used to store dimensions within Pango.
	--    Dimensions are stored in 1/PANGO_SCALE of a device unit. (A device unit
	--    might be a pixel for screen display, or a point on a printer.) PANGO_SCALE
	--    is currently 1024, and may change in the future (unlikely though), but you
	--    should not depend on its exact value. The PANGO_PIXELS() macro can be used
	--    to convert from glyph units into device units with correct rounding.

	--    --------------------------------------------------------------------------

	--   PangoGlyphVisAttr

	--  typedef struct {
	--    guint is_cluster_start : 1;
	--  } PangoGlyphVisAttr;

	--    The PangoGlyphVisAttr is used to communicate information between the
	--    shaping phase and the rendering phase. More attributes may be added in the
	--    future.

	--    guint is_cluster_start : 1; set for the first logical glyph in each
	--                                cluster. (Clusters are stored in visual order,
	--                                within the cluster, glyphs are always ordered
	--                                in logical order, since visual order is
	--                                meaningless; that is, in Arabic text, accent
	--                                glyphs follow the glyphs for the base
	--                                character.)

	--    --------------------------------------------------------------------------

	--   PangoGlyphString

	--  typedef struct {
	--    gint num_glyphs;

	--    PangoGlyphInfo *glyphs;

	--    /* This is a memory inefficient way of representing the information
	--     * here - each value gives the byte index within the text
	--     * corresponding to the glyph string of the start of the cluster to
	--     * which the glyph belongs.
	--     */
	--    gint *log_clusters;
	--  } PangoGlyphString;

	--    The PangoGlyphString structure is used to store strings of glyphs with
	--    geometry and visual attribute information. The storage for the glyph
	--    information is owned by the structure which simplifies memory management.

	--    gint num_glyphs;        the number of glyphs in the string.
	--    PangoGlyphInfo *glyphs; an array of PangoGlyphInfo structures of length
	--                            num_glyphs.
	--    gint *log_clusters;     for each glyph, byte index of the starting
	--                            character for the cluster. The indices are
	--                            relative to the start of the text corresponding to
	--                            the PangoGlyphString.

	--    --------------------------------------------------------------------------

	--   PangoGlyphItem

	--  typedef struct {
	--    PangoItem        *item;
	--    PangoGlyphString *glyphs;
	--  } PangoGlyphItem;

	--    A PangoGlyphItem is a pair of a PangoItem and the glyphs resulting from
	--    shaping the text corresponding to an item. As an example of the usage of
	--    PangoGlyphItem, the results of shaping text with PangoLayout is a list of
	--    PangoLayoutLine, each of which contains a list of PangoGlyphItem.

	--    PangoItem *item;          a PangoItem structure that provides information
	--                              about a segment of text.
	--    PangoGlyphString *glyphs; the glyphs obtained by shaping the text
	--                              corresponding to item.

	--    --------------------------------------------------------------------------

	--   PANGO_TYPE_GLYPH_STRING

	--  #define PANGO_TYPE_GLYPH_STRING (pango_glyph_string_get_type ())

	--    The GObject type for PangoGlyphString.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_new ()

	--  PangoGlyphString* pango_glyph_string_new    (void);

	--    Create a new PangoGlyphString.

	--    Returns : the newly allocated PangoGlyphString, which should be freed with
	--              pango_glyph_string_free().

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_copy ()

	--  PangoGlyphString* pango_glyph_string_copy   (PangoGlyphString *string);

	--    Copy a glyph string and associated storage.

	--    string :  a PangoGlyphString.
	--    Returns : the newly allocated PangoGlyphString, which should be freed with
	--              pango_glyph_string_free().

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_set_size ()

	--  void        pango_glyph_string_set_size     (PangoGlyphString *string,
	--                                               gint new_len);

	--    Resize a glyph string to the given length.

	--    string :  a PangoGlyphString.
	--    new_len : the new length of the string.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_free ()

	--  void        pango_glyph_string_free         (PangoGlyphString *string);

	--    Free a glyph string and associated storage.

	--    string : a PangoGlyphString.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_extents ()

	--  void        pango_glyph_string_extents      (PangoGlyphString *glyphs,
	--                                               PangoFont *font,
	--                                               PangoRectangle *ink_rect,
	--                                               PangoRectangle *logical_rect);

	--    Compute the logical and ink extents of a glyph string. See the
	--    documentation for pango_font_get_glyph_extents() for details about the
	--    interpretation of the rectangles.

	--    glyphs :       a PangoGlyphString
	--    font :         a PangoFont
	--    ink_rect :     rectangle used to store the extents of the glyph string as
	--                   drawn or NULL to indicate that the result is not needed.
	--    logical_rect : rectangle used to store the logical extents of the glyph
	--                   string or NULL to indicate that the result is not needed.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_extents_range ()

	--  void        pango_glyph_string_extents_range
	--                                              (PangoGlyphString *glyphs,
	--                                               int start,
	--                                               int end,
	--                                               PangoFont *font,
	--                                               PangoRectangle *ink_rect,
	--                                               PangoRectangle *logical_rect);

	--    Computes the extents of a sub-portion of a glyph string. The extents are
	--    relative to the start of the glyph string range (the origin of their
	--    coordinate system is at the start of the range, not at the start of the
	--    entire glyph string).

	--    glyphs :       a PangoGlyphString
	--    start :        start index
	--    end :          end index (the range is the set of bytes with indices such
	--                   that start <= index < end)
	--    font :         a PangoFont
	--    ink_rect :     rectangle used to store the extents of the glyph string
	--                   range as drawn or NULL to indicate that the result is not
	--                   needed.
	--    logical_rect : rectangle used to store the logical extents of the glyph
	--                   string range or NULL to indicate that the result is not
	--                   needed.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_get_width ()

	--  int         pango_glyph_string_get_width    (PangoGlyphString *glyphs);

	--    Computes the logical width of the glyph string as can also be computed
	--    using pango_glyph_string_extents(). However, since this only computes the
	--    width, it's much faster. This is in fact only a convenience function that
	--    computes the sum of geometry.width for each glyph in the glyphs.

	--    glyphs :  a PangoGlyphString
	--    Returns : the logical width of the glyph string.

	--    Since 1.14

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_index_to_x ()

	--  void        pango_glyph_string_index_to_x   (PangoGlyphString *glyphs,
	--                                               char *text,
	--                                               int length,
	--                                               PangoAnalysis *analysis,
	--                                               int index_,
	--                                               gboolean trailing,
	--                                               int *x_pos);

	--    Converts from character position to x position. (X position is measured
	--    from the left edge of the run). Character positions are computed by
	--    dividing up each cluster into equal portions.

	--    glyphs :   the glyphs return from pango_shape()
	--    text :     the text for the run
	--    length :   the number of bytes (not characters) in text.
	--    analysis : the analysis information return from pango_itemize()
	--    index_ :   the byte index within text
	--    trailing : whether we should compute the result for the beginning or end
	--               of the character.
	--    x_pos :    location to store result

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_x_to_index ()

	--  void        pango_glyph_string_x_to_index   (PangoGlyphString *glyphs,
	--                                               char *text,
	--                                               int length,
	--                                               PangoAnalysis *analysis,
	--                                               int x_pos,
	--                                               int *index_,
	--                                               int *trailing);

	--    Convert from x offset to character position. Character positions are
	--    computed by dividing up each cluster into equal portions. In scripts where
	--    positioning within a cluster is not allowed (such as Thai), the returned
	--    value may not be a valid cursor position; the caller must combine the
	--    result with the logical attributes for the text to compute the valid
	--    cursor position.

	--    glyphs :   the glyphs return from pango_shape()
	--    text :     the text for the run
	--    length :   the number of bytes (not characters) in text.
	--    analysis : the analysis information return from pango_itemize()
	--    x_pos :    the x offset (in PangoGlyphUnit)
	--    index_ :   location to store calculated byte index within text
	--    trailing : location to store a integer indicating where whether the user
	--               clicked on the leading or trailing edge of the character.

	--    --------------------------------------------------------------------------

	--   pango_glyph_string_get_logical_widths ()

	--  void        pango_glyph_string_get_logical_widths
	--                                              (PangoGlyphString *glyphs,
	--                                               const char *text,
	--                                               int length,
	--                                               int embedding_level,
	--                                               int *logical_widths);

	--    Given a PangoGlyphString resulting from pango_shape() and the
	--    corresponding text, determine the screen width corresponding to each
	--    character. When multiple characters compose a single cluster, the width of
	--    the entire cluster is divided equally among the characters.

	--    glyphs :          a PangoGlyphString
	--    text :            the text corresponding to the glyphs
	--    length :          the length of text, in bytes
	--    embedding_level : the embedding level of the string
	--    logical_widths :  an array whose length is g_utf8_strlen (text, length) to
	--                      be filled in with the resulting character widths.

	--    --------------------------------------------------------------------------

	--   pango_glyph_item_split ()

	--  PangoGlyphItem* pango_glyph_item_split      (PangoGlyphItem *orig,
	--                                               const char *text,
	--                                               int split_index);

	--    Modifies orig to cover only the text after split_index, and returns a new
	--    item that covers the text before split_index that used to be in orig. You
	--    can think of split_index as the length of the returned item. split_index
	--    may not be 0, and it may not be greater than or equal to the length of
	--    orig (that is, there must be at least one byte assigned to each item, you
	--    can't create a zero-length item).

	--    This function is similar in function to pango_item_split() (and uses it
	--    internally.)

	--    orig :        a PangoItem
	--    text :        text to which positions in orig apply
	--    split_index : byte index of position to split item, relative to the start
	--                  of the item
	--    Returns :     the newly allocated item representing text before
	--                  split_index, which should be freed with
	--                  pango_glyph_item_free().

	--    Since 1.2

	--    --------------------------------------------------------------------------

	--   pango_glyph_item_apply_attrs ()

	--  GSList*     pango_glyph_item_apply_attrs    (PangoGlyphItem *glyph_item,
	--                                               const char *text,
	--                                               PangoAttrList *list);

	--    Splits a shaped item (PangoGlyphItem) into multiple items based on an
	--    attribute list. The idea is that if you have attributes that don't affect
	--    shaping, such as color or underline, to avoid affecting shaping, you
	--    filter them out (pango_attr_list_filter()), apply the shaping process and
	--    then reapply them to the result using this function.

	--    All attributes that start or end inside a cluster are applied to that
	--    cluster; for instance, if half of a cluster is underlined and the
	--    other-half strikethough, then the cluster will end up with both underline
	--    and strikethrough attributes. In these cases, it may happen that
	--    item->extra_attrs for some of the result items can have multiple
	--    attributes of the same type.

	--    This function takes ownership of glyph_item; it will be reused as one of
	--    the elements in the list.

	--    glyph_item : a shaped item
	--    text :       text that list applies to
	--    list :       a PangoAttrList
	--    Returns :    a list of glyph items resulting from splitting glyph_item.
	--                 Free the elements using pango_glyph_item_free(), the list
	--                 using g_slist_free().

	--    Since 1.2

	--    --------------------------------------------------------------------------

	--   pango_glyph_item_letter_space ()

	--  void        pango_glyph_item_letter_space   (PangoGlyphItem *glyph_item,
	--                                               const char *text,
	--                                               PangoLogAttr *log_attrs,
	--                                               int letter_spacing);

	--    Adds spacing between the graphemes of glyph_item to give the effect of
	--    typographic letter spacing.

	--    glyph_item :     a PangoGlyphItem
	--    text :           text that glyph_item corresponds to
	--                     (glyph_item->item->offset is an offset from the start of
	--                     text)
	--    log_attrs :      logical attributes for the item (the first logical
	--                     attribute refers to the position before the first
	--                     character in the item)
	--    letter_spacing : amount of letter spacing to add in Pango units. May be
	--                     negative, though too large negative values will give ugly
	--                     results.

	--    Since 1.6

	--    --------------------------------------------------------------------------

	--   pango_glyph_item_free ()

	--  void        pango_glyph_item_free           (PangoGlyphItem *glyph_item);

	--    Frees a PangoGlyphItem and memory to which it points.

	--    glyph_item : a PangoGlyphItem

end -- PANGO_GLYPH
