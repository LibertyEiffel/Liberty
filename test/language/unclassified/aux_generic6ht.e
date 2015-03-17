-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_GENERIC6HT[G, K -> HASHABLE]

inherit
   AUX_GENERIC6XCT[G]
      rename item as item_for_iteration
      end

insert
   -- *** It was a inherit in Original release. (Vincent Croizier, 03/11/2004) ***
   AUX_GENERIC6LL[G]
      --       go_to as ll_go_to,
      rename make as ll_make,
         forth as ll_forth,
         start as ll_start,
         item as item_for_iteration,
         has as ll_has,
         put as ll_put
      export {} ll_make, ll_forth, ll_start, ll_has, ll_put, extend
      end

create {ANY}
   make

feature {ANY}
   make (sz: INTEGER)
      do
         ll_make
         create keys.make
      end

   put (x: G; k: K)
      do
         extend(x)
         keys.extend(k)
      end
      --    item(k : K): G
      --   local
      --       c: CURSOR;
      --   do
      --       from
      --      c := cursor;
      --      start;
      --       until
      --      keys.after or
      --          keys.item.is_equal(k)
      --       loop
      --      forth;
      --       end; -- loop
      --       if not after then
      --      Result := item_for_iteration;
      --       end;
      --       go_to(c);
      --   end; -- item

   key_for_iteration: K
      do
         Result := keys.item
      end

   forth
      do
         ll_forth
         keys.forth
      end

   start
      do
         ll_start
         keys.start
      end

   has (x: K): BOOLEAN
      do
         Result := keys.has(x)
      end
      --    go_to(c: CURSOR)
      --   do
      --       ll_go_to(c);
      --       keys.go_to(c);
      --   end;

feature {}
   keys: AUX_GENERIC6LL[K]

invariant
-- ***    same_count: keys.count = count;

end -- class AUX_GENERIC6HT
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
