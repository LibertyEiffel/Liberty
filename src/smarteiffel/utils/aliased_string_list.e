-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ALIASED_STRING_LIST
   --
   -- The initial set of STRING in STRING_ALIASER.
   --

feature {} -- Hard-coded class names:
   as_any: STRING "ANY"

   as_array: STRING "ARRAY"

   as_boolean: STRING "BOOLEAN"

   as_character: STRING "CHARACTER"

   as_disposable: STRING "DISPOSABLE"

   as_exceptions: STRING "EXCEPTIONS"

   as_fixed_array: STRING "FAST_ARRAY"

   as_function: STRING "FUNCTION"

   as_integer_general: STRING "INTEGER_GENERAL"

   as_integer_8: STRING "INTEGER_8"

   as_integer_16: STRING "INTEGER_16"

   as_integer_32: STRING "INTEGER_32"

   as_integer: STRING "INTEGER"

   as_integer_64: STRING "INTEGER_64"

   as_internals: STRING "INTERNALS"

   as_internals_handler: STRING "INTERNALS_HANDLER"

   as_native_array: STRING "NATIVE_ARRAY"

   as_native_array_collector: STRING "NATIVE_ARRAY_COLLECTOR"

   as_native_array_internals: STRING "NATIVE_ARRAY_INTERNALS"

   as_natural: STRING "NATURAL"

   as_natural_8: STRING "NATURAL_8"

   as_natural_16: STRING "NATURAL_16"

   as_natural_32: STRING "NATURAL_32"

   as_natural_64: STRING "NATURAL_64"

   as_natural_general: STRING "NATURAL_GENERAL"

   as_platform: STRING "PLATFORM"

   as_pointer: STRING "POINTER"

   as_predicate: STRING "PREDICATE"

   as_procedure: STRING "PROCEDURE"

   as_real_general: STRING "REAL_GENERAL"

   as_real_32: STRING "REAL_32"

   as_real: STRING "REAL"

   as_real_64: STRING "REAL_64"

   as_real_80: STRING "REAL_80"

   as_real_128: STRING "REAL_128"

   as_real_extended: STRING "REAL_EXTENDED"

   as_routine: STRING "ROUTINE"

   as_set: STRING "SET"

   as_string: STRING "STRING"

   as_text_file_read: STRING "TEXT_FILE_READ"

   as_text_file_write: STRING "TEXT_FILE_WRITE"

   as_thread_context: STRING "THREAD_CONTEXT"

   as_thread_lock: STRING "THREAD_LOCK"

   as_tuple: STRING "TUPLE"

   as_type: STRING "TYPE"

   as_typed_internals: STRING "TYPED_INTERNALS"

   as_unicode_string: STRING "UNICODE_STRING"

   as_weak_reference: STRING "WEAK_REFERENCE"

