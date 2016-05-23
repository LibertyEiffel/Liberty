-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_FUNCTIONS_COMPILER
   --
   -- Define C functions for the Garbage Collector
   --

inherit
   C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER
      redefine
         make, visit_weak_reference_type_mark
      end

create {GC_HANDLER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type
         if lt.type.has_local_closure then
            gc_reference_sweep(visited, lt, False, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type
         -- ----------------------------- Definition for gc_markXXX :
         cpp.prepare_c_function
         function_signature.append(once "void ")
         memory.mark_in(visited, function_signature, False)
         function_signature.append(once "(")
         ltid_in(lt, function_signature, True, False)
         function_signature.append(once "o)")
         gc_mark_na(visited)
         cpp.dump_pending_c_function(True)
         -- --------------------------------- Definition for newXXX :
         cpp.prepare_c_function
         ltid_in(lt, function_signature, True, False)
         function_signature.append(once "new")
         ltid_in(lt, function_signature, False, False)
         function_signature.append(once "(unsigned int size)")
         function_body.append(once "size=(size*sizeof(")
         function_body.append(cpp.result_type.for(visited.generic_list.first))
         function_body.append(once "/*")
         function_body.append(lt.type.generic_list.first.live_type.structure_signature)
         function_body.append(once "*/))+sizeof(rsoh);%Nsize=((size+(sizeof(double)-1))&~(sizeof(double)-1));%N")
         if memory.info_flag then
            memory.info_nb_in(visited, function_body, False)
            function_body.append(once "++;%N")
            memory.na_env_in(visited, function_body)
            function_body.append(once ".space_used+=size;%N")
         end
         function_body.append(once "if (size<=(")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left)){%N%
                                                 %rsoh*r=")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left-=size;%N%
                                                 %if(")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left>sizeof(rsoh)){%N%
                                                 %r->header.size=size;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store=((rsoh*)(((char*)(")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store))+size));%N}%N%
                                                 %else {%N%
                                                 %r->header.size=size+")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left;%N")
         memory.na_env_in(visited, function_body)
         function_body.append(once ".store_left=0;%N}%N%
                                   %(r->header.magic_flag)=RSOH_UNMARKED;%N%
                                   %((void)memset((r+1),0,r->header.size-sizeof(rsoh)));%N%
                                   %return((T")
         ltid_in(lt, function_body, False, False)
         function_body.append(once ")(r+1));%N}%Nreturn((T")
         ltid_in(lt, function_body, False, False)
         function_body.append(once ")new_na(&")
         memory.na_env_in(visited, function_body)
         function_body.append(once ",size));%N")
         cpp.dump_pending_c_function(True)

         if lt.type.has_local_closure then
            gc_reference_sweep(visited, lt, False, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         gc_weak_reference(visited)
      end

feature {}
   gc_reference_sweep (visited: TYPE_MARK; lt: LIVE_TYPE; is_weak_ref, for_closure: BOOLEAN)
      require
         lt = visited.type.live_type
         lt.is_expanded implies for_closure
      local
         wr_gen_arg_lt: LIVE_TYPE
         is_monomorphic_weak_ref: BOOLEAN
      do
         cpp.prepare_c_function
         function_signature.append(once "void gc_sweep")
         ltid_in(lt, function_signature, False, for_closure)
         function_signature.append(once "(fsoc*c)")
         function_body.append(once "gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*o1,*o2;%No1=((gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*)(&(c->first_object)));%N%
                                   %if(c->header.state_type==FSO_STORE_CHUNK){%N%
                                   %for(;o1<")
         memory.store_in(visited, function_body, for_closure)
         function_body.append(once ";o1++){%N%
                                   %if((o1->header.flag)==FSOH_MARKED){%N%
                                   %o1->header.flag=FSOH_UNMARKED;%N")
         wr_gen_arg_lt := visited.weak_reference_argument(lt)
         check
            is_weak_ref = (wr_gen_arg_lt /= Void)
         end
         if is_weak_ref then
            check
               visited.generic_list.count = 1
            end
            is_monomorphic_weak_ref := wr_gen_arg_lt.run_time_set.count = 1
            check
               is_monomorphic_weak_ref implies not for_closure
            end
            if is_monomorphic_weak_ref then
               if for_closure then
                  error_handler.append("Unexpected closure on weak_ref?!")
                  error_handler.print_as_internal_error
               end
               function_body.append(once "gc_update_weak_ref_item")
               ltid_in(lt, function_body, False, False)
               function_body.append(once "(&(o1->object));%N")
            else
               function_body.append(once "gc_update_weak_ref_item_polymorph((Tgc*)&(o1->object));%N")
            end
         end
         function_body.append(once "}%Nelse{%N")
         memory.memory_dispose(once "o1", lt)
         function_body.append(once "o1->header.next=gc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ";%Ngc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "=o1;%N%
                                   %}%N}%N}%N%
                                   %else{%N%
                                   %int dead=1;%N%
                                   %gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*old_gc_free=gc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ";%N%
                                   %o2=o1+c->count_minus_one;%N%
                                   %for(;o1<=o2;o1++){%N%
                                   %if((o1->header.flag)==FSOH_MARKED){%N%
                                   %o1->header.flag=FSOH_UNMARKED;%N")
         if is_weak_ref then
            if is_monomorphic_weak_ref then
               function_body.append(once "gc_update_weak_ref_item")
               ltid_in(lt, function_body, False, False)
               function_body.append(once "(&(o1->object));%N")
            else
               function_body.append(once "gc_update_weak_ref_item_polymorph((Tgc*)&(o1->object));%N")
            end
         end
         function_body.append(once "dead=0;}%Nelse{%N")
         memory.memory_dispose(once "o1", lt)
         function_body.append(once "o1->header.next=gc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ";%Ngc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "=o1;%N%
                                   %}%N}%N%
                                   %if(dead){%N%
                                   %gc_free")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "=old_gc_free;%N%
                                   %c->next=fsocfl;%N%
                                   %fsocfl=c;%N%
                                   %c->header.state_type=FSO_FREE_CHUNK;%N}%N%
                                   %}%N")
         cpp.dump_pending_c_function(True)
      end

   gc_reference_update_weak_ref_item (visited: TYPE_MARK; lt: LIVE_TYPE)
      require
         lt = visited.type.live_type
      local
         arg_id: INTEGER; wr_gen_arg_lt: LIVE_TYPE
         is_monomorphic_weak_ref: BOOLEAN
      do
         wr_gen_arg_lt := visited.weak_reference_argument(lt)
         check
            wr_gen_arg_lt /= Void
         end
         is_monomorphic_weak_ref := wr_gen_arg_lt.run_time_set.count = 1
         if is_monomorphic_weak_ref then
            cpp.prepare_c_function
            function_signature.append(once "void gc_update_weak_ref_item")
            ltid_in(lt, function_signature, False, False)
            function_signature.append(once "(T")
            ltid_in(lt, function_signature, False, False)
            function_signature.append(once "*wr)")
            function_body.append(once "gc")
            arg_id := wr_gen_arg_lt.run_time_set.first.id
            arg_id.append_in(function_body)
            function_body.append(once "*obj_ptr=(gc")
            arg_id.append_in(function_body)
            function_body.append(once "*)(wr->o);%N%
                                      %if (obj_ptr != NULL){%N%
                                      %int swept = (((void*)obj_ptr) <= ((void*)wr));%N%
                                      %if (swept != (obj_ptr->header.flag == FSOH_MARKED)) /* **** TODO: was FSOH_UNMARKED???? (incoherent with comment below) */%N%
                                      %/* (already swept) xor marked */%N%
                                      %wr->o = NULL;%N}%N")
            cpp.dump_pending_c_function(True)
         else
            check
               wr_gen_arg_lt.is_tagged
            end
            generate_once_gc_update_weak_ref_item_polymorph(visited)
         end
      end

   gc_reference_mark (visited: TYPE_MARK; lt: LIVE_TYPE; for_closure: BOOLEAN)
      require
         lt = visited.type.live_type
         lt.is_expanded implies for_closure
      local
         gc_check_id: BOOLEAN
      do
         cpp.prepare_c_function
         function_signature.append(once "void ")
         memory.mark_in(visited, function_signature, for_closure)
         function_signature.append(once "(")
         ltid_in(lt, function_signature, True, for_closure)
         function_signature.append(once "o)")
         if for_closure then
            gc_set_fsoh_marked(lt, for_closure)
            if not visited.is_kernel_expanded then
               function_body.append(once "gc_mark")
               ltid_in(lt, function_body, False, False)
               function_body.append(once "(*o);%N")
            end
         else
            gc_check_id := lt.is_tagged and then ace.no_check
            if gc_check_id then
               function_body.append(once "se_gc_check_id(o,")
               ltid_in(lt, function_body, False, False)
               function_body.append(once ");%N{%N")
            end
            gc_mark_fixed_size(lt, False)
         end
         if gc_check_id then
            function_body.append(once "}%N")
         end
         cpp.dump_pending_c_function(True)
      end

   gc_reference_align_mark (visited: TYPE_MARK; lt: LIVE_TYPE; for_closure: BOOLEAN)
      require
         lt = visited.type.live_type
         lt.is_expanded implies for_closure
      do
         cpp.prepare_c_function
         function_signature.append(once "void ")
         memory.align_mark_in(visited, function_signature, for_closure)
         function_signature.append(once "(fsoc*c,gc")
         ltid_in(lt, function_signature, False, for_closure)
         function_signature.append(once "*p)")
         gc_align_mark_fixed_size(lt, for_closure)
         cpp.dump_pending_c_function(True)
      end

   gc_reference_fsoc_model (visited: TYPE_MARK; lt: LIVE_TYPE; for_closure: BOOLEAN)
      require
         lt = visited.type.live_type
         lt.is_expanded implies for_closure
      do
         cpp.out_h_buffer.copy(once "fsoc H")
         ltid_in(lt, cpp.out_h_buffer, False, for_closure)
         cpp.out_c_buffer.copy(once "{{FSOC_SIZE,FSO_STORE_CHUNK,%N(void(*)(mch*,void*))")
         memory.align_mark_in(visited, cpp.out_c_buffer, for_closure)
         cpp.out_c_buffer.append(once ",%N(void(*)(mch*))")
         memory.sweep_in(visited, cpp.out_c_buffer, for_closure)
         cpp.out_c_buffer.append(once "},NULL,(((FSOC_SIZE-sizeof(fsoc)+sizeof(double))/sizeof(gc")
         ltid_in(lt, cpp.out_c_buffer, False, for_closure)
         cpp.out_c_buffer.append(once "))-1)}")
         cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
      end

   gc_reference_new (visited: TYPE_MARK; lt: LIVE_TYPE; for_closure: BOOLEAN)
      require
         lt = visited.type.live_type
         lt.is_expanded implies for_closure
      do
         cpp.prepare_c_function
         ltid_in(lt, function_signature, True, for_closure)
         function_signature.append(once "new")
         ltid_in(lt, function_signature, False, for_closure)
         function_signature.append(once "(void)")
         function_body.append(once "gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*n;%Nfsoc*c;%N")
         if memory.info_flag then
            memory.info_nb_in(visited, function_body, for_closure)
            function_body.append(once "++;%N")
         end
         --
         function_body.append(once "if(")
         memory.store_left_in(visited, function_body, for_closure)
         function_body.append(once ">1){%N")
         memory.store_left_in(visited, function_body, for_closure)
         function_body.append(once "--;%Nn=")
         memory.store_in(visited, function_body, for_closure)
         function_body.append(once "++;%N}%Nelse if(")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once "!=NULL){%Nn=")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once ";%N")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once "=n->header.next;%N}%Nelse if(")
         memory.store_left_in(visited, function_body, for_closure)
         function_body.append(once "==1){%N")
         memory.store_left_in(visited, function_body, for_closure)
         function_body.append(once "=0;%N")
         memory.store_chunk_in(visited, function_body, for_closure)
         function_body.append(once "->header.state_type=FSO_USED_CHUNK;%N%
                                   %n=")
         memory.store_in(visited, function_body, for_closure)
         function_body.append(once "++;%N}%N%
                                   %else{%Nc=gc_fsoc_get1();%N%
                                   %if(")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once "!=NULL){%Nn=")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once ";%N")
         memory.free_in(visited, function_body, for_closure)
         function_body.append(once "=n->header.next;%N}%Nelse{%N%
                                   %if(c==NULL)c=gc_fsoc_get2();%N")
         memory.store_chunk_in(visited, function_body, for_closure)
         function_body.append(once "=c;%N*")
         memory.store_chunk_in(visited, function_body, for_closure)
         function_body.append(once "=H")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ";%N")
         memory.store_in(visited, function_body, for_closure)
         function_body.append(once "=((gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*)(&(")
         memory.store_chunk_in(visited, function_body, for_closure)
         function_body.append(once "->first_object)));%N")
         memory.store_left_in(visited, function_body, for_closure)
         function_body.append(once "=H")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ".count_minus_one;%Nn=")
         memory.store_in(visited, function_body, for_closure)
         function_body.append(once "++;%N}%N%
                                   %}%Nn->header.flag=FSOH_UNMARKED;%N")
         if for_closure then
            function_body.append(once "n->object=")
            function_body.append(cpp.initializer.for(visited))
            function_body.append(once ";%N")
         else
            if cpp.need_struct.for(visited) then
               function_body.append(once "n->object=M")
               lt.id.append_in(function_body)
               function_body.append(once ";%N")
            end
         end
         function_body.append(once "return((")
         ltid_in(lt, function_body, True, for_closure)
         function_body.append(once ")n);%N")
         cpp.dump_pending_c_function(True)
      end

   gc_reference (visited: TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type

         gc_reference_sweep(visited, lt, False, False)
         gc_reference_mark(visited, lt, False)
         gc_reference_align_mark(visited, lt, False)
         gc_reference_fsoc_model(visited, lt, False)
         gc_reference_new(visited, lt, False)
         if lt.type.has_local_closure then
            gc_reference_sweep(visited, lt, False, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

   gc_weak_reference (visited: TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type

         gc_reference_sweep(visited, lt, True, False)
         gc_reference_update_weak_ref_item(visited, lt)
         gc_reference_mark(visited, lt, False)
         gc_reference_align_mark(visited, lt, False)
         gc_reference_fsoc_model(visited, lt, False)
         gc_reference_new(visited, lt, False)
         if lt.type.has_local_closure then
            gc_reference_sweep(visited, lt, True, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

   gc_kernel_expanded (visited: TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type

         if visited.type.has_local_closure then
            gc_reference_sweep(visited, lt, False, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

   gc_expanded (visited: TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         lt := visited.type.live_type
         if memory.need_mark.for(lt.type) then
            -- -------------------------- Definition for gc_markXXX:
            cpp.prepare_c_function
            function_signature.append(once "void ")
            memory.mark_in(visited, function_signature, False)
            function_signature.append(once "(")
            ltid_in(lt, function_signature, True, False)
            function_signature.append(once "*o)")
            gc_mark_fixed_size(lt, True)
            cpp.dump_pending_c_function(True)
         end
         if lt.type.has_local_closure then
            gc_reference_sweep(visited, lt, True, True)
            gc_reference_mark(visited, lt, True)
            gc_reference_align_mark(visited, lt, True)
            gc_reference_fsoc_model(visited, lt, True)
            gc_reference_new(visited, lt, True)
         end
      end

   generate_once_gc_update_weak_ref_item_polymorph (visited: TYPE_MARK)
      require
         visited.is_reference -- is_weak_ref
         not cpp.pending_c_function
         visited.type.live_type.at_run_time
      once
         cpp.out_h_buffer.copy(once "typedef struct Sgc {Tid id;T0*o;} Tgc;%N")
         cpp.write_out_h_buffer

         cpp.prepare_c_function
         function_signature.append(once "void gc_update_weak_ref_item_polymorph(Tgc* item)")
         function_body.append(once "T0* obj_ptr = item->o;%N%
                                   %if (obj_ptr != NULL){%N%
                                   %int obj_size=se_strucT[obj_ptr->id];%N%
                                   %int swept")
         debug
            function_body.append(once ";%N%
                                      %if (obj_size == 0){%N%
                                      %fprintf(stderr, %"Internal error: se_strucT[obj_ptr->id]==0\n%");%N%
                                      %exit(EXIT_FAILURE);%N%
                                      %}%N%
                                      %swept")
         end
         function_body.append(once "=(((void*)obj_ptr)<=((void*)item));%N%
                                   %obj_ptr = (T0*)(((char*)obj_ptr) + obj_size);%N%
                                   %if (swept != (((fso_header*)obj_ptr)->flag==FSOH_UNMARKED)) /* **** TODO: was FSOH_UNMARKED???? (incoherent with comment below) */%N%
                                   %/* (already swept) xor marked */%N%
                                   %item->o=NULL;%N}%N")
         cpp.dump_pending_c_function(True)
      end

   gc_set_fsoh_marked (lt: LIVE_TYPE; for_closure: BOOLEAN)
      require
         cpp.pending_c_function
         lt.is_expanded implies for_closure
      do
         if lt.canonical_type_mark.is_reference or else for_closure then
            function_body.append(once "((gc")
            ltid_in(lt, function_body, False, for_closure)
            function_body.append(once "*)o)->header.flag=FSOH_MARKED;%N")
         end
      end

   gc_mark_fixed_size (lt: LIVE_TYPE; is_unmarked: BOOLEAN)
         -- The main purpose is to compute for example the best body for the corresponding
         -- gc_markXXX function (as well as gc_align_markXXX). In fact, this feature can
         -- be called to produce C code when C variable `o' is not NULL and when `o' is of
         -- some concrete type (Tid*) where `id' is the one of the current LIVE_TYPE.
         -- Finally, when `is_unmarked' is True, object `o' is unmarked.
      require
         cpp.pending_c_function
         not lt.canonical_type_mark.is_native_array
         lt.at_run_time
      local
         rf2: RUN_FEATURE_2; t: TYPE; lvtp: LIVE_TYPE; i: INTEGER
      do
         cpp.recompilation_comment(lt)
         if as_weak_reference = lt.class_text_name.to_string then
            gc_set_fsoh_marked(lt, False)
         else
            wa_buf.clear_count
            wa_cyclic_buf.clear_count
            if lt.writable_attributes /= Void then
               from
                  i := lt.writable_attributes.lower
               until
                  i > lt.writable_attributes.upper
               loop
                  rf2 := lt.writable_attributes.item(i)
                  t := rf2.result_type.type
                  if memory.need_mark.for(t) then
                     lvtp := t.live_type
                     wa_cycle.clear_count
                     wa_cycle.add_last(rf2)
                     if lvtp = lt then
                        wa_cyclic_buf.add_last(rf2)
                     else
                        wa_buf.add_last(rf2)
                     end
                  end
                  i := i + 1
               end
            end
            if wa_buf.is_empty and then wa_cyclic_buf.is_empty then
               gc_set_fsoh_marked(lt, False)
            else
               if not wa_cyclic_buf.is_empty then
                  function_body.append(once "begin:%N")
               end
               if not is_unmarked then
                  function_body.append(once "if(((gc")
                  ltid_in(lt, function_body, False, False)
                  function_body.append(once "*)o)->header.flag==FSOH_UNMARKED){%N")
               end
               gc_set_fsoh_marked(lt, False)
               from
                  -- Ordinary attributes :
                  i := wa_buf.lower
               until
                  i > wa_buf.upper
               loop
                  rf2 := wa_buf.item(i)
                  mark_attribute(lt, rf2)
                  i := i + 1
               end
               from
                  -- Cyclic attributes :
                  i := wa_cyclic_buf.lower
               until
                  i > wa_cyclic_buf.upper
               loop
                  rf2 := wa_cyclic_buf.item(i)
                  t := rf2.result_type.type
                  lvtp := t.live_type
                  wa_cycle.clear_count
                  wa_cycle.add_last(rf2)
                  if i = wa_cyclic_buf.upper and then wa_cycle.count = 1 and then lvtp.run_time_set.count = 1 and then lvtp.run_time_set.item(1) = lt then
                     function_body.append(once "o=(void*)o->_")
                     function_body.append(rf2.name.to_string)
                     function_body.append(once ";%Nif((o!=NULL)")
                     if is_unmarked then
                        function_body.append(once "&&(((gc")
                        ltid_in(lt, function_body, False, False)
                        function_body.append(once "*)o)->header.flag==FSOH_UNMARKED))")
                     else
                        function_body.extend(')')
                     end
                     function_body.append(once "goto begin;%N")
                  else
                     mark_attribute(lt, rf2)
                  end
                  i := i + 1
               end
               if not is_unmarked then
                  function_body.append(once "}%N")
               end
            end
         end
      end

   insert_native_array_collector_flag (lt: LIVE_TYPE): BOOLEAN
      require
         lt /= Void
      local
         must_collect: TAGGED_FLAG
      do
         must_collect := memory.native_array_collector.must_collect(lt)
         Result := must_collect /= Void and then must_collect.item
      end

   mark_attribute (lt: LIVE_TYPE; rf2: RUN_FEATURE_2)
      require
         cpp.pending_c_function
      local
         attribute_type: LIVE_TYPE; field_name: STRING
      do
         attribute_type := rf2.result_type.type.live_type
         if attribute_type = Void then
            -- Access to the attribute actually exist, but this is always Void because no creation
            -- exists for the corresponding type.
            -- Yes, this is possible `simplify', but this test can stay there.
         else
            field_name := once "............ unique local buffer ..................."
            field_name.copy(once "o->_")
            field_name.append(rf2.name.to_string)
            if  attribute_type.is_native_array and then insert_native_array_collector_flag(lt) then
               function_body.append(once "{%N")
               ltid_in(attribute_type, function_body, True, False)
               function_body.append(once " na=")
               function_body.append(field_name)
               function_body.append(once "[
                  ;
                  if(gc_find_chunk(na)!=NULL){/* non external NA */
                     rsoh*h=((rsoh*)na)-1;
                     if((h->header.magic_flag)==RSOH_UNMARKED){
                        h->header.magic_flag=RSOH_MARKED;

                  ]")
               function_body.append(once "r")
               ltid_in(lt, function_body, False, False)
               function_body.append(once "mark_native_arrays(")
               if not ace.boost then
                  -- Hope there is no bug in `mark_native_arrays'...
                  function_body.append(once "NULL,")
               end
               if ace.profile then
                  function_body.append(once "NULL,")
               end
               function_body.append(once "o);%N}%N}%N}")
            else
               memory.mark_for(field_name, attribute_type, False)
            end
         end
      end

   gc_align_mark_fixed_size (lt: LIVE_TYPE; for_closure: BOOLEAN)
         -- Compute the best body for gc_align_markXXX of a fixed_size object.
      require
         cpp.pending_c_function
         not lt.canonical_type_mark.is_native_array
         lt.at_run_time
      do
         function_body.append(once "gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*b=((gc")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once "*)(&(c->first_object)));%N%
                                   %if((c->header.state_type==FSO_STORE_CHUNK)%
                                   %&&(((char*)p)>=((char*)store")
         ltid_in(lt, function_body, False, for_closure)
         function_body.append(once ")))return;%N%
                                   %if(((char*)p)>((char*)(b+(c->count_minus_one))))return;%N%
                                   %if(((char*)p)<((char*)b))return;%N%
                                   %if(((((char*)p)-((char*)b))%%sizeof(*p))==0){%N%
                                   %if(p->header.flag==FSOH_UNMARKED){%N")
         ltid_in(lt, function_body, True, for_closure)
         function_body.append(once "o=(&(p->object));%N")
         if for_closure then
            function_body.append(once "gc_mark")
            ltid_in(lt, function_body, False, True)
            function_body.append(once "(o);%N")
         else
            gc_mark_fixed_size(lt, True)
         end
         function_body.append(once "}%N}%N")
      end

   gc_mark_na (visited: NATIVE_ARRAY_TYPE_MARK)
         -- The main purpose is to compute for example the best body for the gc_markXXX function.
         -- Actually, this feature may be called to produce C code when C variable `o' is not NULL.
      require
         cpp.pending_c_function
         visited.type.live_type.at_run_time
      local
         e_type: TYPE; e_live_type: LIVE_TYPE
      do
         if visited.type.live_type.type.has_simple_feature_name(from_pointer_name) then
            function_body.append(once "if(NULL==gc_find_chunk(o))%N%
                                      %return; /* external NA */%N")
         end
         e_type := visited.elements_type.type
         if memory.need_mark.for(e_type) then
            e_live_type := e_type.live_type
            function_body.append(once "{rsoh*h=((rsoh*)o)-1;%N%
                                      %if((h->header.magic_flag)==RSOH_UNMARKED){%N%
                                      %h->header.magic_flag=RSOH_MARKED;%N%
                                      %{%N")
            native_array_type_in(visited, function_body)
            function_body.remove_last
            if function_body.last /= '*' then
               function_body.extend(' ')
            end
            function_body.append(once "e;%N")
            native_array_type_in(visited, function_body)
            function_body.append(once "p=((void*)(o+((((h->header.size)-sizeof(rsoh))/sizeof(e))-1)));%N%
                                      %for(;((void*)p)>=((void*)o);p--){%N%
                                      %e=*p;%N")
            memory.mark_for(once "e", e_live_type, False)
            function_body.append(once "}}}}%N")
         else
            function_body.append(once "(((rsoh*)o)-1)->header.magic_flag=RSOH_MARKED;%N")
         end
      end

feature {}
   make
      do
         Precursor
         create wa_buf.with_capacity(24)
         create wa_cyclic_buf.with_capacity(24)
         create wa_cycle.with_capacity(24)
      end

   wa_buf: FAST_ARRAY[RUN_FEATURE_2]
   wa_cyclic_buf: FAST_ARRAY[RUN_FEATURE_2]
   wa_cycle: FAST_ARRAY[RUN_FEATURE_2]

end -- class C_GARBAGE_COLLECTOR_FUNCTIONS_COMPILER
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
