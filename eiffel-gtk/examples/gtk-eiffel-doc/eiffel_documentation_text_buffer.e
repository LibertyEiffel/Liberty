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
	-- 

inherit
	GTK_TEXT_BUFFER
	
	CLASS_NAME_VISITOR undefine is_equal, copy end
	CLASS_TEXT_VISITOR undefine is_equal, copy end
	INDEX_LIST_VISITOR undefine is_equal, copy end
	INDEX_CLAUSE_VISITOR undefine is_equal, copy end

	COMMENT_VISITOR  undefine is_equal, copy end
	
	FEATURE_CLAUSE_LIST_VISITOR undefine is_equal, copy end
	FEATURE_CLAUSE_VISITOR undefine is_equal, copy end

creation from_class_name

feature {GTK_EIFFEL_DOC} -- Creation
	from_class_name (a_class_name: CLASS_NAME) is
		require
			class_name_not_void: a_class_name/=Void
		do
			debug
				io.put_string(once "{EIFFEL_DOCUMENTATION_TEXT_BUFFER}.from_class_name(")
				io.put_string(a_class_name.to_string)
				io.put_line(once ")")
			end
			make
			iter := start_iter
			
			if a_class_name.class_text /= Void then
				put_indexing(a_class_name.class_text.index_list)
				-- TODO finish!
			else
				insert_at(iter,"No class text")
			end
		end
	
feature {} -- Documentation builders
	iter: GTK_TEXT_ITER
			-- The insertion point used in all the features that add text
			-- to the buffer.
	
	put_indexing (an_index_list: INDEX_LIST) is
		local
			i: ITERATOR[INDEX_CLAUSE]; index_clause: INDEX_CLAUSE;
			msi: ITERATOR[MANIFEST_STRING]; manifest_string: MANIFEST_STRING
		do
			if an_index_list /= Void then
				insert_at(iter, once "indexing%N")
					from i:=an_index_list.list.get_new_iterator; i.start; until i.is_off
					loop
						index_clause := i.item
						if index_clause /= Void then
							if index_clause.tag /= Void
							 then
								insert_at(iter, index_clause.tag.to_string)
								insert_at(iter, once ": ")
							else insert_at(iter, once " (No tag?!?!) ")
							end
							if index_clause.list /= Void then
								msi := index_clause.list.get_new_iterator
								from msi.start; until msi.is_off
								loop
									manifest_string := msi.item
									if manifest_string /= Void
									 then insert_at(iter, manifest_string.to_string)
									else insert_at(iter, once "Void manifest string")
									end
									msi.next
								end
							end
						else
							debug io.put_line("Void index clause") end
						end
						i.next
					end
			else
				debug io.put_line(once "No indexing clause") end
			end
		end
	
	print_feature_text (a_feature_text: FEATURE_TEXT) is
		local names: FEATURE_NAME_LIST; i: INTEGER
		do
			names:=a_feature_text.names
			if names/=Void then
				io.put_string(names.first.name.to_string)
				if names.count > 1 then 
					io.put_string(once " also known as ")
					from i := 2 until i > names.count
					loop
						io.put_string(names.item(i).name.to_string)
						i := i + 1
						if i > names.count then io.put_string(once ", ") end
					end
				end
				io.put_line(once ".")
			else io.put_string(once " nameless ")
			end
		end


feature -- Visitor features. Mostly empty
	visit_class_name (visited: CLASS_NAME) is do raise(dead_code) end
	visit_class_text (visited: CLASS_TEXT) is do raise(dead_code) end
	visit_index_list (visited: INDEX_LIST) is do raise(dead_code) end
	visit_index_clause (visited: INDEX_CLAUSE) is do raise(dead_code) end

	visit_comment (visited: COMMENT) is do raise(dead_code) end
	
	visit_feature_clause_list (some_features: FEATURE_CLAUSE_LIST) is do raise(dead_code) end
	visit_feature_clause (a_feature_clause: FEATURE_CLAUSE) is do raise(dead_code) end

	dead_code: STRING is "Visitor feature of an EIFFEL_DOCUMENTATION_TEXT_BUFFER invoked. They should never be invoked by design, since they're empty."
end -- class EIFFEL_DOCUMENTATION_TEXT_BUFFER
