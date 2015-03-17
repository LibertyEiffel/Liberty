-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_PH01_SPLAY_DICTIONARY[E, I -> COMPARABLE]
   --
   -- An associative memory implemented as a splay tree.
   --
   -- Values of type E are stored using keys of type I (which must inherit from
   -- from COMPARABLE).
   --inherit
   --   ANY
   --      redefine
   --    is_equal,
   --    copy
   --      end

create {ANY}
   make

feature {ANY}
   make
         -- Initialises the tree
      do
         count := 0
         root := Void -- This will be the case initially
      end

feature {ANY} -- Some queries.
   count: INTEGER
         -- The number of elements in the tree.

   is_empty: BOOLEAN
         -- Is the dictionary empty?
      do
         Result := root = Void
      end

   has (index: I): BOOLEAN
         -- Returns true if the passed index is contained within the tree.
      local
         tmp_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         if not is_empty then
            from
               tmp_node := root
            until
               tmp_node = Void or else Result = True
            loop
               if index = tmp_node.index then
                  -- Case 1.  The indexes are the same.  Therefore the Result
                  --          is True and we bail.
                  splay(tmp_node)
                  Result := True
               elseif index < tmp_node.index then
                  -- Case 2.  The passed index is lower than the current
                  --          node's index.  We simply go left and, if we're
                  --          not pointing at Void, splay the node to the
                  --          top.
                  if tmp_node.left /= Void then
                     tmp_node := tmp_node.left
                  else
                     tmp_node := Void
                  end
               else
                  -- Case 3.  The passed index is larger than the current
                  --          node's index.  We simply go right and, if we're
                  --          not pointing at Void, splay the node to the
                  --          top.
                  if tmp_node.right /= Void then
                     tmp_node := tmp_node.right
                  else
                     tmp_node := Void
                  end
               end
            end
         end
      end

   lowest: I
         -- Returns the lowest index in the tree.
      require
         dictionary_not_empty: not is_empty
      local
         tmp_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         from
            tmp_node := root
         until
            tmp_node.left = Void
         loop
            tmp_node := tmp_node.left
         end
         splay(tmp_node)
         Result := tmp_node.index
      end

   highest: I
         -- Returns the highest index in the tree.
      require
         dictionary_not_empty: not is_empty
      local
         tmp_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         from
            tmp_node := root
         until
            tmp_node.right = Void
         loop
            tmp_node := tmp_node.right
         end
         splay(tmp_node)
         Result := tmp_node.index
      end

