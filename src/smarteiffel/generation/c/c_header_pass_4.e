-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_HEADER_PASS_4

inherit
   C_HEADER_PASS

create {C_PRETTY_PRINTER}
   make

feature {}
   header_comment: STRING "/* C Header Pass 4: */%N"

   pre_compile
      do
      end

   do_compile (live_type: LIVE_TYPE)
      do
         live_type.canonical_type_mark.accept(Current)
      end

   frozen standard_c_print_function (type_mark: TYPE_MARK)
         -- Produce `prinTid' function.
      require
         type_mark.is_static
      do
         if ace.no_check then
            c_print_function(type_mark.type.live_type)
         end
      end

   c_print_function (live_type: LIVE_TYPE)
      require
         ace.no_check
      local
         ct, t: TYPE_MARK; i: INTEGER; wa: ARRAY[RUN_FEATURE_2]; rf2: RUN_FEATURE_2
      do
         cpp.prepare_c_function
         ct := live_type.canonical_type_mark
         function_signature.append(once "void se_prinT")
         live_type.id.append_in(function_signature)
         function_signature.append(once "(FILE* file,T")
         live_type.id.append_in(function_signature)
         if ct.is_reference then
            function_signature.extend('*')
         end
         function_signature.append(once "*o)")
         if ct.is_reference then
            function_body.append(once "if(*o==NULL){fprintf(file, %"void%");return;}%N")
         end
         function_body.append(once "fprintf(file,%"")
         function_body.append(live_type.name.to_string)
         function_body.append(once "%");%N")
         if ct.is_reference or else ct.is_native_array then
            function_body.append(once "fprintf(file,%"#%%p%",(void*)*o);%N")
         end
         if not ct.type.is_empty_expanded then
            wa := live_type.writable_attributes
            if wa /= Void then
               function_body.append(once "fprintf(file,%"\n\t[ %");%N")
               from
                  i := wa.lower
               until
                  i > wa.upper
               loop
                  if i > wa.lower then
                     function_body.append(once "fprintf(file,%"\n\t  %");%N")
                  end
                  rf2 := wa.item(i)
                  t := rf2.result_type
                  function_body.append(once "fprintf(file,%"")
                  function_body.append(rf2.name.to_string)
                  function_body.append(once " = %");%Nse_prinT")
                  if t.is_expanded then
                     t.id.append_in(function_body)
                     function_body.append(once "(file,(&(")
                  elseif t.is_string then
                     function_body.append(once "7(file,(T7**)(&(")
                  else
                     function_body.append(once "0(file,(T0**)(&(")
                  end
                  if ct.is_reference then
                     function_body.append(once "(*o)->_")
                  else
                     function_body.append(once "o->_")
                  end
                  function_body.append(rf2.name.to_string)
                  function_body.append(once ")));%N")
                  i := i + 1
               end
               function_body.append(once "fprintf(file,%"\n\t]%");%N")
            end
         end
         cpp.dump_pending_c_function(True)
      end

feature {LIKE_ARGUMENT_TYPE_MARK}
   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK)
      do
         check
            False
         end
      end

feature {LIKE_FEATURE_TYPE_MARK}
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK)
      do
         check
            False
         end
      end

feature {LIKE_CURRENT_TYPE_MARK}
   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK)
      do
         check
            False
         end
      end

feature {FORMAL_GENERIC_TYPE_MARK}
   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK)
      do
         check
            False
         end
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK)
      do
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
         if ace.no_check then
            cpp.prepare_c_function
            function_signature.append(once "void se_prinT")
            visited.id.append_in(function_signature)
            function_signature.append(once "(FILE* file,T")
            visited.id.append_in(function_signature)
            function_signature.append(once "*o)")
            function_body.append(once "fprintf(file,%"%%llu%",(long long unsigned int)((uint64_t) *o));")
            cpp.dump_pending_c_function(True)
         end
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         standard_c_struct(visited)
         standard_c_object_model(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         if visited.is_reference and then cpp.need_struct.for(visited) then
            standard_c_struct(visited)
         end
         standard_c_object_model(visited)
         standard_c_print_function(visited)
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK)
      do
         if cpp.need_struct.for(visited) then
            standard_c_struct(visited)
         end
         standard_c_object_model(visited)
         standard_c_print_function(visited)
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         if cpp.need_struct.for(visited) then
            standard_c_struct(visited)
         end
         standard_c_object_model(visited)
         standard_c_print_function(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         standard_c_struct(visited)
         standard_c_object_model(visited)
         standard_c_print_function(visited)
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         standard_c_print_function(visited)
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         standard_c_print_function(visited)
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         standard_c_print_function(visited)
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         if visited.is_reference then
            if cpp.need_struct.for(visited) then
               standard_c_struct(visited)
               standard_c_object_model(visited)
            else
               out_h.append(once "typedef void*T")
               visited.id.append_in(out_h)
               out_h.append(once ";%N")
            end
         end
         standard_c_print_function(visited)
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         standard_c_struct(visited)
         standard_c_object_model(visited)
         standard_c_print_function(visited)
      end

end -- class C_HEADER_PASS_4
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
