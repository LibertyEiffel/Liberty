-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_INTEGRAL_BUILTINS
   --
   -- a collection of builtins for INTEGRAL
   --

inherit
   RUNNER_TYPED_BUILTINS[INTEGER_64]

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT is
      do
         check
            False
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN is
      do
         inspect
            processor.current_frame.rf.name.to_string
         when "//", "#//" then
            builtin_infix_int_divide(processor)
            Result := True
         when "\\", "#\\" then
            builtin_infix_int_modulo(processor)
            Result := True
         when "<" then
            builtin_infix_lt(processor)
            Result := True
         when "<=" then
            builtin_infix_le(processor)
            Result := True
         when ">" then
            builtin_infix_gt(processor)
            Result := True
         when ">=" then
            builtin_infix_ge(processor)
            Result := True
         when "to_integer_8" then
            builtin_to_integer_8(processor)
            Result := True
         when "to_integer_16" then
            builtin_to_integer_16(processor)
            Result := True
         when "to_integer_32" then
            builtin_to_integer_32(processor)
            Result := True
         when "to_integer_64" then
            builtin_to_integer_64(processor)
            Result := True
         when "to_natural_8" then
            builtin_to_natural_8(processor)
            Result := True
         when "to_natural_16" then
            builtin_to_natural_16(processor)
            Result := True
         when "to_natural_32" then
            builtin_to_natural_32(processor)
            Result := True
         when "to_natural_64" then
            builtin_to_natural_64(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_infix_divide (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_real_64(left(processor).item / right(processor).item))
      end

   builtin_infix_int_divide (processor: RUNNER_PROCESSOR) is
      do
         set_return(processor, left(processor).item // right(processor).item)
      end

   builtin_infix_int_modulo (processor: RUNNER_PROCESSOR) is
      do
         set_return(processor, left(processor).item \\ right(processor).item)
      end

   builtin_infix_lt (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item < right(processor).item))
      end

   builtin_infix_le (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item <= right(processor).item))
      end

   builtin_infix_gt (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item > right(processor).item))
      end

   builtin_infix_ge (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item >= right(processor).item))
      end

   builtin_to_integer_8 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_integer_8 then
            processor.current_frame.set_return(processor.new_integer_8(i))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into INTEGER_8")
         end
      end

   builtin_to_integer_16 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_integer_16 then
            processor.current_frame.set_return(processor.new_integer_16(i))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into INTEGER_16")
         end
      end

   builtin_to_integer_32 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_integer_32 then
            processor.current_frame.set_return(processor.new_integer_32(i))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into INTEGER_32")
         end
      end

   builtin_to_integer_64 (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_integer_64(left(processor).item))
      end

   builtin_to_natural_8 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_natural_8 then
            processor.current_frame.set_return(processor.new_natural_8(i.to_natural_64))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into NATURAL_8")
         end
      end

   builtin_to_natural_16 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_natural_16 then
            processor.current_frame.set_return(processor.new_natural_8(i.to_natural_64))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into NATURAL_16")
         end
      end

   builtin_to_natural_32 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i.fit_natural_32 then
            processor.current_frame.set_return(processor.new_natural_8(i.to_natural_64))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into NATURAL_16")
         end
      end

   builtin_to_natural_64 (processor: RUNNER_PROCESSOR) is
      local
         i: INTEGER_64
      do
         i := left(processor).item
         if i >= 0 then
            processor.current_frame.set_return(processor.new_natural_8(i.to_natural_64))
         else
            processor.set_exception(exceptions.Routine_failure, i.out + " does not fit into NATURAL_64")
         end
      end

feature {}
   make (a_type: like type) is
      require
         a_type /= Void
      do
         type := a_type
      ensure
         type = a_type
      end

feature {RUNNER_FACET}
   type: TYPE

end -- class RUNNER_INTEGRAL_BUILTINS
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
