-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_TAGGER

inherit
   TYPE_MARK_VISITOR

insert
   GLOBALS

create {GC_HANDLER}
   make

feature {GC_HANDLER}
   for (lt: LIVE_TYPE): HASHED_STRING
      do
         check
            tag.is_empty
            type = Void
         end
         type := lt.type
         if lt.is_tagged then
            tag.extend('T')
         end
         if lt.writable_attributes /= Void then
            fill_tag(lt)
         end
         Result := string_aliaser.hashed_string(tag)
         tag.clear_count
         type := Void
      end

feature {C_GARBAGE_COLLECTOR_TAGGER}
   fill_tag (lt: LIVE_TYPE)
      require
         lt.writable_attributes /= Void
      local
         i: INTEGER; wa: ARRAY[RUN_FEATURE_2]
      do
         from
            wa := lt.writable_attributes
            i := wa.lower
         until
            i > wa.upper
         loop
            wa.item(i).result_type.accept(Current)
            i := i + 1
         end
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         tag.extend('a')
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         tag.extend('p')
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         tag.extend('A')
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         tag.extend('p')
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            tag.extend('X')
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_tag(lt)
            end
            tag.extend('x')
         else
            tag.extend('p')
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         tag.extend('p')
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         tag.extend('p')
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

feature {CLIENT_TYPE_MARK}
   visit_client_type_mark (visited: CLIENT_TYPE_MARK)
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
         tag.extend('p')
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            tag.extend('X')
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_tag(lt)
            end
            tag.extend('x')
         else
            tag.extend('p')
         end
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK)
      do
         tag.extend('z')
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
         tag.extend('c')
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
         tag.extend('i')
         visited.bit_count.append_in(tag)
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
         tag.extend('u')
         visited.bit_count.append_in(tag)
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
         tag.extend('p')
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
         tag.extend('f')
         visited.bit_count.append_in(tag)
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         tag.extend('p')
      end

feature {}
   make
      do
         tag := ""
      end

   tag: STRING
   type: TYPE

end -- class C_GARBAGE_COLLECTOR_TAGGER
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
