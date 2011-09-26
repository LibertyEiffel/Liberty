-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_MEMORY

insert
   GLOBALS

create {RUNNER}
   make

feature {RUNNER_PROCESSOR}
   new_object (processor: RUNNER_PROCESSOR; type: TYPE): RUNNER_STRUCTURED_OBJECT is
      require
         alive: type.live_type /= Void
         processing: processor /= Void
      do
         create Result.make(processor, type)
      ensure
         exists: Result /= Void
         good_type: Result.type = type
         good_processor: Result.processor = processor
      end

   new_boolean (processor: RUNNER_PROCESSOR; boolean: BOOLEAN): RUNNER_NATIVE_EXPANDED[BOOLEAN] is
      do
         create Result.make(processor, smart_eiffel.type_boolean, boolean)
      end

   new_character (processor: RUNNER_PROCESSOR; character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER] is
      do
         create Result.make(processor, smart_eiffel.type_character, character)
      end

   new_native_array_character (processor: RUNNER_PROCESSOR; capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]] is
      do
         create Result.make(processor, smart_eiffel.type_native_array_character,
                            capacity, storage,
                            agent new_character, agent {RUNNER_NATIVE_EXPANDED[CHARACTER]}.item)
      end

   new_pointer (processor: RUNNER_PROCESSOR; pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER] is
      do
         create Result.make(processor, smart_eiffel.type_pointer, pointer)
      end

   new_integer_8 (processor: RUNNER_PROCESSOR; integer_8: INTEGER_8): RUNNER_NATIVE_EXPANDED[INTEGER_8] is
      do
         create Result.make(processor, smart_eiffel.type_integer_8, integer_8)
      end

   new_integer_16 (processor: RUNNER_PROCESSOR; integer_16: INTEGER_16): RUNNER_NATIVE_EXPANDED[INTEGER_16] is
      do
         create Result.make(processor, smart_eiffel.type_integer_16, integer_16)
      end

   new_integer_32 (processor: RUNNER_PROCESSOR; integer_32: INTEGER_32): RUNNER_NATIVE_EXPANDED[INTEGER_32] is
      do
         create Result.make(processor, smart_eiffel.type_integer_32, integer_32)
      end

   new_integer_64 (processor: RUNNER_PROCESSOR; integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64] is
      do
         create Result.make(processor, smart_eiffel.type_integer_64, integer_64)
      end

   new_natural_8 (processor: RUNNER_PROCESSOR; natural_8: NATURAL_8): RUNNER_NATIVE_EXPANDED[NATURAL_8] is
      do
         create Result.make(processor, smart_eiffel.type_natural_8, natural_8)
      end

   new_natural_16 (processor: RUNNER_PROCESSOR; natural_16: NATURAL_16): RUNNER_NATIVE_EXPANDED[NATURAL_16] is
      do
         create Result.make(processor, smart_eiffel.type_natural_16, natural_16)
      end

   new_natural_32 (processor: RUNNER_PROCESSOR; natural_32: NATURAL_32): RUNNER_NATIVE_EXPANDED[NATURAL_32] is
      do
         create Result.make(processor, smart_eiffel.type_natural_32, natural_32)
      end

   new_natural_64 (processor: RUNNER_PROCESSOR; natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64] is
      do
         create Result.make(processor, smart_eiffel.type_natural_64, natural_64)
      end

   new_internals_handler_if_exists (processor: RUNNER_PROCESSOR; internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT is
      do
         --| **** TODO
      end

   new_real_32 (processor: RUNNER_PROCESSOR; real_32: REAL_32): RUNNER_NATIVE_EXPANDED[REAL_32] is
      do
         create Result.make(processor, smart_eiffel.type_real_32, real_32)
      end

   new_real_64 (processor: RUNNER_PROCESSOR; real_64: REAL_64): RUNNER_NATIVE_EXPANDED[REAL_64] is
      do
         create Result.make(processor, smart_eiffel.type_real_64, real_64)
      end

   new_real_extended (processor: RUNNER_PROCESSOR; real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED] is
      do
         create Result.make(processor, smart_eiffel.type_real_extended, real_extended)
      end

feature {}
   make is
      do
      end

end -- class RUNNER_MEMORY
