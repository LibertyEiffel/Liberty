indexing
	description: "Structures representing abstract fonts."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Pango team
					
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

class PANGO_FONT_DESCRIPTION
	-- The PangoFontDescription structure represents the description of
	-- an ideal font. These structures are used both to list what fonts
	-- are available on the system and also for specifying the
	-- characteristics of a font to load.

inherit
	C_STRUCT
		redefine copy, free, is_equal
		end

	MIXED_MEMORY_HANDLING redefine free end

insert
	PANGO_FONT_DESCRIPTION_EXTERNALS
	PANGO_STYLE
	PANGO_VARIANT
	PANGO_WEIGHT
	PANGO_FONT_MASK
	PANGO_STRETCH

create {ANY}
	make, from_string, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new font description structure with all fields unset.
		do
			from_external_pointer (pango_font_description_new)
		end

	from_string (a_string: STRING) is
			-- Creates a new font description from a string representation in
			-- the form "[FAMILY-LIST] [STYLE-OPTIONS] [SIZE]", where FAMILY-LIST
			-- is a comma separated list of families optionally terminated by a
			-- comma, STYLE_OPTIONS is a whitespace separated list of words
			-- where each WORD describes one of style, variant, weight, or
			-- stretch, and SIZE is an decimal number (size in points). Any one
			-- of the options may be absent. If FAMILY-LIST is absent, then the
			-- family_name field of the resulting font description will be
			-- initialized to NULL. If STYLE-OPTIONS is missing, then all style
			-- options will be set to the default values. If SIZE is missing,
			-- the size in the resulting font description will be set to 0.
			--
			-- Example: "Sans Bold 27"
		do
			from_external_pointer (pango_font_description_from_string (a_string.to_external))
		end

feature {ANY} -- Access

	hash: INTEGER is
			-- Computes a hash of a PangoFontDescription structure suitable to
			-- be used, for example, as an argument to g_hash_table_new().
			-- The hash value is independent of 'mask'.
		do
			Result := pango_font_description_hash (handle)
		end

	family: STRING is
			-- Gets the family name field of a font description. See 'set_family'.
			-- Returns the family name field for the font description, or Void
			-- if not previously set.
		local
			family_ptr: POINTER
		do
			family_ptr := pango_font_description_get_family (handle)
			if not family_ptr.is_null then
				create Result.from_external_copy (family_ptr)
			end
		end

	style: INTEGER is
			-- Gets the style field of a PANGO_FONT_DESCRIPTION. See 'set_style'.
			-- Use 'get_set_fields' to find out if the field was explicitely set or not.
		do
			Result := pango_font_description_get_style (handle)
		ensure
			is_valid_pango_style (Result)
		end

	font_variant: INTEGER is
			-- Gets the variant field of a PANGO_FONT_DESCRIPTION. See 'set_variant'.
			-- Use 'get_set_fields' to find out if the field was explicitely
			-- set or not.
			--
			-- This isn't wrapped simply as 'variant' because we'd be stepping
			-- on an Eiffel keyword!
		do
			Result := pango_font_description_get_variant (handle)
		ensure
			is_valid_pango_variant (Result)
		end

	weight: INTEGER is
			-- Gets the weight field of a font description. See 'set_weight'.
			-- Use 'get_set_fields' to find out if the field was explicitely
			-- set or not.
		do
			Result := pango_font_description_get_weight (handle)
		ensure
			is_valid_pango_weight (Result)
		end

	stretch: INTEGER is
			-- Gets the stretch field of a font description. See 'set_stretch'.
			-- Use 'get_set_fields' to find out if the field was explicitely
			-- set or not.
		do
			Result := pango_font_description_get_stretch (handle)
		ensure
			is_valid_pango_stretch (Result)
		end

	size: INTEGER is
			-- Gets the size field of a font description. See 'set_size'.
			-- Returns the size field for the font description in points or
			-- device units. You must call 'size_is_absolute' to find out which
			-- is the case. Returns 0 if the size field has not previously been
			-- set. Use 'get_set_fields' to find out if the field was
			-- explicitely set or not.
		do
			Result := pango_font_description_get_size (handle)
		ensure
			Result >= 0
		end

	size_is_absolute: BOOLEAN is
			-- Determines whether the size of the font is in points or device
			-- units. See 'set_size' and 'set_absolute_size'.
			--
			-- Returns whether the size for the font description is in points or
			-- device units. Use 'get_set_fields' to find out if the size field
			-- of the font description was explicitely set or not.
		do
			Result := pango_font_description_get_size_is_absolute (handle).to_boolean
		end

	fields_set: INTEGER is
			-- Determines which fields in a font description have been set.
			-- Returns a bitmask with bits set corresponding to the fields that
			-- have been set.
		do
			Result := pango_font_description_get_set_fields (handle)
		ensure
			is_valid_pango_font_mask (Result)
		end

	better_match (a_match, b_match: PANGO_FONT_DESCRIPTION): BOOLEAN is
			-- Determines if the style attributes of new_match are a closer
			-- match for desc than old_match, or if a_match is Void,
			-- determines if b_match is a match at all.
			-- Approximate matching is done for weight and style; other
			-- attributes must match exactly.
		require
			b_match /= Void
			-- a_match can be Void
		local
			a_ptr: POINTER
		do
			if a_match /= Void then
				a_ptr := a_match.handle
			end
			Result := pango_font_description_better_match (handle, a_ptr,
																		  b_match.handle).to_boolean
		end

	to_string: STRING is
			-- Creates a string representation of a font description.
			-- See 'from_string' for a description of the format of the string
			-- representation. The family list in the string description will
			-- only have a terminating comma if the last word of the list is a
			-- valid style option.
		do
			create Result.from_external (pango_font_description_to_string (handle))
		end

	to_filename: STRING is
			-- Creates a filename representation of a font description. The
			-- filename is identical to the result from calling 'to_string', but
			-- with underscores instead of characters that are untypical in
			-- filenames, and in lower case only.
		do
			create Result.from_external (pango_font_description_to_filename (handle))
		end

