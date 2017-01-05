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
   ace_option (txt: STRING)
      do
         txt.append("   collect(%"bdw%")%N")
      end

feature {C_PRETTY_PRINTER} -- C code phases
   pre_customize_c_runtime
      local
         gc_debug_env: STRING
      do
         if not ace.boost then
            cpp.out_h_buffer.append(once "#ifndef GC_DEBUG%N%
                                         %#define GC_DEBUG 1%N%
                                         %#endif%N")
         else
            gc_debug_env := system_tools.config.environment(once "GC_DEBUG")
            if gc_debug_env /= Void and then not gc_debug_env.is_empty then
               cpp.out_h_buffer.append(once "#ifndef GC_DEBUG%N%
                                            %#define GC_DEBUG %"")
               cpp.out_h_buffer.append(gc_debug_env)
               cpp.out_h_buffer.append(once "%"%N%
                                            %#endif%N")
            end
         end
         cpp.out_h_buffer.copy(once "#define BDW_GC 1%N%
                                    %#define GC_I_HIDE_POINTERS 1%N%
                                    %#include <gc/gc.h>%N%
                                    %#define malloc(s) GC_MALLOC(s)%N%
                                    %#define calloc(n,s) GC_MALLOC_IGNORE_OFF_PAGE((s)*(n))%N%
                                    %#define realloc(p,s) GC_REALLOC((p),(s))%N%
                                    %#define free(p) p=NULL%N")
         cpp.write_out_h_buffer
      end

   customize_c_runtime
      do
         system_tools.add_bdwgc_lib
      end

   define1
      do
         echo.put_string(once "Adding Boehm-Demers-Weiser Garbage Collector.%N")
      end

   define2
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
         cpp.write_extern_0(once "int bdw_in_assign")
         cpp.write_extern_0(once "int bdw_delayed_finalize")

         from
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

         gc_define2.extra_functions
      end

   pre_initialize_runtime
      do
      end

   initialize_runtime
      do
         cpp.pending_c_function_body.append(once "GC_java_finalization=1;%N%
                                                 %GC_finalize_on_demand=1;%N%
                                                 %GC_finalizer_notifier=bdw_run_finalizers;%N%
                                                 %GC_INIT();%N%
                                                 %GC_stackbottom=(char*)(void*)&argc;%N")
      end

   initialize_thread
      do
         cpp.pending_c_function_body.append(once "GC_stackbottom=(char*)(void*)&C;%N")
      end

   post_initialize_runtime
      do
      end

   gc_info_before_exit
      do
         cpp.pending_c_function_body.append(once "GC_enable();%N%
                                                 %eiffel_root_object=NULL;%N%
                                                 %GC_gcollect();%N%
                                                 %handle(SE_HANDLE_ENTER_GC,NULL);%N")
         if info_flag then
            cpp.pending_c_function_body.append(once "GC_dump();%N")
         end
         cpp.pending_c_function_body.append(once "GC_invoke_finalizers();%N%
                                                 %handle(SE_HANDLE_EXIT_GC,NULL);%N")
      end

   pre_cecil_define
      do
      end

   cecil_define
      do
      end

   post_cecil_define
      do
      end

   echo_information
      do
      end

feature {C_PRETTY_PRINTER} -- specific objects
   manifest_string_in (c_code: STRING)
      do
         c_code.append(once "s=(T7*)bdw_mallocT7(1);%N")
      end

feature {} -- memory-specific handling aspects
   native_array_collector: LIVE_TYPE_NATIVE_ARRAY_COLLECTOR

feature {C_PRETTY_PRINTER} -- memory-specific handling aspects
   add_extra_collectors
      do
         live_type_extra_collectors.add_last(native_array_collector)
      end

   may_need_size_table: BOOLEAN False

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- allocators
   malloc (lt: LIVE_TYPE)
      do
         if lt.at_run_time then
            cpp.pending_c_function_body.append(once "bdw_mallocT")
            lt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "(1)")
         else
            cpp.pending_c_function_body.append(once "NULL")
         end
      end

   malloc_closure (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "se_malloc(sizeof(void*))")
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE])
      do
         if lt.at_run_time then
            cpp.pending_c_function_body.append(once "bdw_mallocT")
            lt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('(')
            n.call([])
            cpp.pending_c_function_body.extend(')')
         else
            cpp.pending_c_function_body.append(once "NULL")
         end
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable
      do
         cpp.pending_c_function_body.append(once "GC_disable();%N")
      end

   gc_enable
      do
         cpp.pending_c_function_body.append(once "GC_enable();%N")
      end

   gc_collect
      do
         cpp.pending_c_function_body.append(once "gc_start();%N")
      end

   gc_is_collecting
      do
         cpp.pending_c_function_body.append(once "(!GC_dont_gc)")
      end

   gc_counter
      do
         cpp.pending_c_function_body.append(once "(GC_gc_no)")
      end

   gc_allocated_bytes
      do
         cpp.pending_c_function_body.append(once "(GC_get_heap_size())")
      end

feature {C_COMPILATION_MIXIN} -- see WEAK_REFERENCE
   weak_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "((")
         cpp.pending_c_function_body.append(cpp.result_type.for(lt.type.generic_list.first.canonical_type_mark))
         cpp.pending_c_function_body.append(once ")GC_call_with_alloc_lock((GC_fn_type)bdw_weakref_getlink,(bdw_Twr*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once ")))")
      end

   weak_set_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "bdw_weakref_setlink((bdw_Twr*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "),(")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once "));%N")
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- agents
   assign_agent_data (mold_id: STRING)
      do
      end

   generate_agent_data (agent_creation: AGENT_CREATION; type: TYPE; mold_id: STRING; generate_closed_operand: PROCEDURE[TUPLE[CLOSED_OPERAND]])
      do
      end

   define_agent_data (mold_id: STRING)
      do
      end

   define_agent_data_is_equal
      do
      end

   define_agent_data_0
      do
      end

