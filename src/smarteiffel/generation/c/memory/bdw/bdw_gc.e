-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BDW_GC

inherit
   MEMORY_HANDLER
      export {BDW_GC_DEFINE2} generate_dispose
      end

create {MEMORY_HANDLER_FACTORY}
   make

feature {ACE}
   ace_option (txt: STRING) is
      do
         txt.append("   collect(%"bdw%")%N")
      end

feature {C_PRETTY_PRINTER} -- C code phases
   pre_customize_c_runtime is
      do
         if not ace.boost then
            cpp.out_h_buffer.append(once "#define GC_DEBUG 1%N")
         end
         cpp.out_h_buffer.copy(once "#define BDW_GC 1%N%
                                    %#define GC_I_HIDE_POINTERS 1%N%
                                    %#include <gc.h>%N%
                                    %#define malloc(s) GC_MALLOC(s)%N%
                                    %#define calloc(n,s) GC_MALLOC_IGNORE_OFF_PAGE((s)*(n))%N%
                                    %#define realloc(p,s) GC_REALLOC((p),(s))%N")
         cpp.write_out_h_buffer
      end

   customize_c_runtime is
      do
         system_tools.add_bdwgc_lib
      end

   define1 is
      do
         echo.put_string(once "Adding Boehm-Demers-Weiser Garbage Collector.%N")
      end

   define2 is
      local
         i: INTEGER; lt: LIVE_TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]; root_type: TYPE
      do
         live_type_map := smart_eiffel.live_type_map
         root_type := smart_eiffel.root_procedure.type_of_current

         echo.put_string(once "GC support (root functions).%N")
         if manifest_string_pool.collected_once_count > 0 then
            cpp.out_h_buffer.copy(once "void* bdw_ms[")
            manifest_string_pool.collected_once_count.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once "]")
            cpp.write_extern_1(cpp.out_h_buffer)
            define_manifest_string_mark
         end
         define_gc_start(root_type, live_type_map)

         cpp.split_c_file_padding_here

         echo.put_string(once "GC support (functions).%N")

         from --| **** TODO move in proper visitor
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               gc_define2.for(lt)
            end
            i := i + 1
         end
      end

   pre_initialize_runtime is
      do
      end

   initialize_runtime is
      do
         cpp.pending_c_function_body.append(once "GC_java_finalization=1;%N%
                                                 %GC_INIT();%N%
                                                 %GC_stackbottom=(char*)(void*)&argc;%N")
      end

   post_initialize_runtime is
      do
      end

   gc_info_before_exit is
      do
         cpp.pending_c_function_body.append(once "GC_enable();%N%
                                                 %gc_start();%N")
      end

   pre_cecil_define is
      do
      end

   cecil_define is
      do
      end

   post_cecil_define is
      do
      end

feature {C_PRETTY_PRINTER} -- specific objects
   manifest_string_in (c_code: STRING; string_at_run_time: BOOLEAN) is
      do
         if string_at_run_time then
            c_code.append(once "s=(T7*)bdw_mallocT7(1);%N")
         else
            c_code.append(once "s=((T7*)se_malloc(sizeof(T7)));%N")
         end
         if string_at_run_time and then smart_eiffel.type_string.live_type.is_tagged then
            c_code.append(once "s->id=7;%N")
         end
      end

   native9_in (c_code: STRING; string_at_run_time: BOOLEAN) is
      do
         if string_at_run_time then
            c_code.append(once "bdw_mallocT9")
         else
            c_code.append(once "se_malloc")
         end
      end

feature {C_PRETTY_PRINTER} -- memory-specific handling aspects
   add_extra_collectors is
      do
      end

   may_need_size_table: BOOLEAN is False

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- allocators
   malloc (lt: LIVE_TYPE) is
      do
         cpp.pending_c_function_body.append(once "bdw_mallocT")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(1)")
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE]) is
      do
         cpp.pending_c_function_body.append(once "bdw_mallocT")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend('(')
         n.call([])
         cpp.pending_c_function_body.extend(')')
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable is
      do
         cpp.pending_c_function_body.append(once "GC_disable();%N")
      end

   gc_enable is
      do
         cpp.pending_c_function_body.append(once "GC_enable();%N")
      end

   gc_collect is
      do
         cpp.pending_c_function_body.append(once "gc_start();%N")
      end

   gc_is_collecting is
      do
         cpp.pending_c_function_body.append(once "(!GC_dont_gc)")
      end

   gc_counter is
      do
         cpp.pending_c_function_body.append(once "(GC_gc_no)")
      end

   gc_allocated_bytes is
      do
         cpp.pending_c_function_body.append(once "(GC_get_heap_size())")
      end

feature {C_COMPILATION_MIXIN} -- see WEAK_REFERENCE
   weak_item (lt: LIVE_TYPE) is
      do
         cpp.pending_c_function_body.append(once "((")
         cpp.pending_c_function_body.append(cpp.result_type.for(lt.type.generic_list.first.canonical_type_mark))
         cpp.pending_c_function_body.append(once ")GC_call_with_alloc_lock((GC_fn_type)bdw_weakref_getlink, (bdw_Twr*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once ")))")
      end

   weak_set_item (lt: LIVE_TYPE) is
      do
         cpp.pending_c_function_body.append(once "bdw_weakref_setlink((bdw_Twr*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "), ")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once ");%N")
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- agents
   assign_agent_data (mold_id: STRING) is
      do
      end

   generate_agent_data (agent_creation: AGENT_CREATION; type: TYPE; mold_id: STRING; generate_closed_operand: PROCEDURE[TUPLE[CLOSED_OPERAND]]) is
      do
      end

   define_agent_data (mold_id: STRING) is
      do
      end

   define_agent_data_is_equal is
      do
      end

   define_agent_data_0 is
      do
      end

feature {C_NATIVE_PROCEDURE_MAPPER}
   mark_item (rf7: RUN_FEATURE_7) is
      do
         cpp.pending_c_function_body.append(once "{/*mark_item*/}%N")
      end

feature {ANY}
   allocation_of (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE) is
      do
         internal_c_local.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "=((T0*)bdw_mallocT")
         created_live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(1));%N")
         initialize_user_expanded_attributes(internal_c_local, created_live_type)
      end

feature {}
   define_gc_start (root_type: TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]) is
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void gc_start(void)")
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_ENTER_GC,NULL);%N");
         cpp.pending_c_function_body.append(once "GC_gcollect();%N")
         if info_flag then
            cpp.pending_c_function_body.append(once "GC_dump();%N")
         end
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_EXIT_GC,NULL);%N");
         cpp.dump_pending_c_function(True)
      end

   manifest_string_mark (i, id: INTEGER) is
      do
         cpp.pending_c_function_body.append(once "bdw_ms[")
         (i-1).append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "]=")
      end

feature {BDW_GC_DEFINE2}
   get_memory_dispose (lt: LIVE_TYPE): RUN_FEATURE_3 is
      require
         lt /= Void
      do
         Result := lt.get_memory_dispose
      end

feature {}
   gc_define2: BDW_GC_DEFINE2

   make is
      do
         create gc_define2.make(Current)
      end

end -- class BDW_GC
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
