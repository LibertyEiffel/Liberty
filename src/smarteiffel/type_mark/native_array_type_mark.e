-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_ARRAY_TYPE_MARK
   --
   -- Handling of the "NATIVE_ARRAY[FOO]" type mark.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         typed_internals_type_mark, canonical_long_name
      end

creation {ANY}
   make

feature {ANY}
   is_expanded: BOOLEAN is True

   is_reference, is_empty_expanded, is_user_expanded: BOOLEAN is False

   jvm_method_flags: INTEGER is 9

   elements_type: TYPE_MARK is
      do
         Result := generic_list.first
      end

   of_references: BOOLEAN is
      do
         Result := elements_type.is_reference
      end

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   need_c_struct: BOOLEAN is
      do
      end

   c_initialize_in (buffer: STRING) is
      do
         buffer.append(once "(void*)0")
      end

   c_type_for_argument_in (str: STRING) is
      do
         str.extend('T')
         id.append_in(str)
      end

   c_type_for_target_in (str: STRING) is
      do
         c_type_for_argument_in(str)
      end

   c_type_for_result_in (str: STRING) is
      do
         c_type_for_argument_in(str)
      end

   jvm_target_descriptor_in, jvm_descriptor_in (str: STRING) is
      do
         str.extend('[')
         elements_type.jvm_descriptor_in(str)
      end

   jvm_return_code is
      do
         code_attribute.opcode_areturn
      end

   jvm_push_local (offset: INTEGER) is
      do
         code_attribute.opcode_aload(offset)
      end

   jvm_check_class_invariant is
      do
      end

   jvm_push_default: INTEGER is
      do
         code_attribute.opcode_aconst_null
         Result := 1
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         code_attribute.opcode_astore(offset)
      end

   jvm_xnewarray is
      local
         idx: INTEGER; buffer: STRING
      do
         buffer := once "......................."
         buffer.clear_count
         jvm_target_descriptor_in(buffer)
         idx := constant_pool.idx_class2(buffer)
         code_attribute.opcode_anewarray(idx)
      end

   jvm_xastore is
      do
         code_attribute.opcode_aastore
      end

   jvm_xaload is
      do
         code_attribute.opcode_aaload
      end

   jvm_if_x_eq: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpeq
      end

   jvm_if_x_ne: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpne
      end

   jvm_standard_is_equal is
      local
         ca: like code_attribute; point1, point2: INTEGER
      do
         ca := code_attribute
         point1 := jvm_if_x_eq
         ca.opcode_iconst_0
         point2 := ca.opcode_goto
         ca.resolve_u2_branch(point1)
         ca.opcode_iconst_1
         ca.resolve_u2_branch(point2)
      end

   accept (visitor: NATIVE_ARRAY_TYPE_MARK_VISITOR) is
      do
         visitor.visit_native_array_type_mark(Current)
      end

feature {TYPE}
   need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         Result := True
      end

feature {LIVE_TYPE, TYPE_MARK}
   just_before_gc_mark_in (c_code: STRING) is
      do
         c_code.append(once "if(")
         gc_na_env_in(c_code)
         c_code.append(once ".store_left>0){%N")
         gc_na_env_in(c_code)
         c_code.append(once ".store->header.size=")
         gc_na_env_in(c_code)
         c_code.append(once ".store_left;%N")
         gc_na_env_in(c_code)
         c_code.append(once ".store->header.magic_flag=RSOH_FREE;%N")
         gc_na_env_in(c_code)
         c_code.append(once ".store_left=0;%N}%N")
         gc_na_env_in(c_code)
         c_code.append(once ".chunk_list=NULL;%N")
         gc_na_env_in(c_code)
         c_code.append(once ".store_chunk=NULL;%N")
      end

   gc_info_in (c_code: STRING) is
      do
         c_code.append(once "if(")
         gc_info_nb_in(c_code)
         c_code.append(once ")%Nfprintf(SE_GCINFO,%"%%d\t%%d\t\t")
         c_code.append(written_name.to_string)
         c_code.append(once "\n%",")
         gc_info_nb_in(c_code)
         c_code.extend(',')
         gc_na_env_in(c_code)
         c_code.append(once ".space_used);%N")
      end

   gc_define1 is
      do
         -- ------------------------------------ Declare na_envXXX :
         cpp.out_h_buffer.copy(once "na_env ")
         gc_na_env_in(cpp.out_h_buffer)
         cpp.out_c_buffer.copy(once "{0,NULL,NULL,NULL,(void(*)(T0*))")
         gc_mark_in(cpp.out_c_buffer)
         cpp.out_c_buffer.extend('}')
         cpp.write_extern_2(cpp.out_h_buffer, cpp.out_c_buffer)
         -- -------------------------------- Declare gc_info_nbXXX :
         if gc_handler.info_flag then
            cpp.out_h_buffer.copy(once "int ")
            gc_info_nb_in(cpp.out_h_buffer)
            cpp.write_extern_0(cpp.out_h_buffer)
         end
      end

   gc_define2 is
      local
         ltid: INTEGER
      do
         ltid := type.live_type.id
         -- ----------------------------- Definiton for gc_markXXX :
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "void ")
         gc_mark_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(T")
         ltid.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once " o)")
         gc_mark
         cpp.dump_pending_c_function(True)
         -- --------------------------------- Definiton for newXXX :
         cpp.prepare_c_function
         cpp.pending_c_function_signature.extend('T')
         ltid.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once " new")
         ltid.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once "(unsigned int size)")
         cpp.pending_c_function_body.append(once "size=(size*sizeof(")
         generic_list.first.c_type_for_result_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once "))+sizeof(rsoh);%Nsize=((size+(sizeof(double)-1))&~(sizeof(double)-1));%N")
         if gc_handler.info_flag then
            gc_info_nb_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "++;%N")
            gc_na_env_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ".space_used+=size;%N")
         end
         cpp.pending_c_function_body.append(once "if (size<=(")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store_left)){%N%
                                                 %rsoh*r=")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store;%N")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store_left-=size;%N%
                                                 %if(")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store_left>sizeof(rsoh)){%N%
                                                 %r->header.size=size;%N")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store=((rsoh*)(((char*)(")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store))+size));%N}%N%
                                                 %else {%N%
                                                 %r->header.size=size+")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store_left;%N")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ".store_left=0;%N}%N%
                                                 %(r->header.magic_flag)=RSOH_UNMARKED;%N%
                                                 %((void)memset((r+1),0,r->header.size-sizeof(rsoh)));%N%
                                                 %return((T")
         ltid.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ")(r+1));%N}%Nreturn((T")
         ltid.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ")new_na(&")
         gc_na_env_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ",size));%N")
         cpp.dump_pending_c_function(True)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, class_text_name)
      end

