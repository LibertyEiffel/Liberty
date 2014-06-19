-- See the Copyright notice at the end of this file.
--
class EXPAND_ALTERNATIVE

inherit
   ABSTRACT_BACKTRACKING_ALTERNATIVE
   EXPRESSION_ITEM_GLOBALS

feature {ANY}
   pool: POOL_ALTERNATIVE
      once
         create Result.make
      end

feature {ABSTRACT_BACKTRACKING}
   next_alternative (explorer: EXPAND_EXPRESSION)
      do
         explorer.stack.resize(count)
         if Iterate and then item.type = Or_item then
            explorer.goto_item(item.first)
            item := item.second
            explorer.continue_alternative
         else
            explorer.goto_item(item)
            explorer.pop_alternative
         end
      end

feature {}
   item: EXPRESSION_ITEM

   count: INTEGER

feature {EXPAND_EXPRESSION}
   make (itm: EXPRESSION_ITEM; cnt: INTEGER)
      do
         count := cnt
         item := itm
      end

end -- class EXPAND_ALTERNATIVE
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
