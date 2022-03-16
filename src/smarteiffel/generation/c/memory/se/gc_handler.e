-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class GC_HANDLER
   --
   -- GARBAGE_COLLECTOR_HANDLER
   --

inherit
   MEMORY_HANDLER

insert
   C_AGENT_CREATION_MIXIN
   TAGGER

create {MEMORY_HANDLER_FACTORY}
   make

feature {ACE}
   ace_option (txt: STRING)
      do
         txt.append("   collect(yes)%N")
      end

feature {C_COMPILATION_MIXIN}
   header_compiler: C_GARBAGE_COLLECTOR_HEADER_COMPILER
   functions_compiler: C_GARBAGE_COLLECTOR_FUNCTIONS_COMPILER
   info_compiler: C_GARBAGE_COLLECTOR_INFO_COMPILER
   before_mark_compiler: C_GARBAGE_COLLECTOR_BEFORE_MARK_COMPILER
   need_mark: C_GARBAGE_COLLECTOR_NEED_MARK

feature {C_GARBAGE_COLLECTOR_FUNCTIONS_COMPILER}
   memory_dispose (o: STRING; live_type: LIVE_TYPE)
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         cpp.pending_c_function
         not live_type.is_expanded
         not live_type.is_native_array
      local
         rf3: RUN_FEATURE_3
      do
         rf3 := live_type.get_memory_dispose
         if rf3 /= Void then
            dispose_flag := True
            cpp.pending_c_function_body.append(once "if((")
            cpp.pending_c_function_body.append(o)
            cpp.pending_c_function_body.append(once "->header.flag)==FSOH_UNMARKED){%N")
            generate_dispose(o, rf3, live_type)
            cpp.pending_c_function_body.extend('}')
         end
      end

