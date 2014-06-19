-- See the Copyright notice at the end of this file.
--
class VAR

create {ANY}
   make

feature {ANY}
   group: GROUP

   name: STRING

   item: ITEM

   to_integer: INTEGER
      require
         group.is_like_integer
         not is_off
      do
         Result := item.to_integer
      end

   make (the_group: like group; the_name: like name)
      do
         group := the_group
         name := the_name
      end

   start
      do
         if group.item_count = 0 then
            item := Void
         else
            goto_index(0)
         end
      ensure
         group.item_count > 0 /= is_off
      end

   is_off: BOOLEAN
      do
         Result := item /= Void
      ensure
         Result = (item /= Void)
      end

   next
      require
         not is_off
      do
         if item.index + 1 < group.item_count then
            goto_index(item.index + 1)
         else
            item := Void
         end
      end

   goto_index (idx: INTEGER)
      require
         idx.in_range(0, group.item_count - 1)
      do
         group.goto_index(idx)
         item := group.item
      ensure
         not is_off
      end

feature {}
   value: INTEGER

end -- class VAR
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
