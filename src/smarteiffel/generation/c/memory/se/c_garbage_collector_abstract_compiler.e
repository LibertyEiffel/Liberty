-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER
   --
   -- Common behaviour for GC generation classes
   --

inherit
   TYPE_MARK_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON
   TAGGER
      undefine
         is_equal
      end

feature {}
   memory: GC_HANDLER
      do
         Result ::= cpp.memory
      end

   c_struct_signature_tag: FIXED_STRING
      do
         Result := memory.c_struct_signature_tag
      end

   ltid_in (lt: LIVE_TYPE; buffer: STRING; declare_type, for_closure: BOOLEAN)
      require
         lt /= Void
         buffer /= Void
         for_closure implies lt.type.has_local_closure
      do
         if declare_type then
            buffer.extend('T')
         end
         if for_closure and not declare_type then
            buffer.append(once "CL")
         end
         lt.id.append_in(buffer)
         if declare_type then
            if for_closure then
               buffer.extend('*')
            end
            if lt.is_reference then
               buffer.extend('*')
            else
               buffer.append(once "/*")
               buffer.append(lt.structure_signature)
               buffer.append(once "*/")
            end
         end
      end

feature {GC_HANDLER}
   compile (type_mark: TYPE_MARK)
      require
         type_mark.type.live_type.at_run_time
      do
         type_mark.accept(Current)
      end

feature {ARRAY_TYPE_MARK}
   visit_array_type_mark (visited: ARRAY_TYPE_MARK)
      do
         gc_reference(visited)
      end

feature {NON_EMPTY_TUPLE_TYPE_MARK}
   visit_non_empty_tuple_type_mark (visited: NON_EMPTY_TUPLE_TYPE_MARK)
      do
         gc_reference(visited)
      end

feature {USER_GENERIC_TYPE_MARK}
   visit_user_generic_type_mark (visited: USER_GENERIC_TYPE_MARK)
      do
         if visited.is_reference then
            gc_reference(visited)
         else
            gc_expanded(visited)
         end
      end

feature {EMPTY_TUPLE_TYPE_MARK}
   visit_empty_tuple_type_mark (visited: EMPTY_TUPLE_TYPE_MARK)
      do
         gc_reference(visited)
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
         gc_reference(visited)
      end

feature {CLASS_TYPE_MARK}
   visit_class_type_mark (visited: CLASS_TYPE_MARK)
      do
         if visited.is_reference then
            gc_reference(visited)
         else
            gc_expanded(visited)
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
         gc_kernel_expanded(visited)
      end

feature {CHARACTER_TYPE_MARK}
   visit_character_type_mark (visited: CHARACTER_TYPE_MARK)
      do
         gc_kernel_expanded(visited)
      end

feature {INTEGER_TYPE_MARK}
   visit_integer_type_mark (visited: INTEGER_TYPE_MARK)
      do
         gc_kernel_expanded(visited)
      end

feature {NATURAL_TYPE_MARK}
   visit_natural_type_mark (visited: NATURAL_TYPE_MARK)
      do
         gc_kernel_expanded(visited)
      end

feature {POINTER_TYPE_MARK}
   visit_pointer_type_mark (visited: POINTER_TYPE_MARK)
      do
         gc_kernel_expanded(visited)
      end

feature {REAL_TYPE_MARK}
   visit_real_type_mark (visited: REAL_TYPE_MARK)
      do
         gc_kernel_expanded(visited)
      end

feature {STRING_TYPE_MARK}
   visit_string_type_mark (visited: STRING_TYPE_MARK)
      do
         gc_reference(visited)
      end

feature {WEAK_REFERENCE_TYPE_MARK}
   visit_weak_reference_type_mark (visited: WEAK_REFERENCE_TYPE_MARK)
      do
         gc_reference(visited)
      end

feature {}
   make
      do
      end

   gc_kernel_expanded (visited: TYPE_MARK)
      require
         visited.is_kernel_expanded
      deferred
      end

   gc_reference (visited: TYPE_MARK)
         -- For Fixed Size Objects.
      require
         visited.is_static
         visited.is_reference
         visited.type.live_type.at_run_time
      deferred
      end

   gc_expanded (visited: TYPE_MARK)
         -- For user's expanded with reference attribute to mark.
      require
         visited.is_static
         visited.is_expanded
         visited.type.live_type.at_run_time
      deferred
      end

end -- class C_GARBAGE_COLLECTOR_ABSTRACT_COMPILER
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
