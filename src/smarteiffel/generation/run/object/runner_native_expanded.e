-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_NATIVE_EXPANDED[E_]

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

feature {ANY}
   builtins: RUNNER_TYPED_BUILTINS[E_]

   processor: RUNNER_PROCESSOR
   type: TYPE
   item: E_

   is_initialized: BOOLEAN True

   out_in_tagged_out_memory
      do
         item.out_in_tagged_out_memory
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := item = other.item
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER
      do
         processor.set_exception(exceptions.Routine_failure, "to_pointer on expanded type")
      end

   builtin_copy (other: RUNNER_OBJECT)
      local
         o: like Current
      do
         o ::= other
         item := o.item
      end

   builtin_is_equal (other: RUNNER_OBJECT): BOOLEAN
      local
         o: like Current
      do
         if other.type = type then
            o ::= other
            Result := item = o.item
         end
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current
      do
         Result := Current -- because native expanded values are flyweights
      end

   as_foreign_object: FOREIGN_OBJECT
      do
         create {FOREIGN_TYPED_OBJECT[E_]} Result.with(item)
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_item: like item; a_builtins: like builtins)
      require
         a_processor /= Void
         a_type.is_kernel_expanded
      do
         processor := a_processor
         type := a_type
         item := a_item
         builtins := a_builtins
      ensure
         processor = a_processor
         type = a_type
         item = a_item
         builtins = a_builtins
      end

invariant
   item_is_expanded: item /= Void

end -- class RUNNER_NATIVE_EXPANDED
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