feature {INTROSPECTION_HANDLER}
   typed_internals_type_mark (position: POSITION): TYPE_MARK is
      local
         tm: TYPE_MARK
         hs: HASHED_STRING
         cn: CLASS_NAME
         gl: ARRAY[TYPE_MARK]
      do
         hs := string_aliaser.hashed_string(as_native_array_internals)
         tm := elements_type.at(position)
         create cn.make(hs, position)
         gl := {ARRAY[TYPE_MARK] 1, <<tm>>}
         create {USER_GENERIC_TYPE_MARK} Result.make(cn, gl)
      end

feature {C_HEADER_PASS_2}
   c_type_in (str: STRING) is
      local
         et: TYPE_MARK
      do
         et := generic_list.first
         str.extend('T')
         if et.is_reference then
            str.append(once "0*")
         else
            et.type.live_type.id.append_in(str)
         end
         str.extend('*')
      end

feature {}
   gc_mark is
         -- The main purpose is to compute for example the best body for the gc_markXXX function.
         -- Actually, this feature may be called to produce C code when C variable `o' is not NULL.
      require
         cpp.pending_c_function
         not gc_handler.is_off
         is_native_array
         type.live_type.at_run_time
      local
         e_type: TYPE; e_live_type: LIVE_TYPE
      do
         if type.live_type.type.has_simple_feature_name(from_pointer_name) then
            cpp.pending_c_function_body.append(once "[
          if(NULL==gc_find_chunk(o))
          return; /* external NA */

          ]")
         end
         e_type := elements_type.type
         if e_type.need_gc_mark_function then
            e_live_type := e_type.live_type
            cpp.pending_c_function_body.append(once "[
               {rsoh*h=((rsoh*)o)-1;
                if((h->header.magic_flag)==RSOH_UNMARKED){
                   h->header.magic_flag=RSOH_MARKED;
                   {
                             ]")
            c_type_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.remove_last
            cpp.pending_c_function_body.append(once " e;%N")
            c_type_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once "p=((void*)(o+((((h->header.size)-sizeof(rsoh))/sizeof(e))-1)));%N%
               %for(;((void*)p)>=((void*)o);p--){%N%
               %e=*p;%N")
            gc_handler.mark_for(once "e", e_live_type, False)
            cpp.pending_c_function_body.append(once "}}}}%N")
         else
            cpp.pending_c_function_body.append(once "(((rsoh*)o)-1)->header.magic_flag=RSOH_MARKED;%N")
         end
      end

   frozen gc_na_env_in (str: STRING) is
      do
         str.append(once "na_env")
         id.append_in(str)
      end

   make (sp: like start_position; of_what: TYPE_MARK) is
      require
         not sp.is_unknown
         of_what /= Void
      local
         of_what_wm, buffer: STRING
      do
         buffer := once "............................................."
         create class_text_name.make(native_array_name, sp)
         create generic_list.make(1, 1)
         generic_list.put(of_what, 1)
         of_what_wm := of_what.written_mark
         buffer.copy(as_native_array)
         buffer.extend('[')
         buffer.append(of_what_wm)
         buffer.extend(']')
         written_name_memory := string_aliaser.hashed_string(buffer)
      ensure
         start_position = sp
      end

   native_array_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_native_array)
      end

   canonical_long_name: HASHED_STRING is
      do
         Result := native_array_name
      end

end -- class NATIVE_ARRAY_TYPE_MARK
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
