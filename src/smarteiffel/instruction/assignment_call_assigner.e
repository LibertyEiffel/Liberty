-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_CALL_ASSIGNER
   --
   -- For instruction like :
   --                          foo.item := bar
   --                          foo.item := bar + 1
   --
   --

inherit
   INSTRUCTION

create {ANY}
   make

feature {ANY}
   left_side: FUNCTION_CALL

   right_side: EXPRESSION

   end_mark_comment: BOOLEAN False

   side_effect_free (type: TYPE): BOOLEAN
      do
         check False end
      end

   simplify (type: TYPE): INSTRUCTION
      do
         check False end
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := left_side.use_current(type) or else right_side.use_current(type)
      end

   start_position: POSITION
      do
         Result := left_side.start_position
      end

   specialize_in (type: TYPE): like Current
      local
         l: FUNCTION_CALL; r: EXPRESSION
      do
         l := left_side.specialize_in(type)
         r := right_side.specialize_in(type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         l: FUNCTION_CALL; r: EXPRESSION
      do
         l := left_side.specialize_thru(parent_type, parent_edge, new_type)
         r := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r)
         end
      end

   specialize_and_check (type: TYPE): INSTRUCTION
      local
         l: FUNCTION_CALL; r: EXPRESSION
         target_type: TYPE; fn: FEATURE_NAME
         fs_assigned: FEATURE_STAMP; af_assigned, af_assigner: ANONYMOUS_FEATURE
         pc_arguments: EFFECTIVE_ARG_LIST; arguments: EFFECTIVE_ARG_LIST_N
         args: FAST_ARRAY[EXPRESSION]; i: INTEGER
         collected_actual_call: PROCEDURE_CALL
      do
         l ::= left_side.specialize_and_check(type)
         r := right_side.specialize_and_check(type)
         target_type := l.target.resolve_in(type)
         fs_assigned := l.feature_stamp
         check
            fs_assigned.has_anonymous_feature_for(target_type)
         end
         af_assigned := fs_assigned.anonymous_feature(target_type)
         if af_assigned.assigner = Void or else target_type.lookup(af_assigned.assigner) = Void then
            error_handler.append(once "Such an expression cannot be on the left-hand side of an assignment operator. There is no assigner to `")
            error_handler.append(l.feature_name.to_string)
            error_handler.append(once "` in class ")
            error_handler.append(target_type.canonical_type_mark.written_mark)
            error_handler.append(once ".")
            error_handler.add_position(start_position)
            error_handler.print_as_fatal_error
         end
         af_assigner := target_type.lookup(af_assigned.assigner).anonymous_feature(target_type)
         fn := af_assigner.names.first

         echo.put_string(once "Replacing assign to {")
         echo.put_string(target_type.canonical_type_mark.written_mark)
         echo.put_string(once "}.")
         echo.put_string(l.feature_name.to_string)
         echo.put_string(once " by a call to {")
         echo.put_string(target_type.canonical_type_mark.written_mark)
         echo.put_string(once "}.")
         echo.put_line(fn.to_string)

         pc_arguments := l.arguments
         if pc_arguments = Void then
            create arguments.make_1(start_position, r)
            create {PROCEDURE_CALL_1} collected_actual_call.make(l.target, fn, arguments)
         else
            create args.with_capacity(pc_arguments.count)
            from
               i := 1
            until
               i > pc_arguments.count
            loop
               args.add_last(pc_arguments.expression(i))
               i := i + 1
            end
            create arguments.make_n(start_position, r, args)
            create {PROCEDURE_CALL_N} collected_actual_call.make(l.target, fn, arguments)
         end

         Result := collected_actual_call.specialize_and_check(type)
         smart_eiffel.magic_count_increment
      end

   has_been_specialized: BOOLEAN
      do
         check not Result end
      end

   safety_check (type: TYPE)
      do
         check False end
      end

   pretty (indent_level: INTEGER)
      local
         semi_colon_flag: BOOLEAN; expression_with_comment: EXPRESSION_WITH_COMMENT
      do
         pretty_printer.set_indent_level(indent_level)
         semi_colon_flag := pretty_printer.semi_colon_flag
         left_side.pretty(indent_level)
         pretty_printer.put_string(once " := ")
         pretty_printer.set_semi_colon_flag(False)
         expression_with_comment ?= right_side
         if expression_with_comment /= Void and then
            expression_with_comment.comment.start_position.line > expression_with_comment.expression.start_position.line
         then
            -- The comment is actually for the next instruction.
            expression_with_comment.expression.pretty(indent_level)
            pretty_printer.set_indent_level(indent_level)
            expression_with_comment.comment.pretty(indent_level)
         else
            right_side.pretty(indent_level)
         end
         pretty_printer.set_semi_colon_flag(semi_colon_flag)
         if semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(0)
      end

   accept (visitor: ASSIGNMENT_CALL_ASSIGNER_VISITOR)
      do
         visitor.visit_assignment_call_assigner(Current)
      end

   collect (t: TYPE): TYPE
      do
         check False end
      end

   adapt_for (t: TYPE): INSTRUCTION
      do
         check False end
      end

feature {}
   make (ls: like left_side; rs: like right_side)
         -- Note: this creation procedure is for example called by the `eiffel_parser' which is in charge
         -- of checking that `ls' is actually a writable entity.
      require
         not ls.start_position.is_unknown
         rs /= Void
      do
         left_side := ls
         right_side := rs
      ensure
         left_side = ls
         right_side = rs
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
      end

invariant
   left_side /= Void
   right_side /= Void

end -- class ASSIGNMENT_CALL_ASSIGNER
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
