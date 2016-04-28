note
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

	wrapped_version: "2.0.1"

class GTKSOURCEVIEW_20_SEARCHING_IN_A_GTK_SOURCE_BUFFER

inherit
	(SHARED_?)C_STRUCT

insert
	GTKSOURCEVIEW_20_SEARCHING_IN_A_GTK_SOURCE_BUFFER_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: GtkSourceView 2 Reference Manual (start)
	--   Link: API reference (parent)
	--   Link: GtkSourceBuffer (previous)
	--   Link: GtkSourceView (next)
	--   Link: API reference (reference)
	--   Link: Syntax highlighting reference (reference)
	--
	--   Prev Up Home             GtkSourceView 2 Reference Manual             Next
	--   Top  |  Description
	--
	--   Searching in a GtkSourceBuffer
	--
	--   Searching in a GtkSourceBuffer
	--
	--Synopsis
	--
	--
	-- #include <gtksourceview/gtksourceiter.h>
	--
	--
	-- enum                GtkSourceSearchFlags;
	-- gboolean            gtk_source_iter_backward_search     (const GtkTextIter *iter,
	--                                                          const gchar *str,
	--                                                          GtkSourceSearchFlags flags,
	--                                                          GtkTextIter *match_start,
	--                                                          GtkTextIter *match_end,
	--                                                          const GtkTextIter *limit);
	-- gboolean            gtk_source_iter_forward_search      (const GtkTextIter *iter,
	--                                                          const gchar *str,
	--                                                          GtkSourceSearchFlags flags,
	--                                                          GtkTextIter *match_start,
	--                                                          GtkTextIter *match_end,
	--                                                          const GtkTextIter *limit);
	--
	--
	--Description
	--
	--Details
	--
	--  enum GtkSourceSearchFlags
	--
	-- typedef enum
	-- {
	--         GTK_SOURCE_SEARCH_VISIBLE_ONLY           = 1 << 0,
	--         GTK_SOURCE_SEARCH_TEXT_ONLY              = 1 << 1,
	--         GTK_SOURCE_SEARCH_CASE_INSENSITIVE       = 1 << 2
	--         /* Possible future plans: SEARCH_REGEXP */
	-- } GtkSourceSearchFlags;
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_iter_backward_search ()
	--
	-- gboolean            gtk_source_iter_backward_search     (const GtkTextIter *iter,
	--                                                          const gchar *str,
	--                                                          GtkSourceSearchFlags flags,
	--                                                          GtkTextIter *match_start,
	--                                                          GtkTextIter *match_end,
	--                                                          const GtkTextIter *limit);
	--
	--   Same as gtk_text_iter_backward_search(), but supports case insensitive
	--   searching.
	--
	--   iter :        a GtkTextIter where the search begins.
	--   str :         search string.
	--   flags :       bitmask of flags affecting the search.
	--   match_start : return location for start of match, or %NULL.
	--   match_end :   return location for end of match, or %NULL.
	--   limit :       location of last possible match_start, or %NULL for start of
	--                 buffer.
	--   Returns :     whether a match was found.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_source_iter_forward_search ()
	--
	-- gboolean            gtk_source_iter_forward_search      (const GtkTextIter *iter,
	--                                                          const gchar *str,
	--                                                          GtkSourceSearchFlags flags,
	--                                                          GtkTextIter *match_start,
	--                                                          GtkTextIter *match_end,
	--                                                          const GtkTextIter *limit);
	--
	--   Searches forward for str. Any match is returned by setting match_start to
	--   the first character of the match and match_end to the first character
	--   after the match. The search will not continue past limit. Note that a
	--   search is a linear or O(n) operation, so you may wish to use limit to
	--   avoid locking up your UI on large buffers.
	--
	--   If the GTK_SOURCE_SEARCH_VISIBLE_ONLY flag is present, the match may have
	--   invisible text interspersed in str. i.e. str will be a
	--   possibly-noncontiguous subsequence of the matched range. similarly, if you
	--   specify GTK_SOURCE_SEARCH_TEXT_ONLY, the match may have pixbufs or child
	--   widgets mixed inside the matched range. If these flags are not given, the
	--   match must be exact; the special 0xFFFC character in str will match
	--   embedded pixbufs or child widgets. If you specify the
	--   GTK_SOURCE_SEARCH_CASE_INSENSITIVE flag, the text will be matched
	--   regardless of what case it is in.
	--
	--   Same as gtk_text_iter_forward_search(), but supports case insensitive
	--   searching.
	--
	--   iter :        start of search.
	--   str :         a search string.
	--   flags :       flags affecting how the search is done.
	--   match_start : return location for start of match, or %NULL.
	--   match_end :   return location for end of match, or %NULL.
	--   limit :       bound for the search, or %NULL for the end of the buffer.
	--   Returns :     whether a match was found.

end -- class GTKSOURCEVIEW_20_SEARCHING_IN_A_GTK_SOURCE_BUFFER
