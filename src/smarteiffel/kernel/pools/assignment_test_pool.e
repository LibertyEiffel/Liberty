-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_TEST_POOL

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {GLOBALS}
   make

feature {ASSIGNMENT_TEST}
   collect (left_type, right_type: TYPE)
         -- Where `left_type' is the left-hand side TYPE and `right_type' the right-hand side TYPE.
      require
         right_type /= Void
         left_type /= Void
      local
         left_set: HASHED_SET[TYPE]
      do
         left_set := map.fast_reference_at(right_type)
         if left_set = Void then
            left_set := new_empty_set
            map.fast_put(left_set, right_type)
         end
         left_set.fast_add(left_type)
      end

feature {ANY}
   function_name_in (buffer: STRING; left_type, right_type: TYPE)
      require
         buffer /= Void
         left_type /= Void
         right_type /= Void
         simplify_done_in_boost_mode: ace.boost implies not right_type.can_be_assigned_to(left_type)
      do
         buffer.append(once "can_assign_to")
         signature_add_last(buffer, left_type)
         buffer.append(once "_from")
         signature_add_last(buffer, right_type)
      end

feature {SMART_EIFFEL}
   reset
      local
         i: INTEGER
      do
         from
            i := map.lower
         until
            i > map.upper
         loop
            free_set_list.add_last(map.item(i))
            i := i + 1
         end
         map.clear_count
      end

feature {ANY}
   for_each (action: PROCEDURE[TUPLE[TYPE, TYPE]])
      require
         action /= Void
      local
         right_type: TYPE; left_set: SET[TYPE]; i, j: INTEGER
      do
         from
            i := map.lower
         until
            i > map.upper
         loop
            right_type := map.key(i)
            left_set := map.item(i)
            from
               j := left_set.lower
            until
               j > left_set.upper
            loop
               action.call([left_set.item(j), right_type])
               j := j + 1
            end
            i := i + 1
         end
      end

   count: INTEGER
      do
         Result := map.count
      end

feature {}
   map: HASHED_DICTIONARY[HASHED_SET[TYPE], TYPE]
         -- The key is the right-hand side TYPE.
      once
         create Result.make
      end

   free_set_list: FAST_ARRAY[HASHED_SET[TYPE]]
         -- To be able to recycle SETs from one collect to another collect.
      once
         create Result.with_capacity(8)
      end

   new_empty_set: HASHED_SET[TYPE]
      do
         if free_set_list.is_empty then
            create Result.make
         else
            Result := free_set_list.last
            Result.clear_count
            free_set_list.remove_last
         end
      end

   make
      do
      end

   signature_add_last (signature: STRING; type: TYPE)
      require
         type /= Void
      local
         s: STRING; i: INTEGER; c: CHARACTER
      do
         if type.live_type /= Void then
            type.id.append_in(signature)
         else
            from
               s := type.name.to_string
               i := 1
            until
               i > s.count
            loop
               c := s.item(i)
               inspect
                  c
               when '[', ']', ',', ' ' then
                  signature.append(once "__")
                  -- It is not allowed to have 2 _ in the same identifier in Eiffel, but in C.
               else
                  signature.extend(c)
               end
               i := i + 1
            end
         end
      end

end -- ASSIGNMENT_TEST_POOL
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
