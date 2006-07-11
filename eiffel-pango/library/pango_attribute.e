indexing
	description: "Text Attributes -- Font and other attributes for annotating text."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, Pango team
					
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

			-- Description: Attributed text is used in a number of places
			-- in Pango. It is used as the input to the itemization
			-- process and also when creating a PangoLayout. ThAe data
			-- types and functions in this section are used to represent
			-- and manipulate sets of attributes applied to a portion of
			-- text.


class PANGO_ATTRIBUTE
inherit SHARED_C_STRUCT redefine copy, is_equal, free end
insert PANGO_ATTR_TYPE
creation make, from_external_pointer

feature {} -- Creation

feature {} -- Unwrapped API
--   PANGO_TYPE_ATTR_TYPE

--  #define PANGO_TYPE_ATTR_TYPE (pango_attr_type_get_type())

--    The GObject type for PangoAttrType.

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrClass

--  typedef struct {
--    PangoAttrType type;
--    PangoAttribute * (*copy) (const PangoAttribute *attr);
--    void             (*destroy) (PangoAttribute *attr);
--    gboolean         (*equal) (const PangoAttribute *attr1, const PangoAttribute *attr2);
--  } PangoAttrClass;

--    The PangoAttrClass structure stores the type and operations for a particular type of attribute. The functions in this
--    structure should not be called directly. Instead, one should use the wrapper functions provided for PangoAttribute.

--    PangoAttrType type; the type ID for this attribute
--    copy ()             function to duplicate an attribute of this type (see pango_attribute_copy())
--    destroy ()          function to free an attribute of this type (see pango_attribute_destroy())
--    equal ()

--    ------------------------------------------------------------------------------------------------------------------------


feature {} --   PangoAttribute struct access

	-- The PangoAttribute structure represents the common portions of
	-- all attributes. Particular types of attributes include this
	-- structure as their initial portion. The common portion of the
	-- attribute holds the range to which the value in the
	-- type-specific part of the attribute applies.
	
	get_klass (an_attribute: POINTER): POINTER is 
			-- const PangoAttrClass *klass; the class structure holding
			-- information about the type of the attribute
		external "C struct PangoAttribute get klass use <pango/pango.h>"
		end

	get_start_index (an_attribute: POINTER): INTEGER is 
			-- guint start_index; the start index of the range (in bytes).
		external "C struct PangoAttribute get klass use <pango/pango.h>"
		end
	get_end_index (an_attribute: POINTER): INTEGER is
			-- guint end_index; end index of the range (in bytes). The
			-- character at this index is not included in the range.
		external "C struct PangoAttribute get klass use <pango/pango.h>"
		end