feature {C_COMPILATION_MIXIN}
   checkpoint
      do
      end

feature {C_NATIVE_PROCEDURE_MAPPER}
   mark_item (rf7: RUN_FEATURE_7)
      local
         elt_type: TYPE
      do
         cpp.pending_c_function_body.append(once "/*mark_item*/")
         elt_type := rf7.arguments.name(1).resolve_in(rf7.type_of_current).generic_list.first
         if elt_type.is_reference then
            cpp.pending_c_function_body.append(once "if(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "[")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "]!=NULL)")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "[")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "]=(")
            cpp.pending_c_function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
            cpp.pending_c_function_body.append(once ")REVEAL_POINTER(")
            cpp.put_ith_argument(1)
            cpp.pending_c_function_body.append(once "[")
            cpp.put_ith_argument(2)
            cpp.pending_c_function_body.append(once "]);%N")
         end
      end

feature {C_PRETTY_PRINTER}
   start_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      do
      end

   end_assignment (assignment: ASSIGNMENT_INSTRUCTION; type: TYPE)
      do
      end

feature {C_HEADER_PASS_0}
   register_wa_list (live_type: LIVE_TYPE)
      do
      end

feature {C_COMPILATION_MIXIN}
   need_struct_for (type_mark: TYPE_MARK): BOOLEAN
      do
         check not Result end
      end

   extra_c_struct (type_mark: TYPE_MARK)
      local
         flag: TAGGED_FLAG
      do
         flag := native_array_collector.must_collect(type_mark.type.live_type)
         if flag /= Void and then flag.item then
            cpp.out_h_buffer.append(once "void*bdw_markna;")
         end
      end

   extra_c_model (type_mark: TYPE_MARK)
      local
         flag: TAGGED_FLAG
      do
         flag := native_array_collector.must_collect(type_mark.type.live_type)
         if flag /= Void and then flag.item then
            cpp.out_c_buffer.append(once "(void*)0,")
         end
      end

   assigned_native_array (assignment: ASSIGNMENT; type: TYPE)
      local
         flag: TAGGED_FLAG
      do
         if assignment.left_side.is_writable then
            flag := native_array_collector.must_collect(type.live_type)
            if flag /= Void and then flag.item then
               assign_na.for(assignment, type)
            end
         end
      end

feature {}
   define_gc_start (root_type: TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE])
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void gc_start(void)")
         cpp.pending_c_function_body.append(once "GC_gcollect();%N%
                                                 %if(GC_should_invoke_finalizers())bdw_run_finalizers();%N")
         cpp.dump_pending_c_function(True)
      end

   manifest_string_mark (i, id: INTEGER)
      do
         cpp.pending_c_function_body.append(once "bdw_ms[")
         (i - 1).append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "]=")
      end

feature {BDW_GC_DEFINE2}
   get_memory_dispose (lt: LIVE_TYPE): RUN_FEATURE_3
      require
         lt /= Void
      do
         Result := lt.get_memory_dispose
      end

feature {}
   gc_define2: BDW_GC_DEFINE2
   assign_na: BDW_ASSIGN_NATIVE_ARRAY

   make
      do
         create assign_na.make(Current)
         create native_array_collector.make
         create gc_define2.make(Current, native_array_collector)
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
