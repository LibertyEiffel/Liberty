-- See the Copyright notice at the end of this file.
--
class EXPAND_SEQUENCE

inherit
   ABSTRACT_BACKTRACKING_SEQUENCE
   EXPRESSION_ITEM_GLOBALS

feature {ANY}
   pool: POOL_SEQUENCE
      once
         create Result.make
      end

feature {ABSTRACT_BACKTRACKING}
   next_sequence (explorer: EXPAND_EXPRESSION)
      do
         if Iterate and then item.type = And_item then
            explorer.goto_item(item.first)
            item := item.second
         else
            explorer.goto_item(item)
            explorer.pop_sequence
         end
      end

feature {}
   item: EXPRESSION_ITEM

feature {EXPAND_EXPRESSION}
   make (itm: EXPRESSION_ITEM)
      do
         item := itm
      end

end -- class EXPAND_SEQUENCE
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
