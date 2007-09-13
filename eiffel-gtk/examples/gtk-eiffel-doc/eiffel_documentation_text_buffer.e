indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
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

class EIFFEL_DOCUMENTATION_TEXT_BUFFER
	-- TODO: Recognize class names stored into comments and add proper link to it

inherit
	GTK_TEXT_BUFFER
	
	CLASS_NAME_VISITOR undefine is_equal, copy end
	CLASS_TEXT_VISITOR undefine is_equal, copy end
	INDEX_LIST_VISITOR undefine is_equal, copy end
	INDEX_CLAUSE_VISITOR undefine is_equal, copy end

	COMMENT_VISITOR  undefine is_equal, copy end
	
	FEATURE_CLAUSE_LIST_VISITOR undefine is_equal, copy end
	FEATURE_CLAUSE_VISITOR undefine is_equal, copy end

	PARENT_LISTS_VISITOR undefine is_equal, copy end
	PARENT_EDGE_VISITOR undefine is_equal, copy end

	CREATION_CLAUSE_LIST_VISITOR undefine is_equal, copy end
	CREATION_CLAUSE_VISITOR undefine is_equal, copy end
	
insert
	PANGO_SCALES
	PANGO_STYLE
	PANGO_WEIGHT

creation dummy, from_class_name

feature {GTK_EIFFEL_DOC} -- Creation
	from_class_name (a_class_name: CLASS_NAME) is
		require
			class_name_not_void: a_class_name/=Void
		do
			class_name := a_class_name
			class_text := class_name.class_text
			debug
				io.put_string(once "{EIFFEL_DOCUMENTATION_TEXT_BUFFER}.from_class_name(")
				io.put_string(a_class_name.to_string)
				io.put_line(once ")")
			end
			make
			add_tags
			iter := start_iter
			
			if  class_text /= Void then
				put_indexing 
				-- remove the line above and put "if
				-- class_text.index_list/=Void then put_indexing end" when
				-- 2.4 is out.
				if class_text.heading_comment1/=Void then put_comment(class_text.heading_comment1) end
				put_class_name
				if class_text.heading_comment2/=Void then put_comment(class_text.heading_comment2) end
				if class_text.obsolete_mark /= Void then put_obsolete_mark end
				if class_text.parent_lists /= Void then put_parent_lists end
				if class_text.creation_clause_list /= Void then put_creation_clause_list end
				if class_text.feature_clause_list /= Void then put_feature_clause_list end
				-- # class_invariant: CLASS_INVARIANT
				-- If any, the class invariant.
				-- # end_comment: COMMENT
				-- Comment after end of class.

			else insert_at(iter, once "No class text")
			end
		end
	
