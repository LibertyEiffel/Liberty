-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_NATIVE_ARRAY[E_, O_ -> RUNNER_OBJECT]

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

feature {ANY}
   builtins: RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[E_]

   processor: RUNNER_PROCESSOR
   type: TYPE

   item (index: INTEGER): O_ is
      require
         index.in_range(0, capacity - 1)
      do
         Result := retriever.item([processor, storage.item(index)])
      end

   put (a_item: O_; index: INTEGER) is
      require
         index.in_range(0, capacity - 1)
      do
         storage.put(setter.item([a_item]), index)
      end

   out_in_tagged_out_memory is
      local
         i: INTEGER; o: like item
      do
         type.out_in_tagged_out_memory
         tagged_out_memory.extend('<')
         tagged_out_memory.extend('<')
         from
            i := 0
         until
            i = capacity
         loop
            o := item(i)
            if o = Void then
               tagged_out_memory.append(once "Void")
            else
               o.out_in_tagged_out_memory
            end
            tagged_out_memory.extend(',')
            i := i + 1
         end
         tagged_out_memory.put('>', tagged_out_memory.upper)
         tagged_out_memory.extend('>')
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := storage.is_equal(other.storage)
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current is
      do
         Result := Current
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_capacity: like capacity; a_storage: like storage;
         a_retriever: like retriever; a_setter: like setter;
         a_builtins: like builtins) is
      require
         a_processor /= Void
         a_capacity >= 0
         a_retriever /= Void
         a_setter /= Void
      do
         processor := a_processor
         type := a_type
         capacity := a_capacity
         storage := a_storage
         retriever := a_retriever
         setter := a_setter
         builtins := a_builtins
      ensure
         processor = a_processor
         type = a_type
         capacity = a_capacity
         storage = a_storage
         retriever = a_retriever
         setter = a_setter
         builtins = a_builtins
      end

feature {RUNNER_NATIVE_ARRAY}
   storage: NATIVE_ARRAY[E_]
   capacity: INTEGER
   retriever: FUNCTION[TUPLE[RUNNER_PROCESSOR, E_], O_]
   setter: FUNCTION[TUPLE[O_], E_]

invariant
   capacity >= 0
   retriever /= Void
   setter /= Void

end -- class RUNNER_NATIVE_ARRAY
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
