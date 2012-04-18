-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ALIASED_STRING_LIST
   --
   -- The initial set of STRING in STRING_ALIASER.
   --

feature {} -- Hard-coded class names:
   as_any: STRING is "ANY"

   as_array: STRING is "ARRAY"

   as_boolean: STRING is "BOOLEAN"

   as_character: STRING is "CHARACTER"

   as_disposable: STRING is "DISPOSABLE"

   as_exceptions: STRING is "EXCEPTIONS"

   as_fixed_array: STRING is "FAST_ARRAY"

   as_function: STRING is "FUNCTION"

   as_integer_general: STRING is "INTEGER_GENERAL"

   as_integer_8: STRING is "INTEGER_8"

   as_integer_16: STRING is "INTEGER_16"

   as_integer_32: STRING is "INTEGER_32"

   as_integer: STRING is "INTEGER"

   as_integer_64: STRING is "INTEGER_64"

   as_internals: STRING is "INTERNALS"

   as_internals_handler: STRING is "INTERNALS_HANDLER"

   as_native_array: STRING is "NATIVE_ARRAY"

   as_native_array_collector: STRING is "NATIVE_ARRAY_COLLECTOR"

   as_native_array_internals: STRING is "NATIVE_ARRAY_INTERNALS"

   as_natural_8: STRING is "NATURAL_8"

   as_natural_16: STRING is "NATURAL_16"

   as_natural_32: STRING is "NATURAL_32"

   as_natural_64: STRING is "NATURAL_64"

   as_platform: STRING is "PLATFORM"

   as_pointer: STRING is "POINTER"

   as_predicate: STRING is "PREDICATE"

   as_procedure: STRING is "PROCEDURE"

   as_real_general: STRING is "REAL_GENERAL"

   as_real_32: STRING is "REAL_32"

   as_real: STRING is "REAL"

   as_real_64: STRING is "REAL_64"

   as_real_80: STRING is "REAL_80"

   as_real_128: STRING is "REAL_128"

   as_real_extended: STRING is "REAL_EXTENDED"

   as_routine: STRING is "ROUTINE"

   as_set: STRING is "SET"

   as_string: STRING is "STRING"

   as_text_file_read: STRING is "TEXT_FILE_READ"

   as_text_file_write: STRING is "TEXT_FILE_WRITE"

   as_tuple: STRING is "TUPLE"

   as_type: STRING is "TYPE"

   as_typed_internals: STRING is "TYPED_INTERNALS"

   as_unicode_string: STRING is "UNICODE_STRING"

   as_weak_reference: STRING is "WEAK_REFERENCE"

