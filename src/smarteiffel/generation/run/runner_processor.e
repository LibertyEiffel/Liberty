-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_PROCESSOR

insert
   RUNNER_FACET

create {RUNNER}
   make

feature {RUNNER_FACET}
   features: RUNNER_FEATURES
   instructions: RUNNER_INSTRUCTIONS
   expressions: RUNNER_EXPRESSIONS

   memory: RUNNER_MEMORY
         -- shared by all processors

   current_frame: RUNNER_FRAME is
      do
         Result := features.current_frame
      end

feature {} -- fly-weights
   booleans:       FAST_ARRAY[RUNNER_NATIVE_EXPANDED[BOOLEAN]]
   characters:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[CHARACTER],     CHARACTER]
   integers_8:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_8],     INTEGER_8]
   integers_16:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_16],    INTEGER_16]
   integers_32:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_32],    INTEGER_32]
   integers_64:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[INTEGER_64],    INTEGER_64]
   naturals_8:     HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_8],     NATURAL_8]
   naturals_16:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_16],    NATURAL_16]
   naturals_32:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_32],    NATURAL_32]
   naturals_64:    HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[NATURAL_64],    NATURAL_64]
   reals_32:       HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_32],       REAL_32]
   reals_64:       HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_64],       REAL_64]
   reals_extended: HASHED_DICTIONARY[RUNNER_NATIVE_EXPANDED[REAL_EXTENDED], REAL_EXTENDED]

