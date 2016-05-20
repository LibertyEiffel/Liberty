-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[E_, O_ -> RUNNER_OBJECT]
   --
   -- a collection of builtins for NATIVE_ARRAY
   --

inherit
   RUNNER_UNTYPED_NATIVE_ARRAY_BUILTINS

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_NATIVE_ARRAY[E_, O_]
      local
         empty_storage: NATIVE_ARRAY[E_]
      do
         Result := with_storage(processor, 0, empty_storage)
      end

feature {RUNNER_MEMORY, RUNNER_NATIVE_ARRAY}
   with_storage (processor: RUNNER_PROCESSOR; capacity: INTEGER; storage: NATIVE_ARRAY[E_]): RUNNER_NATIVE_ARRAY[E_, O_]
      do
         create Result.make(processor, type, element_type, capacity, storage, retriever, setter, Current)
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
         when "element_sizeof" then
            builtin_element_sizeof(processor)
            Result := True
         when "calloc" then
            builtin_calloc(processor)
            Result := True
         when "item" then
            builtin_item(processor)
            Result := True
         when "put" then
            builtin_put(processor)
            Result := True
         when "slice_copy" then
            builtin_slice_copy(processor)
            Result := True
         when "from_pointer" then
            builtin_from_pointer(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_element_sizeof (processor: RUNNER_PROCESSOR)
      local
         na: NATIVE_ARRAY[E_]
      do
         processor.current_frame.set_return(processor.new_integer(na.element_sizeof))
      end

   builtin_calloc (processor: RUNNER_PROCESSOR)
      local
         nb_elements: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         nb_elements ::= processor.current_frame.arguments.first
         processor.current_frame.set_return(caller.builtin_calloc(nb_elements.item))
      end

   builtin_item (processor: RUNNER_PROCESSOR)
      local
         index: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         index ::= processor.current_frame.arguments.first
         if index.item.in_range(0, caller.capacity - 1) then
            processor.current_frame.set_return(caller.item(index.item))
         else
            processor.current_frame.debug_stack
            break --| **** BUG
         end
      end

   builtin_put (processor: RUNNER_PROCESSOR)
      local
         index: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         item: O_
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         item ::= processor.current_frame.arguments.first
         index ::= processor.current_frame.arguments.last
         caller.put(item, index.item)
      end

   builtin_slice_copy (processor: RUNNER_PROCESSOR)
      local
         at, src_min, src_max: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         caller, src: RUNNER_NATIVE_ARRAY[E_, O_]
         arguments: ITERATOR[RUNNER_OBJECT]
      do
         caller ::= processor.current_frame.target
         arguments := processor.current_frame.arguments.new_iterator
         at ::= arguments.item
         arguments.next
         src ::= arguments.item
         arguments.next
         src_min ::= arguments.item
         arguments.next
         src_max ::= arguments.item
         caller.slice_copy(at.item, src, src_min.item, src_max.item)
      end

   builtin_from_pointer (processor: RUNNER_PROCESSOR)
      do
         break --| **** TODO
      end

feature {}
   make (a_type: like type; a_element_type: like element_type; a_retriever: like retriever; a_setter: like setter)
      require
         a_type /= Void
         a_element_type /= Void
      do
         type := a_type
         element_type := a_element_type
         retriever := a_retriever
         setter := a_setter
      ensure
         type = a_type
         element_type = a_element_type
         retriever = a_retriever
         setter = a_setter
      end

   retriever: FUNCTION[TUPLE[RUNNER_PROCESSOR, E_], O_]
   setter: FUNCTION[TUPLE[O_], E_]

feature {RUNNER_FACET}
   type: TYPE
   element_type: TYPE

invariant
   retriever /= Void
   setter /= Void
   element_type /= Void

end -- class RUNNER_TYPED_NATIVE_ARRAY_BUILTINS
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
