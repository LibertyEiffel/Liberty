-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXTERNAL_PROCEDURE

inherit
   EXTERNAL_ROUTINE
      redefine hook_collect
      end

create {FEATURE_TEXT}
   make

create {CLASS_TEXT}
   non_written

feature {ANY}
   side_effect_free (target_type: TYPE): BOOLEAN
      do
         -- As it is a procedure, there are side effects!
      end

   result_type: TYPE_MARK
      do
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_7
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {RUN_FEATURE}
   hook_collect (t: TYPE)
      local
         n: STRING
         dummy: TYPE
      do
         n := first_name.to_string
         if as_raise_exception = n then
            exceptions_handler.set_used
         elseif as_slice_copy = n and then as_native_array = t.class_text.name.to_string and then t.generic_list.first.is_user_expanded then --|**** TODO also check that copy was redefined
            if routine_body = Void then
               debug
                  echo.put_string(once "**** collecting ")
                  echo.put_string(t.name.to_string)
                  echo.put_line(once ".slice_copy")
               end
               routine_body := collect_slice_copy(t)
               is_generated_eiffel := True
            end
            dummy := routine_body.collect(t)
         end
      end

feature {}
   collect_slice_copy (type: TYPE): INSTRUCTION
      local
         local_index: INTERNAL_LOCAL2
         arg_at, arg_src, arg_src_min, arg_src_max: ARGUMENT_NAME_REF
         call_copy: PROCEDURE_CALL_1
         until_expression: CALL_INFIX_GT
         array_item, src_item: NATIVE_ARRAY_ITEM
         offset: CALL_INFIX_MINUS; plus: CALL_INFIX_PLUS
         one: INTEGER_CONSTANT
         t_int: TYPE
         compound: COMPOUND
         initialize, increment: ASSIGNMENT
         copy_args: EFFECTIVE_ARG_LIST_N
      do
         create arg_at.refer_to(start_position, arguments, 1, 0)
         create arg_src.refer_to(start_position, arguments, 2, 0)
         create arg_src_min.refer_to(start_position, arguments, 3, 0)
         create arg_src_max.refer_to(start_position, arguments, 4, 0)
         t_int := smart_eiffel.type_integer_32
         -- from index := src_min
         create local_index.make(start_position, arg_src_min, once "copy index", True)
         create initialize.make(local_index, arg_src_min)
         -- until index > src_max
         create until_expression.make(local_index, start_position, arg_src_max)
         until_expression.set_feature_stamp(t_int.lookup(create {FEATURE_NAME}.infix_name(eiffel_parser.gt_name, start_position)))
         -- loop copy(Current[index + at], src[index]); index := index + 1
         create plus.make(local_index, start_position, arg_at)
         plus.set_feature_stamp(t_int.lookup(create {FEATURE_NAME}.infix_name(eiffel_parser.plus_name, start_position)))
         create offset.make(plus, start_position, arg_src_min)
         offset.set_feature_stamp(t_int.lookup(create {FEATURE_NAME}.infix_name(eiffel_parser.minus_name, start_position)))
         create array_item.make(start_position, offset, type.generic_list.first)
         create src_item.make_array(start_position, arg_src, local_index)
         create copy_args.make_1(start_position, src_item)
         create call_copy.make(array_item, smart_eiffel.type_any.class_text.any_copy_feature.names.first, copy_args)
         call_copy.set_feature_stamp(type.generic_list.first.copy_stamp)
         create one.make(1, start_position)
         create plus.make(local_index, start_position, one)
         plus.set_feature_stamp(t_int.lookup(create {FEATURE_NAME}.infix_name(eiffel_parser.plus_name, start_position)))
         create increment.make(local_index, plus)
         create compound.make_2(call_copy, increment)
         -- end
         create {LOOP_INSTRUCTION} Result.make(start_position, initialize, Void, Void, until_expression, compound)
      end

feature {}
   collect_body (type: TYPE)
      local
         dummy: TYPE
      do
         if routine_body /= Void and then not type.is_deferred then
            if local_vars /= Void then
               local_vars.collect(type)
            end
            dummy := routine_body.collect(type)
         end
         native.collect(type, Current)
      end

feature {ANY}
   accept (visitor: EXTERNAL_PROCEDURE_VISITOR)
      do
         visitor.visit_external_procedure(Current)
      end

feature {}
   make (fa: like arguments; om: like obsolete_mark; hc: like header_comment; ra: like require_assertion
      l: like native; en: like alias_string)
      require
         l /= Void
      do
         make_routine(fa, om, hc, ra, False)
         make_external_routine(l, en)
      end

   non_written (ct: CLASS_TEXT; fn: FEATURE_NAME; fa: like arguments; l: like native)
      require
         ct /= Void
         fn /= Void
         fa /= Void
         l /= Void
      do
         feature_text := ct.non_written(fn, Current)
         make(fa, Void, Void, Void, l, Void)
      end

   try_to_undefine_aux (fn: FEATURE_NAME; bc: CLASS_TEXT): DEFERRED_ROUTINE
      do
         create {DEFERRED_PROCEDURE} Result.from_effective(fn, arguments, require_assertion, ensure_assertion, bc, permissions)
      end

end -- class EXTERNAL_PROCEDURE
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
