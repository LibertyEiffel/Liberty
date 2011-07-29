-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_BUILT_IN

inherit
   NATIVE
      redefine side_effect_free
      end

creation {ANY}
   make

feature {}
   c_mapping_natural_function (type_of_current: TYPE; name: STRING) is
      require
         type_of_current.is_natural
      local
         natural_type_mark: NATURAL_TYPE_MARK; bit_count: INTEGER
      do
         natural_type_mark ::= type_of_current.canonical_type_mark
         bit_count := natural_type_mark.bit_count
         if as_bit_rotate_right = name then
            cpp.pending_c_function_body.append(once "(uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ">>")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))|(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "<<(")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('-')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")))")
         elseif as_bit_rotate_left = name then
            cpp.pending_c_function_body.append(once "(uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ">>(")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('-')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")))|(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "<<")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))")
         elseif as_bit_rotate = name then
            cpp.pending_c_function_body.append(once "((uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))>>(")
            (bit_count - 1).append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "&(")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "+(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))))|((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")<<(")
            (bit_count - 1).append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "&(")
            bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "-(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))))))")
         elseif as_bit_not = name then
            cpp.pending_c_function_body.append(once "~(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_and = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('&')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_or = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('|')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_xor = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('^')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         else
            -- Well, that can be only some usual infix:
            cpp.pending_c_function_body.append(once "((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
            if as_slash_slash = name or else as_sharp_slash_slash = name then
               cpp.pending_c_function_body.extend('/')
            elseif as_backslash_backslash = name or else as_sharp_backslash_backslash = name then
               cpp.pending_c_function_body.extend('%%')
            elseif as_sharp_plus = name then
               cpp.pending_c_function_body.extend('+')
            elseif as_sharp_minus = name then
               cpp.pending_c_function_body.extend('-')
            elseif as_sharp_muls = name then
               cpp.pending_c_function_body.extend('*')
            else
               cpp.pending_c_function_body.append(name)
            end
            cpp.pending_c_function_body.extend('(')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))")
         end
      end

