-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class HASHED_STRING
   --
   -- To store one STRING with its already precomputed `hash_code' value in
   -- order to speed up  DICTIONARY / SET lookup. HASHED_STRING objects are
   -- aliased (as an example, there is only one instance for the "INTEGER"
   -- string with its associated `hash_code' value). Thus, should use only the
   -- basic = /= comparison for HASHED_STRING as for traditional aliased
   -- STRINGs. Actually, HASHED_STRING object are also allocated by the good
   -- old `string_aliaser' singleton.
   --

inherit
   HASHABLE

insert
   GLOBALS
      redefine is_equal
      end

create {STRING_ALIASER}
   make

feature {ANY}
   to_string: STRING
         -- The corresponding hashed name (eg. "INTEGER", "REAL", "DOUBLE",
         -- "like Current", "SmartEiffel/lib/kernel/any.e", -- etc.).

   hash_code: INTEGER
         -- The precomputed `hash_code' of `to_string' (memory cache).

   is_equal (other: like Current): BOOLEAN
      local
         other_to_string: STRING
      do
         other_to_string := other.to_string
         if to_string = other_to_string then
            Result := True
         else
            Result := to_string.is_equal(other_to_string)
         end
      end

   is_tuple_related: BOOLEAN
         -- Is it some TUPLE-related name ("TUPLE", "TUPLE 1", "TUPLE 2", etc.)?
      do
         Result := to_string.has_prefix(as_tuple)
         if Result then
            if to_string.count > 5 then
               Result := to_string.item(6) = ' '
            end
         end
      end

   is_simple_feature_name: BOOLEAN
         -- Is it an ordinary feature name (i.e. not a prefix / infix operator).
         -- Actually, the goal of this feature is just for assertion purpose in order to check
         -- that manual lookup done in the compiler (i.e. `has_simple_feature_name' and
         -- `feature_stamp_of' of class TYPE) are correct calls.
      local
         i: INTEGER
      do
         inspect
            to_string
         when "or", "and", "xor", "implies", "and then", "or else" then
         else
            if to_string.first.is_letter then
               from
                  Result := True
                  i := 2
               until
                  i > to_string.count or else not Result
               loop
                  inspect
                     to_string.item(i)
                  when 'a'..'z', '0'..'9', '_' then
                  else
                     Result := False
                  end
                  i := i + 1
               end
            end
         end
      ensure
         for_assertions_use_only: Result
      end

feature {STRING_ALIASER}
   set (ts: like to_string)
      require
         ts /= Void
      do
         to_string := ts
         hash_code := ts.hash_code
         debug
            debug_immutable_flag := False
         end
      ensure
         to_string = ts
         hash_code = ts.hash_code
      end

feature {}
   debug_immutable_flag: BOOLEAN
   debug_original_string: STRING

   debug_check: BOOLEAN
         -- To try to check that the `to_string' is really immutable.
      local
         tsh: INTEGER
      do
         Result := True
         debug
            if debug_immutable_flag then
               tsh := to_string.hash_code
               Result := hash_code = tsh
               if not Result then
                  sedb_breakpoint
               end
            end
         end
      end

   make (ts: like to_string; hc: like hash_code)
      require
         ts /= Void
         hc = ts.hash_code
      do
         to_string := ts
         hash_code := hc
         debug
            debug_immutable_flag := True
            debug_original_string := ts.twin
         end
      ensure
         to_string = ts
      end

invariant
   debug_check

end -- class HASHED_STRING
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
