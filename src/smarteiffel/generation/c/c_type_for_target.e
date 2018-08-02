-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_TYPE_FOR_TARGET

inherit
   TYPE_MARK_VISITOR

insert
   C_TYPE_FOR_ARGUMENT
      redefine
         visit_agent_type_mark,
         visit_array_type_mark,
         visit_non_empty_tuple_type_mark,
         visit_user_generic_type_mark,
         visit_empty_tuple_type_mark,
         visit_any_type_mark,
         visit_class_type_mark,
         visit_string_type_mark,
         visit_weak_reference_type_mark
      end

create {C_PRETTY_PRINTER}
   make

feature {AGENT_TYPE_MARK}
   visit_agent_type_mark (visited: AGENT_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         if not visited.type.is_empty_expanded then
            buffer.extend('*')
         end
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {ANY_TYPE_MARK}
   visit_any_type_mark (visited: ANY_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         buffer.extend('*')
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         buffer.extend('T')
         visited.id.append_in(buffer)
         if not visited.type.is_empty_expanded then
            buffer.extend('*')
         end
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         buffer.append(once "T7*")
      end

end -- class C_TYPE_FOR_TARGET
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
