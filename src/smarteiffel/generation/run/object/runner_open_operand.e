-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_OPEN_OPERAND

inherit
   RUNNER_OBJECT

create {RUNNER_MEMORY}
   make

feature {ANY}
   builtins: RUNNER_UNTYPED_BUILTINS

   is_initialized: BOOLEAN False

   processor: RUNNER_PROCESSOR
      do
         Result := agent_object.processor
      end

   type: TYPE

   out_in_tagged_out_memory
      do
         not_yet_implemented
      end

   is_equal (other: like Current): BOOLEAN
      do
         not_yet_implemented
      end

feature {RUNNER_UNTYPED_BUILTINS}
   builtin_to_pointer: POINTER
      do
         Result := to_pointer
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
         not_yet_implemented
      end

feature {}
   make (a_agent_object: like agent_object; a_type: like type)
      require
         a_agent_object /= Void
         a_type.live_type /= Void
      do
         agent_object := a_agent_object
         type := a_type
      ensure
         agent_object = a_agent_object
         type = a_type
      end

   agent_object: RUNNER_AGENT_OBJECT

invariant
   type.live_type /= Void

end -- class RUNNER_OPEN_OPERAND
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
