-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BDW_GC_DEFINE2

inherit
   STATIC_TYPE_MARK_VISITOR
   GENERIC_TYPE_MARK_VISITOR

insert
   GLOBALS

create {BDW_GC}
   make

feature {BDW_GC}
   for (lt: like live_type; na: TAGGED_FLAG) is
      require
         lt.at_run_time
      do
         live_type := lt
         is_na_collector:= na /= Void and then na.item
         lt.canonical_type_mark.accept(Current)
         live_type := Void
      end

   extra_functions is
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_run_finalizers(void)")
         cpp.pending_c_function_body.append(once "if(bdw_in_assign)bdw_delayed_finalize=1;%N%
                                                 %else GC_invoke_finalizers();%N")
         cpp.dump_pending_c_function(True)
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK) is
      do
         alloc_reference(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK) is
      do
         if visited.is_reference then
            alloc_reference(visited)
         end
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK) is
      do
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK) is
      do
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK) is
      do
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK) is
      do
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK) is
      do
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK) is
      do
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK) is
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK) is
      do
         alloc_reference(visited)
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         alloc_native_array(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK) is
      do
         alloc_reference(visited)
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK) is
      do
         if visited.is_reference then
            alloc_reference(visited)
         end
         if is_na_collector then
            mark_native_arrays(visited)
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK) is
      do
         alloc_weak_reference(visited)
      end

