-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_EXCEPTION

insert
   RUNNER_FACET

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_FACET}
   message: FIXED_STRING
   frame: RUNNER_FRAME
   parent: RUNNER_EXCEPTION
   exception: INTEGER

   processor: RUNNER_PROCESSOR
      do
         Result := frame.processor
      end

   print_stack
      do
         frame.print_stack(std_error)
      end

   set_parent (a_parent: like parent)
      require
         parent = Void
         a_parent /= Void
      do
         parent := a_parent
      ensure
         parent = a_parent
      end

feature {}
   make (a_exception: like exception; a_message: like message; a_processor: RUNNER_PROCESSOR; a_parent: like parent)
      require
         a_exception.in_range(exceptions.Check_instruction, exceptions.System_level_type_error)
         a_message /= Void
         a_processor /= Void
      do
         message := a_message
         exception := a_exception
         frame := a_processor.current_frame
         parent := a_parent
      ensure
         message = a_message
         exception = a_exception
         frame = a_processor.current_frame
         processor = a_processor
         parent = a_parent
      end

invariant
   message /= Void
   frame /= Void
   exception.in_range(exceptions.Check_instruction, exceptions.System_level_type_error)

end -- class RUNNER_EXCEPTION
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
