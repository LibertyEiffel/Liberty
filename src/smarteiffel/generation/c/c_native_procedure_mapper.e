-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_NATIVE_PROCEDURE_MAPPER

inherit
   NATIVE_VISITOR
      undefine
         is_equal
      end

insert
   C_NATIVE_FUNCTION_MAPPER
      rename
         compile as compile_
      export {}
         compile_
      redefine
         visit_native_built_in,
         visit_native_c_plus_plus,
         visit_native_c,
         visit_native_java,
         visit_native_plug_in
      end

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   compile (a_rf7: RUN_FEATURE_7) is
      require
         rf7_does_need_c_wrapper(a_rf7)
      local
         old_rf7: like rf7
         old_toc: like type_of_current
         old_bcn: like bcn
         old_name: like name
      do
         old_rf7 := rf7
         old_toc := type_of_current
         old_bcn := bcn
         old_name := name

         rf7 := a_rf7
         type_of_current := a_rf7.type_of_current
         bcn := a_rf7.base_feature.class_text.name.to_string
         name := a_rf7.base_feature.first_name.to_string
         a_rf7.base_feature.native.accept(Current)

         rf7 := old_rf7
         type_of_current := old_toc
         bcn := old_bcn
         name := old_name
      end

feature {}
   rf7: RUN_FEATURE_7

