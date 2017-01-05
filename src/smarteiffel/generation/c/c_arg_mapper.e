-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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
         visit_argument_name_ref,
         visit_loop_variant,
         visit_compound_expression,
         visit_dynamic_dispatch_temporary1_id,
         visit_void_call,
         visit_writable_attribute_name
      end

create {C_PRETTY_PRINTER}
   make

feature {}
   visit_abstract_current (visited: ABSTRACT_CURRENT)
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

   compile_arg (arg: EXPRESSION)
      do
         arg.accept(Current)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION)
      do
         crash
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET)
      do
         crash -- Not a fake argument
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE)
      do
         crash
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         function_body.append(once "/*`")
         function_body.append(visited.to_string)
         function_body.append(once "'*/")
         if visited.closure_rank = 0 then
            cpp.print_argument(visited.rank)
         else
            function_body.append(once "CA_")
            visited.closure_rank.append_in(function_body)
            function_body.extend('_')
            visited.rank.append_in(function_body)
         end
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         crash -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      local
         i: INTEGER; exp: EXPRESSION
      do
         -- GCC specific?? (anyway it will at least work with that compiler, it is a good step from the
         -- previous terse not_yet_implemented)
         function_body.append(once "({%N")
         from
            i := visited.list.lower
         until
            i = visited.list.upper
         loop
            cpp.code_compiler.compile(visited.list.item(i), type)
            i := i + 1
         end
         exp ::= visited.list.last
         exp.accept(Current)
         function_body.append(once ";%N})")
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         not_yet_implemented
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL)
      local
         rt: TYPE
      do
         rt := visited.resolve_in(type)
         cpp.se_evobt(rt.canonical_type_mark, type, create {E_VOID}.make(visited.start_position), False)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         crash -- Cannot be syntactically in arg position.
      end

end -- class C_ARG_MAPPER
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
