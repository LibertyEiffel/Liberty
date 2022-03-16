note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli
					
					This program is free software; you can redistribute it and/or
					modify it under the terms of the GNU General Public License
					as published by the Free Software Foundation; either version 2.0 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class EIFFEL_DOCUMENTATION_TEXT_BUFFER
	-- TODO: Recognize class names stored into comments and add proper link to them

inherit
	GTK_TEXT_BUFFER
	
	CLASS_NAME_VISITOR undefine is_equal, copy end
	CLASS_NAME_LIST_VISITOR  undefine is_equal, copy end
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
	
	CLIENT_LIST_VISITOR undefine is_equal, copy end
	FEATURE_NAME_LIST_VISITOR undefine is_equal, copy end
	FEATURE_NAME_VISITOR undefine is_equal, copy end

	ASSERTION_LIST_VISITOR undefine is_equal, copy end
		-- ASSERTION_LIST_VISITOR is an heir of CHECK_INVARIANT_VISITOR,
		-- CLASS_INVARIANT_VISITOR, E_ENSURE_VISITOR,
		-- LOOP_INVARIANT_VISITOR, REQUIRE_ITEM_VISITOR so there's no
		-- need to inherit them anew.
	
insert
	PANGO_SCALES
	PANGO_STYLE
	PANGO_WEIGHT

create {ANY} from_class_name

feature {GTK_EIFFEL_DOC} -- Creation
	from_class_name (a_class_name: CLASS_NAME)
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
			make; add_tags; iter := start_iter
			
			if  class_text = Void then insert_at(iter, once "No class text")
			else
				put_indexing 
				-- remove the line above and put "if
				-- class_text.index_list/=Void then put_indexing end" when
				-- 2.4 is out.
				put_comment(class_text.heading_comment1)
				put_main_class_name
				put_comment(class_text.heading_comment2)
				if class_text.obsolete_mark/=Void then 
					insert_with_tag(iter,once "obsolete ", class_tag)
					insert_with_tag(iter,class_text.obsolete_mark.to_string, string_tag)
					insert_at(iter,newline)
				end
				if class_text.parent_lists /= Void then put_parent_lists end
				if class_text.creation_clause_list /= Void then put_creation_clause_list end
				if class_text.feature_clause_list /= Void then put_feature_clause_list end
				if class_text.class_invariant/=Void then put_class_invariant(class_text.class_invariant) end
				put_comment(class_text.end_comment)
			end
		end
	