feature {ANY}
   -- The following functions/procedures retrieve function point values or
   -- information concerning them.
   item, infix "@" (index: I): E
         -- Returns the value at the passed index.
      require
         has_index: has(index)
      local
         chk: BOOLEAN
      do
         -- I call `has' first even though it's in the precondition because
         -- there's not guarantee it'll be called (obviously).  Calling this
         -- ensures that the required node is at the root.
         chk := has(index)
         Result := root.item
      end

feature {ANY}
   new_iterator: AUX_PH01_SPLAY_DICTIONARY_ITERATOR[I]
         -- Returns a new iterator for the dictionary.
      require
         not_empty: not is_empty
      do
         create Result.make(Void)
      ensure
         result_not_void: Result /= Void
      end

feature {ANY}
   put (value: E; index: I)
      require
         item_not_there: not has(index)
      local
         elem: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]; tmp: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         create elem.make(value, index, Void, Void, Void)
         if is_empty then
            root := elem
            count := count + 1
         else
            from
               tmp := root
            until
               tmp = Void and then root /= Void
            loop
               check
                  elem.index /= tmp.index
               end
               if elem.index < tmp.index then
                  if tmp.left = Void then
                     tmp.set_left(elem)
                     elem.set_parent(tmp)
                     splay(elem)
                     count := count + 1
                     tmp := Void
                  else
                     tmp := tmp.left
                  end
               else
                  if tmp.right = Void then
                     tmp.set_right(elem)
                     elem.set_parent(tmp)
                     splay(elem)
                     count := count + 1
                     tmp := Void
                  else
                     tmp := tmp.right
                  end
               end
            end
         end
      ensure
         count_has_incremented: count = old count + 1
      end

   replace (value: E; index: I)
      require
         has_index: has(index)
      do
         if has(index) then
            if index = root.index then
               root.set_item(value)
            end
         end
      end

   remove (index: I)
      require
         has_index: has(index)
      local
         left: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]; right: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
         tmp: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         if has(index) then
            if root.right /= Void and root.left /= Void then
               left := root.left
               right := root.right
               tmp := lowest_node_in_subtree(right)
               tmp.set_left(left)
               left.set_parent(tmp)
               right.set_parent(Void)
               root := right
            elseif root.right /= Void then
               right := root.right
               right.set_parent(Void)
               root := right
            elseif root.left /= Void then
               left := root.left
               left.set_parent(Void)
               root := left
            else
               root := Void
            end
            count := count - 1
         end
      ensure
         count_updated: count = old count - 1
      end

   remove_maximum
      require
         not_empty: not is_empty
      local
         tmp: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]; left: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         tmp := highest_node_in_subtree(root)
         left := tmp.left
         if left /= Void then
            left.set_parent(Void)
            root := left
         else
            root := Void
         end
         count := count - 1
      ensure
         count_updated: count = old count - 1
      end

   remove_minimum
      require
         not_empty: not is_empty
      local
         tmp: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]; right: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         tmp := lowest_node_in_subtree(root)
         right := tmp.right
         if right /= Void then
            right.set_parent(Void)
            root := right
         else
            root := Void
         end
         count := count - 1
      ensure
         count_updated: count = old count - 1
      end

   clear
      do
         from
         until
            root = Void
         loop
            remove_minimum
         end
      end

feature {ANY}
   print_tree
      do
         if root /= Void then
            print_subtree(root.left)
            root.index.print_on(std_output)
            print(" ")
            root.item.print_on(std_output)
            print("%N")
            print_subtree(root.right)
         end
      end

feature {AUX_PH01_SPLAY_DICTIONARY_ITERATOR}
   lowest_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      require
         not_empty: not is_empty
      do
         Result := lowest_node_in_subtree(root)
         splay(Result)
      ensure
         result_not_void: Result /= Void
      end

   highest_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      require
         not_empty: not is_empty
      do
         Result := highest_node_in_subtree(root)
         splay(Result)
      ensure
         result_not_void: Result /= Void
      end

   next_highest (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]): AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      require
         not_empty: not is_empty
      do
         splay(node)
         if root.right /= Void then
            Result := lowest_node_in_subtree(root.right)
            splay(Result)
         end
      end

feature {INDEXED_LIST}
   lowest_node_in_subtree (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]): AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      require
         node_not_void: node /= Void
      local
         elem: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         from
            elem := node
         until
            elem = Void
         loop
            if elem.left = Void then
               Result := elem
               elem := Void
            else
               elem := elem.left
            end
         end
      ensure
         result_not_void: Result /= Void
      end

   highest_node_in_subtree (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]): AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      require
         node_not_void: node /= Void
      local
         elem: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         from
            elem := node
         until
            elem = Void
         loop
            if elem.right = Void then
               Result := elem
               elem := Void
            else
               elem := elem.right
            end
         end
      ensure
         result_not_void: Result /= Void
      end

   print_subtree (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I])
      do
         if node /= Void then
            if node.left /= Void then
               print_subtree(node.left)
            end
            node.index.print_on(std_output)
            print(" ")
            node.item.print_on(std_output)
            print("%N")
            if node.right /= Void then
               print_subtree(node.right)
            end
         end
      end

feature {}
   has_tree_integrity: BOOLEAN
      local
         tmp_node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         if is_empty then
            Result := True
         else
            from
               tmp_node := lowest_node_in_subtree(root)
               Result := True
            until
               tmp_node = Void or else Result = False
            loop
               if (tmp_node.left = Void or else tmp_node.left.index < tmp_node.index) and then (tmp_node.right = Void or else tmp_node.right.index > tmp_node.index) then
                  if tmp_node.parent = Void then
                     if tmp_node /= root then
                        Result := False
                     else
                        if tmp_node.right = Void then
                           tmp_node := Void
                        else
                           tmp_node := lowest_node_in_subtree(tmp_node.right)
                           splay(tmp_node)
                        end
                     end
                  elseif tmp_node.parent.left = tmp_node then
                     if tmp_node.right = Void then
                        tmp_node := tmp_node.parent
                     else
                        tmp_node := lowest_node_in_subtree(tmp_node.right)
                        splay(tmp_node)
                     end
                  elseif tmp_node.parent.right = tmp_node then
                     if tmp_node.right /= Void then
                        tmp_node := lowest_node_in_subtree(tmp_node.right)
                        splay(tmp_node)
                     else
                        tmp_node := Void
                     end
                  else
                     Result := False
                  end
               else
                  Result := False
               end
            end
         end
      end

feature {INDEXED_LIST}
   splay (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I])
      require
         node_not_void: node /= Void
      local
         parent: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         from
         until
            node = root
         loop
            if node.parent = root then
               -- In this case we only need to zig.
               parent := node.parent
               if node = parent.left then
                  rotate_right(node)
               else
                  rotate_left(node)
               end
               root := node -- Make sure root is update!
            elseif node = node.parent.left then
               if node.parent = node.parent.parent.right then
                  rotate_right(node)
                  rotate_left(node)
               else
                  rotate_right(node.parent)
                  rotate_right(node)
               end
               if node.parent = Void then
                  -- Make sure to update the root if
                  -- necessary.
                  root := node
               end
            elseif node = node.parent.right then
               if node.parent = node.parent.parent.left then
                  rotate_left(node)
                  rotate_right(node)
               elseif node.parent = node.parent.parent.right then
                  rotate_left(node.parent)
                  rotate_left(node)
               end
               if node.parent = Void then
                  -- Make sure to update the root if
                  -- necessary.
                  root := node
               end
            end
         end
      end

   rotate_right (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I])
      require
         node_not_null: node /= Void
      local
         parent: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         parent := node.parent
         parent.set_left(node.right)
         if node.right /= Void then
            node.right.set_parent(parent)
         end
         if parent.parent = Void then
            node.set_parent(Void)
         else
            node.set_parent(parent.parent)
            if parent = parent.parent.left then
               parent.parent.set_left(node)
            else
               parent.parent.set_right(node)
            end
         end
         node.set_right(parent)
         parent.set_parent(node)
      end

   rotate_left (node: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I])
      require
         node_not_null: node /= Void
      local
         parent: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I]
      do
         parent := node.parent
         parent.set_right(node.left)
         if node.left /= Void then
            node.left.set_parent(parent)
         end
         if parent.parent = Void then
            node.set_parent(Void)
         else
            node.set_parent(parent.parent)
            if parent = parent.parent.left then
               parent.parent.set_left(node)
            else
               parent.parent.set_right(node)
            end
         end
         node.set_left(parent)
         parent.set_parent(node)
      end

feature {AUX_PH01_SPLAY_DICTIONARY}
   root: AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I] -- references the root of the tree.

invariant
   root_null_no_count_integrity: root = Void implies count = 0 and root /= Void implies count /= 0
   count_valid: count >= 0
   -- The following invariant is very heavy-duty.  I've already tried it
   -- and it seems to be ok so I'm commentint it out now.  If I make any
   -- more serious changes to this class I'll uncomment this invariant
   -- and use it until I'm happy.
   -- dictionary_has_integrity     : has_tree_integrity

end -- class AUX_PH01_SPLAY_DICTIONARY
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
