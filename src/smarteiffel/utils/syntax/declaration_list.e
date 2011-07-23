-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class DECLARATION_LIST
   --
   -- For a formal arguments list (FORMAL_ARG_LIST) or for a local
   -- variable list (LOCAL_VAR_LIST).
   --
   -- Exemple :
   --
   --   foo, bar : ZOO; x : INTEGER
   --

inherit
   VISITABLE

insert
   GLOBALS

feature {DECLARATION_LIST, VISITOR}
   list: ARRAY[DECLARATION]
         -- Really written list including declaration groups.

   flat_list: ARRAY[like name]
         -- The same contents as `list' but flat.

feature {ANY}
   start_position: POSITION is
      do
         Result := flat_list.first.start_position
      end

   count: INTEGER is
      do
         Result := flat_list.count
      end

   fast_rank_of (n: STRING): INTEGER is
         -- Result is greater than 0 when `n' is in the list.
      require
         string_aliaser.registered_one(n)
      do
         from
            Result := count
         until
            Result = 0 or else name(Result).to_string = n
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(0, count)
      end

   rank_of (n: STRING): INTEGER is
         -- Result is greater than 0 when `n' is in the list.
      require
         not string_aliaser.registered_one(n)
      do
         from
            Result := count
         until
            Result = 0 or else name(Result).to_string.is_equal(n)
         loop
            Result := Result - 1
         end
      ensure
         Result.in_range(0, count)
      end

   name (i: INTEGER): LOCAL_ARGUMENT1 is
      require
         i.in_range(1, count)
      deferred
      ensure
         Result /= Void
      end

   type_mark (i: INTEGER): TYPE_MARK is
      require
         i.in_range(1, count)
      do
         Result := name(i).result_type
      ensure
         Result /= Void
      end

   specialize_in (type: TYPE): like Current is
      require
         type /= Void
      local
         n1, n2: like name; new_flat_list: like flat_list; i: INTEGER;
         d1, d2: DECLARATION; new_list: like list
      do
         from
            i := flat_list.upper
         until
            i < flat_list.lower or else n1 /= n2
         loop
            n1 := flat_list.item(i)
            n2 := n1.specialize_in(type)
            i := i - 1
         end
         if n1 = n2 then
            Result := Current
         else
            Result := twin
            create new_flat_list.from_collection(flat_list)
            Result.set_flat_list(new_flat_list)
            from
               new_flat_list.put(n2, i + 1)
            until
               i < flat_list.lower
            loop
               new_flat_list.put(flat_list.item(i).specialize_in(type), i)
               i := i - 1
            end
         end
         if smart_eiffel.short_or_class_check_flag then
            from
               i := list.upper
            until
               i < list.lower or else d1 /= d2
            loop
               d1 := list.item(i)
               d2 := d1.specialize_in(type)
               i := i - 1
            end
            if d1 /= d2 then
               if Result = Current then
                  Result := twin
               end
               create new_list.from_collection(list)
               Result.set_list(new_list)
               from
                  new_list.put(d2, i + 1)
               until
                  i < list.lower
               loop
                  new_list.put(list.item(i).specialize_in(type), i)
                  i := i - 1
               end
            end
         end
         name_clash_check(type)
      ensure
         Result.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      require
         new_type.direct_thru_step(parent_type, parent_edge)
         has_been_specialized
      local
         n1, n2: like name; new_flat_list: like flat_list; i: INTEGER
         d1, d2: DECLARATION; new_list: like list
      do
         from
            i := flat_list.upper
         until
            i < flat_list.lower or else n1 /= n2
         loop
            n1 := flat_list.item(i)
            n2 := n1.specialize_thru(parent_type, parent_edge, new_type)
            i := i - 1
         end
         if n1 = n2 then
            Result := Current
         else
            Result := twin
            create new_flat_list.from_collection(flat_list)
            Result.set_flat_list(new_flat_list)
            from
               new_flat_list.put(n2, i + 1)
            until
               i < flat_list.lower
            loop
               new_flat_list.put(flat_list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
               i := i - 1
            end
         end
         if smart_eiffel.short_or_class_check_flag then
            from
               i := list.upper
            until
               i < list.lower or else d1 /= d2
            loop
               d1 := list.item(i)
               d2 := d1.specialize_thru(parent_type, parent_edge, new_type)
               i := i - 1
            end
            if d1 /= d2 then
               if Result = Current then
                  Result := twin
               end
               create new_list.from_collection(list)
               Result.set_list(new_list)
               from
                  new_list.put(d2, i + 1)
               until
                  i < list.lower
               loop
                  new_list.put(list.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i - 1
               end
            end
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   has_been_specialized: BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := flat_list.upper
         until
            i < flat_list.lower or else not Result
         loop
            Result := flat_list.item(i).has_been_specialized
            i := i - 1
         end
         if smart_eiffel.short_or_class_check_flag then
            from
               i := list.upper
            until
               i < list.lower or else not Result
            loop
               Result := list.item(i).has_been_specialized
               i := i - 1
            end
         end
      ensure
         Result
      end

feature {DECLARATION_LIST}
   set_flat_list (fl: like flat_list) is
      require
         fl /= Void
      do
         flat_list := fl
      end

   set_list (l: like list) is
      require
         l /= Void
      do
         list := l
      end

feature {ANONYMOUS_FEATURE, RUN_FEATURE, MANIFEST_GENERIC}
   frozen jvm_stack_space (type: TYPE): INTEGER is
         -- Number of needed words in the JVM stack.
      local
         i: INTEGER
      do
         from
            i := count
         until
            i = 0
         loop
            Result := Result + type_mark(i).to_static(type).jvm_stack_space
            i := i - 1
         end
      end

   frozen jvm_offset_of (type: TYPE; la: like name): INTEGER is
      local
         i, rank: INTEGER
      do
         from
            rank := la.rank
            i := 1
         variant
            count - i
         until
            i = rank
         loop
            Result := Result + type_mark(i).to_static(type).jvm_stack_space
            i := i + 1
         end
      end

feature {RUN_FEATURE}
   adapt_for (t: TYPE): like Current is
      local
         i: INTEGER; n1, n2: like name; fl: like flat_list
      do
         from
            i := flat_list.upper
         until
            i < flat_list.lower or else n1 /= n2
         loop
            n1 := flat_list.item(i)
            n2 := n1.adapt_for(t)
            i := i - 1
         end
         if n1 = n2 then
            Result := Current
         else
            from
               create fl.from_collection(flat_list)
               Result := twin
               Result.set_flat_list(fl)
               fl.put(n2, i + 1)
            until
               i < flat_list.lower
            loop
               fl.put(flat_list.item(i).adapt_for(t), i)
               i := i - 1
            end
         end
      end

feature {DECLARATION_LIST}
   frozen name_clash_check (type: TYPE) is
      require
         type /= Void
      local
         i: INTEGER
      do
         from
            i := count
         until
            i = 0
         loop
            name(i).name_clash_check(type)
            i := i - 1
         end
      end

feature {}
   em1: STRING is "Bad declaration."

   compute_flat_list_count_by_using_list: INTEGER is
      local
         i: INTEGER
      do
         from
            i := list.upper
         until
            i < list.lower
         loop
            Result := Result + list.item(i).count
            i := i - 1
         end
      end
   
invariant
   count > 0

   count = flat_list.count

   list.count <= count

end -- class DECLARATION_LIST
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
