-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class STRING_ALIASER
   --
   -- Singleton object used to share constant immutable strings (simple STRING as well as
   -- HASHED_STRING). The goal is to optimize immutable strings comparisons as well as
   -- hashed dictionary access (see HASHED_STRING). Thus, any immutable name must be
   -- registered here to get the corresponding unique reference. This singleton is shared
   -- via the `string_aliaser' once function from GLOBALS.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {ANY}
   make

feature {ANY}
   registered_one (model: STRING): BOOLEAN
         -- Is the `model' _the_ already registered one? (i.e. True only if
         -- `model' has been returned by some previous `item' call).
      require
         model /= Void
      local
         hs, buffer: like hashed_string_buffer; hash_code: INTEGER
      do
         buffer := hashed_string_buffer
         buffer.set(model)
         hash_code := buffer.hash_code
         hs := memory.reference_at(buffer)
         if hs /= Void then
            check
               hs.to_string.is_equal(model)
            end
            Result := hs.to_string = model
         end
      end

   hashed_string (model: STRING): HASHED_STRING
      require
         model /= Void
      local
         buffer: like hashed_string_buffer; hash_code: INTEGER
      do
         buffer := hashed_string_buffer
         buffer.set(model)
         hash_code := buffer.hash_code
         Result := memory.reference_at(buffer)
         if Result = Void then
            create Result.make(model.twin, hash_code)
            check
               not memory.has(Result)
            end
            memory.add(Result)
         end
      ensure
         Result.to_string.is_equal(model)
      end

   string (model: STRING): STRING
         -- Assuming that `model' is not the registered string,
         -- retrieve or create the aliased string.
         -- Note: the constraining require assertion is here to try to avoid
         -- multiple aliasing of the very same STRING.
      require
         not registered_one(model)
      do
         Result := hashed_string(model).to_string
      ensure
         registered_one(Result)
         Result.is_equal(model)
         Result /= model
      end

feature {ANY} -- Some common HASHED_STRING to be shared:
   tuple_name: HASHED_STRING
      once
         Result := string_aliaser.hashed_string(as_tuple)
      end

feature {COMPILE_TO_C}
   echo_information
      do
         echo.put_string(once "Aliased STRINGs: ")
         echo.put_integer(memory.count)
         echo.put_string(once ".%N")
      end

feature {}
   make
      do
      end

   hashed_string_buffer: HASHED_STRING
      once
         create Result.make(as_any, as_any.hash_code)
      end

   create_hashed_string (aliased_string: STRING): HASHED_STRING
      do
         create Result.make(aliased_string, aliased_string.hash_code)
      end

   memory: HASHED_SET[HASHED_STRING]
      once
         Result := {HASHED_SET[HASHED_STRING]
                      <<
                        create_hashed_string(as_any),
                        create_hashed_string(as_allocated_bytes),
                        create_hashed_string(as_alloc_native_data),
                        create_hashed_string(as_array),
                        create_hashed_string(as_boolean),
                        create_hashed_string(as_character),
                        create_hashed_string(as_disposable),
                        create_hashed_string(as_exceptions),
                        create_hashed_string(as_fixed_array),
                        create_hashed_string(as_function),
                        create_hashed_string(as_integer_general),
                        create_hashed_string(as_integer_8),
                        create_hashed_string(as_integer_16),
                        create_hashed_string(as_integer_32),
                        create_hashed_string(as_integer),
                        create_hashed_string(as_integer_64),
                        create_hashed_string(as_internals),
                        create_hashed_string(as_internals_handler),
                        create_hashed_string(as_native_array),
                        create_hashed_string(as_native_array_collector),
                        create_hashed_string(as_native_array_internals),
                        create_hashed_string(as_natural),
                        create_hashed_string(as_natural_8),
                        create_hashed_string(as_natural_16),
                        create_hashed_string(as_natural_32),
                        create_hashed_string(as_natural_64),
                        create_hashed_string(as_natural_general),
                        create_hashed_string(as_platform),
                        create_hashed_string(as_pointer),
                        create_hashed_string(as_predicate),
                        create_hashed_string(as_procedure),
                        create_hashed_string(as_real_general),
                        create_hashed_string(as_real_32),
                        create_hashed_string(as_real),
                        create_hashed_string(as_real_64),
                        create_hashed_string(as_real_80),
                        create_hashed_string(as_real_128),
                        create_hashed_string(as_real_extended),
                        create_hashed_string(as_routine),
                        create_hashed_string(as_set),
                        create_hashed_string(as_string),
                        create_hashed_string(as_text_file_read),
                        create_hashed_string(as_text_file_write),
                        create_hashed_string(as_thread_context),
                        create_hashed_string(as_thread_lock),
                        create_hashed_string(as_tuple),
                        create_hashed_string(as_type),
                        create_hashed_string(as_typed_internals),
                        create_hashed_string(as_unicode_string),
                        create_hashed_string(as_weak_reference),
                        -- Operator/Infix/Prefix/Alias list:
                        create_hashed_string(as_and),
                        create_hashed_string(as_and_then),
                        create_hashed_string(as_at),
                        create_hashed_string(as_backslash_backslash),
                        create_hashed_string(as_brackets),
                        create_hashed_string(as_bit_and),
                        create_hashed_string(as_bit_clear),
                        create_hashed_string(as_bit_not),
                        create_hashed_string(as_bit_or),
                        create_hashed_string(as_bit_put),
                        create_hashed_string(as_bit_rotate),
                        create_hashed_string(as_bit_rotate_left),
                        create_hashed_string(as_bit_rotate_right),
                        create_hashed_string(as_bit_set),
                        create_hashed_string(as_bit_shift_right_unsigned),
                        create_hashed_string(as_bit_xor),
                        create_hashed_string(as_eq),
                        create_hashed_string(as_ge),
                        create_hashed_string(as_gt),
                        create_hashed_string(as_implies),
                        create_hashed_string(as_le),
                        create_hashed_string(as_lt),
                        create_hashed_string(as_minus),
                        create_hashed_string(as_muls),
                        create_hashed_string(as_neq),
                        create_hashed_string(as_not),
                        create_hashed_string(as_or),
                        create_hashed_string(as_or_else),
                        create_hashed_string(as_parentheses),
                        create_hashed_string(as_plus),
                        create_hashed_string(as_pow),
                        create_hashed_string(as_sharp_backslash_backslash),
                        create_hashed_string(as_sharp_minus),
                        create_hashed_string(as_sharp_muls),
                        create_hashed_string(as_sharp_plus),
                        create_hashed_string(as_sharp_slash_slash),
                        create_hashed_string(as_bit_shift_left),
                        create_hashed_string(as_bit_shift_right),
                        create_hashed_string(as_slash),
                        create_hashed_string(as_slash_slash),
                        create_hashed_string(as_xor),
                        -- Hard coded feature names:
                        create_hashed_string(as_a1),
                        create_hashed_string(as_add_last),
                        create_hashed_string(as_agent),
                        create_hashed_string(as_as_16_ne),
                        create_hashed_string(as_as_32_ne),
                        create_hashed_string(as_atan2),
                        create_hashed_string(as_blank),
                        create_hashed_string(as_boolean_bits),
                        create_hashed_string(as_call),
                        create_hashed_string(as_calloc),
                        create_hashed_string(as_capacity),
                        create_hashed_string(as_ceiling),
                        create_hashed_string(as_character_bits),
                        create_hashed_string(as_clear_all),
                        create_hashed_string(as_count),
                        create_hashed_string(as_code),
                        create_hashed_string(as_collecting),
                        create_hashed_string(as_collection_off),
                        create_hashed_string(as_collection_on),
                        create_hashed_string(as_collector_counter),
                        create_hashed_string(as_copy),
                        create_hashed_string(as_c_inline_c),
                        create_hashed_string(as_c_inline_h),
                        create_hashed_string(as_default_create),
                        create_hashed_string(as_default_rescue),
                        create_hashed_string(as_deep_memcmp),
                        create_hashed_string(as_deep_twin),
                        create_hashed_string(as_deep_twin_from),
                        create_hashed_string(as_dispose),
                        create_hashed_string(as_die_with_code),
                        create_hashed_string(as_element_sizeof),
                        create_hashed_string(as_exception),
                        create_hashed_string(as_for_object),
                        create_hashed_string(as_force_to_integer_16),
                        create_hashed_string(as_force_to_integer_32),
                        create_hashed_string(as_force_to_integer_64),
                        create_hashed_string(as_force_to_natural_16),
                        create_hashed_string(as_force_to_natural_32),
                        create_hashed_string(as_force_to_natural_64),
                        create_hashed_string(as_force_to_real_32),
                        create_hashed_string(as_force_to_real_64),
                        create_hashed_string(as_fifth),
                        create_hashed_string(as_first),
                        create_hashed_string(as_floor),
                        create_hashed_string(as_flush),
                        create_hashed_string(as_fourth),
                        create_hashed_string(as_free_native_data),
                        create_hashed_string(as_from_external_sized_copy),
                        create_hashed_string(as_from_pointer),
                        create_hashed_string(as_full_collect),
                        create_hashed_string(as_generating_type),
                        create_hashed_string(as_generator),
                        create_hashed_string(as_io),
                        create_hashed_string(as_integer_bits),
                        create_hashed_string(as_internals_from_generating_type),
                        create_hashed_string(as_is_basic_expanded_type),
                        create_hashed_string(as_is_deep_equal),
                        create_hashed_string(as_is_empty),
                        create_hashed_string(as_is_equal),
                        create_hashed_string(as_is_finished),
                        create_hashed_string(as_is_infinity),
                        create_hashed_string(as_is_locked),
                        create_hashed_string(as_is_normal),
                        create_hashed_string(as_is_not_a_number),
                        create_hashed_string(as_is_not_null),
                        create_hashed_string(as_is_started),
                        create_hashed_string(as_is_subnormal),
                        create_hashed_string(as_item),
                        create_hashed_string(as_last),
                        create_hashed_string(as_lock),
                        create_hashed_string(as_lower),
                        create_hashed_string(as_low_8),
                        create_hashed_string(as_low_16),
                        create_hashed_string(as_low_32),
                        create_hashed_string(as_native_array_internals_from_generating_type),
                        create_hashed_string(as_native_data),
                        create_hashed_string(as_notify),
                        create_hashed_string(as_notify_all),
                        create_hashed_string(as_make),
                        create_hashed_string(as_make_blank),
                        create_hashed_string(as_mark_item),
                        create_hashed_string(as_mark_native_arrays),
                        create_hashed_string(as_minimum_character_code),
                        create_hashed_string(as_minimum_double),
                        create_hashed_string(as_minimum_real),
                        create_hashed_string(as_manifest_creation),
                        create_hashed_string(as_manifest_initialize),
                        create_hashed_string(as_manifest_make),
                        create_hashed_string(as_manifest_put),
                        create_hashed_string(as_manifest_semicolon_check),
                        create_hashed_string(as_maximum_character_code),
                        create_hashed_string(as_maximum_double),
                        create_hashed_string(as_maximum_real),
                        create_hashed_string(as_object_as_pointer),
                        create_hashed_string(as_object_attribute),
                        create_hashed_string(as_object_invariant),
                        create_hashed_string(as_object_memory),
                        create_hashed_string(as_object_size),
                        create_hashed_string(as_pointer_bits),
                        create_hashed_string(as_pow_postfix),
                        create_hashed_string(as_print),
                        create_hashed_string(as_print_on),
                        create_hashed_string(as_print_run_time_stack),
                        create_hashed_string(as_put),
                        create_hashed_string(as_put_0),
                        create_hashed_string(as_put_1),
                        create_hashed_string(as_put_16_be),
                        create_hashed_string(as_put_16_le),
                        create_hashed_string(as_put_16_ne),
                        create_hashed_string(as_put_32_be),
                        create_hashed_string(as_put_32_le),
                        create_hashed_string(as_put_32_ne),
                        create_hashed_string(as_raise_exception),
                        create_hashed_string(as_real_bits),
                        create_hashed_string(as_realloc),
                        create_hashed_string(as_rounded),
                        create_hashed_string(as_run),
                        create_hashed_string(as_second),
                        create_hashed_string(as_same_dynamic_type),
                        create_hashed_string(as_se_argc),
                        create_hashed_string(as_se_argv),
                        create_hashed_string(as_se_atexit),
                        create_hashed_string(as_se_fault),
                        create_hashed_string(as_sedb_breakpoint),
                        create_hashed_string(as_set_item),
                        create_hashed_string(as_set_object_attribute),
                        create_hashed_string(as_signal_number),
                        create_hashed_string(as_slice_copy),
                        create_hashed_string(as_standard_copy),
                        create_hashed_string(as_standard_is_equal),
                        create_hashed_string(as_standard_twin),
                        create_hashed_string(as_status),
                        create_hashed_string(as_std_error),
                        create_hashed_string(as_std_input),
                        create_hashed_string(as_std_output),
                        create_hashed_string(as_stderr),
                        create_hashed_string(as_stdin),
                        create_hashed_string(as_stdout),
                        create_hashed_string(as_storage),
                        create_hashed_string(as_timed_wait),
                        create_hashed_string(as_third),
                        create_hashed_string(as_to_character),
                        create_hashed_string(as_to_integer_8),
                        create_hashed_string(as_to_integer_16),
                        create_hashed_string(as_to_integer_32),
                        create_hashed_string(as_to_integer_64),
                        create_hashed_string(as_to_internals),
                        create_hashed_string(as_to_natural_8),
                        create_hashed_string(as_to_natural_16),
                        create_hashed_string(as_to_natural_32),
                        create_hashed_string(as_to_natural_64),
                        create_hashed_string(as_to_pointer),
                        create_hashed_string(as_trace_switch),
                        create_hashed_string(as_twin),
                        create_hashed_string(as_type_can_be_assigned_to_attribute),
                        create_hashed_string(as_type_can_be_assigned_to_item),
                        create_hashed_string(as_type_attribute_count),
                        create_hashed_string(as_type_attribute_generator),
                        create_hashed_string(as_type_attribute_generating_type),
                        create_hashed_string(as_type_attribute_is_expanded),
                        create_hashed_string(as_type_attribute_name),
                        create_hashed_string(as_type_generating_type),
                        create_hashed_string(as_type_generator),
                        create_hashed_string(as_type_is_expanded),
                        create_hashed_string(as_type_item_generating_type),
                        create_hashed_string(as_type_item_generator),
                        create_hashed_string(as_type_item_is_expanded),
                        create_hashed_string(as_unlock),
                        create_hashed_string(as_upper),
                        create_hashed_string(as_valid_generating_type_for_internals),
                        create_hashed_string(as_valid_generating_type_for_native_array_internals),
                        create_hashed_string(as_wait),
                        create_hashed_string(as_with_capacity),
                        -- Other names:
                        create_hashed_string(as_arguments),
                        create_hashed_string(as_current),
                        create_hashed_string(as_native_array_character),
                        create_hashed_string(as_last_result),
                        create_hashed_string(as_like_current),
                        create_hashed_string(as_method),
                        create_hashed_string(as_open_arguments),
                        create_hashed_string(as_open_argument_indices),
                        create_hashed_string(as_open_argument_index),
                        create_hashed_string(as_open_argument_count),
                        create_hashed_string(as_precursor),
                        create_hashed_string(as_result),
                        create_hashed_string(as_target),
                        create_hashed_string(as_void)
                        >> }
      end

end -- class STRING_ALIASER
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
