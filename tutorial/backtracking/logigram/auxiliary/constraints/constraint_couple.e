-- See the Copyright notice at the end of this file.
--
deferred class CONSTRAINT_COUPLE
   --
   -- constraint on a couple of items NOT in the same group
   --

inherit
   CONSTRAINT

feature {ANY}
   item1, item2: ITEM
      -- the couple of items

   make (i1, i2: ITEM)
         -- creation
      require
         i1.group /= i2.group
      do
         item1 := i1
         item2 := i2
      end

   get_items (collector: ITEM_COLLECTOR)
         -- collect the items
      do
         collector.put(item1)
         collector.put(item2)
      end

   build_masks (builder: MASK_BUILDER)
         -- creation of the mask for the constraint
      deferred
      end

end -- class CONSTRAINT_COUPLE
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
