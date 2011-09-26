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

feature {RUNNER_FACET}
   new_object (type: TYPE): RUNNER_STRUCTURED_OBJECT is
      require
         alive: type.live_type /= Void
         processing: processor /= Void
      do
         Result := memory.new_object(Current, type)
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = processor
      end

   new_boolean (boolean: BOOLEAN): RUNNER_NATIVE_EXPANDED[BOOLEAN] is
      do
         Result := memory.new_boolean(Current, boolean)
      end

   new_character (character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER] is
      do
         Result := memory.new_character(Current, character)
      end

   new_native_array_character (capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]] is
      do
         Result := memory.new_native_array_character(Current, capacity, storage)
      end

   new_pointer (pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER] is
      do
         Result := memory.new_pointer(Current, pointer)
      end

   new_integer_8 (integer_8: INTEGER_8): RUNNER_NATIVE_EXPANDED[INTEGER_8] is
      do
         Result := memory.new_integer_8(Current, integer_8)
      end

   new_integer_16 (integer_16: INTEGER_16): RUNNER_NATIVE_EXPANDED[INTEGER_16] is
      do
         Result := memory.new_integer_16(Current, integer_16)
      end

   new_integer_32 (integer_32: INTEGER_32): RUNNER_NATIVE_EXPANDED[INTEGER_32] is
      do
         Result := memory.new_integer_32(Current, integer_32)
      end

   new_integer_64 (integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64] is
      do
         Result := memory.new_integer_64(Current, integer_64)
      end

   new_natural_8 (natural_8: NATURAL_8): RUNNER_NATIVE_EXPANDED[NATURAL_8] is
      do
         Result := memory.new_natural_8(Current, natural_8)
      end

   new_natural_16 (natural_16: NATURAL_16): RUNNER_NATIVE_EXPANDED[NATURAL_16] is
      do
         Result := memory.new_natural_16(Current, natural_16)
      end

   new_natural_32 (natural_32: NATURAL_32): RUNNER_NATIVE_EXPANDED[NATURAL_32] is
      do
         Result := memory.new_natural_32(Current, natural_32)
      end

   new_natural_64 (natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64] is
      do
         Result := memory.new_natural_64(Current, natural_64)
      end

   new_internals_handler_if_exists (internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT is
      do
         Result := memory.new_internals_handler_if_exists(Current, internals_handler)
      end

   new_real_32 (real_32: REAL_32): RUNNER_NATIVE_EXPANDED[REAL_32] is
      do
         Result := memory.new_real_32(Current, real_32)
      end

   new_real_64 (real_64: REAL_64): RUNNER_NATIVE_EXPANDED[REAL_64] is
      do
         Result := memory.new_real_64(Current, real_64)
      end

   new_real_extended (real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED] is
      do
         Result := memory.new_real_extended(Current, real_extended)
      end

feature {RUNNER}
   run (rf: RUN_FEATURE) is
      local
         root_object: RUNNER_OBJECT
      do
         root_object := memory.new_object(Current, rf.type_of_current)
         features.call(root_object, Void, rf)
      end

feature {}
   make (a_memory: like memory) is
      require
         a_memory /= Void
      do
         create features.make(Current)
         create instructions.make(Current)
         create expressions.make(Current)
         memory := a_memory
      ensure
         memory = a_memory
      end

invariant
   features /= Void
   instructions /= Void
   expressions /= Void
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