feature {} -- Hard coded feature names:
   as_a1: STRING is "a1"

   as_add_last: STRING is "add_last"

   as_agent: STRING is "agent"

   as_as_16_ne: STRING is "as_16_ne"

   as_as_32_ne: STRING is "as_32_ne"

   as_atan2: STRING is "atan2"

   as_blank: STRING is "blank"

   as_bit_clear: STRING is "bit_clear"

   as_bit_put: STRING is "bit_put"

   as_bit_rotate: STRING is "bit_rotate"

   as_bit_set: STRING is "bit_set"

   as_bit_xor: STRING is "bit_xor"

   as_boolean_bits: STRING is "Boolean_bits"

   as_call: STRING is "call"

   as_calloc: STRING is "calloc"

   as_capacity: STRING is "capacity"

   as_ceiling: STRING is "ceiling"

   as_character_bits: STRING is "Character_bits"

   as_clear_all: STRING is "clear_all"

   as_count: STRING is "count"

   as_code: STRING is "code"

   as_collecting: STRING is "collecting"

   as_collection_off: STRING is "collection_off"

   as_collection_on: STRING is "collection_on"

   as_collector_counter: STRING is "collector_counter"

   as_copy: STRING is "copy"

   as_c_inline_c: STRING is "c_inline_c"

   as_c_inline_h: STRING is "c_inline_h"

   as_default_create: STRING is "default_create"

   as_default_rescue: STRING is "default_rescue"

   as_deep_memcmp: STRING is "deep_memcmp"

   as_deep_twin: STRING is "deep_twin"

   as_deep_twin_from: STRING is "deep_twin_from"

   as_dispose: STRING is "dispose"

   as_die_with_code: STRING is "die_with_code"

   as_element_sizeof: STRING is "element_sizeof"

   as_exception: STRING is "exception"

   as_for_object: STRING is "for_object"

   as_type_can_be_assigned_to_attribute: STRING is "type_can_be_assigned_to_attribute"

   as_type_can_be_assigned_to_item: STRING is "type_can_be_assigned_to_item"

   as_type_attribute_count: STRING is "type_attribute_count"

   as_type_attribute_generator: STRING is "type_attribute_generator"

   as_type_attribute_generating_type: STRING is "type_attribute_generating_type"

   as_type_attribute_is_expanded: STRING is "type_attribute_is_expanded"

   as_type_attribute_name: STRING is "type_attribute_name"

   as_fifth: STRING is "fifth"

   as_first: STRING is "first"

   as_floor: STRING is "floor"

   as_flush: STRING is "flush"

   as_fourth: STRING is "fourth"

   as_force_to_integer_16: STRING is "force_to_integer_16"

   as_force_to_integer_32: STRING is "force_to_integer_32"

   as_force_to_integer_64: STRING is "force_to_integer_64"

   as_force_to_natural_16: STRING is "force_to_natural_16"

   as_force_to_natural_32: STRING is "force_to_natural_32"

   as_force_to_natural_64: STRING is "force_to_natural_64"

   as_force_to_real_32: STRING is "force_to_real_32"

   as_force_to_real_64: STRING is "force_to_real_64"

   as_from_pointer: STRING is "from_pointer"

   as_full_collect: STRING is "full_collect"

   as_generating_type: STRING is "generating_type"

   as_generator: STRING is "generator"

   as_io: STRING is "io"

   as_integer_bits: STRING is "Integer_bits"

   as_internals_from_generating_type: STRING is "internals_from_generating_type"

   as_is_basic_expanded_type: STRING is "is_basic_expanded_type"

   as_is_deep_equal: STRING is "is_deep_equal"

   as_is_equal: STRING is "is_equal"

   as_is_infinity: STRING is "is_infinity"

   as_is_normal: STRING is "is_normal"

   as_is_not_a_number: STRING is "is_not_a_number"

   as_is_not_null: STRING is "is_not_null"

   as_is_subnormal: STRING is "is_subnormal"

   as_item: STRING is "item"

   as_last: STRING is "last"

   as_lower: STRING is "lower"

   as_low_8: STRING is "low_8"

   as_low_16: STRING is "low_16"

   as_low_32: STRING is "low_32"

   as_native_array_internals_from_generating_type: STRING is "native_array_internals_from_generating_type"

   as_make: STRING is "make"

   as_make_blank: STRING is "make_blank"

   as_mark_item: STRING is "mark_item"

   as_mark_native_arrays: STRING is "mark_native_arrays"

   as_minimum_character_code: STRING is "Minimum_character_code"

   as_minimum_double: STRING is "Minimum_double"

   as_minimum_real: STRING is "Minimum_real"

   as_manifest_creation: STRING is "manifest_creation"

   as_manifest_initialize: STRING is "manifest_initialize"

   as_manifest_make: STRING is "manifest_make"

   as_manifest_put: STRING is "manifest_put"

   as_manifest_semicolon_check: STRING is "manifest_semicolon_check"

   as_maximum_character_code: STRING is "Maximum_character_code"

   as_maximum_double: STRING is "Maximum_double"

   as_maximum_real: STRING is "Maximum_real"

   as_object_as_pointer: STRING is "object_as_pointer"

   as_object_attribute: STRING is "object_attribute"

   as_object_invariant: STRING is "object_invariant"

   as_object_memory: STRING is "object_memory"

   as_object_size: STRING is "object_size"

   as_pointer_bits: STRING is "Pointer_bits"

   as_pow_postfix: STRING is "pow"

   as_print: STRING is "print"

   as_print_on: STRING is "print_on"

   as_print_run_time_stack: STRING is "print_run_time_stack"

   as_put: STRING is "put"

   as_put_0: STRING is "put_0"

   as_put_1: STRING is "put_1"

   as_put_16_be: STRING is "put_16_be"

   as_put_16_le: STRING is "put_16_le"

   as_put_16_ne: STRING is "put_16_ne"

   as_put_32_be: STRING is "put_32_be"

   as_put_32_le: STRING is "put_32_le"

   as_put_32_ne: STRING is "put_32_ne"

   as_raise_exception: STRING is "raise_exception"

   as_real_bits: STRING is "Real_bits"

   as_realloc: STRING is "realloc"

   as_rounded: STRING is "rounded"

   as_same_dynamic_type: STRING is "same_dynamic_type"

   as_second: STRING is "second"

   as_se_argc: STRING is "se_argc"

   as_se_argv: STRING is "se_argv"

   as_se_atexit: STRING is "se_atexit"

   as_sedb_breakpoint: STRING is "sedb_breakpoint"

   as_set_object_attribute: STRING is "set_object_attribute"

   as_signal_number: STRING is "signal_number"

   as_slice_copy: STRING is "slice_copy"

   as_standard_copy: STRING is "standard_copy"

   as_standard_is_equal: STRING is "standard_is_equal"

   as_standard_twin: STRING is "standard_twin"

   as_std_error: STRING is "std_error"

   as_std_input: STRING is "std_input"

   as_std_output: STRING is "std_output"

   as_stderr: STRING is "stderr"

   as_stdin: STRING is "stdin"

   as_stdout: STRING is "stdout"

   as_storage: STRING is "storage"

   as_storage_lower: STRING is "storage_lower"

   as_third: STRING is "third"

   as_to_character: STRING is "to_character"

   as_to_integer_8: STRING is "to_integer_8"

   as_to_integer_16: STRING is "to_integer_16"

   as_to_integer_32: STRING is "to_integer_32"

   as_to_integer_64: STRING is "to_integer_64"

   as_to_internals: STRING is "to_internals"

   as_to_natural_8: STRING is "to_natural_8"

   as_to_natural_16: STRING is "to_natural_16"

   as_to_natural_32: STRING is "to_natural_32"

   as_to_natural_64: STRING is "to_natural_64"

   as_to_pointer: STRING is "to_pointer"

   as_trace_switch: STRING is "trace_switch"

   as_twin: STRING is "twin"

   as_type_generating_type: STRING is "type_generating_type"

   as_type_generator: STRING is "type_generator"

   as_type_is_expanded: STRING is "type_is_expanded"

   as_type_item_generating_type: STRING is "type_item_generating_type"

   as_type_item_generator: STRING is "type_item_generator"

   as_type_item_is_expanded: STRING is "type_item_is_expanded"

   as_upper: STRING is "upper"

   as_valid_generating_type_for_internals: STRING is "valid_generating_type_for_internals"

   as_valid_generating_type_for_native_array_internals: STRING is "valid_generating_type_for_native_array_internals"
   as_with_capacity: STRING is "with_capacity"

