-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_NATIVE_FUNCTION_MAPPER

inherit
   NATIVE_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   compile (a_rf8: RUN_FEATURE_8)
      require
         rf8_does_need_c_wrapper(a_rf8)
      local
         old_rf8: like rf8
         old_toc: like type_of_current
         old_bcn: like bcn
         old_name: like name
      do
         old_rf8 := rf8
         old_toc := type_of_current
         old_bcn := bcn
         old_name := name

         rf8 := a_rf8
         type_of_current := a_rf8.type_of_current
         bcn := a_rf8.base_feature.class_text.name.to_string
         name := a_rf8.base_feature.first_name.to_string
         a_rf8.base_feature.native.accept(Current)

         rf8 := old_rf8
         type_of_current := old_toc
         bcn := old_bcn
         name := old_name
      end

feature {}
   rf8: RUN_FEATURE_8
   type_of_current: TYPE
   bcn, name: STRING

feature {NATIVE_BUILT_IN}
   visit_native_built_in (visited: NATIVE_BUILT_IN)
      local
         cbd, cda: BOOLEAN; live_type_of_current: LIVE_TYPE; copy_run_feature: RUN_FEATURE
         i, id: INTEGER
      do
         live_type_of_current := type_of_current.live_type
         if name.has_prefix(once "basic_") then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               function_body.extend(',')
            end
            function_body.append(name)
            if rf8.arguments /= Void then
               function_body.extend('(')
               cpp.put_arguments(rf8.arguments.count)
               function_body.extend(')')
            end
            if cbd then
               function_body.extend(')')
            end
         elseif as_to_integer_8 = name then
            function_body.append(once "((int8_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_integer_16 = name then
            function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_integer_32 = name then
            function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_integer_64 = name then
            function_body.append(once "((int64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_natural_8 = name then
            function_body.append(once "((uint8_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_natural_16 = name then
            function_body.append(once "((uint16_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_natural_32 = name then
            function_body.append(once "((uint32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_to_natural_64 = name then
            function_body.append(once "((uint64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_platform = bcn then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               function_body.extend(',')
            end
            function_body.append(once "EIF_")
            from
               i := name.lower
            until
               i > name.upper
            loop
               function_body.extend(name.item(i).to_upper)
               i := i + 1
            end
            if cbd then
               function_body.extend(')')
            end
         elseif as_generating_type = name then
            cpp.put_target_generating_type(type_of_current)
         elseif as_generator = name then
            cpp.put_target_generator(type_of_current)
         elseif as_same_dynamic_type = name then
            function_body.append(once "/* same_dynamic_type */%N")
            if type_of_current.is_reference and then type_of_current.live_type.is_tagged then
               function_body.append(once "((")
               if ace.no_check then
                  function_body.append(once "(vc(")
               end
               function_body.append(once "((T0*)(")
               cpp.put_target_as_value
               function_body.append(once "))")
               if ace.no_check then
                  function_body.append(once ",0))")
               end
               function_body.append(once "->id)==(")
               if ace.no_check then
                  function_body.append(once "(vc(")
               end
               function_body.append(once "((T0*)(")
               cpp.put_ith_argument(1)
               function_body.append(once "))")
               if ace.no_check then
                  function_body.append(once ",0))")
               end
               function_body.append(once "->id))")
            else
               -- Statically known:
               cda := cpp.cannot_drop_all
               if cda then
                  function_body.extend(',')
               end
               function_body.extend('1')
               if cda then
                  function_body.extend(')')
               end
            end
         elseif as_to_pointer = name then
            if type_of_current.is_expanded and then not type_of_current.is_native_array then
               error_handler.add_position(rf8.start_position)
               error_handler.append(once "Invalid usage of feature `to_pointer' of class ANY. %
                                         %(The target which is of type ")
               error_handler.append(type_of_current.name.to_string)
               error_handler.append(once " cannot be converted to a memory address.)")
               cpp.target_position_in_error_handler
               error_handler.print_as_error
               function_body.append(once ",NULL")
            end
            function_body.append(once "((void*)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_object_size = name then
            cpp.put_object_size(type_of_current)
         elseif as_is_equal = name or else as_standard_is_equal = name then
            if type_of_current.is_kernel_expanded or else type_of_current.is_native_array then
               function_body.extend('(')
               cpp.put_target_as_value
               function_body.append(once ")==(")
               cpp.put_ith_argument(1)
               function_body.extend(')')
            elseif type_of_current.is_agent then
               function_body.append(once "(((se_agent*)C)->u0.eq==((se_agent*)a1)->u0.eq)&&(((se_agent*)C)->u0.eq((se_agent*)C,(se_agent*)a1))")
            elseif live_type_of_current.is_tagged then
               function_body.append(once "((T6)((C->id==a1->id)?!memcmp(C,a1,sizeof(*C/*")
               function_body.append(live_type_of_current.structure_signature)
               function_body.append(once "*/)):0))")
            elseif live_type_of_current.writable_attributes = Void then
               if ace.boost then
                  cbd := cpp.cannot_drop_all
                  if cbd then
                     function_body.extend(',')
                  end
                  function_body.extend('1')
                  if cbd then
                     function_body.extend(')')
                  end
               else
                  function_body.extend('1')
               end
            elseif type_of_current.is_user_expanded or else not ace.boost then
               function_body.append(once "(T6)!memcmp(C,&a1,sizeof(T")
               type_of_current.id.append_in(function_body)
               function_body.append(once ")/*")
               function_body.append(live_type_of_current.structure_signature)
               function_body.append(once "*/)")
            else
               function_body.append(once "!memcmp(")
               cpp.put_target_as_target(type_of_current)
               function_body.extend(',')
               if type_of_current.is_user_expanded then
                  function_body.extend('&')
               end
               function_body.extend('(')
               cpp.put_ith_argument(1)
               function_body.append(once "),sizeof(T")
               live_type_of_current.id.append_in(function_body)
               function_body.append(once ")/*")
               function_body.append(live_type_of_current.structure_signature)
               function_body.append(once "*/)")
            end
         elseif as_standard_twin = name then
            c_mapping_standard_twin
         elseif as_twin = name then
            copy_run_feature := live_type_of_current.copy_run_feature
            if {RUN_FEATURE_7} ?:= copy_run_feature then -- *** WRONG! fails if `twin' is redefined as another external
               c_mapping_standard_twin
            else
               if live_type_of_current.is_reference then
                  id := live_type_of_current.id
                  function_body.append(once "(void*)")
                  cpp.memory.malloc(live_type_of_current)
                  function_body.append(once ";%N*((T")
                  id.append_in(function_body)
                  function_body.append(once "*)R)=M")
                  id.append_in(function_body)
                  function_body.append(once ";%N")
               else
                  check
                     function_body.has_suffix(once "R=")
                  end
                  function_body.remove_tail(2)
               end
               cpp.inside_twin(live_type_of_current.type, copy_run_feature)
               if function_body.has_suffix(once ";%N") then
                  function_body.remove_tail(2)
               end
            end
         elseif as_deep_twin = name then
            if type_of_current.is_kernel_expanded then
               cpp.put_target_as_target(type_of_current)
            elseif type_of_current.is_native_array then
               error_handler.add_type_mark(type_of_current.canonical_type_mark)
               error_handler.add_position(visited.start_position)
               error_handler.append(fz_dtideena)
               error_handler.print_as_warning
               function_body.append(once "NULL")
               if ace.no_check then
                  function_body.append(once ";%Nerror0(%"Invalid deep_twin.%",NULL)")
               end
            elseif type_of_current.is_empty_expanded then
               cpp.put_target_as_target(type_of_current)
            else
               check
                  function_body.has_suffix(once "R=")
               end
               function_body.remove_tail(2)
               c_deep_twin_body(live_type_of_current)
            end
         elseif as_is_deep_equal = name then
            if type_of_current.is_kernel_expanded then
               function_body.append(once "(T6)(C==a1)")
            elseif type_of_current.is_empty_expanded then
               function_body.extend('1')
            elseif type_of_current.is_native_array then
               error_handler.add_type_mark(type_of_current.canonical_type_mark)
               error_handler.add_position(type_of_current.canonical_type_mark.start_position)
               error_handler.append(fz_dtideena)
               error_handler.print_as_warning
               if ace.boost then
                  function_body.extend('0')
               else
                  function_body.append(once "0;%Nerror0(%"Invalid is_deep_equal.%",NULL)")
               end
            else
               check
                  function_body.has_suffix(once "R=")
               end
               function_body.remove_tail(2)
               is_deep_equal_c_code(live_type_of_current)
            end
         elseif as_is_basic_expanded_type = name then
            cbd := cpp.cannot_drop_all
            if cbd then
               function_body.extend(',')
            end
            if type_of_current.is_kernel_expanded then
               function_body.extend('1')
            else
               function_body.extend('0')
            end
            if cbd then
               function_body.extend(')')
            end
         elseif as_se_argc = name then
            function_body.append(as_se_argc)
         elseif as_se_argv = name then
            function_body.append(once "((T0*)se_string(")
            if ace.no_check then
               function_body.append(once "&ds,")
            end
            if ace.profile then
               function_body.append(once "&local_profile,")
            end
            function_body.append(once "strlen(se_argv[")
            cpp.put_ith_argument(1)
            function_body.append(once "]), se_argv[")
            cpp.put_ith_argument(1)
            function_body.append(once "]))")
         elseif as_native_array = bcn then
            c_mapping_native_array_function
         elseif type_of_current.is_real then
            c_mapping_real
         elseif as_boolean = bcn then
            if as_implies = name then
               function_body.append(once "(T6)((!(")
               cpp.put_target_as_value
               function_body.append(once "))||(")
               cpp.put_ith_argument(1)
               function_body.append(once "))")
            else
               check
                  rf8.arg_count = 1
               end
               function_body.append(once "(T6)((")
               cpp.put_target_as_value
               if as_or_else = name then
                  function_body.append(once ")||(")
               else
                  check
                     as_and_then = name
                  end
                  function_body.append(once ")&&(")
               end
               cpp.put_ith_argument(1)
               function_body.append(once "))")
            end
         elseif as_character = bcn then
            function_body.append(once "T3")
            function_body.append(name)
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_pointer = bcn then
            check
               as_is_not_null = name
            end
            function_body.append(once "(NULL!=")
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_weak_reference = bcn then
            if as_item = name then
               cpp.memory.weak_item(live_type_of_current)
            else
               echo.w_put_string(once "Unknown WEAK_REFERENCE built-in: ")
               echo.w_put_line(name)
               not_yet_implemented
            end
         elseif as_exception = name then
            function_body.append(once "internal_exception_number")
         elseif as_signal_number = name then
            function_body.append(once "signal_exception_number")
         elseif as_collecting = name then
            cpp.memory.gc_is_collecting
         elseif as_collector_counter = name then
            cpp.memory.gc_counter
         elseif as_allocated_bytes = name then
            cpp.memory.gc_allocated_bytes
         elseif type_of_current.is_integer then
            c_mapping_integer_function
         elseif type_of_current.is_natural then
            c_mapping_natural_function
         elseif as_as_16_ne = name then
            function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N(")
            cpp.put_ith_argument(2)
            function_body.append(once "<<8)|((uint16_t)")
            cpp.put_ith_argument(1)
            function_body.append(once ")%N#else%N(")
            cpp.put_ith_argument(1)
            function_body.append(once "<<8)|((uint16_t)")
            cpp.put_ith_argument(2)
            function_body.append(once ")%N#endif%N")
         elseif as_as_32_ne = name then
            function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N(")
            cpp.put_ith_argument(2)
            function_body.append(once "<<16)|((uint32_t)")
            cpp.put_ith_argument(1)
            function_body.append(once ")%N#else%N(")
            cpp.put_ith_argument(1)
            function_body.append(once "<<16)|((uint32_t)")
            cpp.put_ith_argument(2)
            function_body.append(once ")%N#endif%N")
         elseif as_to_internals = name then
            check
               as_typed_internals = bcn
            end
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               function_body.extend(',')
            end
            function_body.append(once "NULL")
            if cbd then
               function_body.extend(')')
            end
         elseif as_thread_lock = bcn then
            if as_is_locked = name then
               function_body.append(once "se_thread_lock_is_locked((")
               cpp.put_target_as_target(type_of_current)
               function_body.append(once ")->_native_data)")
            elseif as_timed_wait = name then
               function_body.append(once "se_thread_lock_timed_wait((")
               cpp.put_target_as_target(type_of_current)
               function_body.append(once ")->_native_data)")
            end
         else
            echo.w_put_string(once "Unknown ")
            echo.w_put_string(bcn)
            echo.w_put_string(once " built-in: ")
            echo.w_put_line(name)
            not_yet_implemented
         end
      end

feature {NATIVE_C_PLUS_PLUS}
   visit_native_c_plus_plus (visited: NATIVE_C_PLUS_PLUS)
      do
         if not cpp.c_plus_plus_registered(visited) then
            extra_c_prototype(visited.external_tag.start_position, type_of_current, rf8.base_feature)
            cpp.c_plus_plus_register(visited, rf8)
         end
         wrapped_external_call_in(visited, function_body, rf8.base_feature, rf8.arg_count)
      end

feature {NATIVE_C}
   visit_native_c (visited: NATIVE_C)
      do
         visited.parse_external_tag
         if visited.need_prototype and then not cpp.c_registered(visited) then
            cpp.c_register(visited, rf8)
            extra_c_prototype(visited.start_position, type_of_current, rf8.base_feature)
         end
         mapping_c(visited, rf8.base_feature, cpp.native_need_wrapper.for_rf8(rf8), True, rf8.arg_count)
      end

feature {NATIVE_PLUG_IN}
   visit_native_plug_in (visited: NATIVE_PLUG_IN)
      do
         mapping_plug_in(visited, rf8.arguments)
      end

feature {}
   extra_c_prototype (position: POSITION; context_type: TYPE; er: EXTERNAL_ROUTINE)
      do
         extra_c_prototype_in_cpp_out_h_buffer(position, context_type, er)
         out_h.append(once ";%N")
         out_c.copy(out_h)
         cpp.write_out_h_buffer
         cpp.write_out_c_buffer
      end

   mapping_c (visited: NATIVE_C; er: EXTERNAL_ROUTINE; wrapped, is_function: BOOLEAN; arg_count: INTEGER)
         -- Where `wrapped' means that the code is wrapped inside some function (-no_check mode).
      local
         tcbd, stop: BOOLEAN; p: POSITION; c_code, arg: STRING; cc: CHARACTER; i, arg_idx: INTEGER
      do
         p := visited.start_position
         if visited.signature /= Void and then visited.signature.upper /= arg_count then
            visited.bad_external("Bad number of arguments of external signature.")
         end
         if not wrapped then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               function_body.extend(',')
            end
         end
         if visited.struct /= Void then
            if visited.access_mode = visited.set_access then
               if is_function or else arg_count /= 2 then
                  error_handler.add_position(er.start_position)
                  visited.bad_external("Bad prototype for C struture set external.")
               end
            elseif visited.access_mode = visited.get_access then
               if not is_function or else arg_count /= 1 then
                  error_handler.add_position(er.start_position)
                  visited.bad_external("Bad prototype for C struture get external.")
               end
            end
            function_body.append(once "(((")
            function_body.append(visited.struct)
            function_body.append(once "*)")
            if wrapped then
               function_body.append(as_a1)
            else
               cpp.put_ith_argument(1)
            end
            function_body.append(once ")->")
            function_body.append(visited.access)
            function_body.extend(')')
            if not is_function then
               function_body.append(once "=(")
               if visited.type /= Void then
                  function_body.extend('(')
                  function_body.append(visited.type)
                  function_body.extend(')')
               end
               if wrapped then
                  function_body.append(once "a2")
               else
                  cpp.put_ith_argument(2)
               end
               function_body.extend(')')
            end
         elseif visited.c_inline then
            from
               c_code := er.external_name
               i := 1
            until
               i > c_code.count
            loop
               cc := c_code.item(i)
               if cc /= '$' then
                  function_body.extend(cc)
               else
                  from
                     i := i + 1
                     arg := once "local buffer..."
                     arg.clear_count
                     stop := i > c_code.count
                  until
                     stop
                  loop
                     cc := c_code.item(i)
                     inspect
                        cc
                     when 'a' .. 'z', 'A' .. 'Z', '0' .. '9', '_' then
                        arg.extend(cc)
                        i := i + 1
                        stop := i > c_code.count
                     else
                        stop := True
                        i := i - 1
                     end
                  end
                  arg := string_aliaser.string(arg)
                  arg_idx := er.argument_rank_of(arg)
                  if arg_idx > 0 then
                     if wrapped then
                        function_body.extend('a')
                        arg_idx.append_in(function_body)
                     else
                        cpp.put_ith_argument(arg_idx)
                     end
                  else
                     error_handler.add_position(er.start_position)
                     error_handler.add_position(visited.start_position)
                     error_handler.append(once "Unknown %"$")
                     error_handler.append(arg)
                     error_handler.append(once "%" argument in external C inline definition.")
                     error_handler.print_as_fatal_error
                  end
               end
               i := i + 1
            end
         else
            function_body.append(er.external_name)
            if arg_count > 0 then
               function_body.extend('(')
               from
                  i := 1
               until
                  i > arg_count
               loop
                  if visited.signature /= Void then
                     function_body.append(once "((")
                     function_body.append(visited.signature.item(i))
                     function_body.extend(')')
                  end
                  if wrapped then
                     function_body.extend('a')
                     i.append_in(function_body)
                  else
                     cpp.put_ith_argument(i)
                  end
                  if visited.signature /= Void then
                     function_body.extend(')')
                  end
                  i := i + 1
                  if i <= arg_count then
                     function_body.extend(',')
                  end
               end
               function_body.extend(')')
            elseif not visited.macro then
               function_body.append(once "()")
            end
         end
         if not wrapped then
            if tcbd then
               function_body.extend(')')
            end
            if not is_function then
               function_body.extend(';')
            end
         end
         function_body.extend('%N')
         cpp.put_position_comment(p)
      end

   mapping_plug_in (plugin: NATIVE_PLUG_IN; arguments: FORMAL_ARG_LIST)
      local
         cbd: BOOLEAN
      do
         cbd := cpp.target_cannot_be_dropped
         if cbd then
            function_body.extend(',')
         end
         function_body.append(plugin.feature_name)
         if arguments /= Void then
            function_body.extend('(')
            cpp.put_arguments(arguments.count)
            function_body.extend(')')
         end
         if cbd then
            function_body.extend(')')
         end
      end

feature {} -- built-ins
   c_mapping_standard_twin
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
                  function_body.has_suffix(once "R=")
               end
               function_body.remove_tail(2)
               function_body.append(once "memcpy(&R,C,sizeof(R")
               function_body.append(once ")/*")
               function_body.append(type_of_current.live_type.structure_signature)
               function_body.append(once "*/)")
            end
         else
            function_body.append(once "((void*)")
            cpp.memory.malloc(type_of_current.live_type)
            function_body.append(once ");%N*((T")
            type_of_current.id.append_in(function_body)
            function_body.append(once "*)R)=*C")
         end
      end

   c_mapping_native_array_function
      local
         elt_type: TYPE; tcbd: BOOLEAN
      do
         elt_type := type_of_current.generic_list.first
         if as_element_sizeof = name then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               function_body.extend(',')
            end
            function_body.append(once "sizeof(")
            function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
            function_body.append(once "/*")
            function_body.append(elt_type.live_type.structure_signature)
            function_body.append(once "*/)")
            if tcbd then
               function_body.extend(')')
            end
         elseif as_calloc = name then
            if expanded_initializer(elt_type) then
               cpp.memory.calloc(type_of_current.live_type, agent do function_body.append(once "a1") end)
               function_body.append(once ";%Nr")
               type_of_current.id.append_in(function_body)
               function_body.append(once "clear_all(")
               if ace.no_check then
                  function_body.append(once "&ds,")
               end
               if ace.profile then
                  function_body.append(once "&local_profile,")
               end
               function_body.append(once "R,a1-1);%N")
            else
               tcbd := cpp.target_cannot_be_dropped
               if tcbd then
                  function_body.extend(',')
               end
               cpp.memory.calloc(type_of_current.live_type, agent cpp.put_ith_argument(1))
               if tcbd then
                  function_body.extend(')')
               end
            end
         elseif as_from_pointer = name then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               function_body.extend(',')
            end
            cpp.put_ith_argument(1)
            if tcbd then
               function_body.extend(')')
            end
         elseif as_item = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.append(once ")[")
            cpp.put_ith_argument(1)
            function_body.extend(']')
         else
            error_handler.append(once "Class NATIVE_ARRAY has been tampered with. Unknown function: ")
            error_handler.append(name)
            error_handler.print_as_fatal_error
         end
      end

   c_mapping_real
      require
         type_of_current.is_real
         rf8.arg_count = 0 or rf8.arg_count = 1
      local
         real_type_mark: REAL_TYPE_MARK
      do
         real_type_mark ::= type_of_current.canonical_type_mark
         if as_force_to_real_32 = name then
            function_body.append(once "((real32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_real_64 = name then
            function_body.append(once "((real64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_integer_16 = name then
            function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_integer_32 = name then
            function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_integer_64 = name then
            function_body.append(once "((int64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_natural_16 = name then
            function_body.append(once "((uint16_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_natural_32 = name then
            function_body.append(once "((uint32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_natural_64 = name then
            function_body.append(once "((uint64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_ceiling = name then
            system_tools.add_lib_math
            inspect
               real_type_mark.bit_count
            when 32 then
               function_body.append(once "ceilf")
            when 64 then
               function_body.append(once "ceil")
            else
               function_body.append(once "ceill")
            end
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_rounded = name then
            system_tools.add_lib_math
            inspect
               real_type_mark.bit_count
            when 32 then
               function_body.append(once "floorf((")
            when 64 then
               function_body.append(once "floor((")
            else
               function_body.append(once "floorl((")
            end
            cpp.put_target_as_value
            function_body.append(once ")+.5)")
         elseif as_is_not_a_number = name then
            system_tools.add_lib_math
            function_body.append(once "isnan")
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_is_infinity = name then
            system_tools.add_lib_math
            function_body.append(once "isinf")
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_is_normal = name then
            system_tools.add_lib_math
            function_body.append(once "isnormal")
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_is_subnormal = name then
            system_tools.add_lib_math
            function_body.append(once "fpclassify(")
            cpp.put_target_as_value
            function_body.append(once ")==FP_SUBNORMAL")
         elseif as_pow = name then
            system_tools.add_lib_math
            function_body.append(once "pow((")
            cpp.put_target_as_value
            function_body.append(once "),(double)(")
            cpp.put_arguments(1)
            function_body.append(once "))")
         elseif name.count <= 2 and then rf8.arg_count = 1 then
            -- + - * < <= > >=
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
            function_body.append(name)
            function_body.extend('(')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif rf8.arg_count = 0 and then name.count = 1 then
            -- unary + -
            function_body.append(name)
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         elseif rf8.arg_count = 0 then
            -- General scheme with the ANSI C name convention:
            system_tools.add_lib_math
            function_body.append(name)
            inspect
               real_type_mark.bit_count
            when 32 then
               function_body.extend('f')
            when 64 then
            else
               function_body.extend('l')
            end
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         else
            check
               rf8.arg_count = 1
               name.is_equal(once "atan2") or else name.is_equal(once "pow")
            end
            -- General scheme with the ANSI C name convention:
            system_tools.add_lib_math
            function_body.append(name)
            inspect
               real_type_mark.bit_count
            when 32 then
               function_body.extend('f')
            when 64 then
            else
               function_body.extend('l')
            end
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(',')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         end
      end

   c_mapping_integer_function
      require
         type_of_current.is_integer
      local
         integer_type_mark: INTEGER_TYPE_MARK; integer_bit_count: INTEGER
      do
         integer_type_mark ::= type_of_current.canonical_type_mark
         integer_bit_count := integer_type_mark.bit_count
         if as_force_to_real_32 = name then
            function_body.append(once "((real32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_force_to_real_64 = name then
            function_body.append(once "((real64_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_bit_shift_right = name then
            function_body.append(once "((")
            cpp.put_target_as_value
            function_body.append(once ")>>(")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_shift_right_unsigned = name then
            function_body.append(once "((int")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)((uint")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)(")
            cpp.put_target_as_value
            function_body.append(once ")>>(")
            cpp.put_ith_argument(1)
            function_body.append(once ")))")
         elseif as_bit_shift_left = name then
            function_body.append(once "((")
            cpp.put_target_as_value
            function_body.append(once ")<<(")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_rotate = name then
            function_body.append(once "((int")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)(")
            cpp.put_target_as_value
            function_body.append(once "))>>(")
            (integer_bit_count - 1).append_in(function_body)
            function_body.append(once "&(")
            integer_bit_count.append_in(function_body)
            function_body.append(once "+(")
            cpp.put_ith_argument(1)
            function_body.append(once "))))|((")
            cpp.put_target_as_value
            function_body.append(once ")<<(")
            (integer_bit_count - 1).append_in(function_body)
            function_body.append(once "&(")
            integer_bit_count.append_in(function_body)
            function_body.append(once "-(")
            cpp.put_ith_argument(1)
            function_body.append(once "))))))")
         elseif as_bit_rotate_right = name then
            function_body.append(once "(int")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once ">>")
            cpp.put_ith_argument(1)
            function_body.append(once "))|(")
            cpp.put_target_as_value
            function_body.append(once "<<(")
            integer_bit_count.append_in(function_body)
            function_body.extend('-')
            cpp.put_ith_argument(1)
            function_body.append(once ")))")
         elseif as_bit_rotate_left = name then
            function_body.append(once "(int")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once ">>(")
            integer_bit_count.append_in(function_body)
            function_body.extend('-')
            cpp.put_ith_argument(1)
            function_body.append(once ")))|(")
            cpp.put_target_as_value
            function_body.append(once "<<")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_and = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('&')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif as_bit_or = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('|')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif as_bit_xor = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('^')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif as_bit_not = name then
            function_body.append(once "~(")
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_low_8 = name then
            function_body.append(once "((int8_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_low_16 = name then
            function_body.append(once "((int16_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif as_low_32 = name then
            function_body.append(once "((int32_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif rf8.arg_count = 0 and then as_sharp_minus = name then
            function_body.append(once "(int")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)-((uint")
            integer_bit_count.append_in(function_body)
            function_body.append(once "_t)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         elseif rf8.arg_count = 1 then
            if as_slash = name then
               function_body.append(once "((T5)(")
               cpp.put_target_as_value
               function_body.append(once "))/(")
               cpp.put_ith_argument(1)
               function_body.append(once ")")
            elseif as_sharp_plus = name then
               c_modular_computation(integer_bit_count, '+')
            elseif as_sharp_minus = name then
               c_modular_computation(integer_bit_count, '-')
            elseif as_sharp_muls = name then
               c_modular_computation(integer_bit_count, '*')
            else
               function_body.append(once "((int")
               integer_bit_count.append_in(function_body)
               function_body.append(once "_t)(")
               cpp.put_target_as_value
               function_body.append(once "))")
               if as_sharp_slash_slash = name then
                  function_body.extend('/')
               elseif as_sharp_backslash_backslash = name then
                  function_body.extend('%%')
               else
                  function_body.append(name)
               end
               function_body.extend('(')
               cpp.put_ith_argument(1)
               function_body.extend(')')
            end
         elseif as_to_character = name then
            function_body.append(once "((T3)(")
            cpp.put_target_as_value
            function_body.append(once "))")
         else
            function_body.append(name)
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend(')')
         end
      end

   c_modular_computation (integer_bit_count: INTEGER; operator: CHARACTER)
      do
         function_body.append(once "(int")
         integer_bit_count.append_in(function_body)
         function_body.append(once "_t)(((uint")
         integer_bit_count.append_in(function_body)
         function_body.append(once "_t)(")
         cpp.put_target_as_value
         function_body.append(once "))")
         function_body.extend(operator)
         function_body.append(once "((uint")
         integer_bit_count.append_in(function_body)
         function_body.append(once "_t)(")
         cpp.put_ith_argument(1)
         function_body.append(once ")))")
      end

   c_mapping_natural_function
      require
         type_of_current.is_natural
      local
         natural_type_mark: NATURAL_TYPE_MARK; bit_count: INTEGER
      do
         natural_type_mark ::= type_of_current.canonical_type_mark
         bit_count := natural_type_mark.bit_count
         if as_bit_rotate_right = name then
            function_body.append(once "(uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once ">>")
            cpp.put_ith_argument(1)
            function_body.append(once "))|(")
            cpp.put_target_as_value
            function_body.append(once "<<(")
            bit_count.append_in(function_body)
            function_body.extend('-')
            cpp.put_ith_argument(1)
            function_body.append(once ")))")
         elseif as_bit_rotate_left = name then
            function_body.append(once "(uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once ">>(")
            bit_count.append_in(function_body)
            function_body.extend('-')
            cpp.put_ith_argument(1)
            function_body.append(once ")))|(")
            cpp.put_target_as_value
            function_body.append(once "<<")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_shift_right = name then
            function_body.append(once "(uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once ">>(")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_shift_left = name then
            function_body.append(once "(uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)")
            cpp.put_target_as_value
            function_body.append(once "<<(")
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         elseif as_bit_rotate = name then
            function_body.append(once "((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)((((uint")
            bit_count.append_in(function_body)
            function_body.append(once "_t)(")
            cpp.put_target_as_value
            function_body.append(once "))>>(")
            (bit_count - 1).append_in(function_body)
            function_body.append(once "&(")
            bit_count.append_in(function_body)
            function_body.append(once "+(")
            cpp.put_ith_argument(1)
            function_body.append(once "))))|((")
            cpp.put_target_as_value
            function_body.append(once ")<<(")
            (bit_count - 1).append_in(function_body)
            function_body.append(once "&(")
            bit_count.append_in(function_body)
            function_body.append(once "-(")
            cpp.put_ith_argument(1)
            function_body.append(once "))))))")
         elseif as_bit_not = name then
            function_body.append(once "~(")
            cpp.put_target_as_value
            function_body.extend(')')
         elseif as_bit_and = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('&')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif as_bit_or = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('|')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         elseif as_bit_xor = name then
            function_body.extend('(')
            cpp.put_target_as_value
            function_body.extend('^')
            cpp.put_ith_argument(1)
            function_body.extend(')')
         else
            -- Well, that can be only some usual infix:
            function_body.append(once "((")
            cpp.put_target_as_value
            function_body.extend(')')
            if as_slash_slash = name or else as_sharp_slash_slash = name then
               function_body.extend('/')
            elseif as_backslash_backslash = name or else as_sharp_backslash_backslash = name then
               function_body.extend('%%')
            elseif as_sharp_plus = name then
               function_body.extend('+')
            elseif as_sharp_minus = name then
               function_body.extend('-')
            elseif as_sharp_muls = name then
               function_body.extend('*')
            else
               function_body.append(name)
            end
            function_body.extend('(')
            cpp.put_ith_argument(1)
            function_body.append(once "))")
         end
      end

   c_deep_twin_body (live_type: LIVE_TYPE)
      require
         cpp.pending_c_function
         live_type.at_run_time
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2; lt: LIVE_TYPE; tm: TYPE_MARK
         field_name: STRING; rts: RUN_TIME_SET; internal_c_local: INTERNAL_C_LOCAL
      do
         internal_c_local := cpp.pending_c_function_lock_local(live_type.type, once "deeptwin")
         function_body.append(once "se_deep_twin_start();%N")
         if live_type.is_reference then
            function_body.append(once "R=se_deep_twin_search((void*)C);%N%
                                      %if(NULL==R){%N")
            cpp.memory.allocation_of(internal_c_local, live_type)
            function_body.append(once "R=")
            internal_c_local.append_in(function_body)
            function_body.append(once ";%N*((T")
            live_type.id.append_in(function_body)
            function_body.append(once "*)")
            internal_c_local.append_in(function_body)
            function_body.append(once ")=*C;%Nse_deep_twin_register(((T0*)C),")
            internal_c_local.append_in(function_body)
            function_body.append(once ");%N")
         else
            internal_c_local.append_in(function_body)
            function_body.append(once "=*C;%N")
         end
         wa := live_type.writable_attributes
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(live_type.type, False)
               if tm.is_reference then
                  lt := tm.type.live_type
                  if lt = Void then
                     rts := Void
                  else
                     rts := lt.run_time_set
                  end
                  if rts /= Void and then rts.count > 0 then
                     function_body.append(once "if(")
                     c_field_access(live_type, internal_c_local, field_name)
                     function_body.append(once "!=NULL){%N")
                     c_field_access(live_type, internal_c_local, field_name)
                     function_body.extend('=')
                     if rts.count > 1 then
                        function_body.extend('X')
                        rts.owner.id.append_in(function_body)
                     else
                        function_body.extend('r')
                        rts.first.id.append_in(function_body)
                     end
                     function_body.append(once "deep_twin(")
                     if ace.no_check then
                        function_body.append(once "&ds,")
                        if rts.count > 1 then
                           function_body.append(once "ds.p,")
                        end
                     end
                     if rts.count = 1 then
                        function_body.extend('(')
                        function_body.append(cpp.target_type.for(rts.first.canonical_type_mark))
                        function_body.extend(')')
                     end
                     function_body.extend('(')
                     c_field_access(live_type, internal_c_local, field_name)
                     function_body.append(once "));%N}%N")
                  end
               elseif tm.is_native_array then
                  if not live_type.type.has_simple_feature_name(capacity_name) then
                     error_handler.add_type_mark(tm)
                     error_handler.add_position(tm.start_position)
                     error_handler.append(fz_dtideena)
                     error_handler.print_as_error
                     error_handler.add_position(rf2.start_position)
                     error_handler.append(em1)
                     error_handler.print_as_fatal_error
                  end
                  c_field_access(live_type, internal_c_local, field_name)
                  function_body.append(once "=r")
                  tm.id.append_in(function_body)
                  function_body.append(once "deep_twin_from(")
                  if ace.no_check then
                     function_body.append(once "&ds,")
                  end
                  c_field_access(live_type, internal_c_local, field_name)
                  function_body.extend(',')
                  c_field_access(live_type, internal_c_local, as_capacity)
                  function_body.append(once ");%N")
               elseif tm.type.is_empty_expanded then
               elseif tm.is_user_expanded then
                  c_field_access(live_type, internal_c_local, field_name)
                  function_body.append(once "=r")
                  tm.id.append_in(function_body)
                  function_body.append(once "deep_twin(")
                  if ace.no_check then
                     function_body.append(once "&ds,")
                  end
                  function_body.append(once "&(")
                  c_field_access(live_type, internal_c_local, field_name)
                  function_body.append(once "));%N")
               else
                  check
                     tm.is_kernel_expanded
                  end
               end
               i := i + 1
            end
         end
         if live_type.is_user_expanded then
            function_body.append(once "R=")
            internal_c_local.append_in(function_body)
            function_body.append(once ";%N")
         end
         if live_type.is_reference then
            function_body.append(once "}%N")
         end
         function_body.append(once "se_deep_twin_trats()%N")
         internal_c_local.unlock
      end

   c_field_access (live_type: LIVE_TYPE; internal_c_local: INTERNAL_C_LOCAL; field_name: STRING)
      do
         if live_type.is_reference then
            function_body.append(once "((T")
            live_type.id.append_in(function_body)
            function_body.append(once "*)")
            internal_c_local.append_in(function_body)
            function_body.append(once ")->_")
         elseif live_type.is_native_array then
            internal_c_local.append_in(function_body)
            function_body.append(once "->_")
         else
            internal_c_local.append_in(function_body)
            check
               live_type.is_user_expanded
            end
            function_body.append(once ".is_")
         end
         function_body.append(field_name)
      end

   is_deep_equal_c_code (live_type: LIVE_TYPE)
      require
         cpp.pending_c_function
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2; ct, tm: TYPE_MARK; field_name: STRING
         check_type: BOOLEAN; lt: LIVE_TYPE; rts: RUN_TIME_SET
      do
         ct := live_type.canonical_type_mark
         function_body.append(once "se_deep_equal_start();%N")
         if ct.is_reference then
            check_type := ct.type.live_type.is_tagged
            if check_type then
               function_body.append(once "R=(C->id==a1->id);%Nif(R){%N")
            end
            function_body.append(once "R=se_deep_equal_search(C,a1);%N")
         end
         function_body.append(once "if(!R){%N")
         function_body.append(cpp.target_type.for(ct))
         function_body.append(once "a1ptr=")
         if ct.is_reference then
            function_body.append(once "((void*)a1);%N")
         else
            function_body.append(once "((void*)(&a1));%N")
         end
         function_body.append(once "R=1;%N")
         wa := live_type.writable_attributes
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(live_type.type, False)
               if tm.is_kernel_expanded then
                  function_body.append(once "if(R)R=((C->_")
                  function_body.append(field_name)
                  function_body.append(once ")==(a1ptr->_")
                  function_body.append(field_name)
                  function_body.append(once "));%N")
               end
               i := i + 1
            end
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               rf2 := wa.item(i)
               field_name := rf2.name.to_string
               tm := rf2.result_type.to_static(live_type.type, False)
               if tm.is_reference then
                  lt := tm.type.live_type
                  if lt = Void then
                     rts := Void
                  else
                     rts := lt.run_time_set
                  end
                  if rts /= Void and then rts.count > 0 then
                     function_body.append(once "if(R){%NT0*o1=C->_")
                     function_body.append(field_name)
                     function_body.append(once ";%NT0*o2=a1ptr->_")
                     function_body.append(field_name)
                     function_body.append(once ";%Nif(o1==o2){}%N%
                                               %else if(NULL==o1){R=0;}%N%
                                               %else if(NULL==o2){R=0;}%N%
                                               %else {R=")
                     if rts.count = 1 then
                        tm := rts.first.canonical_type_mark
                        function_body.extend('r')
                     else
                        function_body.extend('X')
                     end
                     tm.id.append_in(function_body)
                     function_body.append(once "is_deep_equal(")
                     if ace.no_check then
                        function_body.append(once "&ds,")
                        if rts.count > 1 then
                           function_body.append(once "ds.p,")
                        end
                     end
                     if rts.count = 1 then
                        function_body.extend('(')
                        function_body.append(cpp.target_type.for(tm))
                        function_body.extend(')')
                     end
                     function_body.append(once "o1,o2);}%N}%N")
                  end
               elseif tm.is_native_array then
                  if not live_type.type.has_simple_feature_name(capacity_name) then
                     error_handler.add_type_mark(tm)
                     error_handler.add_position(tm.start_position)
                     error_handler.append(fz_dtideena)
                     error_handler.print_as_error
                     error_handler.add_position(rf2.start_position)
                     error_handler.append(em1)
                     error_handler.print_as_fatal_error
                  end
                  function_body.append(once "if(R)R=r")
                  tm.id.append_in(function_body)
                  function_body.append(once "deep_memcmp(")
                  if ace.no_check then
                     function_body.append(once "&ds,")
                  end
                  function_body.append(once "C->_")
                  function_body.append(field_name)
                  function_body.append(once ",a1ptr->_")
                  function_body.append(field_name)
                  function_body.append(once ",C->_capacity);%N")
               elseif tm.type.is_empty_expanded then
               elseif tm.is_user_expanded then
                  function_body.append(once "if(R)R=r")
                  tm.id.append_in(function_body)
                  function_body.append(once "is_deep_equal(")
                  if ace.no_check then
                     function_body.append(once "&ds,")
                  end
                  function_body.append(once "&(C->_")
                  function_body.append(field_name)
                  function_body.append(once "),a1ptr->_")
                  function_body.append(field_name)
                  function_body.append(once ");%N")
               end
               i := i + 1
            end
         end
         if check_type then
            function_body.append(once "}%N")
         end
         function_body.append(once "}%Nse_deep_equal_trats()%N")
      end

   em1: STRING "The `deep_twin'/`is_deep_equal' problem comes from this attribute."

feature {} -- C++
   wrapped_external_call_in (visited: NATIVE_C_PLUS_PLUS; body: STRING; er: EXTERNAL_ROUTINE; arg_count: INTEGER)
      local
         i: INTEGER
      do
         body.append(er.external_name)
         body.extend('(')
         if visited.use_current(er) then
            body.extend('C')
            if arg_count > 0 then
               body.extend(',')
            end
         end
         from
            i := 1
         until
            i > arg_count
         loop
            body.extend('a')
            i.append_in(body)
            i := i + 1
            if i <= arg_count then
               body.extend(',')
            end
         end
         body.append(once ")")
      end

feature {}
   make
      do
      end

end -- class C_NATIVE_FUNCTION_MAPPER
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
