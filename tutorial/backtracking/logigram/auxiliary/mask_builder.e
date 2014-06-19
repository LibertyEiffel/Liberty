-- See the Copyright notice at the end of this file.
--
class MASK_BUILDER
   --
   -- manage mask on permutations and create corresponding backtracking nodes

create {ANY}
   make

feature {ANY}
   make (situ: SITUATION)
         -- creation
      do
         permut := situ.permut
         create mask_array.make(situ.wdim)
         create mask.make(permut.count)
      end

   clear
         -- reset the state
      do
         mask_array.clear_all
         mask := Void
         is_ok := True
      end

   and_yes
         -- make the previous association mandatory
      do
         change(False)
      end

   and_no
         -- make the previous association forbidden
      do
         change(True)
      end

   is_ok: BOOLEAN
      -- is possible (has no impossibility)

   goto (it1, it2: ITEM)
         -- select the association of two items
      local
         g1, g2: INTEGER
      do
         g1 := it1.group.index
         g2 := it2.group.index
         if g1 < g2 then
            index := g1 + g2 * (g2 - 1) // 2
            i1 := it1.index
            i2 := it2.index
         else
            index := g2 + g1 * (g1 - 1) // 2
            i2 := it1.index
            i1 := it2.index
         end

         mask := mask_array.item(index)
         if mask = Void then
            create mask.make(permut.count)
            mask.set_all
            mask_array.put(mask, index)
         end
      ensure
         mask /= Void
      end

   get_node: BACKTRACKING_NODE_AND_LIST
         -- create the backtracking node corresponding to
         -- the currently built masks
      require
         is_ok
      local
         idx: INTEGER; node: NODE_MASK
      do
         from
            idx := mask_array.lower
         until
            idx > mask_array.upper
         loop
            mask := mask_array.item(idx)
            if mask /= Void then
               create node.make(idx, mask)
               Result := create {BACKTRACKING_NODE_AND_LIST}.make(node, Result)
            end

            idx := idx + 1
         end
         mask := mask_array.item(index)
      end

feature {}
   permut: ARRAY[PERMUT]
      -- array of permutations

   mask_array: FAST_ARRAY[BIT_STRING]
      -- array of masks

   index, i1, i2: INTEGER
      -- selected

   mask: BIT_STRING
      -- selected mask

   change (test: BOOLEAN)
         -- update the mask
      local
         i: INTEGER
      do
         -- enumerate permutations
         from
            i := permut.lower
         until
            i > permut.upper
         loop
            -- disable permutations that are not allowed
            if permut.item(i).item(i1) = i2 = test then
               mask.put_0(i)
            end

            i := i + 1
         end
         -- update is_ok
         is_ok := is_ok and then not mask.all_cleared
      end

end -- class MASK_BUILDER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is free software, which comes along with SmartEiffel. This software is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- You can modify it as you want, provided this footer is kept unaltered, and a notification of the changes is added.
-- You are allowed to redistribute it and sell it, alone or as a part of another product.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