feature {C_PRETTY_PRINTER}
   pre_customize_c_runtime
      do
         cpp.out_h_buffer.copy(once "#define SE_GC_LIB 1%N")
         cpp.write_out_h_buffer
      end

   customize_c_runtime
      do
         cpp.macro_def(once "FSOC_SIZE", fsoc_size)
         cpp.macro_def(once "RSOC_SIZE", rsoc_size)
         cpp.sys_runtime_h_and_c(once "gc_lib")
      end

   pre_initialize_runtime
      do
         cpp.pending_c_function_body.append(once "stack_bottom=((void**)(void*)(&argc));%N")
      end

   initialize_runtime
      do
         cpp.pending_c_function_body.append(once "gcmt=((mch**)se_malloc((gcmt_max+1)*sizeof(void*)));%N%
                                                 %#ifdef FIXED_STACK_BOTTOM%N%
                                                 %if (!stack_bottom) stack_bottom=((void**)(void*)(&argc));%N%
                                                 %#endif%N")
         if smart_eiffel.thread_used then
            cpp.write_extern_0(once "void*gc_lock");
            cpp.pending_c_function_body.append(once "gc_lock=se_thread_lock_alloc();%N")
         end
         if ace.boost then
            -- In boost you just want the process to stop quickly. For correctness you should not rely on
            -- dispose for useful computation anyway.
            cpp.pending_c_function_body.append(once "gc_set_dispose_before_exit(0);%N")
         else
            -- In other modes you may want to run dispose at exit because the standard library contains checks
            -- in its dispose functions.
            cpp.pending_c_function_body.append(once "gc_set_dispose_before_exit(1);%N")
         end
      end

   initialize_thread
      do
         cpp.pending_c_function_body.append(once "gcmt=((mch**)se_malloc((gcmt_max+1)*sizeof(void*)));%N%
                                                 %stack_bottom=((void**)(void*)(&C));%N")
      end

   post_initialize_runtime
      do
         cpp.out_h_buffer.append(once "manifest_string_mark1();%N")
      end

   gc_info_before_exit
      do
         if info_flag then
            cpp.pending_c_function_body.append(once "fprintf(SE_GCINFO,%"==== Last GC before exit ====\n%");%N%
                                                    %gc_start();%N")
         end
         if dispose_flag then
            cpp.pending_c_function_body.append(once "gc_dispose_before_exit();%N")
         end
      end

   pre_cecil_define
      do
         cpp.pending_c_function_body.extend_unless('%N')
         cpp.pending_c_function_body.append(once "#ifndef FIXED_STACK_BOTTOM%N%
                                                 %int valid_stack_bottom = stack_bottom != NULL;%N%
                                                 %#endif%N")
      end

   cecil_define
      do
         cpp.pending_c_function_body.extend_unless('%N')
         cpp.pending_c_function_body.append(once "#ifndef FIXED_STACK_BOTTOM%N%
                                                 %if(!valid_stack_bottom) stack_bottom = (void**)(void*)&valid_stack_bottom;%N%
                                                 %#endif%N")
      end

   post_cecil_define
      do
         cpp.pending_c_function_body.extend_unless('%N')
         cpp.pending_c_function_body.append(once "#ifndef FIXED_STACK_BOTTOM%N%
                                                 %if(!valid_stack_bottom) stack_bottom = NULL;%N%
                                                 %#endif%N")
      end

   echo_information
      local
         i: INTEGER; tag: C_GARBAGE_COLLECTOR_TAG
         sorter: COLLECTION_SORTER[C_GARBAGE_COLLECTOR_TAG]
      do
         sorter.sort(c_struct_signature_map)
         from
            echo.print_count(once "equivalent memory structure", c_struct_signature_map.count)
            i := c_struct_signature_map.lower
         until
            i > c_struct_signature_map.upper
         loop
            tag := c_struct_signature_map.item(i)
            echo.put_character('%T')
            echo.put_integer(tag.count)
            echo.put_string(once "%Tid:")
            echo.put_integer(tag.id)
            echo.put_string(once "%Tstruct:{")
            echo.put_string(tag.tag.to_string)
            echo.put_line(once "}")
            i := i + 1
         end
      end

feature {C_PRETTY_PRINTER}
   define1
      do
         echo.put_string(once "Adding SmartEiffel Garbage Collector.%N")
         compute_ceils
      end

   define2
      local
         i: INTEGER; lt: LIVE_TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]; root_type: TYPE
      do
         live_type_map := smart_eiffel.live_type_map
         root_type := smart_eiffel.root_procedure.type_of_current

         echo.put_string(once "GC support: adding root functions.%N")
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void once_function_mark(void)")
         mark_once_routines
         cpp.dump_pending_c_function(True)
         define_manifest_string_mark
         define_gc_start(root_type, live_type_map)

         cpp.split_c_file_padding_here

         echo.put_string(once "GC support: generating header.%N")
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               header_compiler.compile(lt.canonical_type_mark)
            end
            i := i + 1
         end

         echo.put_string(once "GC support: generating functions.%N")
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               functions_compiler.compile(lt.canonical_type_mark)
            end
            i := i + 1
         end

         echo.put_string(once "GC support: generating switch functions.%N")
         from
            i := switch_list.lower
         until
            i > switch_list.upper
         loop
            switch_for(switch_list.item(i))
            i := i + 1
         end

         if info_flag then
            define_gc_info(live_type_map)
         end
      end

feature {}
   mark_once_routines
         -- Produce the C code to mark results of all once functions (because they are part of the root).
      require
         smart_eiffel.is_ready
      local
         i: INTEGER; rf: RUN_FEATURE; memory: HASHED_SET[STRING]; once_function: ONCE_FUNCTION;
         type: TYPE; unique_result: STRING; non_void_no_dispatch: NON_VOID_NO_DISPATCH; live_type: LIVE_TYPE
      do
         unique_result := once "... unique buffer ..."
         create memory.make
         -- Precomputed once_function first:
         cpp.pending_c_function_body.append(once "/*NON_VOID_NO_DISPATCH:*/%N")
         from
            i := once_routine_pool.collected_precomputable_function.lower
         until
            i > once_routine_pool.collected_precomputable_function.upper
         loop
            non_void_no_dispatch := once_routine_pool.collected_precomputable_function.item(i)
            once_function := non_void_no_dispatch.once_function
            unique_result.clear_count
            once_routine_pool.unique_result_in(unique_result, once_function)
            if not memory.has(unique_result) then
               memory.add(unique_result.twin)
               type := non_void_no_dispatch.dynamic_type
               if need_mark.for(type) then
                  mark_for(unique_result, type.live_type, True)
               end
            end
            i := i + 1
         end
         -- Then, ordinary non precomputed once function:
         cpp.pending_c_function_body.append(once "/*Ordinary once functions:*/%N")
         from
            i := once_routine_pool.function_list.lower
         until
            i > once_routine_pool.function_list.upper
         loop
            rf := once_routine_pool.function_list.item(i)
            once_function ?= rf.base_feature
            check
               once_function /= Void
            end
            unique_result.clear_count
            once_routine_pool.unique_result_in(unique_result, once_function)
            if not memory.has(unique_result) then
               live_type := rf.type_of_current.live_type
               if live_type /= Void and then live_type.at_run_time then
                  memory.add(unique_result.twin)
                  type := rf.result_type.type
                  if type.live_type /= Void and then need_mark.for(type) then
                     mark_for(unique_result, type.live_type, False)
                  end
               end
            end
            i := i + 1
         end
      end

   manifest_string_mark (i, id: INTEGER)
      do
         cpp.pending_c_function_body.append(once "gc_mark")
         id.append_in(cpp.pending_c_function_body)
      end

feature {C_COMPILATION_MIXIN}
   frozen store_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "store")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen store_left_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "store_left")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen store_chunk_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "store_chunk")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen free_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "gc_free")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen align_mark_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "gc_align_mark")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen info_nb_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "gc_info_nb")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen mark_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "gc_mark")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen sweep_in (type_mark: TYPE_MARK; buffer: STRING; for_closure: BOOLEAN)
      require
         type_mark.is_static
      do
         buffer.append(once "gc_sweep")
         if for_closure then
            buffer.append(once "CL")
         end
         type_mark.id.append_in(buffer)
      end

   frozen na_env_in (type_mark: TYPE_MARK; str: STRING)
      do
         str.append(once "na_env")
         type_mark.id.append_in(str)
      end