feature 
	-- TODO parse_markup 
	
	--  gboolean    pango_parse_markup              (const char *markup_text, int length, gunichar accel_marker, PangoAttrList **attr_list, char **text, gunichar *accel_char, GError **error);

	--    Parses marked-up text (see markup format) to create a plaintext string and an attribute list.
	
	--    If accel_marker is nonzero, the given character will mark the character following it as an accelerator. For example, the
	--    accel marker might be an ampersand or underscore. All characters marked as an accelerator will receive a
	--    PANGO_UNDERLINE_LOW attribute, and the first character so marked will be returned in accel_char. Two accel_marker
	--    characters following each other produce a single literal accel_marker character.
	
	--    markup_text :  markup to parse (see markup format)
	--    length :       length of markup_text, or -1 if nul-terminated
	--    accel_marker : character that precedes an accelerator, or 0 for none
	--    attr_list :    address of return location for a PangoAttrList, or NULL
	--    text :         address of return location for text with tags stripped, or NULL
	--    accel_char :   address of return location for accelerator char, or NULL
	--    error :        address of return location for errors, or NULL
	--    Returns :      FALSE if error is set, otherwise TRUE
	
	
	-- TODO:  pango_attr_type_register; is it needed for low level 
	-- code? Paolo 2006-07-10
	
	--  PangoAttrType pango_attr_type_register      (const gchar *name);
	
	--    Allocate a new attribute type ID.
	
	--    name :    an identifier for the type (currently unused.)
	--    Returns : the new type ID.
	
	--    ------------------------------------------------------------------------------------------------------------------------
	
	copy (another: like Current) is
			-- Make a copy of an attribute.
		do
			handle := (pango_attribute_copy (another.handle))
			-- pango_attribute_copy returns the newly allocated
			-- PangoAttribute, which should be freed with
			-- pango_attribute_destroy().
		end

	is_equal (another: like Current): BOOLEAN is
			-- Is `another' equals to Current? This compares only the
			-- actual value of the two attributes and not the ranges that
			-- the attributes apply to.
		do
			Result := pango_attribute_equal (handle, another.handle).to_boolean
		end

feature {} -- Implementation
	free (handle: POINTER) is
			-- Destroy a PangoAttribute and free all associated memory.
		do
			pango_attribute_destroy (handle)
			-- Note: could be easily optimized renaming
			-- pango_attribute_destroy as free. Paolo 2006-07-11
		end

--   enum PangoUnderline

--  typedef enum {
--    PANGO_UNDERLINE_NONE, PANGO_UNDERLINE_SINGLE, PANGO_UNDERLINE_DOUBLE, PANGO_UNDERLINE_LOW, PANGO_UNDERLINE_ERROR
--  } PangoUnderline;

--    the PangoUnderline enumeration is used to specify whether text should be underlined, and if so, the type of underlining.

--    PANGO_UNDERLINE_NONE   no underline should be drawn
--    PANGO_UNDERLINE_SINGLE a single underline should be drawn
--    PANGO_UNDERLINE_DOUBLE a double underline should be drawn
--    PANGO_UNDERLINE_LOW    a single underline should be drawn at a position beneath the ink extents of the text being
--                           underlined. This should be used only for underlining single characters, such as for keyboard
--                           accelerators. PANGO_UNDERLINE_SINGLE should be used for extended portions of text.
--    PANGO_UNDERLINE_ERROR  a wavy underline should be drawn below. This underline is typically used to indicate an error
--                           such as a possilble mispelling; in some cases a contrasting color may automatically be used. This
--                           type of underlining is available since Pango 1.4.

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_TYPE_UNDERLINE

--  #define PANGO_TYPE_UNDERLINE (pango_underline_get_type())

--    The GObject type for PangoUnderline.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_shape_new ()

--  PangoAttribute* pango_attr_shape_new        (const PangoRectangle *ink_rect, const PangoRectangle *logical_rect);

--    Create a new shape attribute. A shape is used to impose a particular ink and logical rect on the result of shaping a
--    particular glyph. This might be used, for instance, for embedding a picture or a widget inside a PangoLayout.

--    ink_rect :     ink rectangle to assign to each character
--    logical_rect : logical rectangle to assign to each character
--    Returns :      the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_shape_new_with_data ()

--  PangoAttribute* pango_attr_shape_new_with_data
--                                              (const PangoRectangle *ink_rect, const PangoRectangle *logical_rect, gpointer data, PangoAttrDataCopyFunc copy_func, GDestroyNotify destroy_func);

--    Like pango_attr_shape_new(), but a user data pointer is also provided; this pointer can be accessed when later rendering
--    the glyph.

--    ink_rect :     ink rectangle to assign to each character
--    logical_rect : logical rectangle to assign to each character
--    data :         user data pointer
--    copy_func :    function to copy data when the attribute is copied. If NULL, data is simply copied as a pointer.
--    destroy_func : function to free data when the attribute is freed, or NULL
--    Returns :      the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    Since 1.8

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrDataCopyFunc ()

--  gpointer    (*PangoAttrDataCopyFunc)        (gconstpointer data);

--    A copy function passed to attribute new functions that take user data.

--    data :    the user data
--    Returns : a new copy of data.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_scale_new ()

--  PangoAttribute* pango_attr_scale_new        (double scale_factor);

--    Create a new font size scale attribute. The base font for the affected text will have its size multiplied by
--    scale_factor.

--    scale_factor : factor to scale the font
--    Returns :      the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_fallback_new ()

--  PangoAttribute* pango_attr_fallback_new     (gboolean enable_fallback);

--    Create a new font fallback attribute.

--    If fallback is disabled, characters will only be used from the closest matching font on the system. No fallback will be
--    done to other fonts on the system that might contain the characters in the text.

--    enable_fallback : TRUE if we should fall back on other fonts for characters the active font is missing.
--    Returns :         the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    Since 1.4

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_XX_SMALL

--  #define PANGO_SCALE_XX_SMALL ((double)0.5787037037037)

--    The scale factor for three shrinking steps (1 / (1.2 * 1.2 * 1.2)).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_X_SMALL

--  #define PANGO_SCALE_X_SMALL  ((double)0.6444444444444)

--    The scale factor for two shrinking steps (1 / (1.2 * 1.2)).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_SMALL

--  #define PANGO_SCALE_SMALL    ((double)0.8333333333333)

--    The scale factor for one shrinking step (1 / 1.2).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_MEDIUM

--  #define PANGO_SCALE_MEDIUM   ((double)1.0)

--    The scale factor for normal size (1.0).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_LARGE

--  #define PANGO_SCALE_LARGE    ((double)1.2)

--    The scale factor for one magnification step (1.2).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_X_LARGE

--  #define PANGO_SCALE_X_LARGE  ((double)1.4399999999999)

--    The scale factor for two magnification steps (1.2 * 1.2).

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_SCALE_XX_LARGE

--  #define PANGO_SCALE_XX_LARGE ((double)1.728)

--    The scale factor for three magnification steps (1.2 * 1.2 * 1.2).

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_rise_new ()

--  PangoAttribute* pango_attr_rise_new         (int rise);

--    Create a new baseline displacement attribute.

--    rise :    the amount that the text should be displaced vertically, in Pango units. Positive values displace the text
--               upwards.
--    Returns : the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_letter_spacing_new ()

--  PangoAttribute* pango_attr_letter_spacing_new
--                                              (int letter_spacing);

--    Create a new letter-spacing attribute.

--    letter_spacing : amount of extra space to add between graphemes of the text, in Pango units.
--    Returns :        the newly allocated PangoAttribute, which should be freed with pango_attribute_destroy().

--    Since 1.6

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoColor

--  typedef struct {
--    guint16 red;
--    guint16 green;
--    guint16 blue;
--  } PangoColor;

--    The PangoColor structure is used to represent a color in an uncalibrated RGB colorspace.

--    guint16 red;   The red component of the color. This is a value between 0 and 65535, with 65535 indicating full
--                    intensity.
--    guint16 green; The green component of the color. This is a value between 0 and 65535, with 65535 indicating full
--                    intensity.
--    guint16 blue;  The blue component of the color. This is a value between 0 and 65535, with 65535 indicating full
--                    intensity.

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_TYPE_COLOR

--  #define PANGO_TYPE_COLOR pango_color_get_type ()

--    The GObject type for PangoColor.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_color_free ()

--  void        pango_color_free                (PangoColor *color);

--    Frees a color allocated by pango_color_copy().

--    color : an allocated PangoColor

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_color_parse ()

--  gboolean    pango_color_parse               (PangoColor *color, const char *spec);

--    Fill in the fields of a color from a string specification. The string can either one of a large set of standard names.
--    (Taken from the X11 rgb.txt file), or it can be a hex value in the form '#rgb' '#rrggbb' '#rrrgggbbb' or '#rrrrggggbbbb'
--    where 'r', 'g' and 'b' are hex digits of the red, green, and blue components of the color, respectively. (White in the
--    four forms is '#fff' '#ffffff' '#fffffffff' and '#ffffffffffff')

--    color :   a PangoColor structure in which to store the result
--    spec :    a string specifying the new color
--    Returns : TRUE if parsing of the specifier succeeded, otherwise false.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_color_copy ()

--  PangoColor* pango_color_copy                (const PangoColor *src);

--    Creates a copy of src, which should be freed with pango_color_free(). Primarily used by language bindings, not that
--    useful otherwise (since colors can just be copied by assignment in C).

--    src :     color to copy
--    Returns : the newly allocated PangoColor, which should be freed with pango_color_free().

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoLanguage

--  typedef struct _PangoLanguage PangoLanguage;

--    The PangoLanguage structure is used to represent a language.

--    PangoLanguage pointers can be efficiently copied and compared with each other.

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_TYPE_LANGUAGE

--  #define PANGO_TYPE_LANGUAGE (pango_language_get_type ())

--    The GObject type for PangoLanguage.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_language_from_string ()

--  PangoLanguage* pango_language_from_string   (const char *language);

--    Take a RFC-3066 format language tag as a string and convert it to a PangoLanguage pointer that can be efficiently copied
--    (copy the pointer) and compared with other language tags (compare the pointer.)

--    This function first canonicalizes the string by converting it to lowercase, mapping '_' to '-', and stripping all
--    characters other than letters and '-'.

--    language : a string representing a language tag
--    Returns :  an opaque pointer to a PangoLanguage structure. this will be valid forever after.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_language_to_string()

--  #define pango_language_to_string(language) ((const char *)language)

--    Returns a RFC-3066 format string representing the given language tag.

--    language : a language tag.
--    Returns :  a string representing the language tag.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_language_matches ()

--  gboolean    pango_language_matches          (PangoLanguage *language, const char *range_list);

--    Checks if a language tag matches one of the elements in a list of language ranges. A language tag is considered to match
--    a range in the list if the range is '*', the range is exactly the tag, or the range is a prefix of the tag, and the
--    character after the tag is '-'.

--    language :   a language tag (see pango_language_from_string()), NULL is allowed and matches nothing but '*'
--    range_list : a list of language ranges, separated by ';' characters. each element must either be '*', or a RFC 3066
--                  language range canonicalized as by pango_language_from_string()
--    Returns :    TRUE if a match was found.

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrList

--  typedef struct _PangoAttrList PangoAttrList;

--    The PangoAttrList structure represents a list of attributes that apply to a section of text. The attributes are, in
--    general, allowed to overlap in an arbitrary fashion, however, if the attributes are manipulated only through
--    pango_attr_list_change(), the overlap between properties will meet stricter criteria.

--    Since the PangoAttrList structure is stored as a linear list, it is not suitable for storing attributes for large
--    amounts of text. In general, you should not use a single PangoAttrList for more than one paragraph of text.

--    ------------------------------------------------------------------------------------------------------------------------

--   PANGO_TYPE_ATTR_LIST

--  #define PANGO_TYPE_ATTR_LIST pango_attr_list_get_type ()

--    The GObject type for PangoAttrList.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_new ()

--  PangoAttrList* pango_attr_list_new          (void);

--    Create a new empty attribute list with a reference count of one.

--    Returns : the newly allocated PangoAttrList, which should be freed with pango_attr_list_unref().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_ref ()

--  PangoAttrList* pango_attr_list_ref          (PangoAttrList *list);

--    Increase the reference count of the given attribute list by one.

--    list :    a PangoAttrList
--    Returns : The attribute list passed in

--    Since 1.10

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_unref ()

--  void        pango_attr_list_unref           (PangoAttrList *list);

--    Decrease the reference count of the given attribute list by one. If the result is zero, free the attribute list and the
--    attributes it contains.

--    list : a PangoAttrList

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_copy ()

--  PangoAttrList* pango_attr_list_copy         (PangoAttrList *list);

--    Copy list and return an identical new list.

--    list :    a PangoAttrList
--    Returns : the newly allocated PangoAttrList, with a reference count of one, which should be freed with
--               pango_attr_list_unref().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_insert ()

--  void        pango_attr_list_insert          (PangoAttrList *list, PangoAttribute *attr);

--    Insert the given attribute into the PangoAttrList. It will be inserted after all other attributes with a matching
--    start_index.

--    list : a PangoAttrList
--    attr : the attribute to insert. Ownership of this value is assumed by the list.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_insert_before ()

--  void        pango_attr_list_insert_before   (PangoAttrList *list, PangoAttribute *attr);

--    Insert the given attribute into the PangoAttrList. It will be inserted before all other attributes with a matching
--    start_index.

--    list : a PangoAttrList
--    attr : the attribute to insert. Ownership of this value is assumed by the list.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_change ()

--  void        pango_attr_list_change          (PangoAttrList *list, PangoAttribute *attr);

--    Insert the given attribute into the PangoAttrList. It will replace any attributes of the same type on that segment and
--    be merged with any adjoining attributes that are identical.

--    This function is slower than pango_attr_list_insert() for creating a attribute list in order (potentially much slower
--    for large lists). However, pango_attr_list_insert() is not suitable for continually changing a set of attributes since
--    it never removes or combines existing attributes.

--    list : a PangoAttrList
--    attr : the attribute to insert. Ownership of this value is assumed by the list.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_splice ()

--  void        pango_attr_list_splice          (PangoAttrList *list, PangoAttrList *other, gint pos, gint len);

--    This function splices attribute list other into list. This operation is equivalent to stretching every attribute that
--    applies at position pos in list by an amount len, and then calling pango_attr_list_change() with a copy of each
--    attribute in other in sequence (offset in position by pos).

--    This operation proves useful for, for instance, inserting a preedit string in the middle of an edit buffer.

--    list :  a PangoAttrList
--    other : another PangoAttrList
--    pos :   the position in list at which to insert other
--    len :   the length of the spliced segment. (Note that this must be specified since the attributes in other may only be
--             present at some subsection of this range)

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_filter ()

--  PangoAttrList* pango_attr_list_filter       (PangoAttrList *list, PangoAttrFilterFunc func, gpointer data);

--    Given a PangoAttrList and callback function, removes any elements of list for which func returns TRUE and inserts them
--    into a new list.

--    list :    a PangoAttrList
--    func :    callback function; returns TRUE if an atttribute should be filtered out.
--    data :    Data to be passed to func
--    Returns : the new PangoAttrList or NULL if no attributes of the given types were found.

--    Since 1.2

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrFilterFunc ()

--  gboolean    (*PangoAttrFilterFunc)          (PangoAttribute *attribute, gpointer data);

--    A predicate function used by pango_attr_list_filter() to filter out a subset of attributes for a list.

--    attribute : a PangoAttribute
--    data :      callback data passed to pango_attr_list_filter()
--    Returns :   TRUE if the attribute should be filtered out

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_list_get_iterator ()

--  PangoAttrIterator* pango_attr_list_get_iterator
--                                              (PangoAttrList *list);

--    Create a iterator initialized to the beginning of the list. list must not be modified until this iterator is freed.

--    list :    a PangoAttrList
--    Returns : the newly allocated PangoAttrIterator, which should be freed with pango_attr_iterator_destroy().

--    ------------------------------------------------------------------------------------------------------------------------

--   PangoAttrIterator

--  typedef struct _PangoAttrIterator PangoAttrIterator;

--    The PangoAttrIterator structure is used to represent an iterator through a PangoAttrList. A new iterator is created with
--    pango_attr_list_get_iterator(). Once the iterator is created, it can be advanced through the style changes in the text
--    using pango_attr_iterator_next(). At each style change, the range of the current style segment and the attributes
--    currently in effect can be queried.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_copy ()

--  PangoAttrIterator* pango_attr_iterator_copy (PangoAttrIterator *iterator);

--    Copy a PangoAttrIterator

--    iterator : a PangoAttrIterator.
--    Returns :  the newly allocated PangoAttrIterator, which should be freed with pango_attr_iterator_destroy().

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_next ()

--  gboolean    pango_attr_iterator_next        (PangoAttrIterator *iterator);

--    Advance the iterator until the next change of style.

--    iterator : a PangoAttrIterator
--    Returns :  FALSE if the iterator is at the end of the list, otherwise TRUE

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_range ()

--  void        pango_attr_iterator_range       (PangoAttrIterator *iterator, gint *start, gint *end);

--    Get the range of the current segment. Note that the stored return values are signed, not unsigned like the values in
--    PangoAttribute. To deal with this API oversight, stored return values that wouldn't fit into a signed integer are
--    clamped to G_MAXINT.

--    iterator : a PangoAttrIterator
--    start :    location to store the start of the range
--    end :      location to store the end of the range

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_get ()

--  PangoAttribute* pango_attr_iterator_get     (PangoAttrIterator *iterator, PangoAttrType type);

--    Find the current attribute of a particular type at the iterator location. When multiple attributes of the same type
--    overlap, the attribute whose range starts closest to the current location is used.

--    iterator : a PangoAttrIterator
--    type :     the type of attribute to find.
--    Returns :  the current attribute of the given type, or NULL if no attribute of that type applies to the current
--                location.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_get_font ()

--  void        pango_attr_iterator_get_font    (PangoAttrIterator *iterator, PangoFontDescription *desc, PangoLanguage **language, GSList **extra_attrs);

--    Get the font and other attributes at the current iterator position.

--    iterator :    a PangoAttrIterator
--    desc :        a PangoFontDescription to fill in with the current values. The family name in this structure will be set
--                   using pango_font_description_set_family_static() using values from an attribute in the PangoAttrList
--                   associated with the iterator, so if you plan to keep it around, you must call:
--                   pango_font_description_set_family (desc, pango_font_description_get_family (desc)).
--    language :    if non-NULL, location to store language tag for item, or NULL if none is found.
--    extra_attrs : if non-NULL, location in which to store a list of non-font attributes at the the current position; only
--                   the highest priority value of each attribute will be added to this list. In order to free this value, you
--                   must call pango_attribute_destroy() on each member.

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_get_attrs ()

--  GSList*     pango_attr_iterator_get_attrs   (PangoAttrIterator *iterator);

--    Gets a list of all attributes at the current position of the iterator.

--    iterator : a PangoAttrIterator
--    Returns :  a list of all attributes for the current range. To free this value, call pango_attribute_destroy() on each
--                value and g_slist_free() on the list.

--    Since 1.2

--    ------------------------------------------------------------------------------------------------------------------------

--   pango_attr_iterator_destroy ()

--  void        pango_attr_iterator_destroy     (PangoAttrIterator *iterator);

--    Destroy a PangoAttrIterator and free all associated memory.

--    iterator : a PangoAttrIterator.

--    << Fonts                                                                                                  Tab Stops >>

feature -- size

	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoAttribute)"
		end

feature {} -- External calls
-- 	gboolean    pango_parse_markup              (const char *markup_text, int length, gunichar accel_marker, PangoAttrList **attr_list, char **text, gunichar *accel_char, GError **error) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttrType pango_attr_type_register      (const gchar *name) is
-- 		external "C use <pango/pango.h>"
-- 		end

	pango_attribute_copy (const_pangoattribute: POINTER): POINTER is--  PangoAttribute*
		external "C use <pango/pango.h>"
		end

	pango_attribute_equal  (attr1, attr2: POINTER): INTEGER is --  gboolean
		external "C use <pango/pango.h>"
 		end

	pango_attribute_destroy (a_pangoattribute: POINTER) is
 		external "C use <pango/pango.h>"
 		end


--  PangoAttribute* pango_attr_language_new     (PangoLanguage *language) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_family_new       (const char *family) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_style_new        (PangoStyle style) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_variant_new      (PangoVariant variant) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_stretch_new      (PangoStretch stretch) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_weight_new       (PangoWeight weight) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_size_new         (int size) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_size_new_absolute
--                                              (int size) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_font_desc_new    (const PangoFontDescription *desc) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_foreground_new   (guint16 red, guint16 green, guint16 blue) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_background_new   (guint16 red, guint16 green, guint16 blue) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_strikethrough_new
--                                              (gboolean strikethrough) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_strikethrough_color_new
--                                              (guint16 red, guint16 green, guint16 blue) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_underline_new    (PangoUnderline underline) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_underline_color_new
--                                              (guint16 red, guint16 green, guint16 blue) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  enum        PangoUnderline;
--  #define     PANGO_TYPE_UNDERLINE
--  PangoAttribute* pango_attr_shape_new        (const PangoRectangle *ink_rect, const PangoRectangle *logical_rect) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_shape_new_with_data
--                                              (const PangoRectangle *ink_rect, const PangoRectangle *logical_rect, gpointer data, PangoAttrDataCopyFunc copy_func, GDestroyNotify destroy_func) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  gpointer    (*PangoAttrDataCopyFunc)        (gconstpointer data) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_scale_new        (double scale_factor) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_fallback_new     (gboolean enable_fallback) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  #define     PANGO_SCALE_XX_SMALL
--  #define     PANGO_SCALE_X_SMALL
--  #define     PANGO_SCALE_SMALL
--  #define     PANGO_SCALE_MEDIUM
--  #define     PANGO_SCALE_LARGE
--  #define     PANGO_SCALE_X_LARGE
--  #define     PANGO_SCALE_XX_LARGE
--  PangoAttribute* pango_attr_rise_new         (int rise) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_letter_spacing_new
--                                              (int letter_spacing) is
-- 		external "C use <pango/pango.h>"
-- 		end

--              PangoColor;
--  #define     PANGO_TYPE_COLOR
--  void        pango_color_free                (PangoColor *color) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  gboolean    pango_color_parse               (PangoColor *color, const char *spec) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoColor* pango_color_copy                (const PangoColor *src) is
-- 		external "C use <pango/pango.h>"
-- 		end

--              PangoLanguage;
--  #define     PANGO_TYPE_LANGUAGE
--  PangoLanguage* pango_language_from_string   (const char *language) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  #define     pango_language_to_string        (language)
--  gboolean    pango_language_matches          (PangoLanguage *language, const char *range_list) is
-- 		external "C use <pango/pango.h>"
-- 		end


--              PangoAttrList;
--  #define     PANGO_TYPE_ATTR_LIST
--  PangoAttrList* pango_attr_list_new          (void) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttrList* pango_attr_list_ref          (PangoAttrList *list) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_list_unref           (PangoAttrList *list) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttrList* pango_attr_list_copy         (PangoAttrList *list) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_list_insert          (PangoAttrList *list, PangoAttribute *attr) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_list_insert_before   (PangoAttrList *list, PangoAttribute *attr) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_list_change          (PangoAttrList *list, PangoAttribute *attr) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_list_splice          (PangoAttrList *list, PangoAttrList *other, gint pos, gint len) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttrList* pango_attr_list_filter       (PangoAttrList *list, PangoAttrFilterFunc func, gpointer data) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  gboolean    (*PangoAttrFilterFunc)          (PangoAttribute *attribute, gpointer data) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttrIterator* pango_attr_list_get_iterator
--                                              (PangoAttrList *list) is
-- 		external "C use <pango/pango.h>"
-- 		end

--              PangoAttrIterator;
--  PangoAttrIterator* pango_attr_iterator_copy (PangoAttrIterator *iterator) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  gboolean    pango_attr_iterator_next        (PangoAttrIterator *iterator) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_iterator_range       (PangoAttrIterator *iterator, gint *start, gint *end) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  PangoAttribute* pango_attr_iterator_get     (PangoAttrIterator *iterator, PangoAttrType type) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_iterator_get_font    (PangoAttrIterator *iterator, PangoFontDescription *desc, PangoLanguage **language, GSList **extra_attrs) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  GSList*     pango_attr_iterator_get_attrs   (PangoAttrIterator *iterator) is
-- 		external "C use <pango/pango.h>"
-- 		end

--  void        pango_attr_iterator_destroy     (PangoAttrIterator *iterator) is
-- 		external "C use <pango/pango.h>"
-- 		end
end