feature {} -- Hard coded feature names:
   as_a1: STRING "a1"

   as_add_last: STRING "add_last"

   as_agent: STRING "agent"

   as_allocated_bytes: STRING "allocated_bytes"

   as_alloc_native_data: STRING "alloc_native_data"

   as_as_16_ne: STRING "as_16_ne"

   as_as_32_ne: STRING "as_32_ne"

   as_atan2: STRING "atan2"

   as_blank: STRING "blank"

   as_bit_clear: STRING "bit_clear"

   as_bit_put: STRING "bit_put"

   as_bit_rotate: STRING "bit_rotate"

   as_bit_set: STRING "bit_set"

   as_bit_xor: STRING "bit_xor"

   as_boolean_bits: STRING "Boolean_bits"

   as_call: STRING "call"

   as_calloc: STRING "calloc"

   as_capacity: STRING "capacity"

   as_ceiling: STRING "ceiling"

   as_character_bits: STRING "Character_bits"

   as_clear_all: STRING "clear_all"

   as_count: STRING "count"

   as_code: STRING "code"

   as_collecting: STRING "collecting"

   as_collection_off: STRING "collection_off"

   as_collection_on: STRING "collection_on"

   as_collector_counter: STRING "collector_counter"

   as_copy: STRING "copy"

   as_c_inline_c: STRING "c_inline_c"

   as_c_inline_h: STRING "c_inline_h"

   as_default_create: STRING "default_create"

   as_default_rescue: STRING "default_rescue"

   as_deep_memcmp: STRING "deep_memcmp"

   as_deep_twin: STRING "deep_twin"

   as_deep_twin_from: STRING "deep_twin_from"

   as_dispose: STRING "dispose"

   as_die_with_code: STRING "die_with_code"

   as_element_sizeof: STRING "element_sizeof"

   as_exception: STRING "exception"

   as_for_object: STRING "for_object"

   as_type_can_be_assigned_to_attribute: STRING "type_can_be_assigned_to_attribute"

   as_type_can_be_assigned_to_item: STRING "type_can_be_assigned_to_item"

   as_type_attribute_count: STRING "type_attribute_count"

   as_type_attribute_generator: STRING "type_attribute_generator"

   as_type_attribute_generating_type: STRING "type_attribute_generating_type"

   as_type_attribute_is_expanded: STRING "type_attribute_is_expanded"

   as_type_attribute_name: STRING "type_attribute_name"

   as_fifth: STRING "fifth"

   as_first: STRING "first"

   as_floor: STRING "floor"

   as_flush: STRING "flush"

   as_fourth: STRING "fourth"

   as_force_to_integer_16: STRING "force_to_integer_16"

   as_force_to_integer_32: STRING "force_to_integer_32"

   as_force_to_integer_64: STRING "force_to_integer_64"

   as_force_to_natural_16: STRING "force_to_natural_16"

   as_force_to_natural_32: STRING "force_to_natural_32"

   as_force_to_natural_64: STRING "force_to_natural_64"

   as_force_to_real_32: STRING "force_to_real_32"

   as_force_to_real_64: STRING "force_to_real_64"

   as_free_native_data: STRING "free_native_data"

   as_from_external_sized_copy: STRING "from_external_sized_copy"

   as_from_pointer: STRING "from_pointer"

   as_full_collect: STRING "full_collect"

   as_generating_type: STRING "generating_type"

   as_generator: STRING "generator"

   as_io: STRING "io"

   as_integer_bits: STRING "Integer_bits"

   as_internals_from_generating_type: STRING "internals_from_generating_type"

   as_is_basic_expanded_type: STRING "is_basic_expanded_type"

   as_is_deep_equal: STRING "is_deep_equal"

   as_is_equal: STRING "is_equal"

   as_do_at_exit: STRING "do_at_exit"

   as_is_empty: STRING "is_empty"

   as_is_finished: STRING "is_finished"

   as_is_infinity: STRING "is_infinity"

   as_is_locked: STRING "is_locked"

   as_is_normal: STRING "is_normal"

   as_is_not_a_number: STRING "is_not_a_number"

   as_is_not_null: STRING "is_not_null"

   as_is_started: STRING "is_started"

   as_is_subnormal: STRING "is_subnormal"

   as_item: STRING "item"

   as_last: STRING "last"

   as_lock: STRING "lock"

   as_lower: STRING "lower"

   as_low_8: STRING "low_8"

   as_low_16: STRING "low_16"

   as_low_32: STRING "low_32"

   as_native_array_internals_from_generating_type: STRING "native_array_internals_from_generating_type"

   as_make: STRING "make"

   as_make_blank: STRING "make_blank"

   as_mark_item: STRING "mark_item"

   as_mark_native_arrays: STRING "mark_native_arrays"

   as_minimum_character_code: STRING "Minimum_character_code"

   as_minimum_double: STRING "Minimum_double"

   as_minimum_real: STRING "Minimum_real"

   as_manifest_creation: STRING "manifest_creation"

   as_manifest_initialize: STRING "manifest_initialize"

   as_manifest_make: STRING "manifest_make"

   as_manifest_put: STRING "manifest_put"

   as_manifest_semicolon_check: STRING "manifest_semicolon_check"

   as_maximum_character_code: STRING "Maximum_character_code"

   as_maximum_double: STRING "Maximum_double"

   as_maximum_real: STRING "Maximum_real"

   as_native_data: STRING "native_data"

   as_notify: STRING "notify"

   as_notify_all: STRING "notify_all"

   as_object_as_pointer: STRING "object_as_pointer"

   as_object_attribute: STRING "object_attribute"

   as_object_invariant: STRING "object_invariant"

   as_object_memory: STRING "object_memory"

   as_object_size: STRING "object_size"

   as_pointer_bits: STRING "Pointer_bits"

   as_pow_postfix: STRING "pow"

   as_print: STRING "print"

   as_print_on: STRING "print_on"

   as_print_run_time_stack: STRING "print_run_time_stack"

   as_put: STRING "put"

   as_put_0: STRING "put_0"

   as_put_1: STRING "put_1"

   as_put_16_be: STRING "put_16_be"

   as_put_16_le: STRING "put_16_le"

   as_put_16_ne: STRING "put_16_ne"

   as_put_32_be: STRING "put_32_be"

   as_put_32_le: STRING "put_32_le"

   as_put_32_ne: STRING "put_32_ne"

   as_raise_exception: STRING "raise_exception"

   as_real_bits: STRING "Real_bits"

   as_realloc: STRING "realloc"

   as_rounded: STRING "rounded"

   as_run: STRING "run"

   as_same_dynamic_type: STRING "same_dynamic_type"

   as_second: STRING "second"

   as_se_argc: STRING "se_argc"

   as_se_argv: STRING "se_argv"

   as_se_atexit: STRING "se_atexit"

   as_se_fault: STRING "se_fault"

   as_sedb_breakpoint: STRING "sedb_breakpoint"

   as_set_item: STRING "set_item"

   as_set_object_attribute: STRING "set_object_attribute"

   as_signal_number: STRING "signal_number"

   as_slice_copy: STRING "slice_copy"

   as_standard_copy: STRING "standard_copy"

   as_standard_is_equal: STRING "standard_is_equal"

   as_standard_twin: STRING "standard_twin"

   as_status: STRING "status"

   as_std_error: STRING "std_error"

   as_std_input: STRING "std_input"

   as_std_output: STRING "std_output"

   as_stderr: STRING "stderr"

   as_stdin: STRING "stdin"

   as_stdout: STRING "stdout"

   as_storage: STRING "storage"

   as_storage_lower: STRING "storage_lower"

   as_third: STRING "third"

   as_timed_wait: STRING "timed_wait"

   as_to_character: STRING "to_character"

   as_to_integer_8: STRING "to_integer_8"

   as_to_integer_16: STRING "to_integer_16"

   as_to_integer_32: STRING "to_integer_32"

   as_to_integer_64: STRING "to_integer_64"

   as_to_internals: STRING "to_internals"

   as_to_natural_8: STRING "to_natural_8"

   as_to_natural_16: STRING "to_natural_16"

   as_to_natural_32: STRING "to_natural_32"

   as_to_natural_64: STRING "to_natural_64"

   as_to_pointer: STRING "to_pointer"

   as_trace_switch: STRING "trace_switch"

   as_twin: STRING "twin"

   as_type_generating_type: STRING "type_generating_type"

   as_type_generator: STRING "type_generator"

   as_type_is_expanded: STRING "type_is_expanded"

   as_type_item_generating_type: STRING "type_item_generating_type"

   as_type_item_generator: STRING "type_item_generator"

   as_type_item_is_expanded: STRING "type_item_is_expanded"

   as_unlock: STRING "unlock"

   as_upper: STRING "upper"

   as_valid_generating_type_for_internals: STRING "valid_generating_type_for_internals"

   as_valid_generating_type_for_native_array_internals: STRING "valid_generating_type_for_native_array_internals"

   as_wait: STRING "wait"

   as_with_capacity: STRING "with_capacity"

