-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_NATIVE_EXPANDED[E_]

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

feature {ANY}
   processor: RUNNER_PROCESSOR
   type: TYPE
   item: E_

   out_in_tagged_out_memory is
      do
         item.out_in_tagged_out_memory
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := item = other.item
      end

feature {RUNNER_FACET}
   copy_if_expanded: like Current is
      do
         Result := Current -- because native expanded values are flyweights
      end

feature {}
   make (a_processor: like processor; a_type: like type; a_item: like item) is
      require
         a_processor /= Void
         a_type.is_kernel_expanded
      do
         processor := a_processor
         type := a_type
         item := a_item
      ensure
         processor = a_processor
         type = a_type
         item = a_item
      end

invariant
   item_is_expanded: item /= Void

end -- class RUNNER_NATIVE_EXPANDED
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
