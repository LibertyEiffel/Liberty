-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class GC_HANDLER
   --
   -- GARBAGE_COLLECTOR_HANDLER
   --

insert
   GLOBALS

creation {ANY}
   make

feature {ANY}
   is_off: BOOLEAN
         -- True when the Garbage Collector is not produced.

   info_flag: BOOLEAN
         -- True when Garbage Collector Information need to be printed.

feature {ACE, COMPILE_TO_C, STRING_COMMAND_LINE}
   no_gc is
      do
         is_off := True
         info_flag := False
      ensure
         is_off
         not info_flag
      end

   set_info_flag is
      do
         is_off := False
         info_flag := True
      ensure
         not is_off
         info_flag
      end

feature {TYPE_MARK}
   memory_dispose (o: STRING; live_type: LIVE_TYPE) is
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         cpp.pending_c_function
         not live_type.is_expanded
         not live_type.is_native_array
      local
         rf3: RUN_FEATURE_3; no_check: BOOLEAN
      do
         rf3 := live_type.get_memory_dispose
         if rf3 /= Void then
            dispose_flag := True
            cpp.pending_c_function_body.append(once "if((")
            cpp.pending_c_function_body.append(o)
            cpp.pending_c_function_body.append(once "->header.flag)==FSOH_UNMARKED){%N")
            no_check := ace.no_check
            if no_check then
               cpp.pending_c_function_body.append(once "[
                se_frame_descriptor gcd={"Garbage Collector at work.\n"
                "dispose called (during sweep phase)",0,0,"",1};
                se_dump_stack ds = {NULL,NULL,0,NULL,NULL};
                ds.fd=&gcd;
                ds.caller=se_dst;
                ds.exception_origin=NULL;
                ds.locals=NULL;

                     ]")
               rf3.c_set_dump_stack_top(once "&ds", once "link")
            end
            cpp.pending_c_function_body.extend('r')
            live_type.id.append_in(cpp.pending_c_function_body)
            rf3.name.mapping_c_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('(')
            if no_check then
               cpp.pending_c_function_body.append(once "&ds,")
            end
            if ace.profile then
               cpp.pending_c_function_body.append(once "&gc_local_profile")
            end
            if no_check or else rf3.use_current then
               inspect
                  cpp.pending_c_function_body.last
               when ',', '(' then
               else
                  cpp.pending_c_function_body.extend(',')
               end
               cpp.pending_c_function_body.extend('(')
               live_type.canonical_type_mark.c_type_for_target_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(')')
               cpp.pending_c_function_body.append(o)
            end
            cpp.pending_c_function_body.append(once ");%N")
            if no_check then
               rf3.c_set_dump_stack_top(once "ds.caller", once "unlink")
            end
            cpp.pending_c_function_body.extend('}')
         end
      end

feature {C_PRETTY_PRINTER}
   customize_c_runtime is
      do
         if not is_off then
            cpp.macro_def(once "FSOC_SIZE", fsoc_size)
            cpp.macro_def(once "RSOC_SIZE", rsoc_size)
            cpp.sys_runtime_h_and_c(once "gc_lib")
         end
      end

   initialize_runtime is
      do
         if not is_off then
            cpp.pending_c_function_body.append(once "gcmt=((mch**)se_malloc((gcmt_max+1)*sizeof(void*)));%N%
                                %#ifdef FIXED_STACK_BOTTOM%N%
                                %if (!stack_bottom) stack_bottom=((void**)(void*)(&argc));%N%
                                %#endif%N")
         end
      end

   gc_info_before_exit is
      do
         if not is_off then
            if info_flag then
               cpp.pending_c_function_body.append(once "fprintf(SE_GCINFO,%"==== Last GC before exit ====\n%");%N%
               %gc_start();%N")
            end
            if dispose_flag then
               cpp.pending_c_function_body.append(once "gc_dispose_before_exit();%N")
            end
         end
      end

feature {C_PRETTY_PRINTER}
   define1 is
      require
         not is_off
      do
         echo.put_string(once "Adding Garbage Collector.%N")
         --
         compute_ceils
      end

   define2 is
      require
         not is_off
      local
         i: INTEGER; lt: LIVE_TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]; root_type: TYPE
      do
         live_type_map := smart_eiffel.live_type_map
         root_type := smart_eiffel.root_procedure.type_of_current
         manifest_string_pool.define_manifest_string_mark
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void once_function_mark(void)")
         once_routine_pool.gc_mark
         cpp.dump_pending_c_function(True)
         define_gc_start(root_type, live_type_map)
         echo.put_string(once "GC support (gc_define1 step).%N")
         cpp.split_c_file_padding_here
         from
            i := live_type_map.upper
         until
            i < 0
         loop
            lt := live_type_map.item(i)
            lt.gc_define1
            i := i - 1
         end
         echo.put_string(once "GC support (gc_define2 step).%N")
         from
            i := live_type_map.upper
         until
            i < 0
         loop
            lt := live_type_map.item(i)
            lt.gc_define2
            i := i - 1
         end
         from
            i := switch_list.upper
         until
            i < 0
         loop
            switch_for(switch_list.item(i))
            i := i - 1
         end
         if info_flag then
            define_gc_info(live_type_map)
         end
      ensure
         smart_eiffel.magic_count = old smart_eiffel.magic_count
      end

feature {ANY}
   allocation_of (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE) is
         -- Heap-allocation into `internal_c_local' of a new object of some `created_live_type'.
      require
         cpp.pending_c_function
         created_live_type.at_run_time
         created_live_type.is_reference
      do
         internal_c_local.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend('=')
         if is_off then
            if created_live_type.canonical_type_mark.need_c_struct then
               cpp.pending_c_function_body.append(once "((T0*)se_malloc(sizeof(T")
               created_live_type.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ")))")
               cpp.recompilation_comment(created_live_type)
               cpp.pending_c_function_body.append(once ";%N*((T")
               created_live_type.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "*)")
               internal_c_local.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once ")=M")
               created_live_type.id.append_in(cpp.pending_c_function_body)
            else
               -- Object has no attributes:
               cpp.pending_c_function_body.append(once "((T0*)(se_malloc(1)))")
            end
         else
            cpp.pending_c_function_body.append(once "((T0*)(new")
            created_live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "()))")
         end
         cpp.pending_c_function_body.append(once ";%N")
         initialize_user_expanded_attributes(internal_c_local, created_live_type)
      end