feature {RUNNER_FACET}
   new_object (type: TYPE): RUNNER_STRUCTURED_OBJECT is
      require
         alive: type.live_type /= Void
      do
         Result := memory.new_object(Current, type)
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = Current
      end

   new_boolean (boolean: BOOLEAN): RUNNER_NATIVE_EXPANDED[BOOLEAN] is
      do
         Result := booleans.item(boolean.to_integer)
         if Result = Void then
            Result := memory.new_boolean(Current, boolean)
            booleans.put(Result, boolean.to_integer)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_boolean
         good_processor: Result.processor = Current
      end

   new_character (character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER] is
      do
         Result := characters.fast_reference_at(character)
         if Result = Void then
            Result := memory.new_character(Current, character)
            characters.add(Result, character)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_character
         good_processor: Result.processor = Current
      end

   new_native_array_character (capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]] is
      do
         Result := memory.new_native_array_character(Current, capacity, storage)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_native_array_character
         good_processor: Result.processor = Current
      end

   new_pointer (pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER] is
      do
         Result := memory.new_pointer(Current, pointer)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_pointer
         good_processor: Result.processor = Current
      end

   new_integer_8 (integer_8: INTEGER_8): RUNNER_NATIVE_EXPANDED[INTEGER_8] is
      do
         Result := integers_8.fast_reference_at(integer_8)
         if Result = Void then
            Result := memory.new_integer_8(Current, integer_8)
            integers_8.add(Result, integer_8)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_8
         good_processor: Result.processor = Current
      end

   new_integer_16 (integer_16: INTEGER_16): RUNNER_NATIVE_EXPANDED[INTEGER_16] is
      do
         Result := integers_16.fast_reference_at(integer_16)
         if Result = Void then
            Result := memory.new_integer_16(Current, integer_16)
            integers_16.add(Result, integer_16)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_16
         good_processor: Result.processor = Current
      end

   new_integer_32 (integer_32: INTEGER_32): RUNNER_NATIVE_EXPANDED[INTEGER_32] is
      do
         Result := integers_32.fast_reference_at(integer_32)
         if Result = Void then
            Result := memory.new_integer_32(Current, integer_32)
            integers_32.add(Result, integer_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_32
         good_processor: Result.processor = Current
      end

   new_integer_64 (integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64] is
      do
         Result := integers_64.fast_reference_at(integer_64)
         if Result = Void then
            Result := memory.new_integer_64(Current, integer_64)
            integers_64.add(Result, integer_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_integer_64
         good_processor: Result.processor = Current
      end

   new_natural_8 (natural_8: NATURAL_8): RUNNER_NATIVE_EXPANDED[NATURAL_8] is
      do
         Result := naturals_8.fast_reference_at(natural_8)
         if Result = Void then
            Result := memory.new_natural_8(Current, natural_8)
            naturals_8.add(Result, natural_8)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_8
         good_processor: Result.processor = Current
      end

   new_natural_16 (natural_16: NATURAL_16): RUNNER_NATIVE_EXPANDED[NATURAL_16] is
      do
         Result := naturals_16.fast_reference_at(natural_16)
         if Result = Void then
            Result := memory.new_natural_16(Current, natural_16)
            naturals_16.add(Result, natural_16)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_16
         good_processor: Result.processor = Current
      end

   new_natural_32 (natural_32: NATURAL_32): RUNNER_NATIVE_EXPANDED[NATURAL_32] is
      do
         Result := naturals_32.fast_reference_at(natural_32)
         if Result = Void then
            Result := memory.new_natural_32(Current, natural_32)
            naturals_32.add(Result, natural_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_32
         good_processor: Result.processor = Current
      end

   new_natural_64 (natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64] is
      do
         Result := naturals_64.fast_reference_at(natural_64)
         if Result = Void then
            Result := memory.new_natural_64(Current, natural_64)
            naturals_64.add(Result, natural_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_natural_64
         good_processor: Result.processor = Current
      end

   new_internals_handler_if_exists (internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT is
      do
         Result := memory.new_internals_handler_if_exists(Current, internals_handler)
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_internals_handler_if_exists
         good_processor: Result.processor = Current
      end

   new_real_32 (real_32: REAL_32): RUNNER_NATIVE_EXPANDED[REAL_32] is
      do
         Result := reals_32.fast_reference_at(real_32)
         if Result = Void then
            Result := memory.new_real_32(Current, real_32)
            reals_32.add(Result, real_32)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_32
         good_processor: Result.processor = Current
      end

   new_real_64 (real_64: REAL_64): RUNNER_NATIVE_EXPANDED[REAL_64] is
      do
         Result := reals_64.fast_reference_at(real_64)
         if Result = Void then
            Result := memory.new_real_64(Current, real_64)
            reals_64.add(Result, real_64)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_64
         good_processor: Result.processor = Current
      end

   new_real_extended (real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED] is
      do
         Result := reals_extended.fast_reference_at(real_extended)
         if Result = Void then
            Result := memory.new_real_extended(Current, real_extended)
            reals_extended.add(Result, real_extended)
         end
      ensure
         exists: Result /= Void
         good_type: Result.type = smart_eiffel.type_real_extended
         good_processor: Result.processor = Current
      end

feature {RUNNER}
   run (rf: RUN_FEATURE) is
      do
         features.run(rf)
      end

feature {}
   make (a_memory: like memory) is
      require
         a_memory /= Void
      do
         create features.make(Current)
         create instructions.make(Current)
         create expressions.make(Current)

         create booleans.make(2)
         create characters.make
         create integers_8.make
         create integers_16.make
         create integers_32.make
         create integers_64.make
         create naturals_8.make
         create naturals_16.make
         create naturals_32.make
         create naturals_64.make
         create reals_32.make
         create reals_64.make
         create reals_extended.make

         memory := a_memory
      ensure
         memory = a_memory
      end

invariant
   features /= Void
   instructions /= Void
   expressions /= Void

   booleans /= Void
   characters /= Void
   integers_8 /= Void
   integers_16 /= Void
   integers_32 /= Void
   integers_64 /= Void
   naturals_8 /= Void
   naturals_16 /= Void
   naturals_32 /= Void
   naturals_64 /= Void
   reals_32 /= Void
   reals_64 /= Void
   reals_extended /= Void

   memory /= Void

end -- class RUNNER_PROCESSOR
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
