-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_TYPES


insert ANY undefine is_equal, copy end

feature {ANY} -- C type definitions (typedefs)
	pango_fontset_foreach_func: POINTER is
		-- typedef PangoFontsetForeachFunc
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	pango_glyph: NATURAL_32 is
		-- typedef PangoGlyph
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	pango_attr_data_copy_func: POINTER is
		-- typedef PangoAttrDataCopyFunc
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	pango_attr_filter_func: POINTER is
		-- typedef PangoAttrFilterFunc
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

	pango_glyph_unit: INTEGER_32 is
		-- typedef PangoGlyphUnit
		-- Empty by design, used for anchored declarations.
	do
	ensure Result.is_default
	end

end
