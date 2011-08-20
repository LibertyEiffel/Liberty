-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EFFECTIVE_ARG_LIST
   --
   -- For an effective arguments list (for a routine call).
   --

inherit
   VISITABLE
      undefine out_in_tagged_out_memory
      end

insert
   GLOBALS
      undefine out_in_tagged_out_memory
      end
   TRAVERSABLE[EXPRESSION]

creation {ANY}
   make_1, make_2, make_n

feature {EFFECTIVE_ARG_LIST}
   first_one: EXPRESSION

   remainder: FAST_ARRAY[EXPRESSION]
         -- Corresponding list of actual arguments.

feature {ANY}
   expression (i: INTEGER): EXPRESSION is
      require
         i.in_range(1, count)
      do
         if i = 1 then
            Result := first_one
         else
            Result := remainder.item(i - 2)
         end
      ensure
         Result /= Void
      end

   start_position: POSITION is
      do
         Result := first.start_position
      end

   specialize_in (type: TYPE): like Current is
      require
         type /= Void
      local
         i: INTEGER; fo: like first_one; rem: like remainder; exp1, exp2: EXPRESSION
      do
         Result := Current
         fo := first_one.specialize_in(type)
         if fo /= first_one then
            Result := twin
            Result.set_first_one(fo)
            if remainder /= Void then
               --|*** Could remainder be shared? (yes ... (dom))
               create rem.make(remainder.count)
               Result.set_remainder(rem)
               from
                  i := remainder.lower
               until
                  i > remainder.upper
               loop
                  rem.put(remainder.item(i).specialize_in(type), i)
                  i := i + 1
               end
            end
         else
            if remainder /= Void then
               from
                  i := remainder.lower
               until
                  exp1 /= exp2 or else i > remainder.upper
               loop
                  exp1 := remainder.item(i)
                  exp2 := exp1.specialize_in(type)
                  i := i + 1
               end
               if exp1 /= exp2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(exp2, i - 1)
                  until
                     i > rem.upper
                  loop
                     rem.put(remainder.item(i).specialize_in(type), i)
                     i := i + 1
                  end
               end
            end
         end
      ensure
         Result.has_been_specialized
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      require
         parent_type /= Void
         new_type /= Void
         parent_type /= new_type
         has_been_specialized
      local
         i: INTEGER; fo: like first_one; rem: like remainder; exp1, exp2: EXPRESSION
      do
         Result := Current
         fo := first_one.specialize_thru(parent_type, parent_edge, new_type)
         if fo /= first_one then
            Result := twin
            Result.set_first_one(fo)
            if remainder /= Void then
               create rem.make(remainder.count)
               Result.set_remainder(rem)
               from
                  i := remainder.lower
               until
                  i > remainder.upper
               loop
                  rem.put(remainder.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         else
            if remainder /= Void then
               from
                  i := remainder.lower
               until
                  exp1 /= exp2 or else i > remainder.upper
               loop
                  exp1 := remainder.item(i)
                  exp2 := exp1.specialize_thru(parent_type, parent_edge, new_type)
                  i := i + 1
               end
               if exp1 /= exp2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(exp2, i - 1)
                  until
                     i > rem.upper
                  loop
                     rem.put(remainder.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                     i := i + 1
                  end
               end
            end
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

   specialize_2 (t: TYPE; af: ANONYMOUS_FEATURE; target_type: TYPE; is_current: BOOLEAN): like Current is
         -- Checks the validity of argument passing (i.e. assignments) from the effective arguments list into
         -- the formal arguments list from `af'.
         --
         --|*** Change exportation to verify what's follow:
         --| (Must be called specialize_2 of call_proc_call and precursor_call and AGENT_CREATION as well).
         --|*** (Dom. feb 7th 2004)
         --|
         --|***
         --| What is `is_current' for ? Is it really for the type of
         --| the target of the call ? Strange or I am tired.
         --|*** (Dom. feb 7th 2004)
      require
         has_been_specialized
         af.arguments /= Void implies af.arguments.has_been_specialized
      local
         i: INTEGER; e1, e2: EXPRESSION; rem: like remainder; fal: FORMAL_ARG_LIST
      do
         fal := af.arguments
         if fal /= Void then
            i := fal.count
         end
         check
         -- Because `smart_eiffel.argument_count_check' has already been called.
            i = count
         end
         e2 := specialize_2_basic(t, first_one, fal.type_mark(1), target_type)
         if first_one /= e2 then
            Result := twin
            Result.set_first_one(e2)
            if remainder /= Void then
               from
                  i := remainder.lower
                  e2 := Void
               until
                  e1 /= e2 or else i > remainder.upper
               loop
                  e1 := remainder.item(i)
                  e2 := specialize_2_basic(t, e1, fal.type_mark(i + 2), target_type)
                  i := i + 1
               end
               if e1 /= e2 then
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(e2, i - 1)
                  until
                     i > rem.upper
                  loop
                     e2 := specialize_2_basic(t, remainder.item(i), fal.type_mark(i + 2), target_type)
                     rem.put(e2, i)
                     i := i + 1
                  end
               end
            end
         else
            Result := Current
            if remainder /= Void then
               from
                  i := remainder.lower
                  e2 := Void
               until
                  e1 /= e2 or else i > remainder.upper
               loop
                  e1 := remainder.item(i)
                  e2 := specialize_2_basic(t, e1, fal.type_mark(i + 2), target_type)
                  i := i + 1
               end
               if e1 /= e2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(e2, i - 1)
                  until
                     i > rem.upper
                  loop
                     e2 := specialize_2_basic(t, remainder.item(i), fal.type_mark(i + 2), target_type)
                     rem.put(e2, i)
                     i := i + 1
                  end
               end
            end
         end
      ensure
         Result.count = count
      end

   has_been_specialized: BOOLEAN is
      local
         i: INTEGER
      do
         Result := first_one /= Void implies first_one.has_been_specialized
         if Result and remainder /= Void then
            from
               i := remainder.lower
            until
               not Result or else i > remainder.upper
            loop
               Result := remainder.item(i).has_been_specialized
               i := i + 1
            end
         end
      ensure
         Result
      end

   simplify (type: TYPE): like Current is
      local
         fo: like first_one; rem: like remainder; i: INTEGER; e1, e2: EXPRESSION
      do
         fo := first_one.simplify(type)
         if remainder /= Void then
            from
               i := remainder.lower
            until
               e1 /= e2 or else i > remainder.upper
            loop
               e1 := remainder.item(i)
               e2 := e1.simplify(type)
               i := i + 1
            end
            if e1 = e2 then
               rem := remainder
            else
               from
                  rem := remainder.twin
                  rem.put(e2, i - 1)
               until
                  i > rem.upper
               loop
                  rem.put(rem.item(i).simplify(type), i)
                  i := i + 1
               end
            end
         end
         if fo = first_one and then rem = remainder then
            Result := Current
         else
            Result := twin
            Result.set_first_one(fo)
            Result.set_remainder(rem)
         end
      ensure
         (Result /= Current or Result = Void) implies (smart_eiffel.magic_count > old smart_eiffel.magic_count);
         (Result = Current) implies (smart_eiffel.magic_count = old smart_eiffel.magic_count)
      end

   static_simplify is
      local
         i: INTEGER
      do
         first_one := first_one.static_simplify
         if remainder /= Void then
            from
               i := remainder.lower
            until
               i > remainder.upper
            loop
               remainder.put(remainder.item(i).static_simplify, i)
               i := i + 1
            end
         end
      end

   side_effect_free (type: TYPE): BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := 1
         until
            not Result or else i > count
         loop
            Result := expression(i).side_effect_free(type)
            i := i + 1
         end
      end

   safety_check (type: TYPE) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > count
         loop
            expression(i).safety_check(type)
            i := i + 1
         end
      end

   compile_to_jvm (type: TYPE; fal: FORMAL_ARG_LIST): INTEGER is
      require
         count = fal.count
      local
         i, up: INTEGER
      do
         from
            i := 1
            up := count
         until
            i > up
         loop
            Result := Result + compile_to_jvm_ith(type, fal, i)
            i := i + 1
         end
      end

   compile_to_jvm_ith (type: TYPE; fal: FORMAL_ARG_LIST; index: INTEGER): INTEGER is
      require
         count = fal.count
         1 <= index
         index <= count
      local
         e: EXPRESSION; formal_type, actual_type: TYPE
      do
         e := expression(index)
         actual_type := e.resolve_in(type)
         formal_type := fal.type_mark(index).resolve_in(type)
         e.compile_to_jvm(type)
         Result := formal_type.jvm_stack_space
         jvm.kernel_expanded_convert(actual_type, formal_type)
      end

   use_current (type: TYPE): BOOLEAN is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            Result or else i > count
         loop
            Result := expression(i).use_current(type)
            i := i + 1
         end
      end

   pretty (indent_level: INTEGER) is
      local
         i: INTEGER
      do
         pretty_printer.put_character('(')
         from
            i := 1
         until
            i > count
         loop
            expression(i).pretty(indent_level)
            if i < count then
               pretty_printer.put_string(once ", ")
            end
            i := i + 1
         end
         pretty_printer.put_character(')')
      end

   short (type: TYPE) is
      local
         i: INTEGER
      do
         short_printer.hook_or(once "op_eal", once "(")
         from
            i := 1
         until
            i > count
         loop
            expression(i).short(type)
            i := i + 1
            if i <= count then
               short_printer.hook_or(once "eal_sep", once ", ")
            end
         end
         short_printer.hook_or(once "cl_eal", once ")")
      end

   is_static: BOOLEAN is
         -- Is True when only `is_static' expression are used.
      local
         i: INTEGER
      do
         from
            Result := True
            i := 1
         until
            not Result or else i > count
         loop
            Result := expression(i).is_static
            i := i + 1
         end
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   lower: INTEGER is 1

   upper: INTEGER is
      do
         Result := count
      end

   count: INTEGER is
      do
         if remainder = Void then
            Result := 1
         else
            Result := remainder.upper + 2
         end
      end

   is_empty: BOOLEAN is
      do
      end

   item (i: INTEGER): EXPRESSION is
      do
         if i = 1 then
            Result := first_one
         else
            Result := remainder.item(i - 2)
         end
      end

   first: like item is
      do
         Result := first_one
      end

   last: like item is
      do
         if remainder = Void then
            Result := first_one
         else
            Result := remainder.last
         end
      end

feature {}
   new_iterator: ITERATOR[EXPRESSION] is
      do
         check
            False -- Just use the usual pattern instead please.
         end
      end

feature {FUNCTION_CALL, PROCEDURE_CALL}
   unused_expression_inline (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         i: INTEGER; exp: EXPRESSION
      do
         from
            i := lower
         until
            i > upper
         loop
            exp := item(i)
            if not exp.side_effect_free(type) then
               code_accumulator.current_context.add_last(create {UNUSED_EXPRESSION}.make(exp))
            end
            i := i + 1
         end
      end

feature {E_PROCEDURE}
   unused_expression_in (inline_memo: INLINE_MEMO; type: TYPE) is
      local
         i: INTEGER; exp: EXPRESSION; memo: INSTRUCTION; compound: COMPOUND
      do
         from
            i := lower
         until
            i > upper
         loop
            exp := item(i)
            if not exp.side_effect_free(type) then
               memo := inline_memo.instruction
               if memo = Void then
                  inline_memo.set_instruction(create {UNUSED_EXPRESSION}.make(exp))
               elseif {COMPOUND} ?:= memo then
                  compound ::= memo
                  compound.add_last(create {UNUSED_EXPRESSION}.make(exp))
               else
                  inline_memo.set_instruction(create {COMPOUND}.make_2(memo,create {UNUSED_EXPRESSION}.make(exp)))
               end
            end
            i := i + 1
         end
      end

feature {CODE}
   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE): like Current is
      local
         fo: like first_one; rem: like remainder; i: INTEGER; exp1, exp2: EXPRESSION
      do
         first_one.inline_dynamic_dispatch_(code_accumulator, type)
         fo := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if remainder /= Void then
            from
               i := remainder.lower
            until
               i > remainder.upper or else exp1 /= exp2
            loop
               exp1 := remainder.item(i)
               exp1.inline_dynamic_dispatch_(code_accumulator, type)
               exp2 := code_accumulator.current_context.last.to_expression
               code_accumulator.current_context.remove_last
               i := i + 1
            end
            if exp1 = exp2 then
               rem := remainder
            else
               from
                  rem := remainder.twin
                  rem.put(exp2, i - 1)
               until
                  i > rem.upper
               loop
                  rem.item(i).inline_dynamic_dispatch_(code_accumulator, type)
                  rem.put(code_accumulator.current_context.last.to_expression, i)
                  code_accumulator.current_context.remove_last
                  i := i + 1
               end
            end
         end
         if fo = first_one and then rem = remainder then
            Result := Current
         else
            Result := twin
            Result.set_first_one(fo)
            Result.set_remainder(rem)
         end
      ensure
         Result.count = Current.count
      end

feature {CREATE_EXPRESSION, MANIFEST_TUPLE}
   specialize_2_on_expressions (type: TYPE): like Current is
      require
         type /= Void
         has_been_specialized
         not smart_eiffel.status.is_specializing
      local
         i: INTEGER; fo: like first_one; rem: like remainder; exp1, exp2: EXPRESSION
      do
         Result := Current
         fo := first_one.specialize_2(type)
         if fo /= first_one then
            Result := twin
            Result.set_first_one(fo)
            if remainder /= Void then
               --|*** Could remainder be shared? (yes ... (dom))
               create rem.make(remainder.count)
               Result.set_remainder(rem)
               from
                  i := remainder.lower
               until
                  i > remainder.upper
               loop
                  rem.put(remainder.item(i).specialize_2(type), i)
                  i := i + 1
               end
            end
         else
            if remainder /= Void then
               from
                  i := remainder.lower
               until
                  exp1 /= exp2 or else i > remainder.upper
               loop
                  exp1 := remainder.item(i)
                  exp2 := exp1.specialize_2(type)
                  i := i + 1
               end
               if exp1 /= exp2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(exp2, i - 1)
                  until
                     i > rem.upper
                  loop
                     rem.put(remainder.item(i).specialize_2(type), i)
                     i := i + 1
                  end
               end
            end
         end
      ensure
         has_been_specialized
         Result.has_been_specialized
      end

feature {FEATURE_CALL, PRECURSOR_CALL, AGENT_INSTRUCTION}
   adapt_for (t: TYPE): like Current is
      local
         i: INTEGER; fo: like first_one; rem: like remainder; exp1, exp2: EXPRESSION
      do
         Result := Current
         fo := first_one.adapt_for(t)
         if fo /= first_one then
            Result := twin
            Result.set_first_one(fo)
            if remainder /= Void then
               --|*** Could remainder be shared? (yes ... (dom))
               create rem.make(remainder.count)
               Result.set_remainder(rem)
               from
                  i := remainder.lower
               until
                  i > remainder.upper
               loop
                  rem.put(remainder.item(i).adapt_for(t), i)
                  i := i + 1
               end
            end
         else
            if remainder /= Void then
               from
                  i := remainder.lower
               until
                  exp1 /= exp2 or else i > remainder.upper
               loop
                  exp1 := remainder.item(i)
                  exp2 := exp1.adapt_for(t)
                  i := i + 1
               end
               if exp1 /= exp2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(exp2, i - 1)
                  until
                     i > rem.upper
                  loop
                     rem.put(remainder.item(i).adapt_for(t), i)
                     i := i + 1
                  end
               end
            end
         end
      ensure
         Result.count = count
      end

feature {FEATURE_CALL}
   --|*** Pourquoi le collect n'est il pas appele' depuis PRECURSOR ????
   -- Dom feb 7th 2004
   --|***
   collect (t: TYPE; fs: FEATURE_STAMP; feature_type: TYPE) is
         -- arguments are written in `t' and the feature stamp `fs' is used with a target of type `feature_type'.
      require
         count = fs.anonymous_feature(feature_type).arguments.count
      local
         i, j: INTEGER; sub_type, arg_type, formal_type: TYPE; first_fal: INTEGER; rts: RUN_TIME_SET
         cf: like collecting_formal; cfst: like collecting_formal_sub_type; dynamic_fs: FEATURE_STAMP
         expr: EXPRESSION; formal_live_type: LIVE_TYPE
      do
         -- List formal_arg_list for feature_type' subtypes (run_time_set)
         from
            cf := collecting_formal
            first_fal := cf.upper + 1
            cfst := collecting_formal_sub_type
            rts := feature_type.live_type.run_time_set
            i := 1
         until
            i > rts.count
         loop
            sub_type := rts.item(i).type
            dynamic_fs := fs.resolve_static_binding_for(feature_type, sub_type)
            cf.add_last(dynamic_fs.anonymous_feature(sub_type).arguments)
            cfst.add_last(sub_type)
            i := i + 1
         end
         check
            cf.upper - first_fal + 1 = feature_type.live_type.run_time_set.count
            cf.count = cfst.count
         end
         -- Collect each effective argument and apply assignment for types from formal types listed.
         from
            i := 1
         until
            i > count
         loop
            expr := expression(i)
            if not expr.is_void then
               arg_type := expr.collect(t)
               from
                  j := first_fal
               until
                  j > cf.upper
               loop
                  --|*** PH: removing duplicate FAL in cf.range(first_fal, cf.last)
                  --|will reduce resolve_in here
                  formal_type := cf.item(j).type_mark(i).resolve_in(cfst.item(j))
                  if formal_type.live_type = Void then
                     if arg_type.live_type /= Void then
                        -- It is the time to actually collect the corresponding LIVE_TYPE:
                        -- (Done in EFFECTIVE_ARG_LIST, ASSIGNMENT_ATTEMPT, ASSIGNMENT and CREATE_WRITABLE.)
                        formal_live_type := smart_eiffel.collect_one_type(formal_type, False)
                     end
                  end
                  assignment_handler.collect_force(arg_type, formal_type)
                  j := j + 1
               end
            end
            i := i + 1
         end
         cf.resize(first_fal)
         cfst.resize(first_fal)
      ensure
         collecting_formal.count = old collecting_formal.count
      end

feature {PRECURSOR_CALL}
   simple_collect (t: TYPE; fal: FORMAL_ARG_LIST) is
         -- arguments are written in `t' and the formal arguments list is `fal'.
      require
         count = fal.count
      local
         i: INTEGER; arg_type: TYPE; expr: EXPRESSION
      do
         from
            i := 1
         until
            i > count
         loop
            expr := expression(i)
            arg_type := expr.collect(t)
            assignment_handler.collect_normal(arg_type, fal.type_mark(i).resolve_in(t))
            i := i + 1
         end
      end

feature {AGENT_INSTRUCTION, AGENT_EXPRESSION}
   to_fake_tuple: FAKE_TUPLE is
      local
         tuple_expression: MANIFEST_TUPLE
      do
         tuple_expression ?= first_one
         if tuple_expression = Void then
            error_handler.add_position(first_one.start_position)
            error_handler.append("To pass arguments of agents, only the explicit manifest TUPLE notation is allowed (i.e. the %
          %square bracketed tuple notation must be used here). Actually, this is to force you to show %
          %clearly what arguments you are passing to this agent. (Note: this explicit manifest TUPLE %
          %notation will not incurs extra memory allocation. Keep cool.)")
            error_handler.print_as_fatal_error
         end
         create Result.make(tuple_expression)
         check
            remainder = Void
         end
      end

feature {EFFECTIVE_ARG_LIST, FAKE_TUPLE, CALL_1}
   put (e: EXPRESSION; i: INTEGER) is
      require
         i.in_range(1, count)
      do
         if i = 1 then
            first_one := e
         else
            remainder.put(e, i - 2)
         end
      end

feature {EFFECTIVE_ARG_LIST, FORMAL_ARG_LIST, EIFFEL_PARSER}
   add_last (e: EXPRESSION) is
         -- Usually, `e' may be a FAKE_ARGUMENT or an OPEN_OPERAND.
      require
         e /= Void
      do
         if remainder = Void then
            create remainder.with_capacity(4)
         end
         remainder.add_last(e)
      ensure
         count = 1 + old count
      end

feature {EFFECTIVE_ARG_LIST}
   set_first_one (fo: like first_one) is
      do
         first_one := fo
      end

   set_remainder (rem: like remainder) is
      do
         remainder := rem
      end

feature {ANY}
   accept (visitor: EFFECTIVE_ARG_LIST_VISITOR) is
      do
         visitor.visit_effective_arg_list(Current)
      end

feature {PROCEDURE_CALL_N}
   create_inline: like Current is
      do
         Result := twin
         if remainder /= Void then
            Result.set_remainder(remainder.twin)
         end
      ensure
         Result.count = count
      end

feature {AGENT_CREATION}
   replace_item (index: INTEGER; closed_operand: CLOSED_OPERAND) is
      require
         valid_index(index)
         closed_operand /= Void
      do
         if index = 1 then
            first_one := closed_operand
         else
            remainder.put(closed_operand, index - 2)
         end
      ensure
         item(index) = closed_operand
      end

feature {}
   collecting_formal: FAST_ARRAY[FORMAL_ARG_LIST] is
      once
         create Result.with_capacity(10)
      end

   collecting_formal_sub_type: FAST_ARRAY[TYPE] is
      once
         create Result.with_capacity(10)
      end

   specialize_2_basic (t: TYPE; exp: EXPRESSION; formal_type_mark: TYPE_MARK; target_type: TYPE): EXPRESSION is
         -- `exp' is interpreted in `t', `formal_type_mark' in `target_type'
      require
         exp.has_been_specialized
      local
         e: EXPRESSION; actual_type, formal_type: TYPE; open_operand: OPEN_OPERAND
      do
         e := exp.specialize_2(t)
         formal_type := formal_type_mark.resolve_in(target_type)
         if e.is_void then
            -- Well, this special case for Void because Void has not TYPE. We just need to check that the
            -- `formal_type' is compatible with Void:
            if formal_type.is_expanded then
               error_handler.add_position(exp.start_position)
               error_handler.add_position(formal_type_mark.start_position)
               error_handler.append("Cannot pass Void as argument (the formal type is expanded).")
               error_handler.print_as_fatal_error
            else
               Result := e
            end
         elseif {OPEN_OPERAND} ?:= e then
            -- Well, this special case because the open operand needs the FEATURE_STAMP of its corresponding FEATURE_CALL to
            -- compute its type and that this information is beeing computed. But, do not forget, it is an OPEN_OPERAND and
            -- that type checking will be made during agent launching. So we just have to do nothing:
            open_operand ::= e
            open_operand.update_resolved_memory(t, formal_type)
            Result := open_operand
         else
            actual_type := e.resolve_in(t)
            if not actual_type.can_be_assigned_to(formal_type) then
               error_handler.add_position(e.start_position)
               error_handler.add_position(formal_type_mark.start_position)
               error_handler.append("Cannot pass ")
               error_handler.add_expression(exp)
               error_handler.append(" which is of type ")
               error_handler.append(actual_type.name.to_string)
               error_handler.append(" into formal type ")
               error_handler.append(formal_type.name.to_string)
               error_handler.append(".")
               error_handler.print_as_fatal_error
            end
            Result := assignment_handler.implicit_cast(e, actual_type, formal_type)
         end
      ensure
         Result.has_been_specialized
      end

   make_1 (e: EXPRESSION) is
      require
         e /= Void
      do
         first_one := e
      ensure
         count = 1
         first = e
      end

   make_2 (e1, e2: EXPRESSION) is
      require
         e1 /= Void
         e2 /= Void
      do
         first_one := e1
         create remainder.make(1)
         remainder.put(e2, 0)
      ensure
         count = 2
         first = e1
         expression(2) = e2
      end

   make_n (fo: like first_one; r: like remainder) is
      require
         fo /= Void
      do
         first_one := fo
         remainder := r
      ensure
         first_one = fo
         remainder = r
      end

   em2: STRING is "Bad number of arguments."

invariant
   first_one /= Void

   remainder /= Void implies count = remainder.count + 1

   collecting_formal_sub_type.count = collecting_formal.count

end -- class EFFECTIVE_ARG_LIST
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