feature {} -- Operator/Infix/Prefix list:
   as_and: STRING is "and"

   as_and_then: STRING is "and then"

   as_at: STRING is "@"

   as_backslash_backslash: STRING is "\\"

   as_bit_and: STRING is "&"

   as_bit_not: STRING is "~"

   as_bit_or: STRING is "|"

   as_bit_rotate_left: STRING is "#<<"

   as_bit_rotate_right: STRING is "#>>"

   as_bit_shift_right_unsigned: STRING is "|>>>"

   as_eq: STRING is "="

   as_ge: STRING is ">="

   as_gt: STRING is ">"

   as_implies: STRING is "implies"

   as_le: STRING is "<="

   as_lt: STRING is "<"

   as_minus: STRING is "-"

   as_muls: STRING is "*"

   as_neq: STRING is "/="

   as_not: STRING is "not"

   as_or: STRING is "or"

   as_or_else: STRING is "or else"

   as_plus: STRING is "+"

   as_pow: STRING is "^"

   as_sharp_backslash_backslash: STRING is "#\\"

   as_sharp_minus: STRING is "#-"

   as_sharp_muls: STRING is "#*"

   as_sharp_plus: STRING is "#+"

   as_sharp_slash_slash: STRING is "#//"

   as_bit_shift_left: STRING is "|<<"

   as_bit_shift_right: STRING is "|>>"

   as_slash: STRING is "/"

   as_slash_slash: STRING is "//"

   as_xor: STRING is "xor"

feature {} -- Other names:
   as_arguments: STRING is "arguments"

   as_current: STRING is "Current"

   as_native_array_character: STRING is "NATIVE_ARRAY[CHARACTER]"

   as_last_result: STRING is "last_result"

   as_like_current: STRING is "like Current"

   as_method: STRING is "method"

   as_open_arguments: STRING is "open_arguments"

   as_open_argument_indices: STRING is "open_argument_indices"

   as_open_argument_index: STRING is "open_argument_index"

   as_open_argument_count: STRING is "open_argument_count"

   as_precursor: STRING is "Precursor"

   as_result: STRING is "Result"

   as_target: STRING is "target"

   as_void: STRING is "Void"

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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
