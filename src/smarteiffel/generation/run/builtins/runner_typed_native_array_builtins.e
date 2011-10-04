-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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

feature {RUNNER_UNTYPED_BUILTINS}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN is
      do
         inspect
            processor.current_frame.rf.name.to_string
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
   builtin_element_sizeof (processor: RUNNER_PROCESSOR) is
      local
         na: NATIVE_ARRAY[E_]
      do
         processor.current_frame.set_return(processor.new_integer(na.element_sizeof))
      end

   builtin_calloc (processor: RUNNER_PROCESSOR) is
      local
         nb_elements: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         nb_elements ::= processor.current_frame.arguments.first
         processor.current_frame.set_return(caller.builtin_calloc(nb_elements.item))
      end

   builtin_item (processor: RUNNER_PROCESSOR) is
      local
         index: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         index ::= processor.current_frame.arguments.first
         processor.current_frame.set_return(caller.item(index.item))
      end

   builtin_put (processor: RUNNER_PROCESSOR) is
      local
         index: RUNNER_NATIVE_EXPANDED[INTEGER_64]
         item: O_
         caller: RUNNER_NATIVE_ARRAY[E_, O_]
      do
         caller ::= processor.current_frame.target
         item ::= processor.current_frame.arguments.first
         index ::= processor.current_frame.arguments.item(processor.current_frame.arguments.lower + 1)
         caller.put(item, index.item)
      end

   builtin_slice_copy (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

   builtin_from_pointer (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

feature {}
   make is
      do
      end

end -- class RUNNER_TYPED_NATIVE_ARRAY_BUILTINS
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
