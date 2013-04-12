indexing
	description:
		"Text Attributes -- Font and other attributes for annotating text."
	copyright:
		"[
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
	
	-- TODO: adapt to the scheme using a sub cluster externals for the 
	-- C function wrappers
inherit
	C_STRUCT
		redefine copy, is_equal, free
		end
	MIXED_MEMORY_HANDLING
		redefine free
		end

insert
	PANGO_ATTR_TYPE

create {ANY}
	background, foreground, weight, style
	
create {WRAPPER}
	from_external_pointer

feature {} -- Creation
	background (r, g, b: INTEGER) is
		do
			handle := pango_attr_background_new(r, g, b)
		end

	foreground (r, g, b: INTEGER) is
		do
			handle := pango_attr_foreground_new(r, g, b)
		end

	weight (a_weight: INTEGER) is
		do
			handle := pango_attr_weight_new(a_weight)
		end

	style (a_style: INTEGER) is
		do
			handle := pango_attr_style_new(a_style)
		end

feature {ANY} -- Operations
	set_start_index (index: INTEGER) is
		do
			c_set_start_index(handle, index)
		end

	set_end_index (index: INTEGER) is
		do
			c_set_end_index(handle, index)
		end

feature {}
	-- Unwrapped API
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
	

feature {}
	--   PangoAttribute struct access
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
		external "C struct PangoAttribute get start_index use <pango/pango.h>"
		end

	get_end_index (an_attribute: POINTER): INTEGER is
			-- guint end_index; end index of the range (in bytes). The
			-- character at this index is not included in the range.
		external "C struct PangoAttribute get end_index use <pango/pango.h>"
		end

	c_set_start_index (an_attribute: POINTER; value: INTEGER) is
		external "C struct PangoAttribute set start_index use <pango/pango.h>"
		end

	c_set_end_index (an_attribute: POINTER; value: INTEGER) is
		external "C struct PangoAttribute set end_index use <pango/pango.h>"
		end

feature {ANY} -- Markup parsing
	parse_markup (a_markup_text: STRING) is
			-- Parses marked-up text (see markup format) to create a
			-- plaintext string and an attribute list.
			-- `attributes' will contain the list of the attributes,
			-- TODO: Provide support for `accel_marker' and
			-- `accel_char'. Paolo 2007-07-12
		local
			attribute_list: PANGO_ATTR_LIST; text_ptr, error_ptr: POINTER
		do
			-- Note: please leave the following commented C documentation
			-- as reference for future implementation
			--  gboolean pango_parse_markup (const char *markup_text, int
			--  length, gunichar accel_marker, PangoAttrList **attr_list,
			--  char **text, gunichar *accel_char, GError **error);
			-- If accel_marker is nonzero, the given character will mark
			-- the character following it as an accelerator. For example,
			-- the -- accel marker might be an ampersand or
			-- underscore. All characters marked as an accelerator will
			-- receive a -- PANGO_UNDERLINE_LOW attribute, and the first
			-- character so marked will be returned in accel_char. Two
			-- accel_marker -- characters following each other produce a
			-- single literal accel_marker character.
			--    markup_text :  markup to parse (see markup format)
			--    length :       length of markup_text, or -1 if nul-terminated
			--    accel_marker : character that precedes an accelerator, or 0 for none
			--    attr_list :    address of return location for a PangoAttrList, or NULL
			--    text :         address of return location for text with tags stripped, or NULL
			--    accel_char :   address of return location for accelerator char, or NULL
			--    error :        address of return location for errors, or NULL
			--    Returns :      FALSE if error is set, otherwise TRUE
			-- is_parsing_successful := (pango_parse_markup
			--							  (a_markup_text.to_external, -1,
			--	0, -- gunichar accel_marker,
			-- PangoAttrList **attr_list,
			--  char **text, gunichar *accel_char, GError **error);
		ensure
			implemented: False
		end

	is_parsing_successful: BOOLEAN

feature {ANY}
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
			-- TODO: is this a memory leak? Shall we free handle before?
			handle := pango_attribute_copy(another.handle)
			-- pango_attribute_copy returns the newly allocated
			-- PangoAttribute, which should be freed with
			-- pango_attribute_destroy().
		end

	is_equal (another: like Current): BOOLEAN is
			-- Is `another' equals to Current? This compares only the
			-- actual value of the two attributes and not the ranges that
			-- the attributes apply to.
		do
			Result := pango_attribute_equal(handle, another.handle).to_boolean
		end

feature {} -- Implementation
	free (a_handle: POINTER) is
			-- Destroy a PangoAttribute and free all associated memory.
		do
			pango_attribute_destroy(a_handle)
		end
	
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

feature {WRAPPER} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(PangoAttribute)"
		end

feature {}
	-- External calls
	-- 	gboolean    pango_parse_markup              (const char *markup_text, int length, gunichar accel_marker, PangoAttrList **attr_list, char **text, gunichar *accel_char, GError **error) is
	-- 		external "C use <pango/pango.h>"
	-- 		end
	--  PangoAttrType pango_attr_type_register      (const gchar *name) is
	-- 		external "C use <pango/pango.h>"
	-- 		end
	pango_attribute_copy (const_pangoattribute: POINTER): POINTER is
			--  PangoAttribute*
		external "C use <pango/pango.h>"
		end

	pango_attribute_equal (attr1, attr2: POINTER): INTEGER is
			--  gboolean
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

	pango_attr_style_new (a_style: INTEGER): POINTER is
		external "C use <pango/pango.h>"
		end
		--  PangoAttribute* pango_attr_variant_new      (PangoVariant variant) is
		-- 		external "C use <pango/pango.h>"
		-- 		end
		--  PangoAttribute* pango_attr_stretch_new      (PangoStretch stretch) is
		-- 		external "C use <pango/pango.h>"
		-- 		end

	pango_attr_weight_new (a_weight: INTEGER): POINTER is
		external "C use <pango/pango.h>"
		end
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

	pango_attr_foreground_new (r, g, b: INTEGER): POINTER is
		external "C use <pango/pango.h>"
		end

	pango_attr_background_new (r, g, b: INTEGER): POINTER is
		external "C use <pango/pango.h>"
		end
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

end -- class PANGO_ATTRIBUTE