feature {ANY}
	iter: GTK_TEXT_ITER
			-- The insertion point used in all the features that add text
			-- to the buffer.
	
	put_indexing
			-- Append the indexing clauses to Current buffer; TODO:
			-- currently only a small note is printed since the real
			-- implementation is commented out; in fact SmartEiffel 2.3
			-- does not export to visitors enought features to implement
			-- this. A couple of one-liner patches have already been
			-- applied to the SE repository.
		do
			insert_with_tag(iter,once "SmartEiffel 2.3 does not export to visitors enought features to implement this. A couple of one-liner patches have already been applied to the compiler SVN repository.%N",note_tag)
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

	put_comment (a_comment: COMMENT)
		do
			if a_comment/=Void then
				insert_with_tag(iter,merged_strings(a_comment.list),comment_tag)
			end
		end

	put_main_class_name
			-- Append to `iter' the name of the class text with full
			-- details as expected when you start reading an Eiffel
			-- class; i.e.  "deferred class FOO [ITEM_->BAR]" or
			-- "expanded class MAMAN"
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
			put_newline
		end

	put_formal_generic_arg (an_arg: FORMAL_GENERIC_ARG)
		do
			insert_with_tag(iter,an_arg.name.to_string,class_tag)
			if an_arg.constrained then
				insert_with_tag(iter,left_arrow,class_tag) -- "->"
				insert_with_tag(iter,an_arg.constraint.written_mark,class_tag)
			end
		end
				
	put_parent_lists
			-- Put parent_lists if not Void
		require class_text.parent_lists /= Void
		local parents: PARENT_LISTS
		do	
			parents := class_text.parent_lists
			if parents.inherit_count > 0 then
				if parents.inherit_count = 1
				then insert_with_tag(iter,once "Direct parent ",keyword_tag)
				else insert_with_tag(iter,once "Direct parents ",keyword_tag)
				end
				put_comment(parents.inherit_comment)
				if parents.inherit_list /= Void
				then put_parent_edges(parents.inherit_list)
				end
			end
			
			if parents.insert_count > 0 then
				insert_with_tag(iter,once "Directly inserting ",keyword_tag)
				put_comment(parents.insert_comment)
				if parents.default_insert_any_added_flag
				then insert_with_tag(iter,once "ANY has been automatically inserted%N",comment_tag)
				end
				if parents.insert_list /= Void
				then put_parent_edges(parents.insert_list)
				end
			end
		end
	
	put_parent_edges (some_parent_edges: COLLECTION[PARENT_EDGE])
		require some_parent_edges /= Void
		local i: INTEGER; edge: PARENT_EDGE
		do
			from i:=some_parent_edges.lower until i>some_parent_edges.upper-1
			loop
				edge := some_parent_edges.item(i)
				insert_with_tag(iter, edge.class_text_name+", ",feature_name_tag)
				i := i + 1
			end
			insert_with_tag(iter,some_parent_edges.item(i).class_text_name,
								 feature_name_tag)
			insert_at(iter,newline)
		end
	
	put_creation_clause_list
		require class_text.creation_clause_list /= Void
		local cci: ITERATOR[CREATION_CLAUSE]; cc: CREATION_CLAUSE; i, a_count: INTEGER
		do
			insert_with_tag(iter,once "creation features: ",feature_clause_tag)
			put_newline

			if class_text.creation_clause_list.list /= Void then
				from cci:=class_text.creation_clause_list.list.get_new_iterator
				until cci.is_off loop
					cc:=cci.item
					if cc/=Void then put_creation_clause(cc) end
					put_newline
					cci.next
				end -- loop over creation clauses
			end
		end

	put_creation_clause (a_creation_clause: CREATION_CLAUSE)
		require non_void_clause: a_creation_clause/=Void
		do
			if a_creation_clause.clients/=Void then
				put_client_list(a_creation_clause.clients)
			end
			if a_creation_clause.comment/=Void then
				put_comment(a_creation_clause.comment)
			end
			if a_creation_clause.procedure_list/=Void then
				put_feature_name_list(a_creation_clause.procedure_list)
			else io.put_line(once "Void procedure list in creation clause list.")
			end
		end

	put_client_list (some_clients: CLIENT_LIST)
		require clients_not_void: some_clients/=Void
		local i: INTEGER 
		do
			if some_clients.class_name_list/=Void then
				from i:=1 until i>some_clients.class_name_list.count-1 loop
					insert_with_tag(iter,some_clients.class_name_list.item(i).to_string,feature_clause_tag)
					i := i + 1
				end
			end
		end
	
	put_feature_clause_list
		require class_text.feature_clause_list /= Void
		local
			fci: ITERATOR[FEATURE_CLAUSE] -- Feature Clause Iterator
			fc: FEATURE_CLAUSE -- Feature Clause
			i: INTEGER
		do
			fci := class_text.feature_clause_list.list.get_new_iterator
			from fci.start until fci.is_off loop
				fc := fci.item
				-- clients: CLIENT_LIST The clients allowed to use these
				-- features.
				insert_with_tag(iter, "Feature clause "+fc.clients.eiffel_view,
									 feature_name_tag)

				-- comment: COMMENT The heading comment comming with the
				-- clause.
				put_comment(fc.comment)
				
				-- list: FAST_ARRAY[FEATURE_TEXT] Only the features of the
				-- current clause.
				if fc.list/=Void then 
					from i := fc.list.lower until i > fc.list.upper loop
						put_feature_text(fc.list.item(i))
						i := i + 1
					end
				else insert_with_tag(iter, once "no feature text into a feature clause%N", note_tag)
				end

				fci.next
			end -- Loop over Feature Clause
		end
	
	put_feature_name_list (a_list: FEATURE_NAME_LIST)
		require list_not_void: a_list/=Void
		local i: INTEGER
		do
			from i:=1 until i> a_list.count-1 loop
				put_feature_name(a_list.item(i))
				insert_with_tag(iter,once ", ",feature_name_tag)
				i:=i+1
			end
		end
	
	put_feature_name (a_name: FEATURE_NAME)
		require name_not_void: a_name /= Void
		do
			if a_name.is_frozen then
				insert_with_tag(iter,once "frozen ",feature_name_tag)
			end
			if a_name.is_infix_name then
				insert_with_tag(iter,once "infix ",feature_name_tag)
			end
			if a_name.is_prefix_name then
				insert_with_tag(iter,once "prefix ",feature_name_tag)
			end
			insert_with_tag(iter,a_name.to_string,feature_name_tag)
		end

	put_feature_text (a_text: FEATURE_TEXT)
		require text_not_void: a_text/=Void
		local i, a_count: INTEGER
		do
			-- names: FEATURE_NAME_LIST All the names of the feature.
			if a_text.names/=Void then
				from i:=1; a_count:=a_text.names.count until i>a_count-1 
				loop
					put_feature_name(a_text.names.item(i))
					insert_with_tag(iter, once ",",feature_name_tag)
					i:=i+1
				end 
				put_feature_name(a_text.names.item(a_count))
			else io.put_line(once "Void feature names list!")
			end

			if a_text.arguments/=Void
			then put_formal_arg_list(a_text.arguments)
			end
			
			if a_text.result_type/=Void then 
				-- result_type: TYPE_MARK Result type if any.
				insert_with_tag(iter,once ": ",argument_type_tag)
				insert_with_tag(iter,a_text.result_type.written_mark,argument_type_tag)
			end
			
			put_newline

			put_comment(a_text.header_comment) -- Header comment for a routine or following comment for an attribute.
			
			if a_text.obsolete_mark/=Void then
				-- obsolete_mark: MANIFEST_STRING The obsolete mark if any.
				insert_with_tag(iter,once "obsolete ", feature_clause_tag)
				insert_with_tag(iter,a_text.obsolete_mark.to_string, string_tag)
				put_newline
			end
			
			if a_text.clients/=Void then
				-- clients: CLIENT_LIST
			end
			
			if a_text.require_assertion/=Void then
				-- require_assertion: E_REQUIRE Not Void if any.
			end

			if a_text.ensure_assertion/=Void then 
				-- ensure_assertion: E_ENSURE Not Void if any.
				put_ensure_assertion(a_text.ensure_assertion)
			end
		end
	
	put_class_invariant (an_invariant: CLASS_INVARIANT)
		require class_text.class_invariant/=Void
		local assertion_iter: ITERATOR[ASSERTION]; an_assertion: ASSERTION
		do
			if an_invariant.list/=Void then
				assertion_iter:=an_invariant.list.get_new_iterator
				from assertion_iter.start until assertion_iter.is_off
				loop
					an_assertion := assertion_iter.item
					if an_assertion/=Void then put_assertion(an_assertion) end
					assertion_iter.next
				end
			else io.put_line(once "Empty assertion list in a class invariant.")
			end
		end

	put_assertion (an_assertion: ASSERTION)
		require an_assertion/=Void
		do
			-- tag: TAG_NAME
			-- expression: EXPRESSION
			-- comment: COMMENT
		end
	
	put_formal_arg_list (some_arguments: FORMAL_ARG_LIST)
			-- Put formal arguments
		require some_arguments/=Void
		local i, a_count: INTEGER; a_name: ARGUMENT_NAME1; a_type_mark: TYPE_MARK
		do
			insert_with_tag(iter, once " (",feature_clause_tag)
			from i:=1; a_count:=some_arguments.count 
			until i > a_count-1 loop
				a_name := some_arguments.name(i)
				a_type_mark := some_arguments.type_mark(i)
				i := i + 1
				check
					name_not_void: a_name /= Void
					type_not_void: a_type_mark /= Void
				end
				-- if a_name=Void then io.put_line(once "Void argument name") end
				-- if a_type_mark=Void then io.put_line(once "Void argument type 
				-- mark") end
				insert_with_tag(iter, a_name.to_string,argument_name_tag)
				insert_with_tag(iter, once ": ",argument_name_tag)
				insert_with_tag(iter, a_type_mark.written_mark,argument_type_tag)
				insert_with_tag(iter, once ", ",feature_clause_tag)
			end
			a_name := some_arguments.name(a_count)
			a_type_mark := some_arguments.type_mark(a_count)
			check
				name_not_void: a_name /= Void
				type_not_void: a_type_mark /= Void
			end
			insert_with_tag(iter,a_name.to_string,argument_name_tag)
			insert_with_tag(iter, once ": ",argument_name_tag)
			insert_with_tag(iter, a_type_mark.written_mark,argument_type_tag)
			insert_with_tag(iter, once ")",feature_clause_tag)
		end
	
	put_require_assertion (a_require_assertion: E_REQUIRE)
		require a_require_assertion/=Void
		do
			
		end

	put_ensure_assertion (an_ensure_assertion: E_ENSURE)
		require an_ensure_assertion /= Void
		do
			
		end

	
feature {ANY} -- Visitor features. Mostly empty
	visit_class_name (visited: CLASS_NAME) do raise(dead_code) end
	visit_class_name_list (visited: CLASS_NAME_LIST) do raise(dead_code) end
	visit_class_text (visited: CLASS_TEXT) do raise(dead_code) end
	visit_index_list (visited: INDEX_LIST) do raise(dead_code) end
	visit_index_clause (visited: INDEX_CLAUSE) do raise(dead_code) end

	visit_comment (visited: COMMENT) do raise(dead_code) end
	
	visit_feature_clause_list (some_features: FEATURE_CLAUSE_LIST) do raise(dead_code) end
	visit_feature_clause (a_feature_clause: FEATURE_CLAUSE) do raise(dead_code) end

	visit_parent_lists (visited: PARENT_LISTS) do raise(dead_code) end
	visit_parent_edge (visited: PARENT_EDGE) do raise(dead_code) end
		
	visit_creation_clause_list (visited: CREATION_CLAUSE_LIST) do raise(dead_code) end
	visit_creation_clause (visited: CREATION_CLAUSE) do raise(dead_code) end
	visit_client_list (visited: CLIENT_LIST) do raise(dead_code) end
	visit_feature_name (visited: FEATURE_NAME) do raise(dead_code) end
	visit_feature_name_list (visited: FEATURE_NAME_LIST) do raise(dead_code) end
	
	-- ASSERTION_LIST_VISITOR features
	visit_loop_invariant (visited: LOOP_INVARIANT) do raise(dead_code) end
	visit_require_item (visited: REQUIRE_ITEM) do raise(dead_code) end
	visit_check_invariant (visited: CHECK_INVARIANT) do raise(dead_code) end
	visit_e_ensure (an_ensure: E_ENSURE) do raise(dead_code) end
	visit_e_require (a_require: E_REQUIRE) do raise(dead_code) end
	visit_class_invariant (visited: CLASS_INVARIANT) do raise(dead_code) end
	
	visit_assertion (visited: ASSERTION) do raise(dead_code) end
	
	dead_code: STRING "Visitor feature of an EIFFEL_DOCUMENTATION_TEXT_BUFFER invoked. They should never be invoked by design, since they're empty."

feature {ANY} -- Tags
	add_tags
			-- Creates all the tags and add the them to the `tag_table'
		do
			create keyword_tag.with_name(once "keyword")
			-- keyword_tag.set_foreground(once "blue")
			keyword_tag.set_weight(pango_weight_semibold)
			tag_table.add(keyword_tag)
			
			create comment_tag.with_name(once "comment")
			-- comment_tag.set_foreground(once "green")
			comment_tag.set_style(pango_style_italic)
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
			class_tag.set_pixels_above_lines(10)
			class_tag.set_pixels_below_lines(10)
			tag_table.add(class_tag)
			
			create feature_clause_tag.with_name(once "feature-clause")
			feature_clause_tag.set_weight(pango_weight_bold)
			feature_clause_tag.set_scale(pango_scale_x_large)
			feature_clause_tag.set_pixels_above_lines(5)
			feature_clause_tag.set_pixels_below_lines(5)
			tag_table.add(feature_clause_tag)

			create feature_name_tag.with_name(once "feature-name")
			feature_name_tag.set_weight(pango_weight_bold)
			feature_name_tag.set_scale(pango_scale_large)
			feature_clause_tag.set_pixels_above_lines(2)
			tag_table.add(feature_name_tag)
			
			create argument_name_tag.with_name(once "argument-name")
			argument_name_tag.set_scale(pango_scale_large)
			tag_table.add(argument_name_tag)

			create argument_type_tag.with_name(once "argument-type")
			argument_type_tag.set_weight(pango_weight_bold)
			argument_type_tag.set_scale(pango_scale_large)
			tag_table.add(argument_type_tag)

			-- TODO: instead of argument make argument-name and
			-- argument-type

			create cluster_tag.with_name(once "cluster")
			tag_table.add(cluster_tag)

			create note_tag.with_name(once "note")
			note_tag.set_scale(pango_scale_xx_small)
			note_tag.set_weight(pango_weight_ultralight)
			tag_table.add(note_tag)
		ensure
			keyword_tag /= Void
			comment_tag /= Void
			string_tag /= Void
			class_tag /= Void
			feature_clause_tag /= Void
			feature_name_tag /= Void
			argument_name_tag /= Void
			argument_type_tag /= Void
			cluster_tag /= Void
			note_tag /= Void
		end
	
	keyword_tag: GTK_TEXT_TAG 
	comment_tag: GTK_TEXT_TAG 
	string_tag: GTK_TEXT_TAG 
	class_tag: GTK_TEXT_TAG 
	feature_clause_tag: GTK_TEXT_TAG
	feature_name_tag: GTK_TEXT_TAG
	argument_name_tag: GTK_TEXT_TAG
	argument_type_tag: GTK_TEXT_TAG
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

	newline: STRING is "%N"
	
	put_newline
		do 
			insert_at(iter,newline) 
		end

	merged_strings (some_strings: COLLECTION[STRING]): STRING
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
	
	merged_manifest_strings (some_strings: COLLECTION[MANIFEST_STRING]): STRING
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

	left_arrow: STRING
			-- A right arrow in Unicode converted into UTF8
		do
			Result := (U"%/Ux2192/").to_string 
		end


	midcolor (a,b: GDK_COLOR): GDK_COLOR
		require
			a /= Void
			b /= Void
		do
			create Result.make
			Result.set_red((a.red+b.red)//2)
			Result.set_green((a.green+b.green)//2)
			Result.set_blue((a.blue+b.blue)//2)
		end
	
invariant
	class_name/=Void
end -- class EIFFEL_DOCUMENTATION_TEXT_BUFFER