feature {ANY} -- Operations

	set_family (a_family: STRING) is
			-- Sets the family name field of a font description. The family name
			-- represents a family of related font styles, and will resolve to a
			-- particular PANGO_FONT_FAMILY. In some uses of
			-- PANGO_FONT_DESCRIPTION, it is also possible to use a comma
			-- separated list of family names for this field.
		do
			pango_font_description_set_family (handle, a_family.to_external)
		end

	set_style (a_style: INTEGER) is
			-- Sets the style field of a PangoFontDescription. The PANGO_STYLE
			-- enumeration describes whether the font is slanted and the manner
			-- in which it is slanted; it can be either pango_style_normal,
			-- pango_style_italic, or pango_style_oblique. Most fonts will
			-- either have a italic style or an oblique style, but not both,
			-- and font matching in Pango will match italic specifications with
			-- oblique fonts and vice-versa if an exact match is not found.
		require
			is_valid_pango_style (a_style)
		do
			pango_font_description_set_style (handle, a_style)
		end

	set_variant (a_variant: INTEGER) is
			-- Sets the variant field of a font description. The PANGO_VARIANT
			-- can either be pango_variant_normal or pango_variant_small_caps.
		require
			is_valid_pango_variant (a_variant)
		do
			pango_font_description_set_variant (handle, a_variant)
		end

	set_weight (a_weight: INTEGER) is
			-- Sets the weight field of a font description. The weight field
			-- specifies how bold or light the font should be. In addition to
			-- the values of the PANGO_WEIGHT enumeration, other intermediate
			-- numeric values are possible.
		require
			is_valid_pango_weight (a_weight)
		do
			pango_font_description_set_weight (handle, a_weight)
		end

	set_stretch (a_stretch: INTEGER) is
			-- Sets the stretch field of a font description. The stretch field
			-- specifies how narrow or wide the font should be.
		require
			is_valid_pango_stretch (a_stretch)
		do
			pango_font_description_set_stretch (handle, a_stretch)
		end

	set_size (a_size: INTEGER) is
			-- Sets the size field of a font description in fractional points.
			-- This is mutually exclusive with 'set_absolute_size'.
			--
			-- 'a_size' is the size of the font in points, scaled by
			-- PANGO_CONSTANTS.pango_scale. (That is, a size value
			-- of 10 * pango_scale is a 10 point font. The conversion factor
			-- between points and device units depends on system configuration
			-- and the output device. For screen display, a logical DPI of 96 is
			-- common, in which case a 10 point font corresponds to
			-- a 10 * (96 / 72) = 13.3 pixel font. Use 'set_absolute_size' if
			-- you need a particular size in device units.
		do
			pango_font_description_set_size (handle, a_size)
		end

	set_absolute_size (an_absolute_size: REAL) is
			-- Sets the size field of a font description, in device units.
			-- This is mutually exclusive with 'set_size'.
			-- 'an_absolute_size' is the new size, in Pango units. There are
			-- PANGO_CONSTANTS.pango_scale Pango units in one device unit.
			-- For an output backend where a device unit is a pixel, a size
			-- value of 10 * PANGO_SCALE gives a 10 pixel font.
		do
			pango_font_description_set_absolute_size (handle, an_absolute_size)
		end

	unset_fields (a_mask: INTEGER) is
			-- Unsets some of the fields in a PANGO_FONT_DESCRIPTION. The unset
			-- fields will get back to their default values.
		require
			is_valid_pango_font_mask (a_mask)
		do
			pango_font_description_unset_fields (handle, a_mask)
		end

	merge (a_font_description: PANGO_FONT_DESCRIPTION; replace_existing: BOOLEAN) is
			-- Merges the fields that are set in a_font_description into the
			-- current font description's fields. If replace_existing is False,
			-- only fields in the current PANGO_FONT_DESCRIPTION that are not
			-- already set are affected. If True, then fields that are already
			-- set will be replaced as well.
		do
			pango_font_description_merge (handle, a_font_description.handle,
													replace_existing.to_integer)
		end

feature {ANY} -- Copying and comparison

	is_equal (other: PANGO_FONT_DESCRIPTION): BOOLEAN is
			-- Compares two font descriptions for equality. Two font
			-- descriptions are considered equal if the fonts they describe are
			-- probably identical. This means that their masks do not have to
			-- match, as long as other fields are all the same. (Two font
			-- descriptions may result in identical fonts being loaded, but
			-- still compare FALSE.)
		do
			Result := pango_font_description_equal (handle, other.handle).to_boolean
		end

	copy (a_font_description: PANGO_FONT_DESCRIPTION) is
			-- Make a copy of a PANGO_FONT_DESCRIPTION.
		do
			dispose
			from_external_pointer (pango_font_description_copy (a_font_description.handle))
		end

feature {ANY} -- Disposing

	free (a_ptr: POINTER)  is
			-- Frees a font description.
		do
			pango_font_description_free (a_ptr)
		end

-- enum PangoFontMask

-- typedef enum {
--   PANGO_FONT_MASK_FAMILY  = 1 < < 0,
--   PANGO_FONT_MASK_STYLE   = 1 < < 1,
--   PANGO_FONT_MASK_VARIANT = 1 < < 2,
--   PANGO_FONT_MASK_WEIGHT  = 1 < < 3,
--   PANGO_FONT_MASK_STRETCH = 1 < < 4,
--   PANGO_FONT_MASK_SIZE    = 1 < < 5
-- } PangoFontMask;

-- The bits in a PangoFontMask correspond to fields in a PangoFontDescription that have been set.
-- PANGO_FONT_MASK_FAMILY 	the font family is specified.
-- PANGO_FONT_MASK_STYLE 	the font style is specified.
-- PANGO_FONT_MASK_VARIANT 	the font variant is specified.
-- PANGO_FONT_MASK_WEIGHT 	the font weight is specified.
-- PANGO_FONT_MASK_STRETCH 	the font stretch is specified.
-- PANGO_FONT_MASK_SIZE 	the font size is specified.
-- PANGO_TYPE_FONT_MASK

-- #define PANGO_TYPE_FONT_MASK (pango_font_mask_get_type())

-- The GObject type for PangoFontMask.







-- PangoFontMetrics

-- typedef struct {
--   guint ref_count;
  
--   int ascent;
--   int descent;
--   int approximate_char_width;
--   int approximate_digit_width;
--   int underline_position;
--   int underline_thickness;
--   int strikethrough_position;
--   int strikethrough_thickness;
-- } PangoFontMetrics;

-- A PangoFontMetrics structure holds the overall metric information for a font (possibly restricted to a script). The fields of this structure are private to implementations of a font backend. See the documentation of the corresponding getters for documentation of their meaning.
-- guint ref_count; 	reference count. Used internally. See pango_font_metrics_ref() and pango_font_metrics_unref().
-- int ascent; 	the distance from the baseline to the highest point of the glyphs of the font. This is positive in practically all fonts.
-- int descent; 	the distance from the baseline to the lowest point of the glyphs of the font. This is positive in practically all fonts.
-- int approximate_char_width; 	approximate average width of the regular glyphs of the font.
-- int approximate_digit_width; 	approximate average width of the glyphs for digits of the font.
-- int underline_position; 	position of the underline. This is normally negative.
-- int underline_thickness; 	thickness of the underline.
-- int strikethrough_position; 	position of the strikethrough line. This is normally positive.
-- int strikethrough_thickness; 	thickness of the strikethrough line.
-- PANGO_TYPE_FONT_METRICS

-- #define PANGO_TYPE_FONT_METRICS  (pango_font_metrics_get_type ())

-- The GObject type for PangoFontMetrics.
-- pango_font_metrics_ref ()

-- PangoFontMetrics* pango_font_metrics_ref    (PangoFontMetrics *metrics);

-- Increase the reference count of a font metrics structure by one.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	metrics
-- pango_font_metrics_unref ()

-- void        pango_font_metrics_unref        (PangoFontMetrics *metrics);

-- Decrease the reference count of a font metrics structure by one. If the result is zero, frees the structure and any associated memory.

-- metrics : 	a PangoFontMetrics structure
-- pango_font_metrics_get_ascent ()

-- int         pango_font_metrics_get_ascent   (PangoFontMetrics *metrics);

-- Gets the ascent from a font metrics structure. The ascent is the distance from the baseline to the logical top of a line of text. (The logical top may be above or below the top of the actual drawn ink. It is necessary to lay out the text to figure where the ink will be.)

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the ascent, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_descent ()

-- int         pango_font_metrics_get_descent  (PangoFontMetrics *metrics);

-- Gets the descent from a font metrics structure. The descent is the distance from the baseline to the logical bottom of a line of text. (The logical bottom may be above or below the bottom of the actual drawn ink. It is necessary to lay out the text to figure where the ink will be.)

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the descent, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_approximate_char_width ()

-- int         pango_font_metrics_get_approximate_char_width
--                                             (PangoFontMetrics *metrics);

-- Gets the approximate character width for a font metrics structure. This is merely a representative value useful, for example, for determining the initial size for a window. Actual characters in text will be wider and narrower than this.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the character width, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_approximate_digit_width ()

-- int         pango_font_metrics_get_approximate_digit_width
--                                             (PangoFontMetrics *metrics);

-- Gets the approximate digit width for a font metrics structure. This is merely a representative value useful, for example, for determining the initial size for a window. Actual digits in text can be wider and narrower than this, though this value is generally somewhat more accurate than the result of pango_font_metrics_get_approximate_digit_width().

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the digit width, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_underline_thickness ()

-- int         pango_font_metrics_get_underline_thickness
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested thickness to draw for the underline.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested underline thickness, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_underline_position ()

-- int         pango_font_metrics_get_underline_position
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested position to draw the underline. The value returned is the distance above the baseline of the top of the underline. Since most fonts have underline positions beneath the baseline, this value is typically negative.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested underline position, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_strikethrough_thickness ()

-- int         pango_font_metrics_get_strikethrough_thickness
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested thickness to draw for the strikethrough.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested strikethrough thickness, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_strikethrough_position ()

-- int         pango_font_metrics_get_strikethrough_position
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested position to draw the strikethrough. The value returned is the distance above the baseline of the top of the strikethrough.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested strikethrough position, in Pango units.

-- Since 1.6
-- PangoFont

-- typedef struct _PangoFont PangoFont;

-- The PangoFont structure is used to represent a font in a rendering-system-independent matter. To create an implementation of a PangoFont, the rendering-system specific code should malloc a larger structure that contains a nested PangoFont, fill in the klass member of the nested PangoFont with a pointer to a appropriate PangoFontClass, then call pango_font_init() on the structure.

-- The PangoFont structure contains one member which the implementation fills in.
-- PANGO_TYPE_FONT

-- #define PANGO_TYPE_FONT              (pango_font_get_type ())

-- The GObject type for PangoFont.
-- PANGO_FONT()

-- #define PANGO_FONT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT, PangoFont))

-- Casts a GObject to a PangoFont.
-- object : 	a GObject.
-- PANGO_IS_FONT()

-- #define PANGO_IS_FONT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT))

-- Returns TRUE if object is a PangoFont.
-- object : 	a GObject.
-- pango_font_find_shaper ()

-- PangoEngineShape* pango_font_find_shaper    (PangoFont *font,
--                                              PangoLanguage *language,
--                                              guint32 ch);

-- Finds the best matching shaper for a font for a particular language tag and character point.

-- font : 	a PangoFont
-- language : 	the language tag
-- ch : 	a Unicode character.
-- Returns : 	the best matching shaper.
-- pango_font_describe ()

-- PangoFontDescription* pango_font_describe   (PangoFont *font);

-- Returns a description of the font.

-- font : 	a PangoFont
-- Returns : 	a newly-allocated PangoFontDescription object.
-- pango_font_get_coverage ()

-- PangoCoverage* pango_font_get_coverage      (PangoFont *font,
--                                              PangoLanguage *language);

-- Computes the coverage map for a given font and language tag.

-- font : 	a PangoFont
-- language : 	the language tag
-- Returns : 	a newly-allocated PangoCoverage object.
-- pango_font_get_glyph_extents ()

-- void        pango_font_get_glyph_extents    (PangoFont *font,
--                                              PangoGlyph glyph,
--                                              PangoRectangle *ink_rect,
--                                              PangoRectangle *logical_rect);

-- Gets the logical and ink extents of a glyph within a font. The coordinate system for each rectangle has its origin at the base line and horizontal origin of the character with increasing coordinates extending to the right and down. The macros PANGO_ASCENT(), PANGO_DESCENT(), PANGO_LBEARING(), and PANGO_RBEARING() can be used to convert from the extents rectangle to more traditional font metrics. The units of the rectangles are in 1/PANGO_SCALE of a device unit.

-- font : 	a PangoFont
-- glyph : 	the glyph index
-- ink_rect : 	rectangle used to store the extents of the glyph as drawn or NULL to indicate that the result is not needed.
-- logical_rect : 	rectangle used to store the logical extents of the glyph or NULL to indicate that the result is not needed.
-- pango_font_get_metrics ()

-- PangoFontMetrics* pango_font_get_metrics    (PangoFont *font,
--                                              PangoLanguage *language);

-- Gets overall metric information for a font. Since the metrics may be substantially different for different scripts, a language tag can be provided to indicate that the metrics should be retrieved that correspond to the script(s) used by that language.

-- font : 	a PangoFont
-- language : 	language tag used to determine which script to get the metrics for, or NULL to indicate to get the metrics for the entire font.
-- Returns : 	a PangoFontMetrics object. The caller must call pango_font_metrics_unref() when finished using the object.
-- pango_font_get_font_map ()

-- PangoFontMap* pango_font_get_font_map       (PangoFont *font);

-- Gets the font map for which the font was created.

-- font : 	a PangoFont
-- Returns : 	the PangoFontMap for the font

-- Since 1.10
-- PangoFontFamily

-- typedef struct _PangoFontFamily PangoFontFamily;

-- The PangoFontFamily structure is used to represent a family of related font faces. The faces in a family share a common design, but differ in slant, weight, width and other aspects.
-- PANGO_TYPE_FONT_FAMILY

-- #define PANGO_TYPE_FONT_FAMILY              (pango_font_family_get_type ())

-- The GObject type for PangoFontFamily.
-- PANGO_FONT_FAMILY()

-- #define PANGO_FONT_FAMILY(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_FAMILY, PangoFontFamily))

-- Casts a GObject to a PangoFontFamily.
-- object : 	a GObject.
-- PANGO_IS_FONT_FAMILY()

-- #define PANGO_IS_FONT_FAMILY(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_FAMILY))

-- Returns TRUE if object is a PangoFontFamily.
-- object : 	a GObject.
-- pango_font_family_get_name ()

-- const char* pango_font_family_get_name      (PangoFontFamily *family);

-- Gets the name of the family. The name is unique among all fonts for the font backend and can be used in a PangoFontDescription to specify that a face from this family is desired.

-- family : 	a PangoFontFamily
-- Returns : 	the name of the family. This string is owned by the family object and must not be modified or freed.
-- pango_font_family_is_monospace ()

-- gboolean    pango_font_family_is_monospace  (PangoFontFamily *family);

-- A monospace font is a font designed for text display where the the characters form a regular grid. For Western languages this would mean that the advance width of all characters are the same, but this categorization also includes Asian fonts which include double-width characters: characters that occupy two grid cells. g_unichar_iswide() returns a result that indicates whether a character is typically double-width in a monospace font.

-- The best way to find out the grid-cell size is to call pango_font_metrics_get_approximate_digit_width(), since the results of pango_font_metrics_get_approximate_char_width() may be affected by double-width characters.

-- family : 	a PangoFontFamily
-- Returns : 	TRUE if the family is monospace.

-- Since 1.4
-- pango_font_family_list_faces ()

-- void        pango_font_family_list_faces    (PangoFontFamily *family,
--                                              PangoFontFace ***faces,
--                                              int *n_faces);

-- Lists the different font faces that make up family. The faces in a family share a common design, but differ in slant, weight, width and other aspects.

-- family : 	a PangoFontFamily
-- faces : 	location to store an array of pointers to PangoFontFace objects, or NULL. This array should be freed with g_free() when it is no longer needed.
-- n_faces : 	location to store number of elements in faces.
-- PangoFontFace

-- typedef struct _PangoFontFace PangoFontFace;

-- The PangoFontFace structure is used to represent a group of fonts with the same family, slant, weight, width, but varying sizes.
-- PANGO_TYPE_FONT_FACE

-- #define PANGO_TYPE_FONT_FACE              (pango_font_face_get_type ())

-- The GObject type for PangoFontFace.
-- PANGO_FONT_FACE()

-- #define PANGO_FONT_FACE(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_FACE, PangoFontFace))

-- Casts a GObject to a PangoFontFace.
-- object : 	a GObject.
-- PANGO_IS_FONT_FACE()

-- #define PANGO_IS_FONT_FACE(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_FACE))

-- Returns TRUE if object is a PangoFontFace.
-- object : 	a GObject.
-- pango_font_face_get_face_name ()

-- const char* pango_font_face_get_face_name   (PangoFontFace *face);

-- Gets a name representing the style of this face among the different faces in the PangoFontFamily for the face. This name is unique among all faces in the family and is suitable for displaying to users.

-- face : 	a PangoFontFace.
-- Returns : 	the face name for the face. This string is owned by the face object and must not be modified or freed.
-- pango_font_face_list_sizes ()

-- void        pango_font_face_list_sizes      (PangoFontFace *face,
--                                              int **sizes,
--                                              int *n_sizes);

-- List the available sizes for a font. This is only applicable to bitmap fonts. For scalable fonts, stores NULL at the location pointed to by sizes and 0 at the location pointed to by n_sizes. The sizes returned are in Pango units and are sorted in ascending order.

-- face : 	a PangoFontFace.
-- sizes : 	location to store a pointer to an array of int. This array should be freed with g_free().
-- n_sizes : 	location to store the number of elements in sizes

-- Since 1.4
-- pango_font_face_describe ()

-- PangoFontDescription* pango_font_face_describe
--                                             (PangoFontFace *face);

-- Returns the family, style, variant, weight and stretch of a PangoFontFace. The size field of the resulting font description will be unset.

-- face : 	a PangoFontFace
-- Returns : 	a newly-created PangoFontDescription structure holding the description of the face. Use pango_font_description_free() to free the result.
-- PangoFontMap

-- typedef struct _PangoFontMap PangoFontMap;

-- The PangoFontMap represents the set of fonts available for a particular rendering system. This is a virtual object with implementations being specific to particular rendering systems. To create an implementation of a PangoFontMap, the rendering-system specific code should malloc a larger structure that contains a nested PangoFontMap, fill in the klass member of the nested PangoFontMap with a pointer to a appropriate PangoFontMapClass, then call pango_font_map_init() on the structure.

-- The PangoFontMap structure contains one member which the implementation fills in.
-- PANGO_TYPE_FONT_MAP

-- #define PANGO_TYPE_FONT_MAP              (pango_font_map_get_type ())

-- The GObject type for PangoFontMap.
-- PANGO_FONT_MAP()

-- #define PANGO_FONT_MAP(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FONT_MAP, PangoFontMap))

-- Casts a GObject to a PangoFontMap.
-- object : 	a GObject.
-- PANGO_IS_FONT_MAP()

-- #define PANGO_IS_FONT_MAP(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FONT_MAP))

-- Returns TRUE if object is a PangoFontMap.
-- object : 	a GObject.
-- PangoFontMapClass

-- typedef struct {
--   GObjectClass parent_class;

  
--   PangoFont *   (*load_font)     (PangoFontMap               *fontmap,
-- 				  PangoContext               *context,
-- 				  const PangoFontDescription *desc);
--   void          (*list_families) (PangoFontMap               *fontmap,
-- 				  PangoFontFamily          ***families,
-- 				  int                        *n_families);
--   PangoFontset *(*load_fontset)  (PangoFontMap               *fontmap,
-- 				  PangoContext               *context,
-- 				  const PangoFontDescription *desc,
-- 				  PangoLanguage              *language);
  
--   const char *shape_engine_type;
-- } PangoFontMapClass;

-- The PangoFontMapClass structure holds the virtual functions for a particular PangoFontMap implementation.
-- GObjectClass parent_class; 	parent GObjectClass.
-- load_font () 	a function to load a font with a given description. See pango_font_map_load_font().
-- list_families () 	A function to list available font families. See pango_font_map_list_families().
-- load_fontset () 	a function to load a fontset with a given given description suitable for a particular language. See pango_font_map_load_fontset().
-- const char *shape_engine_type; 	the type of rendering-system-dependent engines that can handle fonts of this fonts loaded with this fontmap.
-- PANGO_FONT_MAP_CLASS()

-- #define PANGO_FONT_MAP_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_FONT_MAP, PangoFontMapClass))

-- Casts a GObject to a PangoFontMapClass.
-- klass : 	a GObject.
-- PANGO_IS_FONT_MAP_CLASS()

-- #define PANGO_IS_FONT_MAP_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_FONT_MAP))

-- Returns TRUE if klass is a subtype of PangoFontMapClass.
-- klass : 	a GObject.
-- PANGO_FONT_MAP_GET_CLASS()

-- #define PANGO_FONT_MAP_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_FONT_MAP, PangoFontMapClass))

-- Returns the type of a PangoFontMap.
-- obj : 	a PangoFontMap.
-- pango_font_map_load_font ()

-- PangoFont*  pango_font_map_load_font        (PangoFontMap *fontmap,
--                                              PangoContext *context,
--                                              const PangoFontDescription *desc);

-- Load the font in the fontmap that is the closest match for desc.

-- fontmap : 	a PangoFontMap
-- context : 	the PangoContext the font will be used with
-- desc : 	a PangoFontDescription describing the font to load
-- Returns : 	the font loaded, or NULL if no font matched.
-- pango_font_map_load_fontset ()

-- PangoFontset* pango_font_map_load_fontset   (PangoFontMap *fontmap,
--                                              PangoContext *context,
--                                              const PangoFontDescription *desc,
--                                              PangoLanguage *language);

-- Load a set of fonts in the fontmap that can be used to render a font matching desc.

-- fontmap : 	a PangoFontMap
-- context : 	the PangoContext the font will be used with
-- desc : 	a PangoFontDescription describing the font to load
-- language : 	a PangoLanguage the fonts will be used for
-- Returns : 	the fontset, or NULL if no font matched.
-- pango_font_map_list_families ()

-- void        pango_font_map_list_families    (PangoFontMap *fontmap,
--                                              PangoFontFamily ***families,
--                                              int *n_families);

-- List all families for a fontmap.

-- fontmap : 	a PangoFontMap
-- families : 	location to store a pointer to an array of PangoFontFamily *. This array should be freed with g_free().
-- n_families : 	location to store the number of elements in families
-- pango_font_map_get_shape_engine_type ()

-- const char* pango_font_map_get_shape_engine_type
--                                             (PangoFontMap *fontmap);

-- Returns the render ID for shape engines for this fontmap. See the render_type field of PangoEngineInfo.

-- fontmap : 	a PangoFontMap
-- Returns : 	the ID string for shape engines for this fontmap. Owned by Pango, should not be modified or freed.

-- Since 1.4

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFontDescription)"
		end

end -- PANGO_FONT_DESCRIPTION
