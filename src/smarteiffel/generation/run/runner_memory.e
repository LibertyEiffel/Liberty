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
         create Result.make(processor, smart_eiffel.type_boolean, boolean, boolean_builtins)
      end

   new_character (processor: RUNNER_PROCESSOR; character: CHARACTER): RUNNER_NATIVE_EXPANDED[CHARACTER] is
      do
         create Result.make(processor, smart_eiffel.type_character, character, Void) --| **** TODO
      end

   new_native_array_character (processor: RUNNER_PROCESSOR; capacity: INTEGER; storage: NATIVE_ARRAY[CHARACTER]): RUNNER_NATIVE_ARRAY[CHARACTER, RUNNER_NATIVE_EXPANDED[CHARACTER]] is
      do
         create Result.make(processor, smart_eiffel.type_native_array_character,
                            capacity, storage,
                            agent new_character, agent {RUNNER_NATIVE_EXPANDED[CHARACTER]}.item,
                            native_array_character_builtins)
      end

   new_pointer (processor: RUNNER_PROCESSOR; pointer: POINTER): RUNNER_NATIVE_EXPANDED[POINTER] is
      do
         create Result.make(processor, smart_eiffel.type_pointer, pointer, Void) --| **** TODO
      end

   new_integer_8 (processor: RUNNER_PROCESSOR; integer_8: INTEGER_8): RUNNER_NATIVE_EXPANDED[INTEGER_8] is
      do
         create Result.make(processor, smart_eiffel.type_integer_8, integer_8, integer_8_builtins)
      end

   new_integer_16 (processor: RUNNER_PROCESSOR; integer_16: INTEGER_16): RUNNER_NATIVE_EXPANDED[INTEGER_16] is
      do
         create Result.make(processor, smart_eiffel.type_integer_16, integer_16, integer_16_builtins)
      end

   new_integer_32 (processor: RUNNER_PROCESSOR; integer_32: INTEGER_32): RUNNER_NATIVE_EXPANDED[INTEGER_32] is
      do
         create Result.make(processor, smart_eiffel.type_integer_32, integer_32, integer_32_builtins)
      end

   new_integer_64 (processor: RUNNER_PROCESSOR; integer_64: INTEGER_64): RUNNER_NATIVE_EXPANDED[INTEGER_64] is
      do
         create Result.make(processor, smart_eiffel.type_integer_64, integer_64, integer_64_builtins)
      end

   new_natural_8 (processor: RUNNER_PROCESSOR; natural_8: NATURAL_8): RUNNER_NATIVE_EXPANDED[NATURAL_8] is
      do
         create Result.make(processor, smart_eiffel.type_natural_8, natural_8, Void) --| **** TODO
      end

   new_natural_16 (processor: RUNNER_PROCESSOR; natural_16: NATURAL_16): RUNNER_NATIVE_EXPANDED[NATURAL_16] is
      do
         create Result.make(processor, smart_eiffel.type_natural_16, natural_16, Void) --| **** TODO
      end

   new_natural_32 (processor: RUNNER_PROCESSOR; natural_32: NATURAL_32): RUNNER_NATIVE_EXPANDED[NATURAL_32] is
      do
         create Result.make(processor, smart_eiffel.type_natural_32, natural_32, Void) --| **** TODO
      end

   new_natural_64 (processor: RUNNER_PROCESSOR; natural_64: NATURAL_64): RUNNER_NATIVE_EXPANDED[NATURAL_64] is
      do
         create Result.make(processor, smart_eiffel.type_natural_64, natural_64, Void) --| **** TODO
      end

   new_internals_handler_if_exists (processor: RUNNER_PROCESSOR; internals_handler: INTERNALS_HANDLER): RUNNER_OBJECT is
      do
         --| **** TODO
      end

   new_real_32 (processor: RUNNER_PROCESSOR; real_32: REAL_32): RUNNER_NATIVE_EXPANDED[REAL_32] is
      do
         create Result.make(processor, smart_eiffel.type_real_32, real_32, real_32_builtins)
      end

   new_real_64 (processor: RUNNER_PROCESSOR; real_64: REAL_64): RUNNER_NATIVE_EXPANDED[REAL_64] is
      do
         create Result.make(processor, smart_eiffel.type_real_64, real_64, real_64_builtins)
      end

   new_real_extended (processor: RUNNER_PROCESSOR; real_extended: REAL_EXTENDED): RUNNER_NATIVE_EXPANDED[REAL_EXTENDED] is
      do
         create Result.make(processor, smart_eiffel.type_real_extended, real_extended, real_extended_builtins)
      end

feature {}
   make is
      do
      end

   boolean_builtins: RUNNER_BOOLEAN_BUILTINS is
      once
         create Result.make
      end

   integer_8_builtins: RUNNER_INTEGRAL_BUILTINS[INTEGER_8] is
      once
         create Result.make
      end

   integer_16_builtins: RUNNER_INTEGRAL_BUILTINS[INTEGER_16] is
      once
         create Result.make
      end

   integer_32_builtins: RUNNER_INTEGRAL_BUILTINS[INTEGER_32] is
      once
         create Result.make
      end

   integer_64_builtins: RUNNER_INTEGRAL_BUILTINS[INTEGER_64] is
      once
         create Result.make
      end

   real_32_builtins: RUNNER_FLOAT_BUILTINS[REAL_32] is
      once
         create Result.make
      end

   real_64_builtins: RUNNER_FLOAT_BUILTINS[REAL_64] is
      once
         create Result.make
      end

   real_extended_builtins: RUNNER_FLOAT_BUILTINS[REAL_EXTENDED] is
      once
         create Result.make
      end

   native_array_character_builtins: RUNNER_TYPED_NATIVE_ARRAY_BUILTINS[CHARACTER] is
      once
         create Result.make
      end

end -- class RUNNER_MEMORY