feature {}
   initialize_user_expanded_attributes (internal_c_local: INTERNAL_C_LOCAL; created_live_type: LIVE_TYPE) is
         -- Produce C code to initialize, if any, expanded attributes of the newly `created_live_type' which is
         -- currently stored in the `internal_c_local'.
      require
         smart_eiffel.is_ready
         internal_c_local /= Void
         created_live_type.is_reference
      local
         wa: ARRAY[RUN_FEATURE]; a: RUN_FEATURE; at: TYPE_MARK; i: INTEGER; rf3: RUN_FEATURE_3
         coma_flag: BOOLEAN
      do
         if created_live_type.class_text.name.to_string /= as_typed_internals then
            wa := created_live_type.writable_attributes
         end
         if wa /= Void then
            from
               i := wa.upper
            until
               i = 0
            loop
               a := wa.item(i)
               at := a.result_type
               if at.is_user_expanded then
                  rf3 := at.type.live_type.default_create_run_feature
                  if rf3 /= Void then
                     coma_flag := False
                     rf3.mapping_name_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.extend('(')
                     if ace.no_check then
                        cpp.pending_c_function_body.append(once "&ds")
                        coma_flag := True
                     end
                     if ace.profile then
                        if coma_flag then
                           cpp.pending_c_function_body.extend(',')
                        end
                        cpp.pending_c_function_body.append(once "&local_profile")
                        coma_flag := True
                     end
                     if rf3.use_current then
                        if coma_flag then
                           cpp.pending_c_function_body.extend(',')
                        end
                        if rf3.type_of_current.is_empty_expanded then
                           cpp.pending_c_function_body.extend('0')
                        else
                           cpp.pending_c_function_body.append(once "&(((T")
                           created_live_type.id.append_in(cpp.pending_c_function_body)
                           cpp.pending_c_function_body.append(once "*)")
                           internal_c_local.append_in(cpp.pending_c_function_body)
                           cpp.pending_c_function_body.append(once ")->_")
                           cpp.pending_c_function_body.append(a.name.to_string)
                           cpp.pending_c_function_body.extend(')')
                        end
                     end
                     cpp.pending_c_function_body.append(once ");%N")
                  end
               end
               i := i - 1
            end
         end
      end

feature {MANIFEST_STRING_POOL}
   manifest_string_in (c_code: STRING; string_at_run_time: BOOLEAN) is
         -- Code to create a new Manifest STRING in the "s" local C variable.
      do
         if is_off or else not string_at_run_time then
            c_code.append(once "s=((T7*)se_malloc(sizeof(T7)));%N")
            if string_at_run_time and then
               smart_eiffel.type_string.live_type.is_tagged
             then
               c_code.append(once "s->id=7;%N")
            end
         else
            c_code.append(once "s=new7();%N")
         end
      end

   native9_in (c_code: STRING; string_at_run_time: BOOLEAN) is
      do
         if is_off or else not string_at_run_time then
            c_code.append(once "se_malloc")
         else
            c_code.append(once "new9")
         end
      end

