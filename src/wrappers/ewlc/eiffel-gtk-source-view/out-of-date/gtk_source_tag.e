note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GtkSourceView developers
					
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

	wrapped_version: "1.8.5"

deferred class GTK_SOURCE_TAG

inherit G_OBJECT

feature {} -- Creation

	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GtkTextTag
	--          +----GtkSourceTag
	--                +----GtkSyntaxTag
	--                +----GtkPatternTag
	--
	--
	--   GObject
	--    +----GtkTextTag
	--          +----GtkSourceTag
	--                +----GtkSyntaxTag
	--
	--
	--   GObject
	--    +----GtkTextTag
	--          +----GtkSourceTag
	--                +----GtkPatternTag
	--
	--Properties
	--
	--
	--   "id"                       gchararray            : Read / Write / Construct Only
	--   "tag-style"                GtkSourceTagStyle     : Read / Write
	--
	--Description
	--
	--Details
	--
	--  GtkSourceTag
	--
	-- typedef struct _GtkSourceTag GtkSourceTag;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkSourceTagClass
	--
	-- typedef struct _GtkSourceTagClass GtkSourceTagClass;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkSyntaxTag
	--
	-- typedef struct _GtkSyntaxTag GtkSyntaxTag;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkSyntaxTagClass
	--
	-- typedef struct _GtkSyntaxTagClass GtkSyntaxTagClass;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkPatternTag
	--
	-- typedef struct _GtkPatternTag GtkPatternTag;
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkPatternTagClass
	--
	-- typedef struct _GtkPatternTagClass GtkPatternTagClass;
	--
feature {ANY}
	style: GTK_SOURCE_TAG_STYLE
			-- the style associated with the given tag. Can be Void
		local p: POINTER
		do
			p := gtk_source_tag_get_style (handle)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	set_style (a_style: GTK_SOURCE_TAG_STYLE)
			-- Associates `a_style' with the given tag.
		require style_not_void: a_style/=Void
		do
			gtk_source_tag_set_style(handle,a_style.handle)
		end
	
	--  gtk_syntax_tag_new ()
	--
	-- GtkTextTag*         gtk_syntax_tag_new                  (const gchar *id,
	--                                                          const gchar *name,
	--                                                          const gchar *pattern_start,
	--                                                          const gchar *pattern_end);
	--
	--   Creates a new syntax tag object with the provided arguments.
	--
	--   id :            the ID for the tag.
	--   name :          the name of the tag.
	--   pattern_start : the starting pattern.
	--   pattern_end :   the ending pattern.
	--   Returns :       a new syntax tag, as a GtkTextTag.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_pattern_tag_new ()
	--
	-- GtkTextTag*         gtk_pattern_tag_new                 (const gchar *id,
	--                                                          const gchar *name,
	--                                                          const gchar *pattern);
	--
	--   Creates a new pattern tag object with the provided arguments.
	--
	--   id :      the ID for the tag.
	--   name :    the name of the tag.
	--   pattern : the pattern.
	--   Returns : a new pattern tag, as a GtkTextTag.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_keyword_list_tag_new ()
	--
	-- GtkTextTag*         gtk_keyword_list_tag_new            (const gchar *id,
	--                                                          const gchar *name,
	--                                                          const GSList *keywords,
	--                                                          gboolean case_sensitive,
	--                                                          gboolean match_empty_string_at_beginning,
	--                                                          gboolean match_empty_string_at_end,
	--                                                          const gchar *beginning_regex,
	--                                                          const gchar *end_regex);
	--
	--   Creates a new keyword list tag object with the provided arguments.
	--
	--   id :                              the ID for the tag.
	--   name :                            the name of the tag.
	--   keywords :                        a list of keywords.
	--   case_sensitive :                  whether the tag should be case
	--                                     sensitive.
	--   match_empty_string_at_beginning : whether the tag should match empty
	--                                     string at the beginning.
	--   match_empty_string_at_end :       whether the tag should match empty
	--                                     string at the end.
	--   beginning_regex :                 the beginning regular expression.
	--   end_regex :                       the ending regular expression.
	--   Returns :                         a new keyword list tag, as a GtkTextTag.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_block_comment_tag_new
	--
	-- #define             gtk_block_comment_tag_new
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_line_comment_tag_new ()
	--
	-- GtkTextTag*         gtk_line_comment_tag_new            (const gchar *id,
	--                                                          const gchar *name,
	--                                                          const gchar *pattern_start);
	--
	--   Creates a new line comment tag object with the provided arguments.
	--
	--   id :            the ID for the tag.
	--   name :          the name of the tag.
	--   pattern_start : the starting pattern.
	--   Returns :       a new line comment tag, as a GtkTextTag.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_string_tag_new ()
	--
	-- GtkTextTag*         gtk_string_tag_new                  (const gchar *id,
	--                                                          const gchar *name,
	--                                                          const gchar *pattern_start,
	--                                                          const gchar *pattern_end,
	--                                                          gboolean end_at_line_end);
	--
	--   Creates a new string tag object with the provided arguments.
	--
	--   id :              the ID for the tag.
	--   name :            the name of the tag.
	--   pattern_start :   the starting pattern.
	--   pattern_end :     the ending pattern.
	--   end_at_line_end : whether the ending pattern should be suffixed by an
	--                     end-of-line character.
	--   Returns :         a new string tag, as a GtkTextTag.
	--
feature {ANY}
	id: STRING
			-- The "id" property: ID used to refer to the source tag. Default value
			-- Void.
		local p: POINTER
		do
			Result:=string_property_from_pspec(id_property_spec)
		end

	tag_style: GTK_SOURCE_TAG_STYLE
			-- The "tag-style" property: the style associated with the source
			-- tag. TODO: provide a setter
		local p: POINTER
		do
			p:=object_property_from_pspec(tag_style_property_spec)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

feature {} -- size and implementation
	struct_size: INTEGER
		external "C inline use <gtksourceview/gtksourcetag.h>"
		alias "sizeof(GtkSourceTag)"
		end

	id_property_spec: G_PARAM_SPEC
		once
			Result:=find_property(id_property_name)
			check id_property_found: Result/=Void end
		end

	id_property_name: STRING is "id"

	tag_style_property_spec: G_PARAM_SPEC
		once
			Result:=find_property(tag_style_property_name)
			check tag_style_property_found: Result/=Void end
		end

	tag_style_property_name: STRING is "tag-style"


end -- class GTK_SOURCE_TAG
