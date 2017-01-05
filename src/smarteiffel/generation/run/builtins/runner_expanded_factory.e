-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class RUNNER_EXPANDED_FACTORY[E_]

insert
   RUNNER_FACET

feature {RUNNER_TYPED_BUILTINS}
   new (processor: RUNNER_PROCESSOR; value: E_; type: TYPE): RUNNER_NATIVE_EXPANDED[E_]
      local
         the_value: RUNNER_BUILTINS_VALUE[E_]
      do
         create the_value.set(processor, value)
         Result ::= factories.fast_reference_at(type).item([the_value])
      end

feature {}
   factories: HASHED_DICTIONARY[FUNCTION[TUPLE[RUNNER_BUILTINS_ANY_VALUE], RUNNER_OBJECT], TYPE]
      once
         Result := {HASHED_DICTIONARY[FUNCTION[TUPLE[RUNNER_BUILTINS_ANY_VALUE], RUNNER_OBJECT], TYPE]
         <<
            agent new_boolean,                smart_eiffel.type_boolean;
            agent new_character,              smart_eiffel.type_character;
            agent new_pointer,                smart_eiffel.type_pointer;
            agent new_integer_8,              smart_eiffel.type_integer_8;
            agent new_integer_16,             smart_eiffel.type_integer_16;
            agent new_integer_32,             smart_eiffel.type_integer_32;
            agent new_integer_64,             smart_eiffel.type_integer_64;
            --agent new_natural_8,              smart_eiffel.type_natural_8;
            --agent new_natural_16,             smart_eiffel.type_natural_16;
            --agent new_natural_32,             smart_eiffel.type_natural_32;
            --agent new_natural_64,             smart_eiffel.type_natural_64;
            agent new_real_32,                smart_eiffel.type_real_32;
            agent new_real_64,                smart_eiffel.type_real_64;
            agent new_real_extended,          smart_eiffel.type_real_extended;
         >>}
      end

   new_boolean (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[BOOLEAN]
      local
         the_value: RUNNER_BUILTINS_VALUE[BOOLEAN]
      do
         the_value ::= value
         Result := the_value.processor.new_boolean(the_value.item)
      end

   new_character (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[CHARACTER]
      local
         the_value: RUNNER_BUILTINS_VALUE[CHARACTER]
      do
         the_value ::= value
         Result := the_value.processor.new_character(the_value.item)
      end

   new_pointer (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[POINTER]
      local
         the_value: RUNNER_BUILTINS_VALUE[POINTER]
      do
         the_value ::= value
         Result := the_value.processor.new_pointer(the_value.item)
      end

   new_integer_8 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      local
         the_value: RUNNER_BUILTINS_VALUE[INTEGER_64]
      do
         the_value ::= value
         Result := the_value.processor.new_integer_8(the_value.item)
      end

   new_integer_16 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      local
         the_value: RUNNER_BUILTINS_VALUE[INTEGER_64]
      do
         the_value ::= value
         Result := the_value.processor.new_integer_16(the_value.item)
      end

   new_integer_32 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      local
         the_value: RUNNER_BUILTINS_VALUE[INTEGER_64]
      do
         the_value ::= value
         Result := the_value.processor.new_integer_32(the_value.item)
      end

   new_integer_64 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[INTEGER_64]
      local
         the_value: RUNNER_BUILTINS_VALUE[INTEGER_64]
      do
         the_value ::= value
         Result := the_value.processor.new_integer_64(the_value.item)
      end

--   new_natural_8 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[NATURAL_8]
--      local
--         the_value: RUNNER_BUILTINS_VALUE[NATURAL_8]
--      do
--         the_value ::= value
--         Result := the_value.processor.new_natural_8(the_value.item)
--      end
--
--   new_natural_16 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[NATURAL_16]
--      local
--         the_value: RUNNER_BUILTINS_VALUE[NATURAL_16]
--      do
--         the_value ::= value
--         Result := the_value.processor.new_natural_16(the_value.item)
--      end
--
--   new_natural_32 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[NATURAL_32]
--      local
--         the_value: RUNNER_BUILTINS_VALUE[NATURAL_32]
--      do
--         the_value ::= value
--         Result := the_value.processor.new_natural_32(the_value.item)
--      end
--
--   new_natural_64 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[NATURAL_64]
--      local
--         the_value: RUNNER_BUILTINS_VALUE[NATURAL_64]
--      do
--         the_value ::= value
--         Result := the_value.processor.new_natural_64(the_value.item)
--      end

   new_real_32 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      local
         the_value: RUNNER_BUILTINS_VALUE[REAL_32]
      do
         the_value ::= value
         Result := the_value.processor.new_real_32(the_value.item)
      end

   new_real_64 (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      local
         the_value: RUNNER_BUILTINS_VALUE[REAL_64]
      do
         the_value ::= value
         Result := the_value.processor.new_real_64(the_value.item)
      end

   new_real_extended (value: RUNNER_BUILTINS_ANY_VALUE): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED]
      local
         the_value: RUNNER_BUILTINS_VALUE[REAL_EXTENDED]
      do
         the_value ::= value
         Result := the_value.processor.new_real_extended(the_value.item)
      end

end -- class RUNNER_EXPANDED_FACTORY
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