feature {ANY}
   does_need_c_wrapper (type_of_current: TYPE; name: STRING): BOOLEAN is
      do
         if as_and_then = name then
            check
               not Result -- Must not wrap semi-strict operator!
            end
         elseif as_or_else = name then
            check
               not Result -- Must not wrap semi-strict operator!
            end
         elseif as_implies = name then
            check
               not Result -- Must not wrap semi-strict operator!
            end
         elseif as_sedb_breakpoint = name then
            check
               not Result -- Well, `sedb_breakpoint' is really special.
            end
         elseif ace.sedb then
            -- To see built_in while debugging.
            Result := True
         elseif as_is_equal = name or else as_standard_is_equal = name then
            if type_of_current.is_agent then
               Result := True
            elseif type_of_current.live_type.is_tagged then
               Result := True
            elseif type_of_current.live_type.writable_attributes = Void then
               Result := not ace.boost
            elseif type_of_current.is_user_expanded then
               Result := True
            end
         elseif as_twin = name or else as_standard_twin = name then
            Result := True
         elseif as_deep_twin = name then
            Result := True
         elseif as_is_deep_equal = name then
            Result := True
         elseif type_of_current.is_native_array and then as_calloc = name then
            Result := expanded_initializer(type_of_current.private_generic_list.item(1))
         end
      end

   c_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      local
         cbd: BOOLEAN; type_of_current, elt_type: TYPE
      do
         type_of_current := rf7.type_of_current
         if name.has_prefix(once "basic_") then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(name)
            if rf7.arguments /= Void then
               cpp.pending_c_function_body.extend('(')
               cpp.put_arguments(rf7.arguments.count)
               cpp.pending_c_function_body.extend(')')
            end
            if cbd then
               cpp.pending_c_function_body.extend(')')
            end
            cpp.pending_c_function_body.append(once ";%N")
         elseif as_copy = name or else as_standard_copy = name then
            if type_of_current.is_reference then
               cpp.pending_c_function_body.append(once "*((T")
               type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "*)(")
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once "))=*((T")
               type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "*)(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once "));%N")
            elseif type_of_current.is_kernel_expanded or else type_of_current.is_empty_expanded then
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once ";%N")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once ";%N")
            else
               check
                  type_of_current.is_user_expanded
                  not type_of_current.is_empty_expanded
               end
               cpp.pending_c_function_body.append(once "memcpy(")
               cpp.put_target_as_target(type_of_current)
               cpp.pending_c_function_body.append(once ",&")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once ",sizeof(T")
               type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "));%N")
            end
         elseif as_print_run_time_stack = name then
            cpp.pending_c_function_body.append(once "se_print_run_time_stack();%N")
         elseif as_die_with_code = name then
            if cpp.target_cannot_be_dropped then
               cpp.pending_c_function_body.append(once ");%N")
            end
            cpp.pending_c_function_body.append(once "se_die(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ");%N")
         elseif as_native_array = bcn then
            c_mapping_native_array_procedure(rf7, name)
         elseif type_of_current.is_integer then
            c_mapping_integer_procedure(rf7, name)
         elseif as_raise_exception = name then
            cpp.pending_c_function_body.append(once "internal_exception_handler(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ");%N")
         elseif as_full_collect = name then
            if not cpp.gc_handler.is_off then
               cpp.pending_c_function_body.append(once "gc_start();%N")
            end
         elseif as_trace_switch = name then
            cpp.put_trace_switch
         elseif as_sedb_breakpoint = name then
            cpp.put_sedb_breakpoint
         elseif as_collection_off = name then
            if not cpp.gc_handler.is_off then
               cpp.pending_c_function_body.append(once "gc_is_off=1;%N")
            end
         elseif as_collection_on = name then
            if not cpp.gc_handler.is_off then
               cpp.pending_c_function_body.append(once "gc_is_off=0;%N")
            end
         elseif as_put_16_be = name or else as_put_16_le = name or else as_put_16_ne = name then
            cpp.pending_c_function_body.append(once "*((int16_t*)(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "+")
            cpp.put_ith_argument(3)
            cpp.pending_c_function_body.append(once "))=")
            if as_put_16_ne /= name then
               if as_put_16_be = name then
                  cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N")
               else
                  cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == BIG_ENDIAN%N")
               end
               cpp.pending_c_function_body.extend('(')
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once "<<8)|((uint16_t)")
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once ">>8);%N#else%N")
            end
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ";%N")
            if as_put_16_ne /= name then
               cpp.pending_c_function_body.append(once "#endif%N")
            end
         elseif as_put_32_be = name or else as_put_32_le = name or else as_put_32_ne = name then
            cpp.pending_c_function_body.append(once "*((int32_t*)(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "+")
            cpp.put_ith_argument(3)
            cpp.pending_c_function_body.append(once "))=")
            if as_put_32_ne /= name then
               if as_put_32_be = name then
                  cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N")
               else
                  cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == BIG_ENDIAN%N")
               end
               cpp.pending_c_function_body.extend('(')
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once "<<24|(((uint32_t)")
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once "<<8)&0xFF0000)|(((uint32_t)")
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once ">>8)&0xFF00)|(((uint32_t)")
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once ">>24)&0xFF));%N#else%N")
            end
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ";%N")
            if as_put_32_ne /= name then
               cpp.pending_c_function_body.append(once "#endif%N")
            end
         elseif as_mark_item = name then
            cpp.pending_c_function_body.append(once "{/*mark_item*/%N")
            elt_type := rf7.arguments.name(1).resolve_in(rf7.type_of_current).generic_list.first
            cpp.pending_c_function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
            cpp.pending_c_function_body.append(once " elt=")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "[")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "];%N")
            cpp.gc_handler.mark_for(once "elt", elt_type.live_type, False)
            cpp.pending_c_function_body.append(once "/*mark_item*/}")
         else
            check -- Unknown external.
               False
            end
         end
      end

   c_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         cbd, cda: BOOLEAN; live_type_of_current: LIVE_TYPE; copy_run_feature: RUN_FEATURE
         i, id: INTEGER; type_of_current: TYPE
      do
         type_of_current := rf8.type_of_current
         live_type_of_current := type_of_current.live_type
         if name.has_prefix(once "basic_") then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(name)
            if rf8.arguments /= Void then
               cpp.pending_c_function_body.extend('(')
               cpp.put_arguments(rf8.arguments.count)
               cpp.pending_c_function_body.extend(')')
            end
            if cbd then
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_to_integer_8 = name then
            cpp.pending_c_function_body.append(once "((int8_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_integer_16 = name then
            cpp.pending_c_function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_integer_32 = name then
            cpp.pending_c_function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_integer_64 = name then
            cpp.pending_c_function_body.append(once "((int64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_natural_8 = name then
            cpp.pending_c_function_body.append(once "((uint8_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_natural_16 = name then
            cpp.pending_c_function_body.append(once "((uint16_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_natural_32 = name then
            cpp.pending_c_function_body.append(once "((uint32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_to_natural_64 = name then
            cpp.pending_c_function_body.append(once "((uint64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_platform = bcn then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(once "EIF_")
            from
               i := 1
            until
               i > name.upper
            loop
               cpp.pending_c_function_body.extend(name.item(i).to_upper)
               i := i + 1
            end
            if cbd then
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_generating_type = name then
            cpp.put_target_generating_type(type_of_current)
         elseif as_generator = name then
            cpp.put_target_generator(type_of_current)
         elseif as_same_dynamic_type = name then
            cpp.pending_c_function_body.append(once "/* same_dynamic_type */%N")
            if type_of_current.is_reference and then type_of_current.live_type.is_tagged then
               cpp.pending_c_function_body.append(once "((")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once "(vc(")
               end
               cpp.pending_c_function_body.append(once "((T0*)(")
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once "))")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once ",0))")
               end
               cpp.pending_c_function_body.append(once "->id)==(")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once "(vc(")
               end
               cpp.pending_c_function_body.append(once "((T0*)(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once "))")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once ",0))")
               end
               cpp.pending_c_function_body.append(once "->id))")
            else
               -- Statically known:
               cda := cpp.cannot_drop_all
               if cda then
                  cpp.pending_c_function_body.extend(',')
               end
               cpp.pending_c_function_body.extend('1')
               if cda then
                  cpp.pending_c_function_body.extend(')')
               end
            end
         elseif as_to_pointer = name then
            cpp.pending_c_function_body.append(once "((void*)(")
            cpp.put_target_as_value
            if type_of_current.is_expanded and then not type_of_current.is_native_array then
               error_handler.add_position(rf8.start_position)
               error_handler.append(once "Invalid usage of feature `to_pointer' of class ANY. %
                                         %(The target which is of type ")
               error_handler.append(type_of_current.name.to_string)
               error_handler.append(once " cannot be converted as a memory address.)")
               cpp.target_position_in_error_handler
               error_handler.print_as_warning
               cpp.pending_c_function_body.append(once ",NULL")
            end
            cpp.pending_c_function_body.append(once "))")
         elseif as_object_size = name then
            cpp.put_object_size(type_of_current)
         elseif as_is_equal = name or else as_standard_is_equal = name then
            if type_of_current.is_kernel_expanded or else type_of_current.is_native_array then
               cpp.pending_c_function_body.extend('(')
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once ")==(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.extend(')')
            elseif type_of_current.is_agent then
               cpp.pending_c_function_body.append(once
               "(((se_agent*)C)->u0.eq==((se_agent*)a1)->u0.eq)&&(((se_agent*)C)->u0.eq((se_agent*)C,(se_agent*)a1))")
            elseif live_type_of_current.is_tagged then
               cpp.pending_c_function_body.append(once "((T6)((C->id==a1->id)?!memcmp(C,a1,sizeof(*C)):0))")
            elseif live_type_of_current.writable_attributes = Void then
               if ace.boost then
                  cbd := cpp.cannot_drop_all
                  if cbd then
                     cpp.pending_c_function_body.extend(',')
                  end
                  cpp.pending_c_function_body.extend('1')
                  if cbd then
                     cpp.pending_c_function_body.extend(')')
                  end
               else
                  cpp.pending_c_function_body.extend('1')
               end
            elseif type_of_current.is_user_expanded or else not ace.boost then
               cpp.pending_c_function_body.append(once "(T6)!memcmp(C,&a1,sizeof(T")
               type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "))")
            else
               cpp.pending_c_function_body.append(once "!memcmp(")
               cpp.put_target_as_target(type_of_current)
               cpp.pending_c_function_body.extend(',')
               if type_of_current.is_user_expanded then
                  cpp.pending_c_function_body.extend('&')
               end
               cpp.pending_c_function_body.extend('(')
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once "),sizeof(T")
               live_type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "))")
            end
         elseif as_standard_twin = name then
            c_mapping_standard_twin(type_of_current)
         elseif as_twin = name then
            copy_run_feature := live_type_of_current.copy_run_feature
            if {RUN_FEATURE_7} ?:= copy_run_feature then
               c_mapping_standard_twin(type_of_current)
            else
               if live_type_of_current.is_reference then
                  if cpp.gc_handler.is_off then
                     id := live_type_of_current.id
                     cpp.pending_c_function_body.append(once "se_malloc(sizeof(*C));%N*((T")
                     id.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "*)R)=M")
                     id.append_in(cpp.pending_c_function_body)
                  else
                     cpp.pending_c_function_body.append(once "(void*)")
                     live_type_of_current.canonical_type_mark.gc_call_new_in(cpp.pending_c_function_body)
                  end
                  cpp.pending_c_function_body.append(once ";%N")
               end
               cpp.inside_twin(live_type_of_current.type, copy_run_feature)
               if cpp.pending_c_function_body.has_suffix(once ";%N") then
                  cpp.pending_c_function_body.remove_tail(2)
               end
            end
         elseif as_deep_twin = name then
            if type_of_current.is_kernel_expanded then
               cpp.put_target_as_target(type_of_current)
            elseif type_of_current.is_native_array then
               error_handler.add_type_mark(type_of_current.canonical_type_mark)
               error_handler.add_position(start_position)
               error_handler.append(fz_dtideena)
               error_handler.print_as_warning
               cpp.pending_c_function_body.append(once "NULL")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once ";%Nerror0(%"Invalid deep_twin.%",NULL)")
               end
            elseif type_of_current.is_user_expanded and then type_of_current.is_empty_expanded then
               cpp.put_target_as_target(type_of_current)
            else
               check
                  cpp.pending_c_function_body.has_suffix(once "R=")
               end
               cpp.pending_c_function_body.remove_tail(2)
               live_type_of_current.c_deep_twin_body
            end
         elseif as_is_deep_equal = name then
            if type_of_current.is_kernel_expanded then
               cpp.pending_c_function_body.append(once "(T6)(C==a1)")
            elseif type_of_current.is_empty_expanded then
               cpp.pending_c_function_body.extend('1')
            elseif type_of_current.is_native_array then
               error_handler.add_type_mark(type_of_current.canonical_type_mark)
               error_handler.add_position(type_of_current.canonical_type_mark.start_position)
               error_handler.append(fz_dtideena)
               error_handler.print_as_warning
               if ace.boost then
                  cpp.pending_c_function_body.extend('0')
               else
                  cpp.pending_c_function_body.append(once "0;%Nerror0(%"Invalid is_deep_equal.%",NULL)")
               end
            else
               check
                  cpp.pending_c_function_body.has_suffix(once "R=")
               end
               cpp.pending_c_function_body.remove_tail(2)
               live_type_of_current.is_deep_equal_c_code
            end
         elseif as_is_basic_expanded_type = name then
            cbd := cpp.cannot_drop_all
            if cbd then
               cpp.pending_c_function_body.extend(',')
            end
            if type_of_current.is_kernel_expanded then
               cpp.pending_c_function_body.extend('1')
            else
               cpp.pending_c_function_body.extend('0')
            end
            if cbd then
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_se_argc = name then
            cpp.pending_c_function_body.append(as_se_argc)
         elseif as_se_argv = name then
            cpp.pending_c_function_body.append(once "((T0*)se_string(se_argv[")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "]))")
         elseif as_native_array = bcn then
            c_mapping_native_array_function(type_of_current, name)
         elseif type_of_current.is_real then
            c_mapping_real(type_of_current.canonical_type_mark, name, rf8.arg_count)
         elseif as_boolean = bcn then
            if as_implies = name then
               cpp.pending_c_function_body.append(once "(T6)((!(")
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once "))||(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once "))")
            else
               check
                  rf8.arg_count = 1
               end
               cpp.pending_c_function_body.append(once "(T6)((")
               cpp.put_target_as_value
               if as_or_else = name then
                  cpp.pending_c_function_body.append(once ")||(")
               else
                  check
                     as_and_then = name
                  end
                  cpp.pending_c_function_body.append(once ")&&(")
               end
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once "))")
            end
         elseif as_character = bcn then
            cpp.pending_c_function_body.append(once "T3")
            cpp.pending_c_function_body.append(name)
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_pointer = bcn then
            check
               as_is_not_null = name
            end
            cpp.pending_c_function_body.append(once "(NULL!=")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_exception = name then
            cpp.pending_c_function_body.append(once "internal_exception_number")
         elseif as_signal_number = name then
            cpp.pending_c_function_body.append(once "signal_exception_number")
         elseif as_collecting = name then
            if cpp.gc_handler.is_off then
               cpp.pending_c_function_body.extend('0')
            else
               cpp.pending_c_function_body.append(once "!gc_is_off")
            end
         elseif as_collector_counter = name then
            if cpp.gc_handler.is_off then
               cpp.pending_c_function_body.append(once "(-1)")
            else
               cpp.pending_c_function_body.append(as_collector_counter)
            end
         elseif type_of_current.is_integer then
            c_mapping_integer_function(type_of_current, rf8, name)
         elseif type_of_current.is_natural then
            c_mapping_natural_function(type_of_current, name)
         elseif as_as_16_ne = name then
            cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N(")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "<<8)|((uint16_t)")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")%N#else%N(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "<<8)|((uint16_t)")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ")%N#endif%N")
         elseif as_as_32_ne = name then
            cpp.pending_c_function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N(")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "<<16)|((uint32_t)")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")%N#else%N(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "<<16)|((uint32_t)")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ")%N#endif%N")
         elseif as_to_internals = name then
            check
               as_typed_internals = bcn
            end
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(once "NULL")
            if cbd then
               cpp.pending_c_function_body.extend(')')
            end
         else
            check
               False
            end
         end
      end

   jvm_add_method_for_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         lt: LIVE_TYPE; rf: RUN_FEATURE; rf7: RUN_FEATURE_7
      do
         if as_twin = name then
            lt := rf8.type_of_current.live_type
            rf := lt.copy_run_feature
            rf7 ?= rf
            if rf7 = Void then
               jvm.add_method(rf8)
            end
         elseif as_generating_type = name then
            jvm.add_method(rf8)
         elseif as_generator = name then
            jvm.add_method(rf8)
         elseif bcn = as_native_array then
         end
      end

   jvm_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         lt: LIVE_TYPE; rf: RUN_FEATURE; rf7: RUN_FEATURE_7
         lt_idx, field_idx, point1: INTEGER; cp: like constant_pool; ca: like code_attribute
         index_args: INTEGER; t_pointer: POINTER_TYPE_MARK
      do
         cp := constant_pool
         ca := code_attribute
         if as_twin = name then
            lt := rf8.type_of_current.live_type
            rf := lt.copy_run_feature
            rf7 ?= rf
            if rf7 /= Void then
            else
               jvm_define_twin(rf8, lt, rf)
            end
         elseif as_generating_type = name then
            rf8.jvm_opening
            lt := rf8.type_of_current.live_type
            lt_idx := lt.jvm_constant_pool_index
            field_idx := cp.idx_fieldref_generating_type(lt_idx)
            ca.opcode_getstatic(field_idx, 1)
            ca.opcode_dup
            point1 := ca.opcode_ifnonnull
            ca.opcode_pop
            ca.opcode_push_manifest_string(rf8.type_of_current.name.to_string)
            ca.opcode_dup
            ca.opcode_putstatic(field_idx, -1)
            ca.resolve_u2_branch(point1)
            rf8.jvm_closing_fast
         elseif as_generator = name then
            rf8.jvm_opening
            lt := rf8.type_of_current.live_type
            lt_idx := lt.jvm_constant_pool_index
            field_idx := cp.idx_fieldref_generator(lt_idx)
            ca.opcode_getstatic(field_idx, 1)
            ca.opcode_dup
            point1 := ca.opcode_ifnonnull
            ca.opcode_pop
            ca.opcode_push_manifest_string(rf8.type_of_current.class_text.name.to_string)
            ca.opcode_dup
            ca.opcode_putstatic(field_idx, -1)
            ca.resolve_u2_branch(point1)
            rf8.jvm_closing_fast
         elseif as_function = bcn then
            if as_call = name then
               create t_pointer.make(rf8.start_position)
               rf8.jvm_opening
               index_args := code_attribute.extra_local(t_pointer)
               code_attribute.opcode_iconst_1
               code_attribute.opcode_pop
               rf8.jvm_closing
            end
         end
      end

   jvm_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         ct: TYPE_MARK; lt: LIVE_TYPE; rf: RUN_FEATURE; rf7: RUN_FEATURE_7
         point1, point2, space, idx: INTEGER; cp: like constant_pool; ca: like code_attribute
         real_type_mark: REAL_TYPE_MARK
      do
         ct := rf8.type_of_current.canonical_type_mark
         ca := code_attribute
         cp := constant_pool
         if as_to_pointer = name then
            jvm.push_target
         elseif ct.is_integer then
            if rf8.type_of_current.jvm_stack_space = 2 then
               jvm_mapping_integer_64_function(rf8, name)
               if rf8.result_type.jvm_stack_space = 1 then
                  ca.opcode_l2i
               end
            else
               jvm_mapping_integer_function(rf8, name)
               if rf8.result_type.jvm_stack_space = 2 then
                  ca.opcode_i2l
               end
            end
         elseif as_real = bcn then
            real_type_mark ::= ct
            jvm_mapping_real_function(rf8, name, real_type_mark.bit_count)
         elseif as_native_array = bcn then
            jvm_mapping_native_array_function(rf8, name)
         elseif as_character = bcn then
            if as_code = name then
               jvm.push_target
               ca.opcode_dup
               point1 := ca.opcode_ifge
               ca.opcode_sipush(255)
               ca.opcode_iand
               ca.resolve_u2_branch(point1)
            else
               check
                  as_to_integer_8 = name
               end
               jvm.push_target
            end
         elseif as_is_not_null = name then
            jvm.push_target
            point1 := ca.opcode_ifnonnull
            ca.opcode_iconst_0
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            ca.opcode_iconst_1
            ca.resolve_u2_branch(point2)
         elseif as_implies = name then
            jvm.push_target
            point1 := ca.opcode_ifeq
            space := jvm.push_ith_argument(1)
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            ca.opcode_iconst_1
            ca.resolve_u2_branch(point2)
         elseif as_generating_type = name then
            rf8.routine_mapping_jvm
         elseif as_generator = name then
            rf8.routine_mapping_jvm
         elseif as_to_pointer = name then
            fe_nyi(rf8)
         elseif as_object_size = name then
            jvm.drop_target
            jvm_object_size(ct)
         elseif as_is_equal = name or else as_standard_is_equal = name then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            rf8.type_of_current.canonical_type_mark.jvm_standard_is_equal
         elseif as_standard_twin = name then
            jvm_standard_twin(rf8.type_of_current.canonical_type_mark)
         elseif as_twin = name then
            lt := rf8.type_of_current.live_type
            rf := lt.copy_run_feature
            rf7 ?= rf
            if rf7 /= Void then
               jvm_standard_twin(ct)
            else
               rf8.routine_mapping_jvm
            end
         elseif as_is_basic_expanded_type = name then
            jvm.drop_target
            if rf8.type_of_current.is_kernel_expanded then
               ca.opcode_iconst_1
            else
               ca.opcode_iconst_0
            end
         elseif as_se_argc = name then
            jvm.push_se_argc
         elseif as_se_argv = name then
            jvm.push_se_argv
         elseif as_character_bits = name then
            jvm.drop_target
            ca.opcode_bipush(8)
         elseif as_integer_bits = name then
            jvm.drop_target
            ca.opcode_bipush(32)
         elseif as_boolean_bits = name then
            jvm.drop_target
            ca.opcode_bipush(32)
         elseif as_real_bits = name then
            jvm.drop_target
            ca.opcode_bipush(32)
         elseif as_pointer_bits = name then
            jvm.drop_target
            ca.opcode_bipush(32)
         elseif as_minimum_character_code = name then
            jvm.drop_target
            ca.opcode_iconst_i(0)
         elseif as_minimum_double = name then
            jvm.drop_target
            idx := cp.idx_fieldref3(once "java/lang/Double", once "MAX_VALUE", once "D")
            ca.opcode_getstatic(idx, 2)
            ca.opcode_dneg
         elseif as_minimum_real = name then
            jvm.drop_target
            idx := cp.idx_fieldref3(once "java/lang/Float", once "MAX_VALUE", once "F")
            ca.opcode_getstatic(idx, 1)
            ca.opcode_fneg
         elseif as_maximum_character_code = name then
            jvm.drop_target
            ca.opcode_sipush(255)
         elseif as_maximum_double = name then
            jvm.drop_target
            idx := cp.idx_fieldref3(once "java/lang/Double", once "MAX_VALUE", once "D")
            ca.opcode_getstatic(idx, 2)
         elseif as_exception = name then
            ca.runtime_internal_exception_number
         elseif as_signal_number = name then
         elseif as_same_dynamic_type = name then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            jvm_runtime_invokestatic(name, rf8)
         else
            fe_nyi(rf8)
         end
      end

   jvm_add_method_for_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
      end

   jvm_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      local
         t_pointer: POINTER_TYPE_MARK; index_args: INTEGER
      do
         if as_procedure = bcn then
            if as_call = name then
               create t_pointer.make(rf7.start_position)
               rf7.jvm_opening
               index_args := code_attribute.extra_local(t_pointer)
               code_attribute.opcode_iconst_0
               code_attribute.opcode_pop
               rf7.jvm_closing
            end
         end
      end

   jvm_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      local
         ct: TYPE; ca: like code_attribute; cp: like constant_pool; space: INTEGER
      do
         ct := rf7.type_of_current
         ca := code_attribute
         cp := constant_pool
         if as_copy = name or else as_standard_copy = name then
            if ct.is_kernel_expanded then
               jvm.drop_target
               jvm.drop_ith_argument(1)
            else
               jvm_copy(rf7.type_of_current)
            end
         elseif as_die_with_code = name then
            jvm.drop_target
            space := jvm.push_ith_argument(1)
            ca.runtime_die_with_code
         elseif as_print_run_time_stack = name then
            jvm.drop_target
            jvm_runtime_invokestatic(name, rf7)
         elseif as_sedb_breakpoint = name then
         elseif as_native_array = bcn then
            jvm_mapping_native_array_procedure(rf7, name)
         elseif as_raise_exception = name then
            fe_nyi(rf7)
         elseif ct.is_integer then
            if rf7.type_of_current.jvm_stack_space = 2 then
               jvm_mapping_integer_procedure(rf7,name)
            else
               jvm_mapping_integer_64_procedure(rf7,name)
            end
         else
            fe_nyi(rf7)
         end
      end

   accept (visitor: NATIVE_BUILT_IN_VISITOR) is
      do
         visitor.visit_native_built_in(Current)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
      local
         name: STRING
      do
         name := er.first_name.to_string
         if name.has_prefix(once "basic_") then
         elseif as_se_argc = name then
         elseif as_se_argv = name then
         else
            Result := True
         end
      end