feature {} -- Operator/Infix/Prefix/Alias list:
   as_and: STRING "and"

   as_and_then: STRING "and then"

   as_at: STRING "@"

   as_backslash_backslash: STRING "\\"

   as_bit_and: STRING "&"

   as_bit_not: STRING "~"

   as_bit_or: STRING "|"

   as_bit_rotate_left: STRING "#<<"

   as_bit_rotate_right: STRING "#>>"

   as_bit_shift_right_unsigned: STRING "|>>>"

   as_brackets: STRING "[]"

   as_eq: STRING "="

   as_ge: STRING ">="

   as_gt: STRING ">"

   as_implies: STRING "implies"

   as_le: STRING "<="

   as_lt: STRING "<"

   as_minus: STRING "-"

   as_muls: STRING "*"

   as_neq: STRING "/="

   as_not: STRING "not"

   as_or: STRING "or"

   as_or_else: STRING "or else"

   as_parentheses: STRING "()"

   as_plus: STRING "+"

   as_pow: STRING "^"

   as_sharp_backslash_backslash: STRING "#\\"

   as_sharp_minus: STRING "#-"

   as_sharp_muls: STRING "#*"

   as_sharp_plus: STRING "#+"

   as_sharp_slash_slash: STRING "#//"

   as_bit_shift_left: STRING "|<<"

   as_bit_shift_right: STRING "|>>"

   as_slash: STRING "/"

   as_slash_slash: STRING "//"

   as_xor: STRING "xor"

feature {} -- Other names:
   as_arguments: STRING "arguments"

   as_current: STRING "Current"

   as_native_array_character: STRING "NATIVE_ARRAY[CHARACTER]"

   as_last_result: STRING "last_result"

   as_like_current: STRING "like Current"

   as_method: STRING "method"

   as_open_arguments: STRING "open_arguments"

   as_open_argument_indices: STRING "open_argument_indices"

   as_open_argument_index: STRING "open_argument_index"

   as_open_argument_count: STRING "open_argument_count"

   as_precursor: STRING "Precursor"

   as_result: STRING "Result"

   as_target: STRING "target"

   as_void: STRING "Void"

end -- class ALIASED_STRING_LIST
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
