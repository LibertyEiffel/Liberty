-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_ARG_MAPPER
   -- Produce C code in order to pass the expression as an argument of the feature called.

inherit
   EXPRESSION_VISITOR
      undefine
         is_equal
      end

insert
   C_EXPRESSION_COMPILATION_MIXIN[EXPRESSION]
      redefine
         compile_arg,
         visit_abstract_current,
         visit_assertion,
         visit_fake_target,
         visit_fake_tuple,
         visit_argument_name2,
         visit_loop_variant,
         visit_compound_expression,
         visit_dynamic_dispatch_temporary1_id,
         visit_writable_attribute_name
      end

create {C_PRETTY_PRINTER}
   make

feature {}
   visit_abstract_current (visited: ABSTRACT_CURRENT) is
      do
         if type.is_reference then
            cpp.pending_c_function_body.append(once "(T0*)")
            cpp.print_current
         else
            if type.is_user_expanded then
               if not type.is_empty_expanded then
                  cpp.pending_c_function_body.extend('*')
               end
            end
            cpp.print_current
         end
      end

   compile_arg (arg: EXPRESSION) is
      do
         arg.accept(Current)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION) is
      do
         crash
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET) is
      do
         crash -- Not a fake argument
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE) is
      do
         crash
      end

feature {ARGUMENT_NAME2}
   visit_argument_name2 (visited: ARGUMENT_NAME2) is
      do
         cpp.print_argument(visited.rank)
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT) is
      do
         crash -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION) is
      do
         not_yet_implemented
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID) is
      do
         not_yet_implemented
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      do
         crash -- Cannot be syntactically in arg position.
      end

end -- class C_ARG_MAPPER
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