feature {LIVE_TYPE, ONCE_ROUTINE_POOL, NATIVE_ARRAY_TYPE_MARK, NATIVE_BUILT_IN}
   mark_for (entity: STRING; lt: LIVE_TYPE; non_void_no_dispatch_flag: BOOLEAN) is
         -- Add C code to mark the `entity' of `lt'. The `non_void_no_dispatch_flag' indicates that we
         -- are sure that the entity to mark is never NULL or Void)
      require
         cpp.pending_c_function
         not is_off
         lt.type.need_gc_mark_function
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
               ct.gc_mark_in(cpp.pending_c_function_body)
            else
               ct := run_time_set.first.canonical_type_mark
               ct.gc_mark_in(cpp.pending_c_function_body)
            end
            cpp.pending_c_function_body.extend('(')
            if ct.is_reference then
               cpp.pending_c_function_body.extend('(')
               if run_time_set.count > 1 then
                  cpp.pending_c_function_body.append(once "T0*")
               else
                  ct.c_type_for_target_in(cpp.pending_c_function_body)
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
   make is
      do
      end

   compute_ceils is
      local
         fsoc_count_ceil, rsoc_count_ceil, i: INTEGER; live_type_map: TRAVERSABLE[LIVE_TYPE]; lt: LIVE_TYPE
         kb_count: INTEGER
      do
         live_type_map := smart_eiffel.live_type_map
         from
            i := live_type_map.upper
         until
            i < 0
         loop
            lt := live_type_map.item(i)
            if lt.at_run_time then
               if lt.canonical_type_mark.is_native_array then
                  rsoc_count_ceil := rsoc_count_ceil + 1
               else
                  fsoc_count_ceil := fsoc_count_ceil + 1
               end
            end
            i := i - 1
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

   switch_list: FAST_ARRAY[LIVE_TYPE] is
         -- For which there is a switching function.
      once
         create Result.with_capacity(128)
      end

   switch_for (lt: LIVE_TYPE) is
      local
         ct: TYPE_MARK; run_time_set: RUN_TIME_SET
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void X")
         ct := lt.canonical_type_mark
         ct.gc_mark_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(T0*o)")
         run_time_set := lt.run_time_set
         cpp.pending_c_function_body.append(once "{int i=o->id;%N")
         c_dicho(run_time_set, 1, run_time_set.count)
         cpp.pending_c_function_body.extend('}')
         cpp.dump_pending_c_function(True)
      end

   c_dicho (run_time_set: RUN_TIME_SET; bi, bs: INTEGER) is
         -- Produce dichotomic inspection code for Current id.
      require
         bi <= bs
         cpp.pending_c_function
      local
         m: INTEGER; lt: LIVE_TYPE
      do
         if bi = bs then
            lt := run_time_set.item(bi)
            lt.canonical_type_mark.gc_mark_in(cpp.pending_c_function_body)
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

   just_before_mark (live_type_map: TRAVERSABLE[LIVE_TYPE]) is
      require
         not is_off
         cpp.pending_c_function
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         from
            i := live_type_map.upper
         until
            i < 0
         loop
            lt := live_type_map.item(i)
            lt.just_before_gc_mark_in(cpp.pending_c_function_body)
            i := i - 1
         end
      end

   define_gc_info (live_type_map: TRAVERSABLE[LIVE_TYPE]) is
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
            i := 0
         until
            i > live_type_map.upper
         loop
            lt := live_type_map.item(i)
            lt.gc_info_in(cpp.pending_c_function_body)
            i := i + 1
         end
         agent_pool.gc_info
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

   define_gc_start (root_type: TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]) is
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void gc_start(void)")
         cpp.pending_c_function_body.append(once "if(gc_is_off)return;%N%
                                                 %if(garbage_delayed())return;%N")
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_ENTER_GC,NULL);%N");
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
         cpp.pending_c_function_body.append(once "mark_stack_and_registers();%N%
                     %gc_sweep();%N%
                     %collector_counter++;%N")
         if info_flag then
            cpp.pending_c_function_body.append(once "gc_info();%N")
         end
         cpp.pending_c_function_body.append(once "handle(SE_HANDLE_EXIT_GC,NULL);%N");
         cpp.dump_pending_c_function(True)
      end

   fsoc_size: INTEGER is 8192
         -- Fixed Size Objects Chunks Size.

   rsoc_size: INTEGER is 32768
         -- ReSizable Objects Chunks Size.

   dispose_flag: BOOLEAN

invariant
   info_flag implies not is_off

end -- class GC_HANDLER
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
