-- See the Copyright notice at the end of this file.
--
class EXPR_ITEM

inherit
   EXPR

create {ANY}
   make

feature {ANY}
   item: ITEM

   make (it: ITEM)
      require
         it.is_like_integer
      do
         item := it
      end

   to_integer: INTEGER
      do
         Result := item.to_integer
      end

   get_items (collector: ITEM_COLLECTOR)
      do
         collector.put(item)
      end

end -- class EXPR_ITEM
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