feature
	iter: GTK_TEXT_ITER
			-- The insertion point used in all the features that add text
			-- to the buffer.
	
	put_indexing is
			-- Append the indexing clauses to Current buffer; TODO:
			-- currently only a small note is printed since the real
			-- implementation is commented out; in fact SmartEiffel 2.3
			-- does not export to visitors enought features to implement
			-- this. A couple of one-liner patches have already been
			-- applied to the SE repository.
		do
			insert_with_tag(iter,once "SmartEiffel 2.3 does not export to visitors enought features to implement this. A couple of one-liner patches have already been applied to the compiler SVN repository.",note_tag)
			-- require index_list_not_void: class_text.index_list /= Void
			-- local
			--	index_list: INDEX_LIST; string: STRING
			--	ici: ITERATOR[INDEX_CLAUSE]; index_clause: INDEX_CLAUSE;
			-- 		do
			-- 			index_list := class_name.class_text.index_list
			-- 			-- insert_at(iter, once "indexing")
			-- 			from ici:=index_list.list.get_new_iterator; ici.start; until ici.is_off
			-- 			loop
			-- 				index_clause := ici.item
			-- 				if index_clause /= Void then
			-- 					if index_clause.tag /= Void
			-- 					then insert_with_tag(iter,index_clause.tag.to_string+" ",keyword_tag)
			-- 					else insert_at(iter, once " (No tag?!?!) ")
			-- 					end
			-- 					if index_clause.list /= Void then
			-- 						string := merged_manifest_strings(index_clause.list)
			-- 						string.append_character('%N')
			-- 						insert_with_tag(iter,string,string_tag)
			-- 					end -- index_clause.list /= Void
			-- 				else
			-- 					debug io.put_line("Void index clause") end
			-- 				end -- index_claue /= Void
			-- 				ici.next
			-- 			end -- Loop over index list
		end

	put_comment(a_comment: COMMENT) is
		require  a_comment /= Void
		do
			insert_with_tag(iter,merged_strings(a_comment.list),comment_tag)
		end

	put_class_name is
		local i: INTEGER; an_arg: FORMAL_GENERIC_ARG
		do
			if class_text.is_deferred
			then insert_with_tag(iter,once "deferred class ",class_tag)
			elseif class_text.is_expanded
			then insert_with_tag(iter,once "expanded class ",class_tag)
			else insert_with_tag(iter,once "class ",class_tag)
			end
			insert_with_tag(iter,class_name.to_string,class_tag)
			if class_text.formal_generic_list /= Void then
				insert_with_tag(iter,once " [",class_tag)
				from i := 1 until i > class_text.formal_generic_list.count - 1 loop
					an_arg := class_text.formal_generic_list.item(i)
					check arg_not_void: an_arg /= Void end
					put_formal_generic_arg(an_arg)		
					insert_with_tag(iter,once ", ",class_tag)
					i := i + 1
				end
				put_formal_generic_arg(class_text.formal_generic_list.item(i))
				insert_with_tag(iter,once "]",class_tag)				
			end
			insert_at(iter,once "%N")
		end

	put_formal_generic_arg (an_arg: FORMAL_GENERIC_ARG) is
		do
			insert_with_tag(iter,an_arg.name.to_string,class_tag)
			if an_arg.constrained then
				insert_with_tag(iter,left_arrow,class_tag) -- "->"
				insert_with_tag(iter,an_arg.constraint.written_mark,class_tag)
			end
		end
	
	put_obsolete_mark is
		require class_text.obsolete_mark/=Void
		do
			insert_with_tag(iter,once "obsolete%N", class_tag)
			insert_with_tag(iter,class_text.obsolete_mark.to_string, string_tag)
		end
			
	put_parent_lists is
		require class_text.parent_lists /= Void
		local parents: PARENT_LISTS
		do
			parents := class_text.parent_lists

			if parents.inherit_count > 0 then
				if parents.inherit_count = 1
				then insert_with_tag(iter,once "Direct parent ",keyword_tag)
				else insert_with_tag(iter,once "Direct parents ",keyword_tag)
				end
				if parents.inherit_comment /= Void then put_comment(parents.inherit_comment) end
				if parents.inherit_list /= Void then put_parent_edges(parents.inherit_list) end
			end
			
			if parents.insert_count > 0 then
				insert_with_tag(iter,once "Directly inserting ",keyword_tag)
				if parents.insert_comment /= Void then put_comment(parents.insert_comment) end
				if parents.default_insert_any_added_flag
				then insert_with_tag(iter,once "ANY has been automatically inserted%N",comment_tag)
				end
				if parents.insert_list /= Void then put_parent_edges(parents.insert_list) end
			end
		end

	put_parent_edges (some_parent_edges: COLLECTION[PARENT_EDGE]) is
		require some_parent_edges /= Void
		local i: INTEGER; edge: PARENT_EDGE
		do
			from i := some_parent_edges.lower until i > some_parent_edges.upper loop
				edge := some_parent_edges.item(i)
				insert_with_tag(iter, edge.class_text_name+"%N",feature_tag)
				i := i + 1
			end
		end
	
	put_creation_clause_list is
		require class_text.creation_clause_list /= Void
		do
			-- Useful CREATION_CLAUSE_LIST features clients: CLIENT_LIST
			-- comment: COMMENT; procedure_list: FEATURE_NAME_LIST
		end

	put_feature_clause_list is
		require class_text.feature_clause_list /= Void 
		do
			-- count: INTEGER_32 Number of items in Current. list:
			-- FAST_ARRAY[FEATURE_CLAUSE]
		end
	
feature -- Visitor features. Mostly empty
	visit_class_name (visited: CLASS_NAME) is do raise(dead_code) end
	visit_class_text (visited: CLASS_TEXT) is do raise(dead_code) end
	visit_index_list (visited: INDEX_LIST) is do raise(dead_code) end
	visit_index_clause (visited: INDEX_CLAUSE) is do raise(dead_code) end

	visit_comment (visited: COMMENT) is do raise(dead_code) end
	
	visit_feature_clause_list (some_features: FEATURE_CLAUSE_LIST) is do raise(dead_code) end
	visit_feature_clause (a_feature_clause: FEATURE_CLAUSE) is do raise(dead_code) end

	visit_parent_lists (visited: PARENT_LISTS) is do raise(dead_code) end
	visit_parent_edge (visited: PARENT_EDGE) is do raise(dead_code) end
		
	visit_creation_clause_list (visited: CREATION_CLAUSE_LIST) is do raise(dead_code) end
	visit_creation_clause (visited: CREATION_CLAUSE) is do raise(dead_code) end
	
	dead_code: STRING is "Visitor feature of an EIFFEL_DOCUMENTATION_TEXT_BUFFER invoked. They should never be invoked by design, since they're empty."

