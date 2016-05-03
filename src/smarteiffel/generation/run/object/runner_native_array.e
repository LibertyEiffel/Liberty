-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_NATIVE_ARRAY[E_, O_ -> RUNNER_OBJECT]

inherit
   RUNNER_OBJECT

create {RUNNER_UNTYPED_NATIVE_ARRAY_BUILTINS}
   make

feature {ANY}
   builtins: RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[E_, O_]

   processor: RUNNER_PROCESSOR
   type: TYPE
   element_type: TYPE

   capacity: INTEGER

   is_initialized: BOOLEAN True

   item (index: INTEGER_64): O_
      require
         index.in_range(0, capacity - 1)
      do
         Result := retriever.item([processor, storage.item(index.to_integer_32)])
      end

   put (a_item: O_; index: INTEGER_64)
      require
         index.in_range(0, capacity - 1)
      do
         storage.put(setter.item([a_item]), index.to_integer_32)
      end

   slice_copy (at: INTEGER_64; src: like Current; src_min, src_max: INTEGER_64)
      local
         index: INTEGER_64
      do
         if element_type.is_user_expanded then
            -- don't optimize slice_copy because we need to expand each user-expanded object
            from
               index := src_min
            until
               index > src_max
            loop
               put(src.item(index), index - src_min + at)
               index := index + 1
            end
         else
            check
               element_type.is_reference or else element_type.is_kernel_expanded
            end
            storage.slice_copy(at.to_integer_32, src.storage, src_min.to_integer_32, src_max.to_integer_32)
         end
      end

   out_in_tagged_out_memory
      local
         i: INTEGER; o: like item
      do
         type.name.to_string.out_in_tagged_out_memory
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
            if i = 32 then
               i := capacity
            end
         end
         if capacity > 32 then
            tagged_out_memory.append(once " ... >>")
         else
            tagged_out_memory.put('>', tagged_out_memory.upper) -- overwrite the coma
            tagged_out_memory.extend('>')
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := storage.is_equal(other.storage)
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER
      do
         Result := storage.to_pointer
      end

   builtin_copy (other: RUNNER_OBJECT)
      do
         not_yet_implemented
      end

   builtin_is_equal (other: RUNNER_OBJECT): BOOLEAN
      do
         not_yet_implemented
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current
      do
         Result := Current
      end

   as_foreign_object: FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[NATIVE_ARRAY[E_]]} Result.with(storage)
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_element_type: like element_type;
         a_capacity: like capacity; a_storage: like storage;
         a_retriever: like retriever; a_setter: like setter;
         a_builtins: like builtins)
      require
         a_processor /= Void
         a_type /= Void
         a_element_type /= Void
         a_capacity >= 0
         a_retriever /= Void
         a_setter /= Void
         a_builtins.type = a_type
      do
         processor := a_processor
         type := a_type
         element_type := a_element_type
         capacity := a_capacity
         storage := a_storage
         retriever := a_retriever
         setter := a_setter
         builtins := a_builtins
      ensure
         processor = a_processor
         type = a_type
         element_type = a_element_type
         capacity = a_capacity
         storage = a_storage
         retriever = a_retriever
         setter = a_setter
         builtins = a_builtins
      end

feature {RUNNER_NATIVE_ARRAY}
   storage: NATIVE_ARRAY[E_]
   retriever: FUNCTION[TUPLE[RUNNER_PROCESSOR, E_], O_]
   setter: FUNCTION[TUPLE[O_], E_]

feature {RUNNER_FACET}
   builtin_calloc (nb_elements: INTEGER_64): like Current
      require
         nb_elements.fit_integer_32
      local
         storage_: NATIVE_ARRAY[E_]
      do
         if nb_elements > 0 then
            storage_ := storage_.calloc(nb_elements.to_integer_32)
         end
         Result := builtins.with_storage(processor, nb_elements.to_integer_32, storage_)
      end

invariant
   capacity >= 0
   type /= Void
   element_type /= Void
   retriever /= Void
   setter /= Void
   builtins.type = type

end -- class RUNNER_NATIVE_ARRAY
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
