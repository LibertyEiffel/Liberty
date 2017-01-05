-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BDW_ASSIGN_NATIVE_ARRAY

inherit
   COMPOUND_EXPRESSION_VISITOR
   DYNAMIC_DISPATCH_TEMPORARY1_ID_VISITOR
   EXPRESSION_WITH_COMMENT_VISITOR
   INTERNAL_LOCAL2_VISITOR
   LOCAL_NAME_REF_VISITOR
   NATIVE_ARRAY_ITEM_VISITOR
   RESULT_VISITOR
   WRITABLE_ATTRIBUTE_NAME_VISITOR

insert
   GLOBALS

create {BDW_GC}
   make

feature {BDW_GC}
   for (a_assignment: like assignment; a_type: like type)
      require
         a_assignment.left_side.is_writable
         a_type /= Void
      do
         assignment := a_assignment
         type := a_type
         a_assignment.left_side.accept(Current)
         assignment := Void
         type := Void
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      do
         visited.last.accept(Current)
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT)
      do
         visited.expression.accept(Current)
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         cpp.pending_c_function_body.append(once "GC_call_with_alloc_lock((GC_fn_type)bdw_na_assignT")
         type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend(',')
         --cpp.put_target_as_value
         if type.is_expanded then
            cpp.pending_c_function_body.extend('&')
         end
         cpp.pending_c_function_body.extend('C')
         cpp.pending_c_function_body.append(once ");%N")
      end

feature {}
   assignment: ASSIGNMENT
   type: TYPE
   bdw: BDW_GC

   make (a_bdw: like bdw)
      require
         a_bdw /= Void
      do
         bdw := a_bdw
      ensure
         bdw = a_bdw
      end

end -- class BDW_ASSIGN_NATIVE_ARRAY
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