feature {EXTERNAL_FUNCTION}
   side_effect_free (target_type: TYPE; feature_text: FEATURE_TEXT): BOOLEAN is
      do
         if target_type.is_native_array then
            if feature_text.names.first.to_string = as_item then
               Result := True
            end
         elseif target_type.is_kernel_expanded then
            -- Assume all functions are side effect free:
            Result := feature_text.result_type /= Void
         end
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
      do
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      do
         not_yet_implemented
      end

feature {}
   jvm_object_size (ct: TYPE_MARK) is
      local
         t: TYPE_MARK; space, i: INTEGER; wa: ARRAY[RUN_FEATURE_2]
      do
         if ct.is_kernel_expanded then
            space := ct.jvm_stack_space
         else
            wa := ct.type.live_type.writable_attributes
            if wa /= Void then
               from
                  i := wa.lower
               until
                  i > wa.upper
               loop
                  t := wa.item(i).result_type
                  space := space + t.jvm_stack_space
                  i := i + 1
               end
            end
         end
         code_attribute.opcode_push_integer(space)
      end

   c_mapping_standard_twin (type_of_current: TYPE) is
      do
         if type_of_current.is_kernel_expanded then
            cpp.put_target_as_value
         elseif type_of_current.is_expanded then
            if type_of_current.is_empty_expanded then
               cpp.put_target_as_target(type_of_current)
            elseif type_of_current.is_native_array then
               cpp.put_target_as_target(type_of_current)
            else
               check
                  cpp.pending_c_function_body.has_suffix(once "R=")
               end
               cpp.pending_c_function_body.remove_tail(2)
               cpp.pending_c_function_body.append(once "memcpy(&R,C,sizeof(R))")
            end
         else
            if cpp.gc_handler.is_off then
               cpp.pending_c_function_body.append(once "se_malloc(sizeof(*C));%N")
            else
               cpp.pending_c_function_body.append(once "((void*)")
               type_of_current.canonical_type_mark.gc_call_new_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ");%N")
            end
            cpp.pending_c_function_body.append(once "*((T")
            type_of_current.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)R)=*C")
         end
      end

   jvm_mapping_native_array_function (rf8: RUN_FEATURE_8; name: STRING) is
      local
         elt_type: TYPE_MARK; space: INTEGER; lt: LIVE_TYPE; loc1, point1, point2: INTEGER
         ca: like code_attribute
      do
         elt_type := rf8.type_of_current.canonical_type_mark.generic_list.item(1)
         if as_element_sizeof = name then
            jvm.drop_target
            space := elt_type.jvm_stack_space
            code_attribute.opcode_push_integer(space)
         elseif as_item = name then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            elt_type.jvm_xaload
         elseif as_calloc = name then
            jvm.drop_target
            space := jvm.push_ith_argument(1)
            elt_type.jvm_xnewarray
            if elt_type.is_user_expanded and then not elt_type.is_empty_expanded then
               ca := code_attribute
               lt := elt_type.type.live_type
               loc1 := ca.extra_local_size1
               ca.opcode_dup
               ca.opcode_arraylength
               ca.opcode_istore(loc1)
               point1 := ca.program_counter
               ca.opcode_iload(loc1)
               point2 := ca.opcode_ifle
               ca.opcode_iinc(loc1, 255)
               ca.opcode_dup
               ca.opcode_iload(loc1)
               lt.jvm_expanded_push_default
               ca.opcode_aastore
               ca.opcode_goto_backward(point1)
               ca.resolve_u2_branch(point2)
            end
         elseif name = as_from_pointer then
            jvm.drop_target
            space := jvm.push_ith_argument(1)
            rf8.type_of_current.live_type.opcode_checkcast
         else
            fe_nyi(rf8)
         end
      end

   jvm_mapping_native_array_procedure (rf7: RUN_FEATURE_7; name: STRING) is
      local
         elt_type: TYPE_MARK; space: INTEGER; lt: LIVE_TYPE; flag: BOOLEAN; wa: ARRAY[RUN_FEATURE_2]
      do
         elt_type := rf7.type_of_current.canonical_type_mark.generic_list.item(1)
         check
            as_put = name
         end
         lt := elt_type.type.live_type
         flag := lt.name.to_string.has_substring("NATIVE_ARRAY")
         if elt_type.is_kernel_expanded or elt_type.is_reference or flag then
            jvm.push_target
            space := jvm.push_ith_argument(2)
            space := jvm.push_ith_argument(1)
            elt_type.jvm_xastore
         else
            jvm.push_target
            space := jvm.push_ith_argument(2)
            elt_type.jvm_xaload
            space := jvm.push_ith_argument(1)
            wa := lt.writable_attributes
            jvm.fields_by_fields_expanded_copy(wa)
            code_attribute.opcode_pop2
         end
      end

   c_mapping_native_array_function (type_of_current: TYPE; name: STRING) is
      local
         elt_type: TYPE; tcbd: BOOLEAN
      do
         elt_type := type_of_current.private_generic_list.first
         if as_element_sizeof = name then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(once "sizeof(")
            cpp.pending_c_function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
            cpp.pending_c_function_body.extend(')')
            if tcbd then
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_calloc = name then
            if expanded_initializer(elt_type) then
               if cpp.gc_handler.is_off then
                  cpp.pending_c_function_body.append(once "se_malloc(sizeof(T")
                  elt_type.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ")*")
               else
                  cpp.pending_c_function_body.append(once "new")
                  type_of_current.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.extend('(')
               end
               cpp.pending_c_function_body.append(once "a1);%Nr")
               type_of_current.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "clear_all(")
               if ace.no_check then
                  cpp.pending_c_function_body.append(once "&ds,")
               end
               if ace.profile then
                  cpp.pending_c_function_body.append(once "&local_profile,")
               end
               cpp.pending_c_function_body.append(once "R,a1-1);%N")
            else
               tcbd := cpp.target_cannot_be_dropped
               if tcbd then
                  cpp.pending_c_function_body.extend(',')
               end
               if cpp.gc_handler.is_off then
                  cpp.pending_c_function_body.append(once "((T")
                  type_of_current.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ")(se_calloc(")
                  cpp.put_ith_argument(1)
                  cpp.pending_c_function_body.append(once ",sizeof(")
                  cpp.pending_c_function_body.append(cpp.result_type.for(elt_type.canonical_type_mark))
                  cpp.pending_c_function_body.append(once "))))")
               else
                  cpp.pending_c_function_body.append(once "new")
                  type_of_current.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.extend('(')
                  cpp.put_ith_argument(1)
                  cpp.pending_c_function_body.extend(')')
               end
               if tcbd then
                  cpp.pending_c_function_body.extend(')')
               end
            end
         elseif as_from_pointer = name then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.put_ith_argument(1)
            if tcbd then
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_item = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")[")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(']')
         else
            error_handler.append(once "Class NATIVE_ARRAY has been tampered with. Unknown function: ")
            error_handler.append(name)
            error_handler.print_as_fatal_error
         end
      end

   c_mapping_native_array_procedure (rf7: RUN_FEATURE_7; name: STRING) is
      local
         elt_type: TYPE
      do
         elt_type := rf7.type_of_current.private_generic_list.item(1)
         if name = as_put then
            if elt_type.is_user_expanded then
               if elt_type.is_empty_expanded then
                  if cpp.cannot_drop_all then
                     cpp.pending_c_function_body.append(once ");%N")
                  end
               else
                  cpp.pending_c_function_body.append(once "{%NT")
                  elt_type.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once " tmp_src=")
                  cpp.put_ith_argument(1)
                  cpp.pending_c_function_body.append(once ";%Nmemcpy((")
                  cpp.put_target_as_value
                  cpp.pending_c_function_body.append(once ")+(")
                  cpp.put_ith_argument(2)
                  cpp.pending_c_function_body.append(once "),&(tmp_src),sizeof(T")
                  elt_type.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "));%N}%N")
               end
            else
               cpp.pending_c_function_body.extend('(')
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once ")[")
               cpp.put_ith_argument(2)
               cpp.pending_c_function_body.append(once "]=(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once ");%N")
            end
         elseif name = as_slice_copy then
            cpp.pending_c_function_body.append(once "{/*slice_copy*/%Nint a3tmp=")
            cpp.put_ith_argument(3)
            cpp.pending_c_function_body.append(once ";%Nmemcpy((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")+(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "),(")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ")+a3tmp,((")
            cpp.put_ith_argument(4)
            cpp.pending_c_function_body.append(once ")-a3tmp+1)*sizeof(T")
            elt_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "));}%N")
         else
            error_handler.append(once "Class NATIVE_ARRAY has been tampered with. Unknown procedure: ")
            error_handler.append(name)
            error_handler.add_position(rf7.start_position)
            error_handler.print_as_fatal_error
         end
      end

   jvm_copy (t: TYPE) is
      require
         not t.is_kernel_expanded
      local
         lt: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]; space: INTEGER
      do
         lt := t.live_type
         wa := lt.writable_attributes
         jvm.push_target
         space := jvm.push_ith_argument(1)
         lt.opcode_checkcast
         jvm.fields_by_fields_copy(wa)
         code_attribute.opcode_pop
      end

   jvm_define_twin (rf8: RUN_FEATURE_8; lt: LIVE_TYPE; cpy: RUN_FEATURE) is
      require
         lt = rf8.type_of_current.live_type
         cpy /= Void
      local
         idx, space, i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2
      do
         rf8.jvm_opening
         wa := lt.writable_attributes
         lt.jvm_basic_new
         code_attribute.opcode_astore_1
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf2 := wa.item(i)
               code_attribute.opcode_aload_1
               idx := constant_pool.idx_fieldref(rf2)
               space := rf2.result_type.jvm_push_default
               code_attribute.opcode_putfield(idx, - (space + 1))
               i := i + 1
            end
         end
         jvm.inside_twin(cpy)
         rf8.jvm_closing
      end

