-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_PH01_SPLAY_DICTIONARY_ITEM[E, I -> COMPARABLE]
   --
   -- The data node AUX_PH01_SPLAY_DICTIONARY stores and manipulates.  It houses the value
   -- E with index I (of type COMPARABLE).
   --
   -- It houses 5 data items:
   --
   --     1. The item (of type E)
   --     2. The index (of type I, which is COMPARABLE)
   --     3. The node's parent, of like type
   --     4. The node's left child, of like type
   --     5. The node's right child, of like type

create {AUX_PH01_SPLAY_DICTIONARY}
   make, make_null

feature {AUX_PH01_SPLAY_DICTIONARY_ITEM, AUX_PH01_SPLAY_DICTIONARY, AUX_PH01_SPLAY_DICTIONARY_ITERATOR}
   index: I
         -- The index of the node (which must be a derivative of type
         -- COMPARABLE.

feature {AUX_PH01_SPLAY_DICTIONARY_ITEM, AUX_PH01_SPLAY_DICTIONARY}
   item: E
         -- The data item to be stored.

   parent: like Current
         -- The parent of the node.

   left: like Current
         -- The left child of the node.

   right: like Current
         -- The right child of the node.

feature {AUX_PH01_SPLAY_DICTIONARY}
   make (i: like item; ind: like index; p: like parent; l: like left; r: like right)
         -- Create a node with the parameters passed.
      do
         index := ind
         item := i
         parent := p
         left := l
         right := r
      end

   make_null
         -- Create a node with all data items set to their default values.
      do
         -- Don't do anything here - everything is set to its default value.
      end

feature {AUX_PH01_SPLAY_DICTIONARY}
   -- Procedures to change the internal data items.  Note that we will not
   -- allow the index to be changed, as once this is set nothing can be done
   -- to alter it.
   set_item (i: like item)
         -- Set the item.
      do
         item := i
      end

   set_parent (p: like parent)
         -- Set the parent.
      do
         parent := p
      end

   set_left (l: like left)
         -- Set the left child.
      do
         left := l
      end

   set_right (r: like right)
         -- Set the right child.
      do
         right := r
      end

feature {AUX_PH01_SPLAY_DICTIONARY}
   print_state
         -- Prints the state of the link.
      do
         print("Index  = ")
         index.print_on(std_output)
         print("%N")
         print("Item   = ")
         item.print_on(std_output)
         print("%N")
         print("parent = ")
         if parent = Void then
            print("Void%N")
         else
            parent.index.print_on(std_output)
            print("%N")
         end
         print("left   = ")
         if left = Void then
            print("Void%N")
         else
            print("not Void%N")
         end
         print("right  = ")
         if right = Void then
            print("Void%N")
         else
            print("not Void%N")
         end
      end

end -- class AUX_PH01_SPLAY_DICTIONARY_ITEM
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
