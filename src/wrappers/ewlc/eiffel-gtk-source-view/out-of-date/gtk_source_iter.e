note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli 
					
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

deferred class GTK_SOURCE_SEARCH
	-- Features to search into a GtkSourceBuffer
	
feature {} --  Search flags (enum GtkSourceSearchFlags)
	gtk_source_search_visible_only: INTEGER
			-- GTK_SOURCE_SEARCH_VISIBLE_ONLY
		external "C use <gtksourceview/gtksourceiter.h>"
		alias "GTK_SOURCE_SEARCH_VISIBLE_ONLY"
		end
        
	gtk_source_search_text_only: INTEGER
			-- GTK_SOURCE_SEARCH_TEXT_ONLY
		external "C use <gtksourceview/gtksourceiter.h>"
		alias "GTK_SOURCE_SEARCH_TEXT_ONLY"
		end

	gtk_source_search_case_insensitive: INTEGER
			-- GTK_SOURCE_SEARCH_CASE_INSENSITIVE
		external "C use <gtksourceview/gtksourceiter.h>"
		alias "GTK_SOURCE_SEARCH_CASE_INSENSITIVE"
		end
       
feature {ANY} -- Searching
	backward_search (an_iter, a_limit: GTK_TEXT_ITER; a_string: STRING; some_flags: INTEGER): GTK_TEXT_SEARCH_RESULT
			-- Search `a_string' backward, case insensitively, starting from
			-- `an_iter', ending at `a_limit'. If `a_limit' is Void search is
			-- extended till the the beginning of the buffer.
		do
			--   iter :        a GtkTextIter where the search begins.
			--   str :         search string.
			--   flags :       bitmask of flags affecting the search.
			--   match_start : return location for start of match, or %NULL.
			--   match_end :   return location for end of match, or %NULL.
			--   limit :       location of last possible match_start, or %NULL for start of
			--                 buffer.
			--   Returns :     whether a match was found.
			Result.set_found(gtk_source_iter_backward_search
								  (an_iter.handle, a_string.to_external,
									some_flags,
									Result.match_start.handle,
									Result.match_end.handle,
									null_or(a_limit)).to_boolean)
		end
	
	forward_search  (an_iter, a_limit: GTK_TEXT_ITER; a_string: STRING; some_flags: INTEGER)
			-- Searches forward for `a_string' starting from `an_iter'. Any match
			-- is returned by setting match_start to the first character of the
			-- match and match_end to the first character after the match. The
			-- search will not continue past limit. Note that a search is a linear
			-- or O(n) operation, so you may wish to use limit to avoid locking up
			-- your UI on large buffers.

			-- If the GTK_SOURCE_SEARCH_VISIBLE_ONLY flag is present, the match may
			-- have invisible text interspersed in `a_string'. i.e. it will be a
			-- possibly-noncontiguous subsequence of the matched range. similarly,
			-- if you specify GTK_SOURCE_SEARCH_TEXT_ONLY, the match may have
			-- pixbufs or child widgets mixed inside the matched range. If these
			-- flags are not given, the match must be exact; the special 0xFFFC
			-- character in `a_string' will match embedded pixbufs or child
			-- widgets. If you specify the GTK_SOURCE_SEARCH_CASE_INSENSITIVE flag,
			-- the text will be matched regardless of what case it is in.

			-- Similar to GTK_TEXT_ITER's `forward_search', but supports case
			-- insensitive searching.

		do
			Result.set_found(gtk_source_iter_forward_search
								  (an_iter.handle, a_string.to_external,
									some_flags,
									Result.match_start.handle,
									Result.match_end.handle,
									null_or(a_limit)).to_boolean)
		end

	find_matching_bracket (an_iter: GTK_TEXT_ITER): BOOLEAN
			-- Tries to match the bracket character currently at `an_iter' with its
			-- opening/closing counterpart, and if found moves `an_iter' to the
			-- position where it was found.

			--   Returns : TRUE if the matching bracket was found and the iter iter 
			--   moved.
		require
			iter_belongs_to_a_gtk_source_buffer: {GTK_SOURCE_BUFFER} ?:= an_iter.buffer
		do
			Result:=gtk_source_iter_find_matching_bracket(an_iter).to_boolean
		end

feature {} -- External calls
	-- #include <gtksourceview/gtksourceiter.h>

	gtk_source_iter_backward_search (an_iter, a_str: POINTER; some_flags: INTEGER; a_match_start, a_match_end, a_limit: POINTER): INTEGER
			-- gboolean gtk_source_iter_backward_search (const GtkTextIter *iter,
			-- const gchar *str, GtkSourceSearchFlags flags, GtkTextIter
			-- *match_start, GtkTextIter *match_end, const GtkTextIter *limit);
		external "C use <gtksourceview/gtksourceiter.h>"
		end

	gtk_source_iter_forward_search (an_iter, a_str: POINTER; some_flags: INTEGER; a_match_start, a_match_end, a_limit: POINTER): INTEGER
			-- gboolean gtk_source_iter_forward_search (const GtkTextIter *iter,
			-- const gchar *str, GtkSourceSearchFlags flags, GtkTextIter
			-- *match_start, GtkTextIter *match_end, const GtkTextIter *limit);
		external "C use <gtksourceview/gtksourceiter.h>"
		end
	
	gtk_source_iter_find_matching_bracket (an_iter: POINTER): INTEGER
			-- 	gboolean gtk_source_iter_find_matching_bracket (GtkTextIter *iter);
		external "C use <gtksourceview/gtksourceiter.h>"
		end
end -- class GTK_SOURCE_SEARCH