feature {}
   jvm_runtime_invokestatic (name: STRING; rf: RUN_FEATURE) is
      do
         jvm.runtime_invokestatic(Void, fz_se_runtime, name, rf)
      end

   jvm_standard_twin (t: TYPE_MARK) is
      require
         t /= Void
      local
         lt: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]
      do
         if t.is_kernel_expanded or else t.is_native_array then
            jvm.push_target
         else
            lt := t.type.live_type
            wa := lt.writable_attributes
            if t.is_expanded then
               if wa = Void then
                  jvm.push_target
               else
                  jvm_standard_twin_aux(lt, wa)
               end
            else
               jvm_standard_twin_aux(lt, wa)
            end
         end
      end

   jvm_standard_twin_aux (lt: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]) is
      require
         lt /= Void
      local
         ca: like code_attribute; rf2: RUN_FEATURE_2; idx, space, i: INTEGER
      do
         ca := code_attribute
         lt.jvm_basic_new
         if wa = Void then
            jvm.drop_target
         else
            jvm.push_target
            lt.opcode_checkcast
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf2 := wa.item(i)
               ca.opcode_dup2
               idx := constant_pool.idx_fieldref(rf2)
               space := rf2.result_type.jvm_stack_space
               ca.opcode_getfield(idx, space - 1)
               ca.opcode_putfield(idx, space + 1)
               i := i + 1
            end
            ca.opcode_pop
         end
      end

   jvm_mapping_integer_function (rf8: RUN_FEATURE_8; name: STRING) is
      require
         rf8.type_of_current.live_type.type.jvm_stack_space = 1
      local
         point1, point2, space: INTEGER; ca: like code_attribute
      do
         ca := code_attribute
         if as_slash = name then
            jvm.push_target
            ca.opcode_i2d
            space := jvm.push_ith_argument(1)
            ca.opcode_i2d
            ca.opcode_ddiv
         elseif as_bit_rotate = name then
            space := jvm.push_ith_argument(1)
            point1 := ca.opcode_iflt
            jvm.push_target
            space := jvm.push_ith_argument(1)
            ca.opcode_iushr
            jvm.push_target
            ca.opcode_bipush(31)
            space := jvm.push_ith_argument(1)
            ca.opcode_isub
            ca.opcode_ishl
            ca.opcode_ior
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            jvm.push_target
            space := jvm.push_ith_argument(1)
            ca.opcode_ineg
            ca.opcode_ishl
            jvm.push_target
            ca.opcode_bipush(31)
            space := jvm.push_ith_argument(1)
            ca.opcode_iadd
            ca.opcode_iushr
            ca.opcode_ior
            ca.resolve_u2_branch(point2)
         elseif rf8.arg_count = 0 and then as_sharp_minus = name then
            jvm.push_target
            ca.opcode_ineg
         elseif rf8.arg_count = 1 then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            if as_sharp_plus = name then
               ca.opcode_iadd
            elseif as_sharp_minus = name then
               ca.opcode_isub
            elseif as_sharp_muls = name then
               ca.opcode_imul
            elseif as_slash_slash = name or as_sharp_slash_slash = name then
               ca.opcode_idiv
            elseif as_backslash_backslash = name or as_sharp_backslash_backslash = name then
               ca.opcode_irem
            elseif as_bit_shift_right = name then
               ca.opcode_ishr
            elseif as_bit_shift_right_unsigned = name then
               ca.opcode_iushr
            elseif as_bit_shift_left = name then
               ca.opcode_ishl
            elseif as_bit_rotate_right = name then
               ca.opcode_iushr
               jvm.push_target
               ca.opcode_bipush(32)
               space := jvm.push_ith_argument(1)
               ca.opcode_isub
               ca.opcode_ishl
               ca.opcode_ior
            elseif as_bit_rotate_left = name then
               ca.opcode_ishl
               jvm.push_target
               ca.opcode_bipush(31)
               space := jvm.push_ith_argument(1)
               ca.opcode_isub
               ca.opcode_iushr
               ca.opcode_ior
            elseif as_bit_and = name then
               ca.opcode_iand
            elseif as_bit_or = name then
               ca.opcode_ior
            elseif as_bit_xor = name then
               ca.opcode_ixor
            else
               -- < > <= >= only
               if as_gt = name then
                  point1 := ca.opcode_if_icmpgt
               elseif as_lt = name then
                  point1 := ca.opcode_if_icmplt
               elseif as_le = name then
                  point1 := ca.opcode_if_icmple
               else
                  point1 := ca.opcode_if_icmpge
               end
               ca.opcode_iconst_0
               point2 := ca.opcode_goto
               ca.resolve_u2_branch(point1)
               ca.opcode_iconst_1
               ca.resolve_u2_branch(point2)
            end
         elseif as_to_character = name then
            jvm.push_target
            code_attribute.opcode_i2b
         elseif as_minus = name then
            jvm.push_target
            code_attribute.opcode_ineg
         elseif as_bit_not = name then
            jvm.push_target
            ca.opcode_iconst_m1
            ca.opcode_ixor
         elseif as_low_8 = name then
            jvm.push_target
            ca.opcode_sipush(255)
            ca.opcode_iand
         elseif as_low_16 = name then
            jvm.push_target
            ca.opcode_i2s
         elseif as_low_32 = name then
            jvm.push_target
            ca.opcode_l2i
         else
            jvm.push_target
         end
      end

   jvm_mapping_integer_64_function (rf8: RUN_FEATURE_8; name: STRING) is
      require
         rf8.type_of_current.live_type.type.jvm_stack_space = 2
      local
         point1, point2, space: INTEGER; ca: like code_attribute
      do
         ca := code_attribute
         if as_slash = name then
            jvm.push_target
            ca.opcode_l2d
            space := jvm.push_ith_argument(1)
            ca.opcode_l2d
            ca.opcode_ddiv
         elseif as_bit_rotate = name then
            space := jvm.push_ith_argument(1)
            point1 := ca.opcode_iflt
            jvm.push_target
            space := jvm.push_ith_argument(1)
            ca.opcode_lushr
            jvm.push_target
            ca.opcode_bipush(63)
            space := jvm.push_ith_argument(1)
            ca.opcode_isub
            ca.opcode_lshl
            ca.opcode_lor
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            jvm.push_target
            space := jvm.push_ith_argument(1)
            ca.opcode_ineg
            ca.opcode_lshl
            jvm.push_target
            ca.opcode_bipush(63)
            space := jvm.push_ith_argument(1)
            ca.opcode_iadd
            ca.opcode_lushr
            ca.opcode_lor
            ca.resolve_u2_branch(point2)
         elseif rf8.arg_count = 0 and then as_sharp_minus = name then
            jvm.push_target
            ca.opcode_lneg
         elseif rf8.arg_count = 1 then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            if as_sharp_plus = name then
               ca.opcode_ladd
            elseif as_sharp_minus = name then
               ca.opcode_lsub
            elseif as_sharp_muls = name then
               ca.opcode_lmul
            elseif as_slash_slash = name or as_sharp_slash_slash = name then
               ca.opcode_ldiv
            elseif as_backslash_backslash = name or as_sharp_backslash_backslash = name then
               ca.opcode_lrem
            elseif as_bit_shift_right = name then
               ca.opcode_lshr
            elseif as_bit_shift_right_unsigned = name then
               ca.opcode_lushr
            elseif as_bit_shift_left = name then
               ca.opcode_lshl
            elseif as_bit_rotate_right = name then
               ca.opcode_lushr
               jvm.push_target
               ca.opcode_bipush(64)
               space := jvm.push_ith_argument(1)
               ca.opcode_isub
               ca.opcode_lshl
               ca.opcode_lor
            elseif as_bit_rotate_left = name then
               ca.opcode_lshl
               jvm.push_target
               ca.opcode_bipush(63)
               space := jvm.push_ith_argument(1)
               ca.opcode_isub
               ca.opcode_lushr
               ca.opcode_lor
            elseif as_bit_and = name then
               ca.opcode_land
            elseif as_bit_or = name then
               ca.opcode_lor
            elseif as_bit_xor = name then
               ca.opcode_lxor
            else
               -- < > <= >= only
               ca.opcode_lcmp
               if as_gt = name then
                  point1 := ca.opcode_ifgt
               elseif as_lt = name then
                  point1 := ca.opcode_iflt
               elseif as_le = name then
                  point1 := ca.opcode_ifle
               else
                  point1 := ca.opcode_ifge
               end
               ca.opcode_iconst_0
               point2 := ca.opcode_goto
               ca.resolve_u2_branch(point1)
               ca.opcode_iconst_1
               ca.resolve_u2_branch(point2)
            end
         elseif as_to_character = name then
            jvm.push_target
         elseif as_minus = name then
            jvm.push_target
            ca.opcode_lneg
         elseif as_bit_not = name then
            jvm.push_target
            ca.opcode_iconst_m1
            ca.opcode_i2l
            ca.opcode_lxor
         elseif as_low_8 = name then
            jvm.push_target
         elseif as_low_16 = name then
            jvm.push_target
         elseif as_low_32 = name then
            jvm.push_target
         else
            jvm.push_target
         end
      end

   jvm_mapping_integer_procedure (rf7: RUN_FEATURE_7; name: STRING) is
      require
         rf7.type_of_current.jvm_stack_space = 1
      local
         point1, point2, space: INTEGER; ca: like code_attribute
      do
         ca := code_attribute
         if as_bit_put = name then
            space := jvm.push_ith_argument(1)
            point1 := ca.opcode_ifeq
            ca.opcode_iconst_1
            space := jvm.push_ith_argument(2)
            ca.opcode_ishl
            jvm.push_target
            ca.opcode_ior
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            ca.opcode_iconst_1
            space := jvm.push_ith_argument(2)
            ca.opcode_ishl
            ca.opcode_iconst_m1
            ca.opcode_ixor
            jvm.push_target
            ca.opcode_iand
            ca.resolve_u2_branch(point2)
            jvm.assign_target(rf7.type_of_current)
         elseif as_bit_set = name then
            ca.opcode_iconst_1
            space := jvm.push_ith_argument(1)
            ca.opcode_ishl
            jvm.push_target
            ca.opcode_ior
            jvm.assign_target(rf7.type_of_current)
         elseif as_bit_clear = name then
            ca.opcode_iconst_1
            space := jvm.push_ith_argument(1)
            ca.opcode_ishl
            ca.opcode_iconst_m1
            ca.opcode_ixor
            jvm.push_target
            ca.opcode_iand
            jvm.assign_target(rf7.type_of_current)
         end
      end

   jvm_mapping_integer_64_procedure(rf7: RUN_FEATURE_7; name: STRING) is
      require
         rf7.type_of_current.jvm_stack_space = 2
      local
         point1, point2, space: INTEGER
         ca: like code_attribute
      do
         ca := code_attribute
         if as_bit_put = name then
            space := jvm.push_ith_argument(1)
            point1 := ca.opcode_ifeq
            ca.opcode_lconst_1
            space := jvm.push_ith_argument(2)
            ca.opcode_lshl
            jvm.push_target
            ca.opcode_lor;
            point2 := ca.opcode_goto
            ca.resolve_u2_branch(point1)
            ca.opcode_lconst_1
            space := jvm.push_ith_argument(2)
            ca.opcode_lshl
            ca.opcode_iconst_m1
            ca.opcode_i2l
            ca.opcode_lxor
            jvm.push_target
            ca.opcode_land;
            ca.resolve_u2_branch(point2)
            jvm.assign_target(rf7.type_of_current)
         elseif as_bit_set = name then
            ca.opcode_lconst_1
            space := jvm.push_ith_argument(1)
            ca.opcode_lshl
            jvm.push_target
            ca.opcode_lor;
            jvm.assign_target(rf7.type_of_current)
         elseif as_bit_clear = name then
            ca.opcode_lconst_1
            space := jvm.push_ith_argument(1)
            ca.opcode_lshl
            ca.opcode_iconst_m1
            ca.opcode_i2l
            ca.opcode_lxor
            jvm.push_target
            ca.opcode_land;
            jvm.assign_target(rf7.type_of_current)
         end
      end

   jvm_mapping_real_function (rf8: RUN_FEATURE_8; name: STRING; real_bit_count: INTEGER) is
      local
         point1, point2, space: INTEGER; ca: like code_attribute; idx: INTEGER
      do
         ca := code_attribute
         if rf8.arg_count = 1 then
            jvm.push_target
            space := jvm.push_ith_argument(1)
            if as_plus = name then
               inspect
                  real_bit_count
               when 32 then
                  ca.opcode_fadd
               when 64 then
                  ca.opcode_dadd
               end
            elseif as_minus = name then
               inspect
                  real_bit_count
               when 32 then
                  ca.opcode_fsub
               when 64 then
                  ca.opcode_dsub
               end
            elseif as_muls = name then
               inspect
                  real_bit_count
               when 32 then
                  ca.opcode_fmul
               when 64 then
                  ca.opcode_dmul
               end
            elseif as_slash = name then
               inspect
                  real_bit_count
               when 32 then
                  ca.opcode_fdiv
               when 64 then
                  ca.opcode_ddiv
               end
            elseif as_pow = name then
               idx := constant_pool.idx_methodref3(once "java/lang/Math", as_pow_postfix, once "(DD)D")
               ca.opcode_i2d
               ca.opcode_invokestatic(idx, -2)
            elseif as_pow_postfix = name then
               idx := constant_pool.idx_methodref3(once "java/lang/Math", as_pow_postfix, once "(DD)D")
               ca.opcode_invokestatic(idx, -2)
            elseif as_atan2 = name then
               idx := constant_pool.idx_methodref3(once "java/lang/Math", as_atan2, once "(DD)D")
               ca.opcode_invokestatic(idx, -2)
            else
               inspect
                  real_bit_count
               when 32 then
                  ca.opcode_fcmpg
               when 64 then
                  ca.opcode_dcmpg
               end
               if as_gt = name then
                  point1 := ca.opcode_ifgt
               elseif as_lt = name then
                  point1 := ca.opcode_iflt
               elseif as_le = name then
                  point1 := ca.opcode_ifle
               elseif as_ge = name then
                  point1 := ca.opcode_ifge
               end
               ca.opcode_iconst_0
               point2 := ca.opcode_goto
               ca.resolve_u2_branch(point1)
               ca.opcode_iconst_1
               ca.resolve_u2_branch(point2)
            end
         elseif as_minus = name then
            jvm.push_target
            inspect
               real_bit_count
            when 32 then
               ca.opcode_fneg
            when 64 then
               ca.opcode_dneg
            end
         elseif as_force_to_real_32 = name then
            jvm.push_target
            ca.opcode_d2f
         elseif as_floor = name then
            jvm.push_target
            idx := constant_pool.idx_methodref3(once "java/lang/Math", as_floor, once "(D)D")
            ca.opcode_invokestatic(idx, 0)
         elseif as_force_to_integer_16 = name then
            jvm.push_target
            inspect
               real_bit_count
            when 32 then
               ca.opcode_f2i
            when 64 then
               ca.opcode_d2i
            end
            ca.opcode_i2s
         elseif as_force_to_integer_32 = name then
            jvm.push_target
            inspect
               real_bit_count
            when 32 then
               ca.opcode_f2i
            when 64 then
               ca.opcode_d2i
            end
         elseif as_force_to_integer_64 = name then
            jvm.push_target
            inspect
               real_bit_count
            when 32 then
               ca.opcode_f2l
            when 64 then
               ca.opcode_d2l
            end
         else
            -- Same name in java/lang/Math :
            jvm.push_target
            idx := constant_pool.idx_methodref3(once "java/lang/Math", name, once "(D)D")
            ca.opcode_invokestatic(idx, 0)
         end
      end

   c_mapping_real (ct: TYPE_MARK; name: STRING; arg_count: INTEGER) is
      require
         ct.is_real
         arg_count = 0 or arg_count = 1
      local
         real_type_mark: REAL_TYPE_MARK
      do
         real_type_mark ::= ct
         if as_force_to_real_32 = name then
            cpp.pending_c_function_body.append(once "((real32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_real_64 = name then
            cpp.pending_c_function_body.append(once "((real64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_integer_16 = name then
            cpp.pending_c_function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_integer_32 = name then
            cpp.pending_c_function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_integer_64 = name then
            cpp.pending_c_function_body.append(once "((int64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_natural_16 = name then
            cpp.pending_c_function_body.append(once "((uint16_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_natural_32 = name then
            cpp.pending_c_function_body.append(once "((uint32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_natural_64 = name then
            cpp.pending_c_function_body.append(once "((uint64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_ceiling = name then
            system_tools.add_lib_math
            inspect
               real_type_mark.bit_count
            when 32 then
               cpp.pending_c_function_body.append(once "ceilf")
            when 64 then
               cpp.pending_c_function_body.append(once "ceil")
            else
               cpp.pending_c_function_body.append(once "ceill")
            end
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_rounded = name then
            system_tools.add_lib_math
            inspect
               real_type_mark.bit_count
            when 32 then
               cpp.pending_c_function_body.append(once "floorf((")
            when 64 then
               cpp.pending_c_function_body.append(once "floor((")
            else
               cpp.pending_c_function_body.append(once "floorl((")
            end
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")+.5)")
         elseif as_is_not_a_number = name then
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(once "isnan")
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_is_infinity = name then
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(once "isinf")
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_is_normal = name then
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(once "isnormal")
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_is_subnormal = name then
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(once "fpclassify(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")==FP_SUBNORMAL")
         elseif as_pow = name then
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(once "pow((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "),(double)(")
            cpp.put_arguments(1)
            cpp.pending_c_function_body.append(once "))")
         elseif name.count <= 2 and then arg_count = 1 then
            -- + - * < <= > >=
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
            cpp.pending_c_function_body.append(name)
            cpp.pending_c_function_body.extend('(')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif arg_count = 0 and then name.count = 1 then
            -- unary + -
            cpp.pending_c_function_body.append(name)
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif arg_count = 0 then
            -- General scheme with the ANSI C name convention:
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(name)
            inspect
               real_type_mark.bit_count
            when 32 then
               cpp.pending_c_function_body.extend('f')
            when 64 then
            else
               cpp.pending_c_function_body.extend('l')
            end
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         else
            check
               arg_count = 1
               name.is_equal(once "atan2") or else name.is_equal(once "pow")
            end
            -- General scheme with the ANSI C name convention:
            system_tools.add_lib_math
            cpp.pending_c_function_body.append(name)
            inspect
               real_type_mark.bit_count
            when 32 then
               cpp.pending_c_function_body.extend('f')
            when 64 then
            else
               cpp.pending_c_function_body.extend('l')
            end
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(',')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         end
      end

   c_mapping_integer_function (type_of_current: TYPE; rf8: RUN_FEATURE_8; name: STRING) is
      require
         type_of_current.is_integer
      local
         integer_type_mark: INTEGER_TYPE_MARK; integer_bit_count: INTEGER
      do
         integer_type_mark ::= type_of_current.canonical_type_mark
         integer_bit_count := integer_type_mark.bit_count
         if as_force_to_real_32 = name then
            cpp.pending_c_function_body.append(once "((real32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_force_to_real_64 = name then
            cpp.pending_c_function_body.append(once "((real64_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_bit_shift_right = name then
            cpp.pending_c_function_body.append(once "((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")>>(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))")
         elseif as_bit_shift_right_unsigned = name then
            cpp.pending_c_function_body.append(once "((int")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((uint")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")>>(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")))")
         elseif as_bit_shift_left = name then
            cpp.pending_c_function_body.append(once "((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")<<(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))")
         elseif as_bit_rotate = name then
            cpp.pending_c_function_body.append(once "((int")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))>>(")
            (integer_bit_count - 1).append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "&(")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "+(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))))|((")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ")<<(")
            (integer_bit_count - 1).append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "&(")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "-(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))))))")
         elseif as_bit_rotate_right = name then
            cpp.pending_c_function_body.append(once "(int")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ">>")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))|(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "<<(")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('-')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")))")
         elseif as_bit_rotate_left = name then
            cpp.pending_c_function_body.append(once "(int")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once ">>(")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('-')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ")))|(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "<<")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "))")
         elseif as_bit_and = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('&')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_or = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('|')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_xor = name then
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('^')
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.extend(')')
         elseif as_bit_not = name then
            cpp.pending_c_function_body.append(once "~(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         elseif as_low_8 = name then
            cpp.pending_c_function_body.append(once "((int8_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_low_16 = name then
            cpp.pending_c_function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif as_low_32 = name then
            cpp.pending_c_function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif rf8.arg_count = 0 and then as_sharp_minus = name then
            cpp.pending_c_function_body.append(once "(int")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)-((uint")
            integer_bit_count.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "_t)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         elseif rf8.arg_count = 1 then
            if as_slash = name then
               cpp.pending_c_function_body.append(once "((T5)(")
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once "))/(")
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.append(once ")")
            elseif as_sharp_plus = name then
               c_modular_computation(integer_bit_count, '+')
            elseif as_sharp_minus = name then
               c_modular_computation(integer_bit_count, '-')
            elseif as_sharp_muls = name then
               c_modular_computation(integer_bit_count, '*')
            else
               cpp.pending_c_function_body.append(once "((int")
               integer_bit_count.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "_t)(")
               cpp.put_target_as_value
               cpp.pending_c_function_body.append(once "))")
               if as_sharp_slash_slash = name then
                  cpp.pending_c_function_body.extend('/')
               elseif as_sharp_backslash_backslash = name then
                  cpp.pending_c_function_body.extend('%%')
               else
                  cpp.pending_c_function_body.append(name)
               end
               cpp.pending_c_function_body.extend('(')
               cpp.put_ith_argument(1)
               cpp.pending_c_function_body.extend(')')
            end
         elseif as_to_character = name then
            cpp.pending_c_function_body.append(once "((T3)(")
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "))")
         else
            cpp.pending_c_function_body.append(name)
            cpp.pending_c_function_body.extend('(')
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend(')')
         end
      end

   c_modular_computation (integer_bit_count: INTEGER; operator: CHARACTER) is
      do
         cpp.pending_c_function_body.append(once "(int")
         integer_bit_count.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "_t)(((uint")
         integer_bit_count.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "_t)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "))")
         cpp.pending_c_function_body.extend(operator)
         cpp.pending_c_function_body.append(once "((uint")
         integer_bit_count.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "_t)(")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once ")))")
      end

   c_mapping_integer_procedure (rf7: RUN_FEATURE_7; name: STRING) is
      do
         if as_bit_put = name then
            cpp.pending_c_function_body.append(once "if(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "){%N")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('=')
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "|(1<<")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once ");%N}%Nelse{%N")
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('=')
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "&(~(1<<")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "));%N}")
         elseif as_bit_set = name then
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('=')
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "|(1<<")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once ");%N")
         elseif as_bit_clear = name then
            cpp.put_target_as_value
            cpp.pending_c_function_body.extend('=')
            cpp.put_target_as_value
            cpp.pending_c_function_body.append(once "&(~(1<<")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "));%N")
         end
      end

   fe_nyi (rf: RUN_FEATURE) is
      do
         error_handler.add_position(rf.start_position)
         error_handler.append("Sorry, but this feature is not yet implemented for Current type ")
         error_handler.append(rf.type_of_current.name.to_string)
         error_handler.append(".")
         error_handler.print_as_fatal_error
      end

   expanded_initializer (tm: TYPE): BOOLEAN is
      do
         if tm.is_user_expanded then
            Result := tm.live_type.default_create_run_feature /= Void
         end
      end

end -- class NATIVE_BUILT_IN
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
