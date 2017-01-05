-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_GARBAGE_COLLECTOR_STRUCTER

inherit
   TYPE_MARK_VISITOR

create {C_GARBAGE_COLLECTOR_HEADER_COMPILER}
   make

feature {C_GARBAGE_COLLECTOR_HEADER_COMPILER}
   for (lt: LIVE_TYPE): STRING
      do
         struct.copy(once "struct {")
         check
            struct.is_empty
            type = Void
            counter = 0
         end
         type := lt.type
         if lt.is_tagged then
            struct.append(once "int id;")
         end
         if lt.writable_attributes /= Void then
            fill_struct(lt)
         end
         struct.append(once "}")
         Result := struct
         type := Void
         counter := 0
      end

feature {C_GARBAGE_COLLECTOR_STRUCTER}
   fill_struct (lt: LIVE_TYPE)
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
            if wa.item(i).result_type.type /= Void then
               wa.item(i).result_type.accept(Current)
            end
            i := i + 1
         end
      end

feature {}
   append_field_name
      do
         counter := counter + 1
         if struct.last /= '*' and then struct.last /= '}' then
            struct.extend(' ')
         end
         struct.extend('f');
         counter.append_in(struct)
         struct.extend(';')
      end

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {NATIVE_ARRAY_TYPE_MARK}
   visit_native_array_type_mark (visited: NATIVE_ARRAY_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            struct.append(once "struct {")
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_struct(lt)
            end
            struct.append(once "}")
         else
            struct.append(void_star)
         end
         append_field_name
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
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
         struct.append(void_star)
         append_field_name
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      local
         lt: LIVE_TYPE
      do
         if visited.is_expanded then
            struct.append(once "struct {")
            lt := visited.type.live_type
            if lt /= Void and then lt.writable_attributes /= Void then
               fill_struct(lt)
            end
            struct.append(once "}")
         else
            struct.append(void_star)
         end
         append_field_name
      end

feature {BOOLEAN_TYPE_MARK}
   visit_boolean_type_mark (visited: BOOLEAN_TYPE_MARK)
      do
         struct.append(once "char")
         append_field_name
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
         struct.append(once "char")
         append_field_name
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
         struct.append(once "int")
         visited.bit_count.append_in(struct)
         struct.append(once "_t")
         append_field_name
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
         struct.append(once "uint")
         visited.bit_count.append_in(struct)
         struct.append(once "_t")
         append_field_name
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
         struct.append(once "real")
         visited.bit_count.append_in(struct)
         struct.append(once "_t")
         append_field_name
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         struct.append(void_star)
         append_field_name
      end

feature {}
   make
      do
         struct := ""
      end

   struct: STRING
   type: TYPE
   counter: INTEGER

   void_star: STRING "void*"

end -- class C_GARBAGE_COLLECTOR_STRUCTER
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
