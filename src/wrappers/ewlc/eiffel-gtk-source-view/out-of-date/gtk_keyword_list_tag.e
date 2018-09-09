note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GtkSourceView developers
					
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

class GTK_KEYWORD_LIST_TAG

inherit GTK_SOURCE_TAG

create {ANY} dummy, make, from_external_pointer
	
feature {} -- Creation
	make 	(an_id, a_name: STRING; some_keywords: G_SLIST_STRING;
			 case_sensitive: BOOLEAN;
			 match_empty_string_at_beginning: BOOLEAN;
			 match_empty_string_at_end: BOOLEAN;
			 a_beginning_regex: STRING;
			 an_end_regex: STRING)
			-- Creates a new keyword list tag object with the provided arguments.
		
			-- `an_id': the ID for the tag.

			-- `a_name': the name of the tag.

			-- keywords : a list of keywords.

			-- case_sensitive : whether the tag should be case
			-- sensitive.
		
			-- match_empty_string_at_beginning : whether the tag should match empty
			-- string at the beginning.
		
			-- match_empty_string_at_end : whether the tag should match empty
			-- string at the end.
		
			-- beginning_regex : the beginning regular expression.
		
			-- end_regex : the ending regular expression.
		require
			id_not_void: an_id /= Void
			name_not_void: a_name /= Void
			keywords_not_void: some_keywords /= Void
			beginning_regex_not_void: a_beginning_regex /= Void
			end_regex_not_void: an_end_regex /= Void
		do
			from_external_pointer(gtk_keyword_list_tag_new
										 (an_id.to_external,
										  a_name.to_external,
										  some_keywords.handle,
										  case_sensitive.to_integer
										  match_empty_string_at_beginning.to_integer,
										  match_empty_string_at_end.to_integer,
										  a_beginning_regex.to_external,
										  an_end_regex.to_external))
		end
end -- class GTK_KEYWORD_LIST_TAG
