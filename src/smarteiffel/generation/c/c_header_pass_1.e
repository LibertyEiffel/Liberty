-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_HEADER_PASS_1

inherit
   C_HEADER_PASS

create {ANY}
   make

feature {}
   header_comment: STRING is "/* C Header Pass 1: */%N"

   pre_compile is
      do
         if agent_pool.agent_creation_collected_flag then
            cpp.out_h_buffer.copy(once "[
                                        typedef union _se_agent se_agent;
                                        typedef struct _se_agent0 se_agent0;

                                        ]")
            cpp.write_out_h_buffer
         end
      end

   do_compile (live_type: LIVE_TYPE) is
      do
         live_type.canonical_type_mark.accept(Current)
      end

feature {}
   frozen standard_c_typedef (type_mark: TYPE_MARK) is
      require
         type.live_type.at_run_time
      local
         mem_id: INTEGER
      do
         mem_id := type_mark.id
         cpp.out_h_buffer.clear_count
         if type_mark.need_c_struct then
            cpp.out_h_buffer.append(once "typedef struct S")
            mem_id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once " T")
            mem_id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
         elseif type_mark.is_empty_expanded then
            cpp.out_h_buffer.append(once "typedef int T")
            mem_id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
         elseif type_mark.is_reference then
            cpp.out_h_buffer.append(once "typedef void*T")
            mem_id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
         end
         cpp.write_out_h_buffer
      end

feature {LIKE_ARGUMENT_TYPE_MARK}
   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK) is
      do
         check
            False
         end
      end

feature {LIKE_FEATURE_TYPE_MARK}
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK) is
      do
         check
            False
         end
      end

feature {LIKE_CURRENT_TYPE_MARK}
   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK) is
      do
         check
            False
         end
      end

feature {FORMAL_GENERIC_TYPE_MARK}
   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK) is
      do
         check
            False
         end
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK) is
      do
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK) is
      do
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK) is
      do
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK) is
      do
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK) is
      do
         cpp.out_h_buffer.clear_count
         cpp.out_h_buffer.append(once "typedef uint")
         visited.bit_count.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once "_t T")
         visited.id.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once "; /*NATURAL_")
         visited.bit_count.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once "*/%N")
         cpp.write_out_h_buffer
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK) is
      do
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK) is
      do
         if not visited.type.has_external_type then
            standard_c_typedef(visited)
         else
            cpp.out_h_buffer.clear_count
            cpp.out_h_buffer.append(once "typedef ")
            cpp.out_h_buffer.append(visited.type.external_type.type_name)
            cpp.out_h_buffer.append(once " T")
            visited.id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
            cpp.write_out_h_buffer
         end
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK) is
      do
         cpp.out_h_buffer.copy(once "typedef T0 T")
         visited.id.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once ";%N")
         cpp.write_out_h_buffer
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK) is
      do
         visited.generic_list.first.type.live_type.canonical_type_mark.accept(Current)
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK) is
      do
         standard_c_typedef(visited)
      end

end -- class C_HEADER_PASS_1
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
