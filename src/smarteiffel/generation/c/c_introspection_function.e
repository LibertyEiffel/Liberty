-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_INTROSPECTION_FUNCTION

inherit
   LIVE_TYPE_VISITOR
      undefine
         is_equal
      end
   RUN_FEATURE_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

create {C_PRETTY_PRINTER}
   make

feature {C_PRETTY_PRINTER}
   compile (live_type: LIVE_TYPE)
         -- was prepare_introspection
      require
         ace.no_check
      do
         live_type.accept(Current)
      end

feature {LIVE_TYPE}
   visit_live_type (visited: LIVE_TYPE)
      local
         i: INTEGER; rf: RUN_FEATURE; ct, t: TYPE_MARK
      do
         if visited.at_run_time then
            cpp.prepare_c_function
            ct := visited.canonical_type_mark
            function_signature.append(once "void* se_introspecT")
            visited.id.append_in(function_signature)
            function_signature.append(once "(T")
            ct.id.append_in(function_signature)
            if ct.is_reference then
               function_signature.extend('*')
            end
            function_signature.append(once "*C,char*attr,int*id,int*exp)")
            function_body.append(once "void*R=NULL;%N")
            if ct.is_native_array then
               -- NATIVE_ARRAY: support access to an element
               check
                  ct.is_generic
                  ct.generic_list.count = 1
               end
               t := ct.generic_list.first
               if t.is_expanded then
                  function_body.append(once "*id=")
                  t.id.append_in(function_body)
                  function_body.append(once ";%N*exp=1;%N")
               else
                  function_body.append(once "*exp=0;%N")
               end
               function_body.append(once "R=(*((")
               function_body.append(cpp.result_type.for(t))
               function_body.append(once "**)C)+atoi(attr));%N")
               if t.type.live_type.run_time_set.count > 1 then
                  function_body.append(once "*id=(*((T0**)R))->id;%N")
               else
                  function_body.append(once "*id=")
                  t.id.append_in(function_body)
                  function_body.append(once ";%N")
               end
            else
               -- General case: support access to attributes and once queries
               function_body.append(once "*id=-1;%N")
               from
                  put_else := False
                  i := visited.live_features.lower
               until
                  i > visited.live_features.upper
               loop
                  rf := visited.live_features.key(i).run_feature_for(visited.type)
                  rf.accept(Current)
                  i := i + 1
               end
               --|*** PH: loop on precursors?
            end
            function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_1}
   visit_run_feature_1 (visited: RUN_FEATURE_1)
      do
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2)
      local
         lt: LIVE_TYPE
      do
         lt := visited.result_type.type.live_type

         if lt /= Void then
            if put_else then
               function_body.append(once "else ")
            end
            function_body.append(once "if (!strcmp(attr,%"")
            function_body.append(visited.name.to_string)
            function_body.append(once "%")) {%N")
            c_return_introspect(lt, visited, Void)
            function_body.append(once "}%N")
            put_else := True
         end
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3)
      do
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4)
      do
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5)
      do
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6)
      local
         lt: LIVE_TYPE
      do
         lt := visited.result_type.type.live_type
         if lt /= Void then
            if put_else then
               function_body.append(once "else ")
            end
            function_body.append(once "if (!strcmp(attr,%"")
            function_body.append(visited.name.to_string)
            function_body.append(once "%")) {%N")
            if visited.is_precomputable_once then
               c_return_introspect(lt, Void, visited)
            else
               cpp.c_test_o_flag_introspect(visited)
               c_return_introspect(lt, Void, visited)
               function_body.append(once "} else { *id=0; }%N")
            end
            function_body.append(once "}%N")
            put_else := True
         end
      end

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7)
      do
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8)
      do
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9)
      do
      end

feature {}
   c_return_introspect (lt: LIVE_TYPE; rf2: RUN_FEATURE_2; rf6: RUN_FEATURE_6)
      require
         (rf2 /= Void) xor (rf6 /= Void)
         lt /= Void
         cpp.pending_c_function
         ace.no_check
      local
         i, t: INTEGER; rts: RUN_TIME_SET; tm: TYPE_MARK; s: STRING
      do
         rts := lt.run_time_set
         inspect
            rts.count
         when 0 then
            -- nothing
         when 1 then
            tm := rts.first.canonical_type_mark
            s := c_pointer_to_type(tm)
            t := tm.id
            if tm.is_expanded then
               function_body.append(once "*exp=1;%N")
            else
               function_body.append(once "*exp=0;%N")
            end
            function_body.append(once "*id=")
            t.append_in(function_body)
            function_body.append(once ";%N{%Nstatic ")
            if thread_pool.count = 0 then
               function_body.append(s)
               if not tm.is_reference then
                  function_body.extend(' ')
               end
               function_body.append(once "_r=")
            else
               function_body.append(once "TLS(")
               function_body.append(s)
               function_body.append(once ")_r=")
            end
            function_body.append(cpp.initializer.for(tm))
            function_body.extend(';')
            if         (rf2 /= Void and then rf2.result_type.type.is_empty_expanded)
               or else (rf6 /= Void and then rf6.result_type.type.is_empty_expanded) then
               -- do nothing
            else
               function_body.append(once "%N_r=")
               if tm.is_reference then
                  function_body.extend('(')
                  function_body.append(s)
                  function_body.append(once ")")
               end
               function_body.extend('(')
               if rf2 /= Void then
                  mapping_c_inside_introspect(rf2)
               else
                  once_routine_pool.unique_result_in(function_body, rf6.base_feature)
               end
               function_body.append(once ");")
            end
            function_body.append(once "%NR=&_r;%N}%N")
         else
            function_body.append(once "{%Nstatic ")
            if thread_pool.count = 0 then
               function_body.append(once "T0*")
            else
               function_body.append(once "TLS(T0*)")
            end
            function_body.append(once "_r=NULL;%N_r=")
            if rf2 /= Void then
               mapping_c_inside_introspect(rf2)
            else
               once_routine_pool.unique_result_in(function_body, rf6.base_feature)
            end
            function_body.append(once ";%Nif(_r==NULL){R=&_r;*id=0;}else{%Nswitch(_r->id){%N")
            from
               i := 1
            until
               i > rts.count
            loop
               t := rts.item(i).canonical_type_mark.id
               function_body.append(once "case ")
               t.append_in(function_body)
               function_body.append(once ":%N")
               i := i + 1
            end
            function_body.append(once "*id=_r->id;R=&_r;break;%Ndefault:*id=0;break;%N}%N}%N}%N")
         end
      end

   c_pointer_to_type (t: TYPE_MARK): STRING
      do
         Result := once "T32767*"
         Result.copy(once "T")
         t.id.append_in(Result)
         if t.is_reference then
            Result.extend('*')
         end
      end

   mapping_c_inside_introspect (rf2: RUN_FEATURE_2)
      do
         function_body.extend('(')
         if rf2.type_of_current.is_reference then
            function_body.append(once "(*C)->")
            put_c_field_name(rf2)
         else
            check
               rf2.type_of_current.is_user_expanded
            end
            function_body.append(once "C->")
            put_c_field_name(rf2)
         end
         function_body.extend(')')
      end

feature {}
   make
      do
      end

   put_else: BOOLEAN

end -- class C_INTROSPECTION_FUNCTION
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
