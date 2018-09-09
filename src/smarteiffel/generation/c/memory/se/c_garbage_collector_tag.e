-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_TAG

inherit
   TYPED_TAGGED_DATA[INTEGER]
      redefine
         is_equal
      end

insert
   HASHABLE
   COMPARABLE
      redefine
         is_equal
      end

create {GC_HANDLER}
   make, special

feature {ANY}
   hash_code: INTEGER
      do
         Result := tag.hash_code
      end

   is_equal (other: like Current): BOOLEAN
      do
         if id = 0 or else other.id = 0 then
            Result := other.tag = tag
         else
            Result := other = Current
         end
      ensure then
         (not Result) implies (tag /= other.tag and id /= other.id)
         Result implies (tag = other.tag and (id = 0 or other.id = 0 or id = other.id))
      end

   infix "<" (other: like Current): BOOLEAN
      do
         if id = 0 then
            Result := True
         elseif other.id = 0 then
            check not Result end
         elseif count = other.count then
            Result := id < other.id
         else
            Result := count < other.count
         end
      end

   tag: HASHED_STRING
   id: INTEGER
   count: INTEGER

   item: INTEGER
      do
         Result := id
      end

feature {GC_HANDLER}
   set (a_tag: like tag)
      require
         is_special: id = 0
      do
         tag := a_tag
      ensure
         tag = a_tag
      end

   increment
      require
         is_not_special: id > 0
      do
         count := count + 1
      ensure
         count = old count + 1
      end

feature {}
   make (a_tag: like tag)
      require
         a_tag /= Void
      do
         tag := a_tag
         id_provider.increment
         id := id_provider.item
      ensure
         tag = a_tag
         id > 0
         count = 0
      end

   special
      do
      end

   id_provider: COUNTER
      once
         create Result
      end

invariant
   id > 0 implies tag /= Void
   id >= 0
   id = 0 implies count = 0

end -- class C_GARBAGE_COLLECTOR_TAG
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
