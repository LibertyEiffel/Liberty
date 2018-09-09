-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_PLATFORM_BUILTINS
   --
   -- builtins for PLATFORM
   --

inherit
   RUNNER_UNTYPED_BUILTINS

insert
   PLATFORM

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_STRUCTURED_OBJECT
      do
         create Result.make(processor, type, Current)
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
         when "Maximum_character_code" then
            builtin_maximum_character_code(processor)
            Result := True
         when "Maximum_real" then
            builtin_maximum_real(processor)
            Result := True
         when "Maximum_real_80" then
            builtin_maximum_real_80(processor)
            Result := True
         when "Minimum_character_code" then
            builtin_minimum_character_code(processor)
            Result := True
         when "Minimum_real" then
            builtin_minimum_real(processor)
            Result := True
         when "Minimum_real_80" then
            builtin_minimum_real_80(processor)
            Result := True
         when "Boolean_bits" then
            builtin_boolean_bits(processor)
            Result := True
         when "Character_bits" then
            builtin_character_bits(processor)
            Result := True
         when "Integer_bits" then
            builtin_integer_bits(processor)
            Result := True
         when "Pointer_bits" then
            builtin_pointer_bits(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_maximum_character_code (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer_16(Maximum_character_code))
      end

   builtin_maximum_real (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_real_64(Maximum_real))
      end

   builtin_maximum_real_80 (processor: RUNNER_PROCESSOR)
      do
         not_yet_implemented
      end

   builtin_minimum_character_code (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer_16(Minimum_character_code))
      end

   builtin_minimum_real (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_real_64(Minimum_real))
      end

   builtin_minimum_real_80 (processor: RUNNER_PROCESSOR)
      do
         not_yet_implemented
      end

   builtin_boolean_bits (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer(Boolean_bits))
      end

   builtin_character_bits (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer(Character_bits))
      end

   builtin_integer_bits (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer(Integer_bits))
      end

   builtin_pointer_bits (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_integer_16(Pointer_bits))
      end

feature {}
   make (a_type: like type)
      require
         a_type /= Void
      do
         type := a_type
      ensure
         type = a_type
      end

feature {RUNNER_FACET}
   type: TYPE

end -- class RUNNER_PLATFORM_BUILTINS
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
