-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT
      do
         check
            False
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
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
         when "|<<", "bit_shift_left" then
            builtin_infix_bit_shift_left(processor)
            Result := True
         when "|>>", "bit_shift_right" then
            builtin_infix_bit_shift_right(processor)
            Result := True
         when "|>>>", "bit_shift_right_unsigned" then
            builtin_infix_bit_shift_right_unsigned(processor)
            Result := True
         when "#<<", "bit_rotate_left" then
            builtin_infix_bit_rotate_left(processor)
            Result := True
         when "#>>", "bit_rotate_right" then
            builtin_infix_bit_rotate_right(processor)
            Result := True
         when "bit_rotate" then
            builtin_infix_bit_rotate(processor)
            Result := True
         when "&", "bit_and" then
            builtin_infix_bit_and(processor)
            Result := True
         when "|", "bit_or" then
            builtin_infix_bit_or(processor)
            Result := True
         when "~", "bit_not" then
            builtin_infix_bit_not(processor)
            Result := True
         when "bit_xor" then
            builtin_infix_bit_xor(processor)
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
         when "to_character" then
            builtin_to_character(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_infix_divide (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_real_64(left(processor).item / right(processor).item))
      end

   builtin_infix_int_divide (processor: RUNNER_PROCESSOR)
      do
         set_return(processor, left(processor).item // right(processor).item)
      end

   builtin_infix_int_modulo (processor: RUNNER_PROCESSOR)
      do
         set_return(processor, left(processor).item \\ right(processor).item)
      end

   builtin_infix_lt (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item < right(processor).item))
      end

   builtin_infix_le (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item <= right(processor).item))
      end

   builtin_infix_gt (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item > right(processor).item))
      end

   builtin_infix_ge (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item >= right(processor).item))
      end

   builtin_infix_bit_shift_left (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item |<< right(processor).item.to_integer_8))
      end

   builtin_infix_bit_shift_right (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item |>> right(processor).item.to_integer_8))
      end

   builtin_infix_bit_shift_right_unsigned (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item |>>> right(processor).item.to_integer_8))
      end

   builtin_infix_bit_rotate_left (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item #<< right(processor).item.to_integer_8))
      end

   builtin_infix_bit_rotate_right (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item #>> right(processor).item.to_integer_8))
      end

   builtin_infix_bit_rotate (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item.bit_rotate(right(processor).item.to_integer_8)))
      end

   builtin_infix_bit_and (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item & right(processor).item))
      end

   builtin_infix_bit_or (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item | right(processor).item))
      end

   builtin_infix_bit_not (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, ~(left(processor).item)))
      end

   builtin_infix_bit_xor (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(new_integer(processor, left(processor).item.bit_xor(right(processor).item)))
      end

   builtin_to_integer_8 (processor: RUNNER_PROCESSOR)
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

   builtin_to_integer_16 (processor: RUNNER_PROCESSOR)
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

   builtin_to_integer_32 (processor: RUNNER_PROCESSOR)
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

   builtin_to_integer_64 (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer_64(left(processor).item))
      end

   builtin_to_natural_8 (processor: RUNNER_PROCESSOR)
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

   builtin_to_natural_16 (processor: RUNNER_PROCESSOR)
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

   builtin_to_natural_32 (processor: RUNNER_PROCESSOR)
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

   builtin_to_natural_64 (processor: RUNNER_PROCESSOR)
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

   builtin_to_character (processor: RUNNER_PROCESSOR)
      local
         i: INTEGER_64
      do
         i := left(processor).item
         processor.current_frame.set_return(processor.new_character(i.to_character))
      end

feature {}
   make (a_type: like type; a_integer_factory: like integer_factory)
      require
         a_type /= Void
         a_integer_factory /= Void
      do
         type := a_type
         integer_factory := a_integer_factory
      ensure
         type = a_type
         integer_factory = a_integer_factory
      end

   integer_factory: FUNCTION[TUPLE[RUNNER_PROCESSOR, INTEGER_64], RUNNER_NATIVE_EXPANDED[INTEGER_64]]

   new_integer (processor: RUNNER_PROCESSOR; integer: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         Result := integer_factory.item([processor, integer])
      end

feature {RUNNER_FACET}
   type: TYPE

end -- class RUNNER_INTEGRAL_BUILTINS
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