feature -- Tags
	add_tags is
			-- Creates all the tags and add the them to the `tag_table'
		do
			create keyword_tag.with_name(once "keyword")
			-- keyword_tag.set_foreground(once "blue")
			keyword_tag.set_weight(pango_weight_semibold)
			tag_table.add(keyword_tag)
			
			create comment_tag.with_name(once "comment")
			-- comment_tag.set_foreground(once "green")
			comment_tag.set_style(pango_style_oblique)
			comment_tag.set_left_margin(25)
			comment_tag.set_justification(gtk_justify_left) -- TODO: when supported gtk_justify_fill)
			tag_table.add(comment_tag)

			create string_tag.with_name(once "string")
			-- string_tag.set_foreground(once "gray")
			string_tag.set_style(pango_style_italic)
			string_tag.set_justification(gtk_justify_left) -- TODO: when supported gtk_justify_fill)
			tag_table.add(string_tag)
			
			create class_tag.with_name(once "class")
			class_tag.set_scale(pango_scale_xx_large*pango_scale_large)
			class_tag.set_weight(pango_weight_ultrabold)
			tag_table.add(class_tag)
			
			create feature_tag.with_name(once "feature")
			feature_tag.set_weight(pango_weight_bold)
			tag_table.add(feature_tag)
			
			create cluster_tag.with_name(once "cluster")
			tag_table.add(cluster_tag)

			create note_tag.with_name(once "note")
			note_tag.set_scale(pango_scale_xx_small)
			note_tag.set_weight(pango_weight_ultralight)
			tag_table.add(note_tag)
		ensure
		end
	
	keyword_tag: GTK_TEXT_TAG 
	comment_tag: GTK_TEXT_TAG
	string_tag: GTK_TEXT_TAG 
	class_tag: GTK_TEXT_TAG 
	feature_tag: GTK_TEXT_TAG
	cluster_tag: GTK_TEXT_TAG
	
	note_tag: GTK_TEXT_TAG

feature {} -- Implementation, syntactic sugar
	class_name: CLASS_NAME
	class_text: CLASS_TEXT
	
	not_homogeneous: BOOLEAN is False
	dont_expand: BOOLEAN is False
	expand: BOOLEAN is True

	dont_fill: BOOLEAN is False
	fill: BOOLEAN is True

	no_padding: INTEGER is 0


	merged_strings (some_strings: COLLECTION[STRING]): STRING is
			-- A new string with all the strings in `some_strings'
			-- appended; all carriage return are replaced with a space. A
			-- newline is added at the end.
		require some_strings_not_void: some_strings /= Void
		local capacity: INTEGER;i: ITERATOR[STRING]
		do
			i := some_strings.get_new_iterator
			from i.start until i.is_off loop
				if i.item/=Void then capacity:=capacity+i.item.count end
				i.next
			end
			create Result.with_capacity(capacity+1)
			from i.start until i.is_off loop
				if i.item/=Void then Result.append(i.item) end
				i.next
			end
			Result.replace_all('%N',' ')
			Result.append_character('%N') 
		ensure not_void: Result /= Void
		end
	
	merged_manifest_strings (some_strings: COLLECTION[MANIFEST_STRING]): STRING is
			-- A new string with all the strings in `some_strings'
			-- appended; all new lines are replaced with a space, except
			-- the ending one.
		require some_strings_not_void: some_strings /= Void
		local capacity: INTEGER;i: ITERATOR[MANIFEST_STRING]
		do
			-- Compute Result's length
			i := some_strings.get_new_iterator
			from i.start until i.is_off loop
				if i.item/=Void then capacity:=capacity+i.item.count end
				i.next
			end
			create Result.with_capacity(capacity)
			from i.start until i.is_off loop
				if i.item/=Void then Result.append(i.item.to_string) end
				i.next
			end
			Result.replace_all('%N',' ')
			if Result.last=' ' then Result.put('%N',Result.upper) end 
		ensure not_void: Result /= Void
		end

	left_arrow: STRING is
			-- A right arrow in Unicode converted into UTF8
		do
			Result := (U"%/Ux2192/").to_string 
		end

invariant
	class_name/=Void
	class_text/=Void
end -- class EIFFEL_DOCUMENTATION_TEXT_BUFFER
