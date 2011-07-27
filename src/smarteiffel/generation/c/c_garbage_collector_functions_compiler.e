-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_FUNCTIONS_COMPILER
   --
   -- Define C functions for the Garbage Collector
   --

inherit
   C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER
      redefine
         make
      end

create {GC_HANDLER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      local
         ltid: INTEGER
      do
         ltid := visited.type.live_type.id
         -- ----------------------------- Definiton for gc_markXXX :
         cpp.prepare_c_function
         function_signature.append(once "void ")
         cpp.gc_handler.mark_in(visited, function_signature)
         function_signature.append(once "(T")
         ltid.append_in(function_signature)
         function_signature.append(once " o)")
         gc_mark_na(visited)
         cpp.dump_pending_c_function(True)
         -- --------------------------------- Definiton for newXXX :
         cpp.prepare_c_function
         function_signature.extend('T')
         ltid.append_in(function_signature)
         function_signature.append(once " new")
         ltid.append_in(function_signature)
         function_signature.append(once "(unsigned int size)")
         function_body.append(once "size=(size*sizeof(")
         visited.generic_list.first.c_type_for_result_in(function_body)
         function_body.append(once "))+sizeof(rsoh);%Nsize=((size+(sizeof(double)-1))&~(sizeof(double)-1));%N")
         if cpp.gc_handler.info_flag then
            cpp.gc_handler.info_nb_in(visited, function_body)
            function_body.append(once "++;%N")
            cpp.gc_handler.na_env_in(visited, function_body)
            function_body.append(once ".space_used+=size;%N")
         end
         function_body.append(once "if (size<=(")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store_left)){%N%
                                                 %rsoh*r=")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store;%N")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store_left-=size;%N%
                                                 %if(")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store_left>sizeof(rsoh)){%N%
                                                 %r->header.size=size;%N")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store=((rsoh*)(((char*)(")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store))+size));%N}%N%
                                                 %else {%N%
                                                 %r->header.size=size+")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store_left;%N")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ".store_left=0;%N}%N%
                                   %(r->header.magic_flag)=RSOH_UNMARKED;%N%
                                   %((void)memset((r+1),0,r->header.size-sizeof(rsoh)));%N%
                                   %return((T")
         ltid.append_in(function_body)
         function_body.append(once ")(r+1));%N}%Nreturn((T")
         ltid.append_in(function_body)
         function_body.append(once ")new_na(&")
         cpp.gc_handler.na_env_in(visited, function_body)
         function_body.append(once ",size));%N")
         cpp.dump_pending_c_function(True)
      end

feature {}
   gc_reference (visited: TYPE_MARK) is
      local
         lt: LIVE_TYPE; ltid, arg_id: INTEGER; gc_check_id: BOOLEAN; wr_gen_arg_lt: LIVE_TYPE; is_weak_ref: BOOLEAN
         is_monomorphic_weak_ref: BOOLEAN
      do
         lt := visited.type.live_type
         ltid := lt.id
         -- --------------------------- Definition for gc_sweepXXX :
         cpp.prepare_c_function
         function_signature.append(once "void gc_sweep")
         ltid.append_in(function_signature)
         function_signature.append(once "(fsoc*c)")
         function_body.append(once "gc")
         ltid.append_in(function_body)
         function_body.append(once "*o1,*o2;%No1=((gc")
         ltid.append_in(function_body)
         function_body.append(once "*)(&(c->first_object)));%N%
                                   %if(c->header.state_type==FSO_STORE_CHUNK){%N%
                                   %for(;o1<")
         cpp.gc_handler.store_in(visited, function_body)
         function_body.append(once ";o1++){%N%
                                   %if((o1->header.flag)==FSOH_MARKED){%N%
                                   %o1->header.flag=FSOH_UNMARKED;%N")
         wr_gen_arg_lt := visited.weak_reference_argument(lt)
         is_weak_ref := wr_gen_arg_lt /= Void
         if is_weak_ref then
            check
               visited.generic_list.count = 1
            end
            is_monomorphic_weak_ref := wr_gen_arg_lt.run_time_set.count = 1
            if is_monomorphic_weak_ref then
               function_body.append(once "gc_update_weak_ref_item")
               ltid.append_in(function_body)
               function_body.append(once "(&(o1->object));%N")
            else
               function_body.append(once "gc_update_weak_ref_item_polymorph(&(o1->object._item));%N")
            end
         end
         function_body.append(once "}%Nelse{%N")
         cpp.gc_handler.memory_dispose(once "o1", lt)
         function_body.append(once "o1->header.next=gc_free")
         ltid.append_in(function_body)
         function_body.append(once ";%Ngc_free")
         ltid.append_in(function_body)
         function_body.append(once "=o1;%N%
                                   %}%N}%N}%N%
                                   %else{%N%
                                   %int dead=1;%N%
                                   %gc")
         ltid.append_in(function_body)
         function_body.append(once "* old_gc_free = gc_free")
         ltid.append_in(function_body)
         function_body.append(once ";%N%
                                   %o2=o1+c->count_minus_one;%N%
                                   %for(;o1<=o2;o1++){%N%
                                   %if((o1->header.flag)==FSOH_MARKED){%N%
                                   %o1->header.flag=FSOH_UNMARKED;%N")
         if is_weak_ref then
            if is_monomorphic_weak_ref then
               function_body.append(once "gc_update_weak_ref_item")
               ltid.append_in(function_body)
               function_body.append(once "(&(o1->object));%N")
            else
               function_body.append(once "gc_update_weak_ref_item_polymorph(&(o1->object._item));%N")
            end
         end
         function_body.append(once "dead=0;}%Nelse{%N")
         cpp.gc_handler.memory_dispose(once "o1", lt)
         function_body.append(once "o1->header.next=gc_free")
         ltid.append_in(function_body)
         function_body.append(once ";%Ngc_free")
         ltid.append_in(function_body)
         function_body.append(once "=o1;%N%
                                   %}%N}%N%
                                   %if (dead){%N%
                                   %gc_free")
         ltid.append_in(function_body)
         function_body.append(once " = old_gc_free;%N%
                                   %c->next=fsocfl;%N%
                                   %fsocfl=c;%N%
                                   %c->header.state_type=FSO_FREE_CHUNK;%N}%N%
                                   %}%N")
         cpp.dump_pending_c_function(True)
         -- ------------------ Definition for gc_update_weak_ref_item... :
         if is_weak_ref then
            if is_monomorphic_weak_ref then
               cpp.prepare_c_function
               function_signature.append(once "void gc_update_weak_ref_item")
               ltid.append_in(function_signature)
               function_signature.append(once "(T")
               ltid.append_in(function_signature)
               function_signature.append(once "* wr)")
               function_body.append(once "gc")
               arg_id := wr_gen_arg_lt.run_time_set.first.id
               arg_id.append_in(function_body)
               function_body.append(once "* obj_ptr = (gc")
               arg_id.append_in(function_body)
               function_body.append(once "*)(wr->_item);%N%
                                         %if (obj_ptr != NULL){%N%
                                         %int swept = (((void*)obj_ptr) <= ((void*)wr));%N%
                                         %if (swept != (obj_ptr->header.flag == FSOH_UNMARKED))%N%
                                         %/* (already swept) xor marked */%N%
                                         %wr->_item = NULL;%N}%N")
               cpp.dump_pending_c_function(True)
            else
               check
                  wr_gen_arg_lt.is_tagged
               end
               generate_once_gc_update_weak_ref_item_polymorph(visited)
            end
         end
         -- --------------------- Definition for gc_markXXX :
         cpp.prepare_c_function
         function_signature.append(once "void ")
         cpp.gc_handler.mark_in(visited, function_signature)
         function_signature.append(once "(T")
         ltid.append_in(function_signature)
         function_signature.append(once "*o)")
         gc_check_id := lt.is_tagged and then ace.no_check
         if gc_check_id then
            function_body.append(once "se_gc_check_id(o,")
            ltid.append_in(function_body)
            function_body.append(once ");%N{%N")
         end
         gc_mark_fixed_size(lt, False)
         if gc_check_id then
            function_body.append(once "}%N")
         end
         cpp.dump_pending_c_function(True)
         -- ----------------------- Definition for gc_align_markXXX :
         cpp.prepare_c_function
         function_signature.append(once "void ")
         cpp.gc_handler.align_mark_in(visited, function_signature)
         function_signature.append(once "(fsoc*c,gc")
         ltid.append_in(function_signature)
         function_signature.append(once "*p)")
         gc_align_mark_fixed_size(lt)
         cpp.dump_pending_c_function(True)
         -- ------------------------ Definition of chunk model HXXX :
         cpp.out_h_buffer.copy(once "fsoc H")
         ltid.append_in(cpp.out_h_buffer)
         cpp.out_c_buffer.copy(once "{{FSOC_SIZE,FSO_STORE_CHUNK,%N(void(*)(mch*,void*))gc_align_mark")
         ltid.append_in(cpp.out_c_buffer)
         cpp.out_c_buffer.append(once ",%N(void(*)(mch*))gc_sweep")
         ltid.append_in(cpp.out_c_buffer)
         cpp.out_c_buffer.append(once "},NULL,(((FSOC_SIZE-sizeof(fsoc)+sizeof(double))/sizeof(gc")
         ltid.append_in(cpp.out_c_buffer)
         cpp.out_c_buffer.append(once "))-1)}")
         cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
         -- --------------------------------- Definition for newXXX :
         cpp.prepare_c_function
         function_signature.extend('T')
         ltid.append_in(function_signature)
         function_signature.append(once "*new")
         ltid.append_in(function_signature)
         function_signature.append(once "(void)")
         function_body.append(once "gc")
         ltid.append_in(function_body)
         function_body.append(once "*n;%Nfsoc*c;%N")
         if cpp.gc_handler.info_flag then
            cpp.gc_handler.info_nb_in(visited, function_body)
            function_body.append(once "++;%N")
         end
         --
         function_body.append(once "if(")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once ">1){%N")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once "--;%Nn=")
         cpp.gc_handler.store_in(visited, function_body)
         function_body.append(once "++;%N}%Nelse if(")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once "!=NULL){%Nn=")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once ";%N")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once "=n->header.next;%N}%Nelse if(")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once "==1){%N")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once "=0;%N")
         cpp.gc_handler.store_chunk_in(visited, function_body)
         function_body.append(once "->header.state_type=FSO_USED_CHUNK;%N%
                                   %n=")
         cpp.gc_handler.store_in(visited, function_body)
         function_body.append(once "++;%N}%N%
                                   %else{%Nc=gc_fsoc_get1();%N%
                                   %if(")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once "!=NULL){%Nn=")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once ";%N")
         cpp.gc_handler.free_in(visited, function_body)
         function_body.append(once "=n->header.next;%N}%Nelse{%N%
                                   %if(c==NULL)c=gc_fsoc_get2();%N")
         cpp.gc_handler.store_chunk_in(visited, function_body)
         function_body.append(once "=c;%N*")
         cpp.gc_handler.store_chunk_in(visited, function_body)
         function_body.append(once "=H")
         ltid.append_in(function_body)
         function_body.append(once ";%N")
         cpp.gc_handler.store_in(visited, function_body)
         function_body.append(once "=((gc")
         ltid.append_in(function_body)
         function_body.append(once "*)(&(")
         cpp.gc_handler.store_chunk_in(visited, function_body)
         function_body.append(once "->first_object)));%N")
         cpp.gc_handler.store_left_in(visited, function_body)
         function_body.append(once "=H")
         ltid.append_in(function_body)
         function_body.append(once ".count_minus_one;%Nn=")
         cpp.gc_handler.store_in(visited, function_body)
         function_body.append(once "++;%N}%N%
                                   %}%Nn->header.flag=FSOH_UNMARKED;%N")
         if visited.need_c_struct then
            function_body.append(once "n->object=M")
            ltid.append_in(function_body)
            function_body.append(once ";%N")
         end
         function_body.append(once "return((T")
         ltid.append_in(function_body)
         function_body.append(once "*)n);%N")
         cpp.dump_pending_c_function(True)
      end

   gc_expanded (visited: TYPE_MARK) is
      local
         lt: LIVE_TYPE; lt_id: INTEGER
      do
         lt := visited.type.live_type
         if lt.gc_mark_to_follow then
            lt_id := lt.id
            -- -------------------------- Definition for gc_markXXX:
            cpp.prepare_c_function
            function_signature.append(once "void ")
            cpp.gc_handler.mark_in(visited, function_signature)
            function_signature.append(once "(T")
            lt_id.append_in(function_signature)
            function_signature.append(once "*o)")
            gc_mark_fixed_size(lt, True)
            cpp.dump_pending_c_function(True)
         end
      end

   generate_once_gc_update_weak_ref_item_polymorph (visited: TYPE_MARK) is
      require
         visited.is_reference -- is_weak_ref
         not cpp.gc_handler.is_off
         not cpp.pending_c_function
         visited.type.live_type.at_run_time
      once
         cpp.prepare_c_function
         function_signature.append(once "void gc_update_weak_ref_item_polymorph(T0** item)")
         function_body.append(once "T0* obj_ptr = *item;%N%
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
                                   %if (swept!=(((fso_header*)obj_ptr)->flag==FSOH_UNMARKED))%N%
                                   %/* (already swept) xor marked */%N%
                                   %*item = NULL;%N}%N")
         cpp.dump_pending_c_function(True)
      end

   gc_set_fsoh_marked (lt: LIVE_TYPE) is
      require
         cpp.pending_c_function
      do
         if lt.canonical_type_mark.is_reference then
            function_body.append(once "((gc")
            lt.id.append_in(function_body)
            function_body.append(once "*)o)->header.flag=FSOH_MARKED;%N")
         end
      end

   gc_mark_fixed_size (lt: LIVE_TYPE; is_unmarked: BOOLEAN) is
         -- The main purpose is to compute for example the best body for the corresponding
         -- gc_markXXX function (as well as gc_align_markXXX). In fact, this feature can
         -- be called to produce C code when C variable `o' is not NULL and when `o' is of
         -- some concrete type (Tid*) where `id' is the one of the current LIVE_TYPE.
         -- Finally, when `is_unmarked' is True, object `o' is unmarked.
      require
         cpp.pending_c_function
         not cpp.gc_handler.is_off
         not lt.canonical_type_mark.is_native_array
         lt.at_run_time
      local
         rf2: RUN_FEATURE_2; t: TYPE; lvtp: LIVE_TYPE; i: INTEGER
      do
         if as_weak_reference = lt.class_text_name.to_string then
            gc_set_fsoh_marked(lt)
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
                  if t.need_gc_mark_function then
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
               gc_set_fsoh_marked(lt)
            else
               if not wa_cyclic_buf.is_empty then
                  function_body.append(once "begin:%N")
               end
               if not is_unmarked then
                  function_body.append(once "if(((gc")
                  lt.id.append_in(function_body)
                  function_body.append(once "*)o)->header.flag==FSOH_UNMARKED){%N")
               end
               gc_set_fsoh_marked(lt)
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
                        lt.id.append_in(function_body)
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

   mark_attribute (lt: LIVE_TYPE; rf2: RUN_FEATURE_2) is
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
            cpp.recompilation_comment(lt)
            if lt.insert_native_array_collector_flag and then attribute_type.is_native_array then
               function_body.append(once "{%NT")
               attribute_type.id.append_in(function_body)
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
               lt.id.append_in(function_body)
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
               cpp.gc_handler.mark_for(field_name, attribute_type, False)
            end
         end
      end

   gc_align_mark_fixed_size (lt: LIVE_TYPE) is
         -- Compute the best body for gc_align_markXXX of a fixed_size object.
      require
         cpp.pending_c_function
         not cpp.gc_handler.is_off
         not lt.canonical_type_mark.is_native_array
         lt.at_run_time
      do
         function_body.append(once "gc")
         lt.id.append_in(function_body)
         function_body.append(once "*b=((gc")
         lt.id.append_in(function_body)
         function_body.append(once "*)(&(c->first_object)));%N%
                                   %if((c->header.state_type==FSO_STORE_CHUNK)%
                                   %&&(((char*)p)>=((char*)store")
         lt.id.append_in(function_body)
         function_body.append(once ")))return;%N%
                                   %if(((char*)p)>((char*)(b+(c->count_minus_one))))return;%N%
                                   %if(((char*)p)<((char*)b))return;%N%
                                   %if(((((char*)p)-((char*)b))%%sizeof(*p))==0){%N%
                                   %if(p->header.flag==FSOH_UNMARKED){%N%
                                   %T")
         lt.id.append_in(function_body)
         function_body.append(once "*o=(&(p->object));%N")
         gc_mark_fixed_size(lt, True)
         function_body.append(once "}%N}%N")
      end

   gc_mark_na (visited: NATIVE_ARRAY_TYPE_MARK) is
         -- The main purpose is to compute for example the best body for the gc_markXXX function.
         -- Actually, this feature may be called to produce C code when C variable `o' is not NULL.
      require
         cpp.pending_c_function
         not cpp.gc_handler.is_off
         visited.type.live_type.at_run_time
      local
         e_type: TYPE; e_live_type: LIVE_TYPE
      do
         if visited.type.live_type.type.has_simple_feature_name(from_pointer_name) then
            function_body.append(once "if(NULL==gc_find_chunk(o))%N%
                                      %return; /* external NA */%N")
         end
         e_type := visited.elements_type.type
         if e_type.need_gc_mark_function then
            e_live_type := e_type.live_type
            function_body.append(once "{rsoh*h=((rsoh*)o)-1;%N%
                                      %if((h->header.magic_flag)==RSOH_UNMARKED){%N%
                                      %h->header.magic_flag=RSOH_MARKED;%N%
                                      %{%N")
            native_array_type_in(visited, function_body)
            function_body.remove_last
            function_body.append(once " e;%N")
            native_array_type_in(visited, function_body)
            function_body.append(once "p=((void*)(o+((((h->header.size)-sizeof(rsoh))/sizeof(e))-1)));%N%
                                      %for(;((void*)p)>=((void*)o);p--){%N%
                                      %e=*p;%N")
            cpp.gc_handler.mark_for(once "e", e_live_type, False)
            function_body.append(once "}}}}%N")
         else
            function_body.append(once "(((rsoh*)o)-1)->header.magic_flag=RSOH_MARKED;%N")
         end
      end

feature {}
   make is
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
