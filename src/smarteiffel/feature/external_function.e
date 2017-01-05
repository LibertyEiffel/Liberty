-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXTERNAL_FUNCTION
   --
   -- Call to a function of a foreign language.
   --

inherit
   EXTERNAL_ROUTINE
      redefine specialize_signature_in, specialize_signature_thru, hook_collect,
         inline_expression_0, inline_expression_1
      end

insert
   PLATFORM

create {FEATURE_TEXT}
   make

create {CLASS_TEXT}
   non_written

feature {ANY}
   result_type: TYPE_MARK

   side_effect_free (target_type: TYPE): BOOLEAN
      do
         Result := native.side_effect_free(target_type, feature_text)
      end

feature {CALL_0}
   inline_expression_0 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
                        target_type: TYPE; target: EXPRESSION; return_type: TYPE): INLINE_MEMO
      local
         name: STRING; ic1: INTEGER_CONSTANT; cc: CHARACTER_CONSTANT; sp: POSITION
         integer_tm: INTEGER_TYPE_MARK; v: INTEGER_64
      do
         name := first_name.to_string
         sp := start_position
         if name = as_stderr or else name = as_stdin or else name = as_stdout then
            Result := smart_eiffel.get_inline_memo
            Result.set_expression(create {NON_VOID_NO_DISPATCH}.make(return_type, feature_stamp, type))
         elseif name = as_is_basic_expanded_type then
            if target.side_effect_free(type) then
               Result := smart_eiffel.get_inline_memo
               Result.set_expression(true_or_false(target_type.is_kernel_expanded, sp))
            end
         end
         if Result = Void then
            ic1 := integer_constant(target)
            if ic1 /= Void then
               integer_tm ::= target_type.canonical_type_mark
               if name = as_sharp_minus then
                  v := ic1.value_memory
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(#-v, call_site, integer_tm))
               elseif name = as_minus then
                  v := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if v = Minimum_integer_8 then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow for opposite of Minimum_integer_8.")
                     else
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(-v, call_site, integer_tm))
                     end
                  when 16 then
                     if v = Minimum_integer_16 then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow for opposite of Minimum_integer_16.")
                     else
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(-v, call_site, integer_tm))
                     end
                  when 32 then
                     if v = Minimum_integer_32 then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow for opposite of Minimum_integer_32.")
                     else
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(-v, call_site, integer_tm))
                     end
                  when 64 then
                     if v = Minimum_integer_64 then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow for opposite of Minimum_integer_64.")
                     else
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(-v, call_site, integer_tm))
                     end
                  end
               elseif name = as_to_character then
                  v := ic1.value_memory
                  if not v.in_range(0, Maximum_character_code) then
                     error_handler.add_position(call_site)
                     error_handler.append(once "Violated assertion (target value is ")
                     error_handler.append_integer_64(v)
                     error_handler.append(once ").")
                     error_handler.print_as_error
                  else
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {CHARACTER_CONSTANT}.with(call_site, v.to_character))
                  end
               elseif name = as_bit_not then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     v := ic1.value_memory.to_integer_8.bit_not
                  when 16 then
                     v := ic1.value_memory.to_integer_16.bit_not
                  when 32 then
                     v := ic1.value_memory.to_integer_32.bit_not
                  when 64 then
                     v := ic1.value_memory.bit_not
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(v, call_site, integer_tm))
               else
                  --| **** error_handler.append(once "New code for inline in EXTERNAL_FUNCTION ??")
                  --| **** error_handler.add_position(sp)
                  --| **** error_handler.add_position(target.start_position)
                  --| **** error_handler.print_as_warning
               end
            end
         end
         -- For the CHARACTER class:
         if Result = Void and then target_type.is_character then
            if name = as_code then
               cc ?= target
               if cc /= Void then
                  Result := smart_eiffel.get_inline_memo
                  integer_tm ::= return_type.canonical_type_mark
                  create ic1.with(cc.value.code, start_position, integer_tm)
                  Result.set_expression(ic1)
               end
            elseif name = as_to_integer_8 then
               cc ?= target
               if cc /= Void then
                  Result := smart_eiffel.get_inline_memo
                  integer_tm ::= return_type.canonical_type_mark
                  create ic1.with(cc.value.to_integer_8, start_position, integer_tm)
                  Result.set_expression(ic1)
               end
            else
               --| **** error_handler.append(once "New code for inline in EXTERNAL_FUNCTION ??")
               --| **** error_handler.add_position(sp)
               --| **** error_handler.add_position(target.start_position)
               --| **** error_handler.print_as_warning
            end
         end
         if Result /= Void then
            smart_eiffel.magic_count_increment
         end
      end