feature {NATIVE_BUILT_IN}
   visit_native_built_in (visited: NATIVE_BUILT_IN) is
      local
         cbd: BOOLEAN; elt_type: TYPE
      do
         if name.has_prefix(once "basic_") then
            cbd := cpp.target_cannot_be_dropped
            if cbd then
               function_body.extend(',')
            end
            function_body.append(name)
            if rf7.arguments /= Void then
               function_body.extend('(')
               cpp.put_arguments(rf7.arguments.count)
               function_body.extend(')')
            end
            if cbd then
               function_body.extend(')')
            end
            function_body.append(once ";%N")
         elseif as_copy = name or else as_standard_copy = name then
            if type_of_current.is_reference then
               function_body.append(once "*((T")
               type_of_current.id.append_in(function_body)
               function_body.append(once "*)(")
               cpp.put_target_as_value
               function_body.append(once "))=*((T")
               type_of_current.id.append_in(function_body)
               function_body.append(once "*)(")
               cpp.put_ith_argument(1)
               function_body.append(once "));%N")
            elseif type_of_current.is_kernel_expanded or else type_of_current.is_empty_expanded then
               function_body.append(once "{/*dumb copy*/")
               cpp.put_target_as_value
               function_body.append(once ";")
               cpp.put_ith_argument(1)
               function_body.append(once ";}%N")
            else
               check
                  type_of_current.is_user_expanded
                  not type_of_current.is_empty_expanded
               end
               function_body.append(once "memcpy(")
               cpp.put_target_as_target(type_of_current)
               function_body.append(once ",&")
               cpp.put_ith_argument(1)
               function_body.append(once ",sizeof(T")
               type_of_current.id.append_in(function_body)
               function_body.append(once "));%N")
            end
         elseif as_print_run_time_stack = name then
            function_body.append(once "se_print_run_time_stack();%N")
         elseif as_die_with_code = name then
            if cpp.target_cannot_be_dropped then
               function_body.append(once ");%N")
            end
            function_body.append(once "se_die(")
            cpp.put_ith_argument(1)
            function_body.append(once ");%N")
         elseif as_native_array = bcn then
            c_mapping_native_array_procedure
         elseif type_of_current.is_integer then
            c_mapping_integer_procedure
         elseif as_raise_exception = name then
            function_body.append(once "internal_exception_handler(")
            cpp.put_ith_argument(1)
            function_body.append(once ");%N")
         elseif as_full_collect = name then
            if not cpp.gc_handler.is_off then
               function_body.append(once "gc_start();%N")
            end
         elseif as_trace_switch = name then
            cpp.put_trace_switch
         elseif as_sedb_breakpoint = name then
            cpp.put_sedb_breakpoint
         elseif as_collection_off = name then
            if not cpp.gc_handler.is_off then
               function_body.append(once "gc_is_off=1;%N")
            end
         elseif as_collection_on = name then
            if not cpp.gc_handler.is_off then
               function_body.append(once "gc_is_off=0;%N")
            end
         elseif as_put_16_be = name or else as_put_16_le = name or else as_put_16_ne = name then
            function_body.append(once "*((int16_t*)(")
            cpp.put_ith_argument(1)
            function_body.append(once "+")
            cpp.put_ith_argument(3)
            function_body.append(once "))=")
            if as_put_16_ne /= name then
               if as_put_16_be = name then
                  function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N")
               else
                  function_body.append(once "%N#if BYTE_ORDER == BIG_ENDIAN%N")
               end
               function_body.extend('(')
               cpp.put_ith_argument(2)
               function_body.append(once "<<8)|((uint16_t)")
               cpp.put_ith_argument(2)
               function_body.append(once ">>8);%N#else%N")
            end
            cpp.put_ith_argument(2)
            function_body.append(once ";%N")
            if as_put_16_ne /= name then
               function_body.append(once "#endif%N")
            end
         elseif as_put_32_be = name or else as_put_32_le = name or else as_put_32_ne = name then
            function_body.append(once "*((int32_t*)(")
            cpp.put_ith_argument(1)
            function_body.append(once "+")
            cpp.put_ith_argument(3)
            function_body.append(once "))=")
            if as_put_32_ne /= name then
               if as_put_32_be = name then
                  function_body.append(once "%N#if BYTE_ORDER == LITTLE_ENDIAN%N")
               else
                  function_body.append(once "%N#if BYTE_ORDER == BIG_ENDIAN%N")
               end
               function_body.extend('(')
               cpp.put_ith_argument(2)
               function_body.append(once "<<24|(((uint32_t)")
               cpp.put_ith_argument(2)
               function_body.append(once "<<8)&0xFF0000)|(((uint32_t)")
               cpp.put_ith_argument(2)
               function_body.append(once ">>8)&0xFF00)|(((uint32_t)")
               cpp.put_ith_argument(2)
               function_body.append(once ">>24)&0xFF));%N#else%N")
            end
            cpp.put_ith_argument(2)
            function_body.append(once ";%N")
            if as_put_32_ne /= name then
               function_body.append(once "#endif%N")
            end
         elseif as_mark_item = name then
            function_body.append(once "{/*mark_item*/%N")
            elt_type := rf7.arguments.name(1).resolve_in(rf7.type_of_current).generic_list.first
            function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
            function_body.append(once " elt=")
            cpp.put_ith_argument(1)
            function_body.append(once "[")
            cpp.put_ith_argument(2)
            function_body.append(once "];%N")
            cpp.gc_handler.mark_for(once "elt", elt_type.live_type, False)
            function_body.append(once "/*mark_item*/}")
         else
            check -- Unknown external.
               False
            end
         end
      end

feature {NATIVE_C_PLUS_PLUS}
   visit_native_c_plus_plus (visited: NATIVE_C_PLUS_PLUS) is
      do
         if not cpp.c_plus_plus_registered(visited) then
            extra_c_prototype(visited.external_tag.start_position, type_of_current, rf7.base_feature)
            cpp.c_plus_plus_register(visited, rf7)
         end
         wrapped_external_call_in(visited, function_body, rf7.base_feature, rf7.arg_count)
         function_body.append(once ";%N")
      end

