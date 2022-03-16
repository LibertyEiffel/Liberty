-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_INITIALIZER
   -- Append in `buffer' C code for initialisation of local variables or attributes (see also
   -- `c_initialize').

inherit
   TYPE_MARK_VISITOR

insert
   C_COMPILATION_MIXIN

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   for (type_mark: TYPE_MARK): STRING
      require
         type_mark.is_static
      do
         Result := buffer
         Result.clear_count
         type_mark.accept(Current)
      ensure
         Result /= Void
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         if visited.is_expanded then
            c_initialize_user_expanded(visited)
         else
            buffer.append(once "(void*)0")
         end
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {LIKE_ARGUMENT_TYPE_MARK}
   visit_like_argument_type_mark (visited: LIKE_ARGUMENT_TYPE_MARK)
      do
         crash
      end

feature {LIKE_FEATURE_TYPE_MARK}
   visit_like_feature_type_mark (visited: LIKE_FEATURE_TYPE_MARK)
      do
         crash
      end

feature {LIKE_CURRENT_TYPE_MARK}
   visit_like_current_type_mark (visited: LIKE_CURRENT_TYPE_MARK)
      do
         crash
      end

feature {FORMAL_GENERIC_TYPE_MARK}
   visit_formal_generic_type_mark (visited: FORMAL_GENERIC_TYPE_MARK)
      do
         crash
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         if visited.is_expanded then
            check
               visited.is_user_expanded
            end
            if visited.type.has_external_type then
               buffer.append(visited.type.external_type.default_value)
            else
               c_initialize_user_expanded(visited)
            end
         else
            buffer.append(once "(void*)0")
         end
      end

feature {CLIENT_TYPE_MARK}
   visit_client_type_mark (visited: CLIENT_TYPE_MARK)
      do
         check False end
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK)
      do
         buffer.append(once "0")
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
         buffer.append(once "'\0'")
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
         buffer.append(once "0")
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
         buffer.append(once "0")
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
         buffer.append(once "0.0")
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         buffer.append(once "(void*)0")
      end

feature {}
   make
      do
      end

   buffer: STRING "................"

   frozen c_initialize_user_expanded (type_mark: TYPE_MARK)
         -- For all kinds of `is_user_expanded' including `is_empty_expanded' as well.
      require
         type_mark.is_user_expanded
      local
         wa: ARRAY[RUN_FEATURE_2]; i: INTEGER; rf: RUN_FEATURE_2
      do
         if type_mark.type.is_empty_expanded then
            buffer.append(once "0/*empty expanded*/")
         else
            buffer.extend('{')
            wa := type_mark.type.live_type.writable_attributes
            from
               i := wa.lower
            until
               i > wa.upper
            loop
               if i > wa.lower then
                  buffer.extend(',')
               end
               rf := wa.item(i)
               rf.result_type.accept(Current)
               i := i + 1
            end
            cpp.memory.extra_c_model(type_mark)
            buffer.extend('}')
         end
      end

end -- class C_INITIALIZER
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