feature {CALL_1}
   inline_expression_1 (type: TYPE; feature_stamp: FEATURE_STAMP; call_site: POSITION
      target_type: TYPE; target, arg: EXPRESSION; return_type: TYPE): INLINE_MEMO
      local
         name: STRING; ic1, ic2: INTEGER_CONSTANT; bc1, bc2: BOOLEAN_CONSTANT
         integer_8: INTEGER_8; integer_16: INTEGER_16; integer_32: INTEGER_32
         integer_64, v1, v2: INTEGER_64; integer_tm: INTEGER_TYPE_MARK; number: NUMBER
      do
         name := first_name.to_string
         if name = as_is_equal and then target_type.is_kernel_expanded then
            Result := smart_eiffel.get_inline_memo
            Result.set_expression(create {BUILT_IN_EQ_NEQ}.make_eq(target, call_site, arg))
         end
         if Result = Void and then name = as_same_dynamic_type then
            if target_type = arg.resolve_in(type) and then
               target.side_effect_free(type) and then
               arg.side_effect_free(type)
             then
               if target_type.is_expanded then
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {E_TRUE}.make(call_site))
               elseif target_type.live_type /= Void then
                  if target_type.live_type.run_time_set.count = 1 then
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {E_TRUE}.make(call_site))
                  end
               end
            end
         end
         if Result = Void then
            ic1 := integer_constant(target)
            ic2 := integer_constant(arg)
            if ic1 /= Void and then ic2 /= Void then
               integer_tm := ic1.result_type
               if integer_tm.bit_count < ic2.result_type.bit_count then
                  integer_tm := ic2.result_type
               end
               if name = as_lt then
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(true_or_false(ic1.value_memory < ic2.value_memory, call_site))
               elseif name = as_le then
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(true_or_false(ic1.value_memory <= ic2.value_memory, call_site))
               elseif name = as_gt then
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(true_or_false(ic1.value_memory > ic2.value_memory, call_site))
               elseif name = as_ge then
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(true_or_false(ic1.value_memory >= ic2.value_memory, call_site))
               elseif name = as_sharp_plus then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8 #+ ic2.value_memory.to_integer_8
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16 #+ ic2.value_memory.to_integer_16
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32 #+ ic2.value_memory.to_integer_32
                  when 64 then
                     integer_64 := ic1.value_memory #+ ic2.value_memory
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               elseif name = as_plus then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory + ic2.value_memory
                     if integer_64.fit_integer_8 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"+%" with INTEGER_8 operands. (Adding ")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " with ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " would give ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_8 range.)")
                        error_handler.print_as_error
                     end
                  when 16 then
                     integer_64 := ic1.value_memory + ic2.value_memory
                     if integer_64.fit_integer_16 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"+%" with INTEGER_16 operands. (Adding ")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " with ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " would give ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_16 range.)")
                        error_handler.print_as_error
                     end
                  when 32 then
                     integer_64 := ic1.value_memory + ic2.value_memory
                     if integer_64.fit_integer_32 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"+%" with INTEGER_32 operands. (Adding ")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " with ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " would give ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_32 range.)")
                        error_handler.print_as_error
                     end
                  when 64 then
                     number := ic1.value_memory.to_number + ic2.value_memory.to_number
                     if number.is_integer_64 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"+%" with INTEGER_64 operands. (Adding ")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " with ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " would give ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_64 range.)")
                        error_handler.print_as_error
                     end
                  end
               elseif name = as_sharp_minus then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8 #- ic2.value_memory.to_integer_8
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16 #- ic2.value_memory.to_integer_16
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32 #- ic2.value_memory.to_integer_32
                  when 64 then
                     integer_64 := ic1.value_memory #- ic2.value_memory
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               elseif name = as_minus then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory - ic2.value_memory
                     if integer_64.fit_integer_8 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"-%" with INTEGER_8 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " minus ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_8 range.)")
                        error_handler.print_as_error
                     end
                  when 16 then
                     integer_64 := ic1.value_memory - ic2.value_memory
                     if integer_64.fit_integer_16 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"-%" with INTEGER_16 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " minus ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_16 range.)")
                        error_handler.print_as_error
                     end
                  when 32 then
                     integer_64 := ic1.value_memory - ic2.value_memory
                     if integer_64.fit_integer_32 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"-%" with INTEGER_32 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " minus ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append_integer_64(integer_64)
                        error_handler.append(once " which is out of INTEGER_32 range.)")
                        error_handler.print_as_error
                     end
                  when 64 then
                     number := ic1.value_memory.to_number - ic2.value_memory.to_number
                     if number.is_integer_64 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"-%" with INTEGER_64 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " minus ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_64 range.)")
                        error_handler.print_as_error
                     end
                  end
               elseif name = as_sharp_muls then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8 #* ic2.value_memory.to_integer_8
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16 #* ic2.value_memory.to_integer_16
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32 #* ic2.value_memory.to_integer_32
                  when 64 then
                     integer_64 := ic1.value_memory #* ic2.value_memory
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               elseif name = as_muls then
                  number := ic1.value_memory.to_number * ic2.value_memory.to_number
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if number.is_integer_8 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_8, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"*%" with INTEGER_8 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " times ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_8 range.)")
                        error_handler.print_as_error
                     end
                  when 16 then
                     if number.is_integer_16 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_16, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"*%" with INTEGER_16 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " times ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_16 range.)")
                        error_handler.print_as_error
                     end
                  when 32 then
                     if number.is_integer_32 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_32, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"*%" with INTEGER_32 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " times ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_32 range.)")
                        error_handler.print_as_error
                     end
                  when 64 then
                     if number.is_integer_64 then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {INTEGER_CONSTANT}.with(number.to_integer_64, call_site, integer_tm))
                     else
                        error_handler.add_position(call_site)
                        error_handler.append(once "Overflow of infix %"*%" with INTEGER_64 operands. (")
                        error_handler.append_integer_64(ic1.value_memory)
                        error_handler.append(once " times ")
                        error_handler.append_integer_64(ic2.value_memory)
                        error_handler.append(once " gives ")
                        error_handler.append(number.to_string)
                        error_handler.append(once " which is out of INTEGER_64 range.)")
                        error_handler.print_as_error
                     end
                  end
               elseif name = as_sharp_slash_slash then
                  if ic2.value_memory = 0 then
                     error_handler.add_position(call_site)
                     error_handler.append(once "Cannot divide ")
                     error_handler.append_integer_64(ic1.value_memory)
                     error_handler.append(once " by 0.")
                     error_handler.print_as_error
                  else
                     integer_64 := ic1.value_memory #// ic2.value_memory
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, ic1.result_type))
                  end
               elseif name = as_bit_shift_right then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(0, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_shift_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(0, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_shift_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(0, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_shift_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(0, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_shift_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_bit_shift_right_unsigned then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(0, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_shift_right_unsigned(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(0, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_shift_right_unsigned(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(0, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_shift_right_unsigned(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(0, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_shift_right_unsigned(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_bit_shift_left then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(0, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_shift_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(0, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_shift_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(0, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_shift_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(0, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_shift_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_bit_rotate_right then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(0, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_rotate_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(0, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_rotate_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(0, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_rotate_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(0, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_rotate_right(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_bit_rotate_left then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(0, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_rotate_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(0, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_rotate_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(0, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_rotate_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(0, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range 0 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_rotate_left(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_bit_rotate then
                  v1 := ic1.value_memory
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     if not v2.in_range(-7, 7) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range -7..7 because target type is INTEGER_8.")
                        error_handler.print_as_error
                     end
                     integer_8 := v1.to_integer_8.bit_rotate(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_8, call_site, integer_tm))
                  when 16 then
                     if not v2.in_range(-15, 15) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range -15..15 because target type is INTEGER_16.")
                        error_handler.print_as_error
                     end
                     integer_16 := v1.to_integer_16.bit_rotate(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_16, call_site, integer_tm))
                  when 32 then
                     if not v2.in_range(-31, 31) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range -31..31 because target type is INTEGER_31.")
                        error_handler.print_as_error
                     end
                     integer_32 := v1.to_integer_32.bit_rotate(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_32, call_site, integer_tm))
                  when 64 then
                     if not v2.in_range(-63, 63) then
                        error_handler.add_position(call_site)
                        error_handler.append(once "Violated require assertion. Argument value is ")
                        error_handler.append_integer_64(v2)
                        error_handler.append(once " which is out of range -63 ..63 because target type is INTEGER_64.")
                        error_handler.print_as_error
                     end
                     integer_64 := v1.bit_rotate(ic2.value_memory.to_integer_8)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
                  end
               elseif name = as_sharp_backslash_backslash then
                  if ic2.value_memory = 0 then
                     error_handler.add_position(call_site)
                     error_handler.append(once "Cannot divide ")
                     error_handler.append_integer_64(ic1.value_memory)
                     error_handler.append(once " by 0.")
                     error_handler.print_as_error
                  else
                     integer_64 := ic1.value_memory #\\ ic2.value_memory
                     Result := smart_eiffel.get_inline_memo
                     Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, ic1.result_type))
                  end
               elseif name = as_bit_and then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8.bit_and(ic2.value_memory.to_integer_8)
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16.bit_and(ic2.value_memory.to_integer_16)
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32.bit_and(ic2.value_memory.to_integer_32)
                  when 64 then
                     integer_64 := ic1.value_memory.bit_and(ic2.value_memory)
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               elseif name = as_bit_or then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8.bit_or(ic2.value_memory.to_integer_8)
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16.bit_or(ic2.value_memory.to_integer_16)
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32.bit_or(ic2.value_memory.to_integer_32)
                  when 64 then
                     integer_64 := ic1.value_memory.bit_or(ic2.value_memory)
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               elseif name = as_bit_xor then
                  inspect
                     integer_tm.bit_count
                  when 8 then
                     integer_64 := ic1.value_memory.to_integer_8.bit_xor(ic2.value_memory.to_integer_8)
                  when 16 then
                     integer_64 := ic1.value_memory.to_integer_16.bit_xor(ic2.value_memory.to_integer_16)
                  when 32 then
                     integer_64 := ic1.value_memory.to_integer_32.bit_xor(ic2.value_memory.to_integer_32)
                  when 64 then
                     integer_64 := ic1.value_memory.bit_xor(ic2.value_memory)
                  end
                  Result := smart_eiffel.get_inline_memo
                  Result.set_expression(create {INTEGER_CONSTANT}.with(integer_64, call_site, integer_tm))
               else
                  --| **** error_handler.append(once "New code for inline in EXTERNAL_FUNCTION ??")
                  --| **** error_handler.add_position(call_site)
                  --| **** error_handler.print_as_warning
               end
            end
         end
         -- For the BOOLEAN class:
         if Result = Void and then target_type.is_boolean then
            if name = as_and_then then
               bc1 ?= target
               if bc1 /= Void then
                  Result := smart_eiffel.get_inline_memo
                  if bc1.value then
                     Result.set_expression(arg)
                  else
                     Result.set_expression(create {E_FALSE}.make(call_site))
                  end
               else
                  bc2 ?= arg
                  if bc2 /= Void then
                     if bc2.value then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(target)
                     elseif target.side_effect_free(type) then
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(create {E_FALSE}.make(call_site))
                     end
                  end
               end
            elseif name = as_or_else then
               bc1 ?= target
               if bc1 /= Void then
                  Result := smart_eiffel.get_inline_memo
                  if bc1.value then
                     Result.set_expression(create {E_TRUE}.make(call_site))
                  else
                     Result.set_expression(arg)
                  end
               else
                  bc2 ?= arg
                  if bc2 /= Void then
                     if bc2.value then
                        if target.side_effect_free(type) then
                           Result := smart_eiffel.get_inline_memo
                           Result.set_expression(create {E_TRUE}.make(call_site))
                        end
                     else
                        Result := smart_eiffel.get_inline_memo
                        Result.set_expression(target)
                     end
                  end
               end
            elseif name = as_implies then
               bc1 ?= target
               if bc1 /= Void then
                  Result := smart_eiffel.get_inline_memo
                  if bc1.value then
                     Result.set_expression(arg)
                  else
                     Result.set_expression(create {E_TRUE}.make(call_site))
                  end
               end
               --|*** Check the value of `bc2' as for "or else" / "and then".
               --|*** (Dom may 28th 2004) ***
            else
               check
                  False -- No other external functions in BOOLEAN.
               end
            end
         end
         if Result /= Void then
            smart_eiffel.magic_count_increment
         end
      end

feature {}
   true_or_false (bool: BOOLEAN; sp: POSITION): BOOLEAN_CONSTANT
      do
         if bool then
            create {E_TRUE} Result.make(sp)
         else
            create {E_FALSE} Result.make(sp)
         end
      end

   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_8
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {ANY}
   accept (visitor: EXTERNAL_FUNCTION_VISITOR)
      do
         visitor.visit_external_function(Current)
      end

feature {INTROSPECTION_HANDLER}
   collect_internals_handler (t: TYPE; fn: STRING)
      do
         routine_body := introspection_handler.finalized_body_for_internals_handler(Current, t, fn)
      end

feature {ANONYMOUS_FEATURE_MIXER}
   specialize_signature_in (new_type: TYPE): like Current
      local
         args: like arguments; cfal: like closure_arguments
      do
         result_type.specialize_in(new_type)
         if arguments /= Void then
            args := arguments.specialize_in(new_type)
         end
         cfal := specialize_closure_arguments_lists_in(new_type)
         if args = arguments and then cfal = closure_arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args, cfal)
         end
      end

   specialize_signature_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         args: like arguments; rt: like result_type; cfal: like closure_arguments
      do
         rt := result_type.specialize_thru(parent_type, parent_edge, new_type)
         if arguments /= Void then
            args := arguments.specialize_thru(parent_type, parent_edge, new_type)
         end
         cfal := specialize_closure_arguments_lists_thru(parent_type, parent_edge, new_type)
         if result_type = rt and then args = arguments and then cfal = closure_arguments then
            Result := Current
         else
            Result := twin
            Result.set_arguments(args, cfal)
            Result.set_result_type(rt)
         end
      end

feature {}
   hook_collect (t: TYPE)
      local
         n: STRING
         fs: FEATURE_STAMP
         insp: OTHER_INSPECT_STATEMENT
      do
         n := first_name.to_string
         if as_twin = n then
            fs := any_copy_fs.resolve_static_binding_for(smart_eiffel.type_any, t)
            t.live_type.collect(fs)
         elseif as_calloc = n and then as_native_array = t.class_text.name.to_string then
            fs := t.feature_stamp_of(clear_all_name)
            t.live_type.collect(fs)
         elseif as_generating_type = n then
            smart_eiffel.set_generator_used
            smart_eiffel.set_generating_type_used
         elseif as_generator = n then
            smart_eiffel.set_generator_used
         elseif as_deep_twin = n then
            t.live_type.collect_deep_twin
         elseif as_is_deep_equal = n then
            t.live_type.collect_is_deep_equal
         elseif as_internals_handler = class_text.name.to_string then
            if insp ?:= routine_body then
               insp ::= routine_body
               if as_internals_from_generating_type = n then
                  introspection_handler.collect_internals_from_generating_type(insp, start_position, t)
               elseif as_native_array_internals_from_generating_type = n then
                  introspection_handler.collect_native_array_internals_from_generating_type(insp, start_position, arguments, t)
               end
            end
         elseif as_exception = n then
            exceptions_handler.set_used
         elseif as_signal_number = n then
            exceptions_handler.set_used
         end
      end

feature {}
   frozen collect_body (type: TYPE)
      local
         rt, dummy: TYPE
      do
         rt := result_type.resolve_in(type)
         if rt.is_expanded then
            smart_eiffel.collect_external(rt)
         elseif rt.name.to_string = as_string then
            manifest_string_pool.collect_string(rt)
         end
         if routine_body /= Void and then not type.is_deferred then
            if local_vars /= Void then
               local_vars.collect(type)
            end
            dummy := routine_body.collect(type)
         end
         native.collect(type, Current)
      end

feature {EXTERNAL_FUNCTION}
   set_result_type (rt: like result_type)
      require
         rt /= Void
      do
         result_type := rt
      end

feature {}
   make (fa: like arguments; rt: like result_type; om: like obsolete_mark; hc: like header_comment
      ra: like require_assertion; l: like native; en: like alias_string)
      require
         rt /= Void
         l /= Void
      do
         make_routine(fa, om, hc, ra, False)
         result_type := rt
         make_external_routine(l, en)
      end

   non_written (ct: CLASS_TEXT; fn: FEATURE_NAME; fa: like arguments; rt: like result_type; l: like native)
      require
         ct /= Void
         fn /= Void
         fa /= Void
         rt /= Void
         l /= Void
      do
         feature_text := ct.non_written(fn, Current)
         make(fa, rt, Void, Void, Void, l, Void)
      end

   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
      do
         create {DEFERRED_FUNCTION} Result.from_effective(fn, arguments, result_type, require_assertion, ensure_assertion, bc, permissions)
      end

   integer_constant (expression: EXPRESSION): INTEGER_CONSTANT
         -- To unwarped IMPLICIT_CAST too in a single step.
      require
         expression /= Void
      local
         implicit_cast: IMPLICIT_CAST
      do
         Result ?= expression
         if Result = Void then
            implicit_cast ?= expression
            if implicit_cast /= Void then
               Result := integer_constant(implicit_cast.expression)
            end
         end
      end

end -- class EXTERNAL_FUNCTION
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