feature {NATIVE_C}
   visit_native_c (visited: NATIVE_C) is
      do
         visited.parse_external_tag
         if visited.need_prototype and then not cpp.c_registered(visited) then
            cpp.c_register(visited, rf7)
            extra_c_prototype(visited.start_position, type_of_current, rf7.base_feature)
         end
         mapping_c(visited, rf7.base_feature, cpp.native_need_wrapper.for_rf7(rf7), False, rf7.arg_count)
         function_body.append(once ";%N")
      end

feature {NATIVE_JAVA}
   visit_native_java (visited: NATIVE_JAVA) is
      do
         fe_c2c(rf7)
      end

feature {NATIVE_PLUG_IN}
   visit_native_plug_in (visited: NATIVE_PLUG_IN) is
      do
         mapping_plug_in(visited, rf7.arguments)
         function_body.append(once ";%N")
      end

feature {} -- built-ins
   c_mapping_native_array_procedure is
      local
         elt_type: TYPE
      do
         elt_type := rf7.type_of_current.private_generic_list.item(1)
         if name = as_put then
            if elt_type.is_user_expanded then
               if elt_type.is_empty_expanded then
                  if cpp.cannot_drop_all then
                     function_body.append(once ");%N")
                  end
               else
                  function_body.append(once "{%NT")
                  elt_type.id.append_in(function_body)
                  function_body.append(once " tmp_src=")
                  cpp.put_ith_argument(1)
                  function_body.append(once ";%Nmemcpy((")
                  cpp.put_target_as_value
                  function_body.append(once ")+(")
                  cpp.put_ith_argument(2)
                  function_body.append(once "),&(tmp_src),sizeof(T")
                  elt_type.id.append_in(function_body)
                  function_body.append(once "));%N}%N")
               end
            else
               function_body.extend('(')
               cpp.put_target_as_value
               function_body.append(once ")[")
               cpp.put_ith_argument(2)
               function_body.append(once "]=(")
               cpp.put_ith_argument(1)
               function_body.append(once ");%N")
            end
         elseif name = as_slice_copy then
            function_body.append(once "{/*slice_copy*/%Nint a3tmp=")
            cpp.put_ith_argument(3)
            function_body.append(once ";%Nmemcpy((")
            cpp.put_target_as_value
            function_body.append(once ")+(")
            cpp.put_ith_argument(1)
            function_body.append(once "),(")
            cpp.put_ith_argument(2)
            function_body.append(once ")+a3tmp,((")
            cpp.put_ith_argument(4)
            function_body.append(once ")-a3tmp+1)*sizeof(T")
            elt_type.id.append_in(function_body)
            function_body.append(once "));}%N")
         else
            error_handler.append(once "Class NATIVE_ARRAY has been tampered with. Unknown procedure: ")
            error_handler.append(name)
            error_handler.add_position(rf7.start_position)
            error_handler.print_as_fatal_error
         end
      end

   c_mapping_integer_procedure is
      do
         if as_bit_put = name then
            function_body.append(once "if(")
            cpp.put_ith_argument(1)
            function_body.append(once "){%N")
            cpp.put_target_as_value
            function_body.extend('=')
            cpp.put_target_as_value
            function_body.append(once "|(1<<")
            cpp.put_ith_argument(2)
            function_body.append(once ");%N}%Nelse{%N")
            cpp.put_target_as_value
            function_body.extend('=')
            cpp.put_target_as_value
            function_body.append(once "&(~(1<<")
            cpp.put_ith_argument(2)
            function_body.append(once "));%N}")
         elseif as_bit_set = name then
            cpp.put_target_as_value
            function_body.extend('=')
            cpp.put_target_as_value
            function_body.append(once "|(1<<")
            cpp.put_ith_argument(1)
            function_body.append(once ");%N")
         elseif as_bit_clear = name then
            cpp.put_target_as_value
            function_body.extend('=')
            cpp.put_target_as_value
            function_body.append(once "&(~(1<<")
            cpp.put_ith_argument(1)
            function_body.append(once "));%N")
         end
      end

end -- class C_NATIVE_PROCEDURE_MAPPER
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
