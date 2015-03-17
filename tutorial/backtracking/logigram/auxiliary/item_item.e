-- See the Copyright notice at the end of this file.
--
class ITEM_ITEM

inherit
   ITEM

create {ANY}
   make

feature {ANY}
   index: INTEGER

   to_integer: INTEGER
      do
         Result := value
      end

   make (the_group: like group; the_name: like name; the_index: like index)
      require
         the_group.is_numeric implies the_name.is_integer
      do
         group := the_group
         name := the_name
         index := the_index
         if group.is_numeric then
            value := name.to_integer
         elseif group.is_ordered then
            value := the_index
         end
      end

   is_off: BOOLEAN False

feature {}
   value: INTEGER

end -- class ITEM_ITEM
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
