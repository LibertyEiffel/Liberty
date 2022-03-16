-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_HEADER_PASS_1

inherit
   C_HEADER_PASS

create {C_PRETTY_PRINTER}
   make

feature {}
   header_comment: STRING "/* C Header Pass 1: */%N"

   pre_compile
      do
         if agent_pool.agent_creation_collected_flag then
            out_h.copy(once "[
                             typedef union _se_agent se_agent;
                             typedef struct _se_agent0 se_agent0;

                             ]")
            flush_out_h
         end
      end

   do_compile (live_type: LIVE_TYPE)
      do
         live_type.canonical_type_mark.accept(Current)
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
         out_h.clear_count
         out_h.append(once "typedef uint")
         visited.bit_count.append_in(out_h)
         out_h.append(once "_t T")
         visited.id.append_in(out_h)
         out_h.append(once "; /*NATURAL_")
         visited.bit_count.append_in(out_h)
         out_h.append(once "*/%N")
         flush_out_h
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         if not visited.type.has_external_type then
            standard_c_typedef(visited)
         else
            out_h.clear_count
            out_h.append(once "typedef ")
            out_h.append(visited.type.external_type.type_name)
            out_h.append(once " T")
            visited.id.append_in(out_h)
            out_h.append(once ";%N")
            flush_out_h
         end
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         out_h.copy(once "typedef T0 T")
         visited.id.append_in(out_h)
         out_h.append(once ";%N")
         flush_out_h
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      local
         generic_type: LIVE_TYPE
      do
         generic_type := visited.generic_list.first.type.live_type
         if generic_type.at_run_time then
            compile_live_type(generic_type)
         elseif not is_compiled(generic_type) then --| **** TODO: THIS IS A DIRTY HACK!!
            set_compiled(generic_type)
            out_h.copy(once "/*BUG:NA@runtime!*/")
            flush_out_h
            do_compile(generic_type)
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      local
         generic_type: LIVE_TYPE
      do
         generic_type := visited.generic_list.first.type.live_type
         if generic_type.at_run_time then
            compile_live_type(generic_type)
         elseif not is_compiled(generic_type) then --| **** TODO: THIS IS A DIRTY HACK!!
            set_compiled(generic_type)
            out_h.copy(once "/*BUG:WR@runtime!*/")
            flush_out_h
            do_compile(generic_type)
         end
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         standard_c_typedef(visited)
      end

end -- class C_HEADER_PASS_1
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