feature {C_PRETTY_PRINTER}
   manifest_string_in (c_code: STRING)
         -- Code to create a new Manifest STRING in the "s" local C variable.
      do
         c_code.append(once "s=new7();%N")
      end

feature {C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER} -- memory-specific handling aspects
   native_array_collector: LIVE_TYPE_NATIVE_ARRAY_COLLECTOR

feature {C_PRETTY_PRINTER}
   add_extra_collectors
      do
         live_type_extra_collectors.add_last(native_array_collector)
      end

   may_need_size_table: BOOLEAN True

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- allocators
   malloc (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(/*malloc*/(T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)new")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "())")
      end

   malloc_closure (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(/*malloc_closure*/(T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)newCL")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "())")
      end

   calloc (lt: LIVE_TYPE; n: PROCEDURE[TUPLE])
      do
         cpp.pending_c_function_body.append(once "(/*calloc*/(T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ")new")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(")
         n.call([])
         cpp.pending_c_function_body.append(once "))")
      end

feature {C_COMPILATION_MIXIN} -- GC switches (see MEMORY)
   gc_disable
      do
         cpp.pending_c_function_body.append(once "gc_is_off=1;%N")
      end

   gc_enable
      do
         cpp.pending_c_function_body.append(once "gc_is_off=0;%N")
      end

   gc_collect
      do
         cpp.pending_c_function_body.append(once "gc_start();%N")
      end

   gc_is_collecting
      do
         cpp.pending_c_function_body.append(once "(!gc_is_off)")
      end

   gc_counter
      do
         cpp.pending_c_function_body.append(as_collector_counter)
      end

   gc_allocated_bytes
      do
         cpp.pending_c_function_body.append(once "(gc_memory_used())")
      end

feature {C_COMPILATION_MIXIN} -- see WEAK_REFERENCE
   weak_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(((T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "))->o)")
      end

   weak_set_item (lt: LIVE_TYPE)
      do
         cpp.pending_c_function_body.append(once "(((T")
         lt.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)(")
         cpp.put_target_as_value
         cpp.pending_c_function_body.append(once "))->o)=(T0*)(")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once ");%N")
      end

feature {C_COMPILATION_MIXIN, C_PRETTY_PRINTER} -- agents
   assign_agent_data (mold_id: STRING)
      do
         cpp.pending_c_function_body.append(once "u->gc_mark_agent_mold=gc_mark_")
         cpp.pending_c_function_body.append(mold_id)
         cpp.pending_c_function_body.append(once ";%N")
      end

   generate_agent_data (agent_creation: AGENT_CREATION; type: TYPE; mold_id: STRING; generate_closed_operand: PROCEDURE[TUPLE[CLOSED_OPERAND]])
      local
         i: INTEGER; t: TYPE; closed_operand: CLOSED_OPERAND
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void gc_mark_")
         cpp.pending_c_function_signature.append(mold_id)
         cpp.pending_c_function_signature.append(once "(se_")
         cpp.pending_c_function_signature.append(mold_id)
         cpp.pending_c_function_signature.append(once "*u)")

         cpp.pending_c_function_body.append(once "gc_agent*gcu=(gc_agent*)u;%N%
                                                 %if (gcu->header.flag==FSOH_UNMARKED){%N%
                                                 %gcu->header.flag=FSOH_MARKED;%N")

         if agent_creation.closed_operand_list /= Void then
            from
               i := agent_creation.closed_operand_list.lower
            until
               i > agent_creation.closed_operand_list.upper
            loop
               closed_operand := agent_creation.closed_operand_list.item(i)
               if agent_creation.stored_closed_operand(type, closed_operand) then
                  t := closed_operand.resolve_in(type)
                  if t.is_reference then
                     cpp.pending_c_function_body.append(once "gc_mark(u->")
                     generate_closed_operand.call([closed_operand])
                     cpp.pending_c_function_body.append(once ");%N")
                  elseif need_mark.for(t) then
                     mark_in(t.canonical_type_mark, cpp.pending_c_function_body, False)
                     cpp.pending_c_function_body.append(once "(&(u->")
                     generate_closed_operand.call([closed_operand])
                     cpp.pending_c_function_body.append(once "));%N")
                  end
               end
               i := i + 1
            end
         end

         for_all_argument_names(agent_creation, type,
                                agent (argument_name: ARGUMENT_NAME_DEF; type_: TYPE; closure_rank: INTEGER)
                                   local
                                      t_: TYPE
                                   do
                                      t_ := argument_name.resolve_in(type_)
                                      if t_.is_reference then
                                         cpp.pending_c_function_body.append(once "gc_mark(u->CA_")
                                         (closure_rank + 1).append_in(cpp.pending_c_function_body)
                                         cpp.pending_c_function_body.extend('_')
                                         argument_name.rank.append_in(cpp.pending_c_function_body)
                                         cpp.pending_c_function_body.append(once ");%N")
                                      elseif need_mark.for(t_) then
                                         mark_in(t_.canonical_type_mark, cpp.pending_c_function_body, False)
                                         cpp.pending_c_function_body.append(once "(&(u->CA_")
                                         (closure_rank + 1).append_in(cpp.pending_c_function_body)
                                         cpp.pending_c_function_body.extend('_')
                                         argument_name.rank.append_in(cpp.pending_c_function_body)
                                         cpp.pending_c_function_body.append(once "));%N")
                                      end
                                   end (?, type, ?)) --| **** TODO: closure on type

         for_all_local_names(agent_creation, type,
                             agent (local_name: LOCAL_NAME_DEF; type_: TYPE)
                                local
                                   t_: TYPE
                                do
                                   t_ := local_name.resolve_in(type_)
                                   if t_.is_reference then
                                      cpp.pending_c_function_body.append(once "gc_mark(*(u->CL_")
                                      cpp.pending_c_function_body.append(local_name.to_string)
                                      cpp.pending_c_function_body.append(once "));%N")
                                   elseif need_mark.for(t_) then
                                      mark_in(t_.canonical_type_mark, cpp.pending_c_function_body, False)
                                      cpp.pending_c_function_body.append(once "(u->CL_")
                                      cpp.pending_c_function_body.append(local_name.to_string)
                                      cpp.pending_c_function_body.append(once ");%N")
                                   end
                                end (?, type)) --| **** TODO: closure on type

         cpp.pending_c_function_body.append(once "}%N")
         cpp.dump_pending_c_function(True)
      end

   define_agent_data (mold_id: STRING)
      do
         cpp.out_h_buffer.append(once "void(*gc_mark_agent_mold)(se_")
         cpp.out_h_buffer.append(mold_id)
         cpp.out_h_buffer.append(once "*);%N")
      end

   define_agent_data_is_equal
      do
         cpp.out_h_buffer.append(once "void*gc_mark_agent_mold;%N")
      end

   define_agent_data_0
      do
         cpp.out_h_buffer.append(once "void(*gc_mark_agent_mold)(se_agent*);%N")
      end

feature {C_COMPILATION_MIXIN}
   checkpoint
      do
         if smart_eiffel.thread_used then
            -- check to see if we must mark & sweep
            cpp.pending_c_function_body.append(once "se_thread_checkpoint();%N")
         end
      end

feature {C_NATIVE_PROCEDURE_MAPPER}
   mark_item (rf7: RUN_FEATURE_7)
      local
         elt_type: TYPE
      do
         cpp.pending_c_function_body.append(once "{/*mark_item*/%N")
         elt_type := rf7.arguments.name(1).resolve_in(rf7.type_of_current).generic_list.first
         cpp.pending_c_function_body.append(cpp.argument_type.for(elt_type.canonical_type_mark))
         cpp.pending_c_function_body.append(once " elt=")
         cpp.put_ith_argument(1)
         cpp.pending_c_function_body.append(once "[")
         cpp.put_ith_argument(2)
         cpp.pending_c_function_body.append(once "];%N")
         mark_for(once "elt", elt_type.live_type, False)
         cpp.pending_c_function_body.append(once "/*mark_item*/}")
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
      local
         index: INTEGER
         tag: C_GARBAGE_COLLECTOR_TAG
      do
         special_tag.set(c_struct_signature_tagger.for(live_type))
         index := c_struct_signature_map.first_index_of(special_tag)
         if c_struct_signature_map.valid_index(index) then
            tag := c_struct_signature_map.item(index)
         else
            create tag.make(special_tag.tag)
            c_struct_signature_map.add_last(tag)
         end
         tag.increment
         live_type.set_tag(c_struct_signature_tag, tag)
      end

feature {C_COMPILATION_MIXIN}
   need_struct_for (type_mark: TYPE_MARK): BOOLEAN
      do
         check not Result end
      end

   extra_c_struct (type_mark: TYPE_MARK)
      do
      end

   extra_c_model (type_mark: TYPE_MARK)
      do
      end

   assigned_native_array (assignment: ASSIGNMENT; type: TYPE)
      do
      end

feature {ONCE_ROUTINE_POOL, NATIVE_ARRAY_TYPE_MARK, NATIVE_BUILT_IN, C_COMPILATION_MIXIN}
   mark_for (entity: STRING; lt: LIVE_TYPE; non_void_no_dispatch_flag: BOOLEAN)
         -- Add C code to mark the `entity' of `lt'. The `non_void_no_dispatch_flag' indicates that we
         -- are sure that the entity to mark is never NULL or Void)
      require
         cpp.pending_c_function
         need_mark.for(lt.type)
      local
         ct: TYPE_MARK; run_time_set: RUN_TIME_SET
      do
         run_time_set := lt.run_time_set
         if run_time_set.count >= 1 then
            ct := lt.canonical_type_mark
            if ct.is_reference or else ct.is_native_array then
               if not non_void_no_dispatch_flag then
                  cpp.pending_c_function_body.append(once "if(NULL!=")
                  cpp.pending_c_function_body.append(entity)
                  cpp.pending_c_function_body.extend(')')
               end
            end
            if run_time_set.count > 1 and then not ct.is_expanded then
               --|*** ************************
               --| Note: I don't understand why this fix (provided by Alain
               --| Le_Guennec) can be useful because, as far as I know, an
               --| expanded class must not have more than one runnable.
               --|*** Fri Aug 15 2000, DC
               if not switch_list.fast_has(lt) then
                  switch_list.add_last(lt)
               end
               cpp.pending_c_function_body.extend('X')
               --|*** Could be better when `non_void_no_dispatch_flag' !
               --|*** (Dom. june 14th 2004) ***
               mark_in(ct, cpp.pending_c_function_body, False)
            else
               ct := run_time_set.first.canonical_type_mark
               mark_in(ct, cpp.pending_c_function_body, False)
            end
            cpp.pending_c_function_body.extend('(')
            if ct.is_reference then
               cpp.pending_c_function_body.extend('(')
               if run_time_set.count > 1 then
                  cpp.pending_c_function_body.append(once "T0*")
               else
                  cpp.pending_c_function_body.append(cpp.target_type.for(ct))
               end
               cpp.pending_c_function_body.extend(')')
            elseif ct.is_user_expanded then
               cpp.pending_c_function_body.extend('&')
            end
            cpp.pending_c_function_body.extend('(')
            cpp.pending_c_function_body.append(entity)
            cpp.pending_c_function_body.append(once "));%N")
         end
      end

feature {}
   make
      do
         create header_compiler.make
         create functions_compiler.make
         create info_compiler.make
         create before_mark_compiler.make
         create need_mark.make
         create native_array_collector.make
         create c_struct_signature_map.make(0)
         create c_struct_signature_tagger.make
      end

   compute_ceils
      local
         fsoc_count_ceil, rsoc_count_ceil, i: INTEGER; live_type_map: TRAVERSABLE[LIVE_TYPE]; lt: LIVE_TYPE
         kb_count: INTEGER
      do
         live_type_map := smart_eiffel.live_type_map
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               if lt.canonical_type_mark.is_native_array then
                  rsoc_count_ceil := rsoc_count_ceil + 1
               else
                  fsoc_count_ceil := fsoc_count_ceil + 1
               end
            end
            i := i + 1
         end
         fsoc_count_ceil := 4 * fsoc_count_ceil
         kb_count := fsoc_count_ceil * (fsoc_size #// 1024)
         if kb_count < 256 then
            fsoc_count_ceil := (256).to_integer_32 #// (fsoc_size #// 1024)
         end
         rsoc_count_ceil := 3 * rsoc_count_ceil
         kb_count := rsoc_count_ceil * (rsoc_size #// 1024)
         if kb_count < 256 then
            rsoc_count_ceil := (256).to_integer_32 #// (rsoc_size #// 1024)
         end
         cpp.out_c_buffer.clear_count
         fsoc_count_ceil.append_in(cpp.out_c_buffer)
         cpp.write_extern_2(once "unsigned int fsoc_count_ceil", cpp.out_c_buffer)
         cpp.out_c_buffer.clear_count
         rsoc_count_ceil.append_in(cpp.out_c_buffer)
         cpp.write_extern_2(once "unsigned int rsoc_count_ceil", cpp.out_c_buffer)
      end

   switch_list: FAST_ARRAY[LIVE_TYPE]
         -- For which there is a switching function.
      once
         create Result.with_capacity(128)
      end

   switch_for (lt: LIVE_TYPE)
      local
         ct: TYPE_MARK; run_time_set: RUN_TIME_SET
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void X")
         ct := lt.canonical_type_mark
         mark_in(ct, cpp.pending_c_function_signature, False)
         cpp.pending_c_function_signature.append(once "(T0*o)")
         run_time_set := lt.run_time_set
         cpp.pending_c_function_body.append(once "{int i=o->id;%N")
         c_dicho(run_time_set, 1, run_time_set.count)
         cpp.pending_c_function_body.extend('}')
         cpp.dump_pending_c_function(True)
      end

   c_dicho (run_time_set: RUN_TIME_SET; bi, bs: INTEGER)
         -- Produce dichotomic inspection code for Current id.
      require
         bi <= bs
         cpp.pending_c_function
      local
         m: INTEGER; lt: LIVE_TYPE
      do
         if bi = bs then
            lt := run_time_set.item(bi)
            mark_in(lt.canonical_type_mark, cpp.pending_c_function_body, False)
            cpp.pending_c_function_body.append(once "((T")
            lt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*)o);%N")
         else
            m := (bi + bs) #// 2
            lt := run_time_set.item(m)
            cpp.pending_c_function_body.append(once "if (i <= ")
            lt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ") {%N")
            c_dicho(run_time_set, bi, m)
            cpp.pending_c_function_body.append(once "}%Nelse{%N")
            c_dicho(run_time_set, m + 1, bs)
            cpp.pending_c_function_body.extend('}')
         end
      end

   just_before_mark (live_type_map: TRAVERSABLE[LIVE_TYPE])
      require
         cpp.pending_c_function
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               before_mark_compiler.compile(lt.canonical_type_mark)
            end
            i := i + 1
         end
      end

   define_gc_info (live_type_map: TRAVERSABLE[LIVE_TYPE])
      require
         info_flag
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void  gc_info(void)")

         cpp.pending_c_function_body.append(once
         "fprintf(SE_GCINFO,%"--------------------\nNumber\tTotal\tStore\tName\ncreated\tsize\tleft\n%");%N")
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               info_compiler.compile(lt.canonical_type_mark)
            end
            i := i + 1
         end
         agent_pool_gc_info
         cpp.pending_c_function_body.append(once "fprintf(SE_GCINFO,%"C-stack=%%d %",gc_stack_size());%N%
           %fprintf(SE_GCINFO,%"main-table=%%d/%%d %",gcmt_used,gcmt_max);%N%
           %fprintf(SE_GCINFO,%"fsoc:%%d(%",fsoc_count);%N%
           %fprintf(SE_GCINFO,%"free=%%d %",fsocfl_count());%N%
           %fprintf(SE_GCINFO,%"ceil=%%d) %",fsoc_count_ceil);%N%
           %fprintf(SE_GCINFO,%"rsoc:%%d(%",rsoc_count);%N%
           %fprintf(SE_GCINFO,%"ceil=%%d)\n%",rsoc_count_ceil);%N%
           %fprintf(SE_GCINFO,%"GC called %%d time(s)\n%",collector_counter);%N%
           %fprintf(SE_GCINFO,%"--------------------\n%");%N")

         cpp.dump_pending_c_function(True)
      end

   agent_pool_gc_info
         -- Produce C code to print GC information.
      require
         cpp.pending_c_function
      do
         if agent_pool.agent_creation_collected_flag then
            cpp.pending_c_function_body.append(once "[
               if(gc_info_nb_agent)
                  fprintf(SE_GCINFO,
                  "%d\tagent(s) created. (store_left=%d).\n",
                  gc_info_nb_agent,store_left_agent);

                              ]")
         end
      end

   define_gc_start (root_type: TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE])
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void gc_start(void)")
         if smart_eiffel.thread_used then
            cpp.pending_c_function_body.append(once "se_thread_lock_lock(gc_lock);%N")
         end
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_ENTER_GC,NULL);%N");
         cpp.pending_c_function_body.append(once "if(!gc_is_off && !garbage_delayed()){%N")
         cpp.pending_c_function_body.append(once "gcmt_tail_addr=(((char*)(gcmt[gcmt_used-1]))+%
            %(gcmt[gcmt_used-1])->size);%N%
            %((gc")
         root_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*)eiffel_root_object)->header.flag=FSOH_UNMARKED;%N")
         just_before_mark(live_type_map)
         cpp.pending_c_function_body.append(once "gc_mark")
         root_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(eiffel_root_object);%N%
                     %manifest_string_mark1();%N%
                     %once_function_mark();%N")
         if smart_eiffel.generator_used then
            cpp.pending_c_function_body.append(once "{int i=SE_MAXID-1;%N%
                        %while(i>=0){%N%
                        %if(g[i]!=NULL)gc_mark7(g[i]);%N%
                        %i--;}%N}%N")
         end
         if smart_eiffel.generating_type_used then
            cpp.pending_c_function_body.append(once "{int i=SE_MAXID-1;%N%
                        %while(i>=0){%N%
                        %if(t[i]!=NULL)gc_mark7(t[i]);%N%
                        %i--;}%N}%N")
         end
         if smart_eiffel.thread_used then
            cpp.pending_c_function_body.append(once "se_thread_barrier(mark_stack_and_registers);%N%
                                                    %se_thread_barrier(gc_sweep);%N")
         else
            cpp.pending_c_function_body.append(once "mark_stack_and_registers();%N%
                                                    %gc_sweep();%N")
         end
         cpp.pending_c_function_body.append(once "collector_counter++;%N")
         if info_flag then
            cpp.pending_c_function_body.append(once "gc_info();%N")
         end
         cpp.pending_c_function_body.append(once "}%N")
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_EXIT_GC,NULL);%N");
         if smart_eiffel.thread_used then
            cpp.pending_c_function_body.append(once "se_thread_lock_unlock(gc_lock);%N")
         end
         cpp.dump_pending_c_function(True)
      end

   fsoc_size: INTEGER 8192
         -- Fixed Size Objects Chunks Size.

   rsoc_size: INTEGER 32768
         -- ReSizable Objects Chunks Size.

   dispose_flag: BOOLEAN

   c_struct_signature_tagger: C_GARBAGE_COLLECTOR_TAGGER

   c_struct_signature_map: FAST_ARRAY[C_GARBAGE_COLLECTOR_TAG]

   special_tag: C_GARBAGE_COLLECTOR_TAG
      once
         create Result.special
      end

feature {C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER}
   c_struct_signature_tag: FIXED_STRING
      once
         Result := "c_struct_signature".intern
      end

end -- class GC_HANDLER
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
