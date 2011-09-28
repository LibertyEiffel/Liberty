-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class RUNNER_BUILTINS
--
-- role to access parts of the RUNNER framework
--

insert
   RUNNER_FACET

feature {RUNNER_FACET}
   call (processor: RUNNER_PROCESSOR) is
      do
         builtins.fast_reference_at(processor.current_frame.type_of_current).call([processor])
      end

feature {}
   builtins: HASHED_DICTIONARY[PROCEDURE[TUPLE[RUNNER_PROCESSOR]], TYPE] is
      once
         Result := {HASHED_DICTIONARY[PROCEDURE[TUPLE[RUNNER_PROCESSOR]], TYPE]
         <<
            agent builtin_boolean,                smart_eiffel.type_boolean;
            agent builtin_character,              smart_eiffel.type_character;
            --agent builtin_native_array_character, smart_eiffel.type_native_array_character;
            agent builtin_pointer,                smart_eiffel.type_pointer;
            agent builtin_integer_8,              smart_eiffel.type_integer_8;
            agent builtin_integer_16,             smart_eiffel.type_integer_16;
            agent builtin_integer_32,             smart_eiffel.type_integer_32;
            agent builtin_integer_64,             smart_eiffel.type_integer_64;
            --agent builtin_natural_8,              smart_eiffel.type_natural_8;
            --agent builtin_natural_16,             smart_eiffel.type_natural_16;
            --agent builtin_natural_32,             smart_eiffel.type_natural_32;
            --agent builtin_natural_64,             smart_eiffel.type_natural_64;
            agent builtin_real_32,                smart_eiffel.type_real_32;
            agent builtin_real_64,                smart_eiffel.type_real_64;
            agent builtin_real_extended,          smart_eiffel.type_real_extended;
         >>}
      end

   builtin_boolean (processor: RUNNER_PROCESSOR) is
      local
         b: RUNNER_BOOLEAN_BUILTINS
      do
         b.call(processor)
      end

   builtin_character (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

--   builtin_native_array_character (processor: RUNNER_PROCESSOR) is
--      do
--         sedb_breakpoint --| **** TODO
--      end

   builtin_pointer (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

   builtin_integer_8 (processor: RUNNER_PROCESSOR) is
      local
         b: RUNNER_INTEGRAL_BUILTINS[INTEGER_8]
      do
         b.call(processor)
      end

   builtin_integer_16 (processor: RUNNER_PROCESSOR) is
      local
         b: RUNNER_INTEGRAL_BUILTINS[INTEGER_16]
      do
         b.call(processor)
      end

   builtin_integer_32 (processor: RUNNER_PROCESSOR) is
      local
         b: RUNNER_INTEGRAL_BUILTINS[INTEGER_32]
      do
         b.call(processor)
      end

   builtin_integer_64 (processor: RUNNER_PROCESSOR) is
      local
         b: RUNNER_INTEGRAL_BUILTINS[INTEGER_64]
      do
         b.call(processor)
      end

--   builtin_natural_8 (processor: RUNNER_PROCESSOR) is
--      do
--         sedb_breakpoint --| **** TODO
--      end
--
--   builtin_natural_16 (processor: RUNNER_PROCESSOR) is
--      do
--         sedb_breakpoint --| **** TODO
--      end
--
--   builtin_natural_32 (processor: RUNNER_PROCESSOR) is
--      do
--         sedb_breakpoint --| **** TODO
--      end
--
--   builtin_natural_64 (processor: RUNNER_PROCESSOR) is
--      do
--         sedb_breakpoint --| **** TODO
--      end

   builtin_real_32 (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

   builtin_real_64 (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

   builtin_real_extended (processor: RUNNER_PROCESSOR) is
      do
         sedb_breakpoint --| **** TODO
      end

end -- class RUNNER_BUILTINS
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
