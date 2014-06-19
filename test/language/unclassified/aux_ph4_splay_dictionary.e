-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_PH4_SPLAY_DICTIONARY[E, I -> COMPARABLE]

create {ANY}
   make

feature {ANY}
   make
      do
         count := 0
         root := Void
      end

   count: INTEGER

   is_empty: BOOLEAN
      do
         Result := root = Void
      end

   has (index: I): BOOLEAN
      local
         tmp_node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
      do
         if not is_empty then
            from
               tmp_node := root
            until
               tmp_node = Void or else Result = True
            loop
               if index = tmp_node.index then
                  splay(tmp_node)
                  Result := True
               elseif index < tmp_node.index then
                  if tmp_node.left /= Void then
                     tmp_node := tmp_node.left
                  else
                     tmp_node := Void
                  end
               else
                  if tmp_node.right /= Void then
                     tmp_node := tmp_node.right
                  else
                     tmp_node := Void
                  end
               end
            end
         end
      end

   item (index: I): E
      local
         chk: BOOLEAN
      do
         chk := has(index)
         Result := root.item
      end

   new_iterator: AUX_PH4_SPLAY_DICTIONARY_ITERATOR[I]
      do
         create Result.make(Void)
      end

   put (value: E; index: I)
      local
         elem, tmp: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
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
      end

   lowest_node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
      do
         Result := lowest_node_in_subtree(root)
         splay(Result)
      end

   next_highest (node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]): AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
      do
         splay(node)
         if root.right /= Void then
            Result := lowest_node_in_subtree(root.right)
            splay(Result)
         end
      end

   lowest_node_in_subtree (node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]): AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
      local
         elem: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
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
      end

   splay (node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I])
      local
         parent: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
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

   rotate_right (node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I])
      local
         parent: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
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

   rotate_left (node: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I])
      local
         parent: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]
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

   root: AUX_PH4_SPLAY_DICTIONARY_ITEM[E, I]

end -- class AUX_PH4_SPLAY_DICTIONARY
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
