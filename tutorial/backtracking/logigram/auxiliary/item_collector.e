-- See the Copyright notice at the end of this file.
--
class ITEM_COLLECTOR
   --
   -- collector of items in the constraints
   --

create {ANY}
   make

feature {ANY}
   item_set: HASHED_SET[ITEM_ITEM]
      -- the collected items

   var_set: HASHED_SET[ITEM_VAR]
      -- the collected vars

   make
      do
         create item_set.with_capacity(10)
         create var_set.with_capacity(10)
      ensure
         not (has_item or has_var)
      end

   clear
      do
         item_set.clear_count
         var_set.clear_count
      ensure
         not (has_item or has_var)
      end

   has_var: BOOLEAN
      do
         Result := var_set.count > 0
      ensure
         Result = (var_set.count > 0)
      end

   has_item: BOOLEAN
      do
         Result := item_set.count > 0
      ensure
         Result = (item_set.count > 0)
      end

   put (item: ITEM)
         -- records the item in item_set or in var_set
         -- depending on the real type of item that can
         -- be ITEM_VAR or ITEM_ITEM
      local
         itm: ITEM_ITEM; var: ITEM_VAR
      do
         itm ?= item
         if itm /= Void then
            item_set.add(itm)
         else
            var ?= item
            check
               var /= Void
            end
            var_set.add(var)
         end
      end

end -- class ITEM_COLLECTOR
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
