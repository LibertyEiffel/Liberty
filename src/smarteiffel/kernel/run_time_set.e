-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_TIME_SET
   --
   -- The set of all possible `at_run_time' LIVE_TYPEs which are associated with some `owner' LIVE_TYPE. There is
   -- exactely one RUN_TIME_SET object for each LIVE_TYPE. The RUN_TIME_SET of a LIVE_TYPE is the set of
   -- possible `at_run_time' LIVE_TYPEs which can be assigned into a variable of this LIVE_TYPE and which may be
   -- actually held by an expression of the type of `owner'.
   -- Note: except for some kernel expanded (*), the RUN_TIME_SET of some expanded LIVE_TYPE has only one
   -- element (i.e. the expanded LIVE_TYPE itself).
   --
   -- (*) The RUN_TIME_SET of INTEGER_16 can contains INTEGER_16 and INTEGER_8 (because we can directely assign an
   -- INTEGER_8 into a variable of type INTEGER_16).
   --

insert
   GLOBALS

creation {LIVE_TYPE}
   make

feature {ANY} -- Basic accessing:
   count: INTEGER is
      do
         Result := sorted.count
      ensure
         Result >= 0
      end

   item (index: INTEGER): LIVE_TYPE is
      require
         index.in_range(1, count)
      do
         Result := sorted.item(index - 1)
      ensure
         Result /= Void
      end

   is_empty: BOOLEAN is
      do
         Result := count = 0
      ensure
         Result = (count = 0)
      end

   has (live_type: LIVE_TYPE): BOOLEAN is
      require
         live_type /= Void
      do
         Result := set.fast_has(live_type)
      end

   owner: LIVE_TYPE
         -- The `owner' of the `Current' set.

   first: LIVE_TYPE is
      require
         count = 1
      do
         Result := sorted.first
      ensure
         Result = item(1)
      end

   do_all (action: PROCEDURE[TUPLE[LIVE_TYPE]]) is
      require
         action /= Void
      do
         sorted.do_all(action)
      end

feature {LIVE_TYPE}
   id_extra_information (tfw: TEXT_FILE_WRITE) is
      local
         c, i: INTEGER; lt: LIVE_TYPE
      do
         c := sorted.count
         tfw.put_string(once "run-time-set-count: ")
         tfw.put_integer(c)
         tfw.put_character('%N')
         if c > 0 then
            from
               tfw.put_string(once "run-time-set:%N")
               i := sorted.lower
            until
               i = c
            loop
               lt := sorted.item(i)
               tfw.put_character('%T')
               tfw.put_string(lt.name.to_string)
               tfw.put_character(' ')
               tfw.put_character('(')
               tfw.put_integer(lt.id)
               tfw.put_character(')')
               tfw.put_character('%N')
               i := i + 1
            end
         end
      end

   reset is
      do
         sorted.clear_count
         set.clear_count
         debug
            debug_info.append(once " ***reset*** ")
         end
      ensure
         count = 0
      end

feature {RUN_TIME_SET}
   set: SET[LIVE_TYPE]
         -- The set of possible LIVE_TYPEs which are all `at_run_time' and that can be held by a variable
         -- of the `owner' type.

   sorted: FAST_ARRAY[LIVE_TYPE]
         -- Same `set' of LIVE_TYPEs, but sorted by increasing id.

feature {GRAPH_NODE}
   add_set (other: like Current): INTEGER is
         -- Add elements of `other' into `Current' and return the number of actually added elements.
      require
         not smart_eiffel.is_ready
         not other.is_empty
         other /= Current
      local
         i: INTEGER; other_sorted: like sorted; lt: LIVE_TYPE
      do
         from
            other_sorted := other.sorted
            i := other_sorted.lower
         until
            i > other_sorted.upper
         loop
            lt := other_sorted.item(i)
            if owner = lt then
               check
                  set.fast_has(lt)
               end
            elseif not set.fast_has(lt) then
               if lt.can_be_assigned_to(owner) then
                  force_add(lt)
                  Result := Result + 1
               end
            end
            i := i + 1
         end
      ensure
         Result = count - old count
      end

feature {LIVE_TYPE}
   force_add (live_type: LIVE_TYPE) is
      require
         live_type.is_expanded implies live_type = owner
      local
         i: INTEGER
      do
         set.fast_add(live_type)
         debug
            debug_info.extend(' ')
            debug_info.append(live_type.name.to_string)
         end
         from
            i := sorted.upper
            sorted.add_last(live_type)
         until
            i < sorted.lower or else sorted.item(i).id < live_type.id
         loop
            sorted.swap(i, i + 1)
            i := i - 1
         end
      end

   debug_info: STRING

   make (o: like owner) is
      require
         o /= Void
      do
         owner := o
         create sorted.with_capacity(64)
         create {HASHED_SET[LIVE_TYPE]} set.make
         debug
            debug_info := owner.name.to_string.twin
            debug_info.append(once ": ")
         end
      ensure
         owner = o
      end

invariant
   owner.run_time_set = Current or else owner.run_time_set = Void

   sorted.count = set.count

end -- class RUN_TIME_SET
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
