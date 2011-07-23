-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_TEST_POOL

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {GLOBALS}
   make

feature {ASSIGNMENT_TEST}
   collect (left_type, right_type: TYPE) is
         -- Where `left_type' is the left-hand side TYPE and `right_type' the right-hand side TYPE.
      require
         right_type /= Void
         left_type /= Void
      local
         left_set: HASHED_SET[TYPE]
      do
         left_set := map.fast_reference_at(right_type)
         if left_set = Void then
            left_set := new_empty_set
            map.fast_put(left_set, right_type)
         end
         left_set.fast_add(left_type)
      end

   function_name_in (buffer: STRING; left_type, right_type: TYPE) is
      require
         buffer /= Void
         left_type /= Void
         right_type /= Void
         simplify_done_in_boost_mode: ace.boost implies not right_type.can_be_assigned_to(left_type)
      do
         buffer.append(once "at_")
         signature_add_last(buffer, left_type)
         buffer.append(once "__")
         signature_add_last(buffer, right_type)
      end

feature {SMART_EIFFEL}
   reset is
      local
         i: INTEGER
      do
         from
            i := map.lower
         until
            i > map.upper
         loop
            free_set_list.add_last(map.item(i))
            i := i + 1
         end
         map.clear_count
      end

feature {C_PRETTY_PRINTER}
   c_define_assignment_test_functions (live_type_map: TRAVERSABLE[LIVE_TYPE]) is
      local
         right_type: TYPE; left_set: SET[TYPE]; i, j: INTEGER
      do
         echo.print_count(once "Assignment test (%"?:=%") function", map.count)
         from
            i := map.lower
         until
            i > map.upper
         loop
            right_type := map.key(i)
            left_set := map.item(i)
            from
               j := left_set.lower
            until
               j > left_set.upper
            loop
               c_define_assignment_test_for(left_set.item(j), right_type, live_type_map)
               j := j + 1
            end
            i := i + 1
         end
      end

   c_define_assignment_test_for (left_type, right_type: TYPE; live_type_map: TRAVERSABLE[LIVE_TYPE]) is
      require
         must_be_simplified_in_boost: ace.boost implies not right_type.can_be_assigned_to(left_type)
      local
         i: INTEGER; dynamic: TYPE
      do
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "int ")
         function_name_in(cpp.pending_c_function_signature, left_type, right_type)
         cpp.pending_c_function_signature.append(once "(T0* expression)")
         cpp.pending_c_function_body.append(once "/* ")
         cpp.pending_c_function_body.append(left_type.name.to_string)
         cpp.pending_c_function_body.append(once " ?:= ")
         cpp.pending_c_function_body.append(right_type.name.to_string)
         cpp.pending_c_function_body.append(once " */%Nif (expression == NULL) return 1;%N")
         if right_type.live_type /= Void then
            if right_type.live_type.run_time_set.count > 1 then
               check
                  right_type.live_type.is_tagged
               end
               cpp.pending_c_function_body.append(once "switch (expression->id) {%N")
               from
                  i := live_type_map.upper
               until
                  i < live_type_map.lower
               loop
                  dynamic := live_type_map.item(i).type
                  if dynamic.live_type.at_run_time then
                     if dynamic.can_be_assigned_to(left_type) then
                        cpp.pending_c_function_body.append(once "case ")
                        dynamic.live_type.id.append_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "/*")
                        cpp.pending_c_function_body.append(dynamic.name.to_string)
                        cpp.pending_c_function_body.append(once "*/: return 1;%N")
                     elseif (not ace.boost) and then not dynamic.can_be_assigned_to(right_type) then
                        cpp.pending_c_function_body.append(once "case ")
                        dynamic.live_type.id.append_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "/*")
                        cpp.pending_c_function_body.append(dynamic.name.to_string)
                        cpp.pending_c_function_body.append(once "*/: error2(expression,/*unknown-position*/0);break;%N")
                     end
                  end
                  i := i - 1
               end
               cpp.pending_c_function_body.append(once "}%Nreturn 0;%N")
            elseif right_type.live_type.run_time_set.count = 1 then
               if not ace.boost then
                  cpp.pending_c_function_body.append(once "ci(")
                  right_type.live_type.run_time_set.first.id.append_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ",expression,/*unknown-position*/0);%N")
               end
               if right_type.live_type.run_time_set.first.type.can_be_assigned_to(left_type) then
                  cpp.pending_c_function_body.append(once "return 1;%N")
               else
                  cpp.pending_c_function_body.append(once "return 0;%N")
               end
            else
               right_hand_side_can_only_be_void
            end
         else
            right_hand_side_can_only_be_void
         end
         cpp.dump_pending_c_function(True)
      end

feature {}
   right_hand_side_can_only_be_void is
      do
         -- The right-hand side can only be Void:
         if not ace.boost then
            cpp.pending_c_function_body.append(once "if (expression != NULL) error2(expression,/*unknown-position*/0);%N")
         end
         cpp.pending_c_function_body.append(once "return 1;%N")
      end

   map: HASHED_DICTIONARY[HASHED_SET[TYPE], TYPE] is
         -- The key is the right-hand side TYPE.
      once
         create Result.make
      end

   free_set_list: FAST_ARRAY[HASHED_SET[TYPE]] is
         -- To be able to recycle SETs from one collect to another collect.
      once
         create Result.with_capacity(8)
      end

   new_empty_set: HASHED_SET[TYPE] is
      do
         if free_set_list.is_empty then
            create Result.make
         else
            Result := free_set_list.last
            Result.clear_count
            free_set_list.remove_last
         end
      end

   make is
      do
      end

   signature_add_last (signature: STRING; type: TYPE) is
      require
         type /= Void
      local
         s: STRING; i: INTEGER; c: CHARACTER
      do
         if type.live_type /= Void then
            type.id.append_in(signature)
         else
            from
               s := type.name.to_string
               i := 1
            until
               i > s.count
            loop
               c := s.item(i)
               inspect
                  c
               when '[', ']', ',', ' ' then
                  signature.append(once "__")
                  -- It is not allowed to have 2 _ in the same identifier in Eiffel, but in C.
               else
                  signature.extend(c)
               end
               i := i + 1
            end
         end
      end

end -- ASSIGNMENT_TEST_POOL
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
