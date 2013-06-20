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
   for (lt: like live_type) is
      require
         lt.at_run_time
      do
         live_type := lt
         lt.canonical_type_mark.accept(Current)
         live_type := Void
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
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         alloc_reference(visited)
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK) is
      do
         alloc_reference(visited)
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
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK) is
      do
         alloc_weak_reference(visited)
      end

feature {}
   live_type: LIVE_TYPE
   bdw: BDW_GC

   make (a_bdw: like bdw) is
      require
         a_bdw /= Void
      do
         bdw := a_bdw
      ensure
         bdw = a_bdw
      end

   prepare_alloc_function (tm: TYPE_MARK) is
      require
         tm = live_type.canonical_type_mark
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
         cpp.pending_c_function_signature.append(once " bdw_mallocT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(int n)")
      end

   alloc_reference (tm: TYPE_MARK) is
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      do
         finalize_reference(tm)

         prepare_alloc_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once " R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_malloc(n*sizeof(T")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "));%N%
                                                 %GC_REGISTER_FINALIZER_NO_ORDER(R, bdw_finalizeT")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ",NULL,NULL,NULL);%N")
         if cpp.need_struct.for(tm) then
            cpp.pending_c_function_body.append(once "*R=M")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)
      end

   alloc_weak_reference (tm: WEAK_REFERENCE_TYPE_MARK) is
      require
         live_type.is_reference
         tm = live_type.canonical_type_mark
      do
         prepare_weakref_accessors

         prepare_alloc_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once " R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_malloc(n*sizeof(T")
         live_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "));%N%
                                                 %return R;%N")
         cpp.dump_pending_c_function(True)
      end

   alloc_native_array (tm: NATIVE_ARRAY_TYPE_MARK) is
      require
         live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         elt: TYPE
      do
         elt := live_type.type.generic_list.first
         prepare_alloc_function(tm)
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once " R=(")
         cpp.pending_c_function_body.append(cpp.target_type.for(tm))
         cpp.pending_c_function_body.append(once ")se_calloc(n, sizeof(T")
         if elt.is_reference then
            cpp.pending_c_function_body.append(once "0*));%N%
                                                    %bdw_markT")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "(R);%N")
         else
            elt.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "));%N")
         end
         cpp.pending_c_function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)

         if elt.is_reference then
            cpp.out_h_buffer.copy(once "typedef struct {int g;")
            cpp.out_h_buffer.append(cpp.target_type.for(tm))
            cpp.out_h_buffer.append(once " na;} bdwM")
            live_type.id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
            cpp.write_out_h_buffer

            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "void bdw_markT")
            live_type.id.append_in(cpp.pending_c_function_signature)
            cpp.pending_c_function_signature.append(once "(")
            cpp.pending_c_function_signature.append(cpp.target_type.for(tm))
            cpp.pending_c_function_signature.append(once " na)")
            cpp.pending_c_function_body.append(once "bdwM")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "*mark=GC_MALLOC(sizeof(bdwM")
            live_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "));%N")
            --| **** TODO
            --|      - for all items: HIDE_POINTER then call the relevant features to REVEAL_POINTER
            --|      - use storage_generation if available
            cpp.dump_pending_c_function(True)
         end
      end

   finalize_reference (tm: TYPE_MARK) is
         -- Append the extra C code for the MEMORY.dispose call if any.
      require
         not live_type.is_expanded
         not live_type.is_native_array
         tm = live_type.canonical_type_mark
      local
         rf3: RUN_FEATURE_3; o: STRING
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_finalizeT")
         live_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(void*obj,void*_)")
         rf3 := bdw.get_memory_dispose(live_type)
         if rf3 /= Void then
            o := once "................"
            o.copy(once "((")
            o.append(cpp.target_type.for(tm))
            o.append(once ")obj)")
            bdw.generate_dispose(o, rf3, live_type)
         end
         cpp.dump_pending_c_function(True)
      end

   prepare_weakref_accessors is
      once
         cpp.out_h_buffer.copy(once "typedef struct bdw_Swr{Tid id;T0*o;}bdw_Twr;%N")
         cpp.write_out_h_buffer
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void bdw_weakref_setlink(bdw_Twr*wr,T0*r)")
         cpp.pending_c_function_body.append(once "if(r==NULL){%N%
                                                 %GC_unregister_disappearing_link((void**)&(wr->o));%N%
                                                 %wr->o=NULL;%N%
                                                 %}else{%N%
                                                 %wr->o=(T0*)HIDE_POINTER(r);%N%
                                                 %GC_GENERAL_REGISTER_DISAPPEARING_LINK((void**)&(wr->o),(void*)r);%N%
                                                 %}%N")
         cpp.dump_pending_c_function(True)
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "T0* bdw_weakref_getlink(bdw_Twr*wr)")
         cpp.pending_c_function_body.append(once "if(wr->o==NULL)return NULL;%N%
                                                 %return REVEAL_POINTER(wr->o);%N")
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