feature {}
   live_type: LIVE_TYPE
   is_na_collector: BOOLEAN
   bdw: BDW_GC

   make (a_bdw: like bdw) is
      require
         a_bdw /= Void
      do
         bdw := a_bdw
      ensure
         bdw = a_bdw
      end

   put_alloc_function (tm: TYPE_MARK) is
      require
         tm = live_type.canonical_type_mark
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
         cpp.pending_c_function_signature.append(once " bdw_mallocT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(int n)")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         if tm.is_expanded then
            cpp.pending_c_function_body.extend(' ')
         end
         cpp.pending_c_function_body.append(once "R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")bdw_malloc_innerT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(&n);%N%
                                                 %if(GC_should_invoke_finalizers())bdw_run_finalizers();%N%
                                                 %return R;%N")
         cpp.dump_pending_c_function(True)
      end

   prepare_alloc_inner_function (tm: TYPE_MARK) is
      require
         tm = live_type.canonical_type_mark
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
         cpp.pending_c_function_signature.append(once " bdw_malloc_innerT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(int*n)")
      end

   alloc_reference (tm: TYPE_MARK) is
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      local
         has_finalizer: BOOLEAN
      do
         has_finalizer := finalize_reference(tm)

         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once "R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_malloc((*n)*sizeof(T")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "));%N")
         if has_finalizer then
            cpp.pending_c_function_body.append(once "GC_REGISTER_FINALIZER_NO_ORDER(R, bdw_finalizeT")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ",NULL,NULL,NULL);%N")
         end
         if cpp.need_struct.for(tm) then
            cpp.pending_c_function_body.append(once "*R=M")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   alloc_weak_reference (tm: WEAK_REFERENCE_TYPE_MARK) is
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      do
         prepare_weakref_accessors

         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(once "return (")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_malloc((*n)*sizeof(T")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "));%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   alloc_native_array (tm: NATIVE_ARRAY_TYPE_MARK) is
      require
         live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         et: TYPE
      do
         et := live_type.type.generic_list.first
         prepare_alloc_inner_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once " R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_calloc(*n, sizeof(T")
         if et.is_reference then
            cpp.pending_c_function_body.append(once "0*));%N")
         else
            et.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "));%N")
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)

         put_alloc_function(tm)
      end

   finalize_reference (tm: TYPE_MARK): BOOLEAN is
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         not live_type.is_expanded
         not live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         rf3: RUN_FEATURE_3; o: STRING
      do
         if rf3 /= Void then
            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "void bdw_finalizeT")
            live_type.id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "(void*obj,void*_)")
            rf3 := bdw.get_memory_dispose(live_type)
            o := once "................"
            o.copy(once "((")
            o.append(cpp.target_type.for(tm))
            o.append(once ")obj)")
            bdw.generate_dispose(o, rf3, live_type)
            cpp.dump_pending_c_function(True)
         end
      end

   prepare_weakref_accessors is
      once
         cpp.out_h_buffer.copy(once "typedef struct bdw_Swr{Tid id;T0*o;}bdw_Twr;%N")
         cpp.write_out_h_buffer
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_weakref_setlink(bdw_Twr*wr,T0*r)")
         cpp.pending_c_function_body.append(once "if(r==NULL){%N%
                                                 %//GC_reachable_here(r);%N%
                                                 %GC_unregister_disappearing_link((void**)&(wr->o));%N%
                                                 %wr->o=NULL;}else{%N%
                                                 %GC_disable();%N%
                                                 %wr->o=(T0*)HIDE_POINTER(r);%N%
                                                 %GC_GENERAL_REGISTER_DISAPPEARING_LINK((void**)&(wr->o),(void*)r);%N%
                                                 %GC_enable();}%N")
         cpp.dump_pending_c_function(True)
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "T0* bdw_weakref_getlink(bdw_Twr*wr)")
         cpp.pending_c_function_body.append(once "if(wr->o==NULL)return NULL;%N%
                                                 %return REVEAL_POINTER(wr->o);%N")
         cpp.dump_pending_c_function(True)
      end

   mark_native_arrays (type_mark: TYPE_MARK) is
      local
         wa: ARRAY[RUN_FEATURE_2]; i: INTEGER; a: RUN_FEATURE_2; t: TYPE
         has_capacity: BOOLEAN
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void*bdw_na_assignT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(T")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "*o)")
         cpp.pending_c_function_body.append(once "if(bdw_na_assign_innerT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(o)==NULL&&GC_should_invoke_finalizers())bdw_run_finalizers();%N")
         cpp.dump_pending_c_function(True)

         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void*bdw_na_assign_innerT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(T")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "*o)")
         cpp.pending_c_function_body.append(once "if(o->bdw_markna==NULL){%N%
                                                 %T0**markna;%N%
                                                 %GC_disable();%N%
                                                 %bdw_in_assign=1;%N%
                                                 %markna=se_malloc(sizeof(T0*));%N%
                                                 %GC_REGISTER_FINALIZER_NO_ORDER(markna,(GC_finalization_proc)bdw_na_markT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ",NULL,NULL,NULL);%N%
                                                 %GC_reachable_here(markna);%N%
                                                 %o->bdw_markna=(void*)HIDE_POINTER(markna);%N%
                                                 %*markna=(T0*)o;%N%
                                                 %GC_GENERAL_REGISTER_DISAPPEARING_LINK(&(o->bdw_markna),markna);%N%
                                                 %bdw_in_assign=0;%N%
                                                 %GC_enable();%N%
                                                 %if(bdw_delayed_finalize){%N%
                                                 %bdw_delayed_finalize=0;%N%
                                                 %return NULL;}}%N%
                                                 %return o;%N")
         cpp.dump_pending_c_function(True)

         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_na_markT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(T")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "**markna,void*_)")
         cpp.pending_c_function_body.append(once "int i,c;T0*e;T0**na;T")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "*o=*markna;%N%
                                                 %GC_disable();%N")
         wa := live_type.writable_attributes
         if wa /= Void then
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               a := wa.item(i)
               t := a.result_type.resolve_in(live_type.type)
               if t.is_native_array and then t.generic_list.first.is_reference then
                  if not has_capacity then
                     if live_type.type.has_simple_feature_name(capacity_name) then
                        cpp.pending_c_function_body.append(once "c=o->_capacity;%N")
                        has_capacity := True
                     else
                        i := wa.upper
                     end
                  end
                  if has_capacity then
                     cpp.pending_c_function_body.append(once "na=o->_")
                     cpp.pending_c_function_body.append(a.name.to_string)
                     cpp.pending_c_function_body.append(once ";%N%
                                                             %if(na)for(i=0;i<c;i++){%N%
                                                             %e=na[i];if(e)na[i]=(T0*)HIDE_POINTER(e);}%N")
                  end
               end
               i := i + 1
            end
            if has_capacity then
               cpp.pending_c_function_body.extend('r')
               live_type.id.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.append(once "mark_native_arrays(")
               if not ace.boost then
                  -- Hope there is no bug in `mark_native_arrays'...
                  cpp.pending_c_function_body.append(once "NULL,")
               end
               if ace.profile then
                  cpp.pending_c_function_body.append(once "NULL,")
               end
               cpp.pending_c_function_body.append(once "o);%N")
            end
         end
         cpp.pending_c_function_body.append(once "bdw_na_assignT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "(o);%N%
                                                 %GC_enable();%N")
         cpp.dump_pending_c_function(True)
      end

invariant
   bdw /= Void

end -- class BDW_GC_DEFINE2
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
