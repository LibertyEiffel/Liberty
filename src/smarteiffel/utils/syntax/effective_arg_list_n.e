-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EFFECTIVE_ARG_LIST_N
   --
   -- For an effective arguments list (for a routine call).
   --

inherit
   EFFECTIVE_ARG_LIST

insert
   GLOBALS
      undefine out_in_tagged_out_memory
      end

create {ANY}
   make_1, make_2, make_n

feature {EFFECTIVE_ARG_LIST, EFFECTIVE_ARG_LIST_N_VISITOR}
   first_one: EXPRESSION

   remainder: FAST_ARRAY[EXPRESSION]
         -- Corresponding list of actual arguments.

feature {ANY}
   expression (i: INTEGER): EXPRESSION
      do
         if i = 1 then
            Result := first_one
         else
            Result := remainder.item(i - 2)
         end
      end

   start_position: POSITION
   end_position: POSITION

   specialize_in (type: TYPE): like Current
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
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
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
      end

   specialize_and_check (t: TYPE; af: ANONYMOUS_FEATURE; target_type: TYPE; allow_tuple: BOOLEAN): EFFECTIVE_ARG_LIST_N
         --|*** Change exportation to verify what's follow:
         --| (Must be called specialize_and_check of call_proc_call and precursor_call and AGENT_CREATION as well).
         --|*** (Dom. feb 7th 2004)
      local
         i, fal_count, rem_upper: INTEGER; e1, e2: EXPRESSION; rem: like remainder; fal: FORMAL_ARG_LIST; formal_type: TYPE
      do
         fal := af.arguments
         if fal /= Void then
            fal_count := fal.count
         end
         if remainder /= Void then
            rem_upper := (fal_count - 2).min(remainder.upper)
         end
         e2 := specialize_and_check_basic(t, first_one, fal.type_mark(1), target_type, allow_tuple and then fal_count = 1, fal)
         if first_one /= e2 then
            Result := twin
            Result.set_first_one(e2)
            if remainder /= Void then
               from
                  i := remainder.lower
                  e2 := Void
               until
                  e1 /= e2 or else i > rem_upper
               loop
                  e1 := remainder.item(i)
                  e2 := specialize_and_check_basic(t, e1, fal.type_mark(i + 2), target_type, allow_tuple and then i + 2 = fal_count, fal)
                  i := i + 1
               end
               if e1 /= e2 then
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(e2, i - 1)
                  until
                     i > rem_upper
                  loop
                     e2 := Result.specialize_and_check_basic(t, remainder.item(i), fal.type_mark(i + 2), target_type, allow_tuple and then i + 2 = fal_count, fal)
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
                  e1 /= e2 or else i > rem_upper
               loop
                  e1 := remainder.item(i)
                  e2 := specialize_and_check_basic(t, e1, fal.type_mark(i + 2), target_type, allow_tuple and then i + 2 = fal_count, fal)
                  i := i + 1
               end
               if e1 /= e2 then
                  Result := twin
                  rem := remainder.twin
                  Result.set_remainder(rem)
                  from
                     rem.put(e2, i - 1)
                  until
                     i > rem_upper
                  loop
                     e2 := Result.specialize_and_check_basic(t, remainder.item(i), fal.type_mark(i + 2), target_type, allow_tuple and then i + 2 = fal_count, fal)
                     rem.put(e2, i)
                     i := i + 1
                  end
               end
            end
         end
         if fal_count = count + 1 then
            formal_type := fal.type_mark(fal_count).resolve_in(target_type)
            if formal_type.is_tuple then
               inspect
                  fal_count
               when 1 then
                  check
                     impossible: False -- managed by EFFECTIVE_ARG_LIST_0
                  end
                  error_handler.add_position(start_position)
                  error_handler.append(once "BUG: trying to synthetize empty tuple for a function without arguments but with arguments... WTF")
                  error_handler.print_as_internal_error
               when 2 then
                  check remainder = Void end
                  create rem.with_capacity(1)
                  if Result = Current then
                     Result := twin
                  end
                  Result.set_remainder(rem)
               else
                  if Result = Current then
                     Result := twin
                     rem := remainder.twin
                     Result.set_remainder(rem)
                  else
                     rem := remainder
                  end
               end
               rem.add_last(synthetize_tuple(target_type, t, fal))
            end
         end
         Result.specialize_check_count(t, target_type, fal)
      end

   has_been_specialized: BOOLEAN
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
      end

   simplify (type: TYPE): like Current
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
      end

   static_simplify
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

   side_effect_free (type: TYPE): BOOLEAN
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

   safety_check (type: TYPE)
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

   use_current (type: TYPE): BOOLEAN
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

   pretty (indent_level: INTEGER)
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

   short (type: TYPE)
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

   is_static: BOOLEAN
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

feature {EIFFEL_PARSER, EFFECTIVE_ARG_LIST}
   set_end_position (p: POSITION) assign end_position
      do
         end_position := p
      end

feature {ANY} -- Implementation of TRAVERSABLE:
   count: INTEGER
      do
         if remainder = Void then
            Result := 1
         else
            Result := remainder.upper + 2
         end
      end

   is_empty: BOOLEAN False

   item (i: INTEGER): EXPRESSION
      do
         if i = 1 then
            Result := first_one
         else
            Result := remainder.item(i - 2)
         end
      end

   first: like item
      do
         Result := first_one
      end

   last: like item
      do
         if remainder = Void then
            Result := first_one
         else
            Result := remainder.last
         end
      end

feature {CODE}
   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE): like Current
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
      end

feature {CREATE_EXPRESSION, MANIFEST_TUPLE}
   specialize_and_check_on_expressions (type: TYPE): like Current
      local
         i: INTEGER; fo: like first_one; rem: like remainder; exp1, exp2: EXPRESSION
      do
         Result := Current
         fo := first_one.specialize_and_check(type)
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
                  rem.put(remainder.item(i).specialize_and_check(type), i)
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
                  exp2 := exp1.specialize_and_check(type)
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
                     rem.put(remainder.item(i).specialize_and_check(type), i)
                     i := i + 1
                  end
               end
            end
         end
      end

feature {FEATURE_CALL, PRECURSOR_CALL, AGENT_INSTRUCTION}
   adapt_for (t: TYPE): like Current
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
         elseif remainder /= Void then
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

feature {FEATURE_CALL}
   collect (t: TYPE; fs: FEATURE_STAMP; feature_type: TYPE)
         -- arguments are written in `t' and the feature stamp `fs' is used with a target of type `feature_type'.
      local
         i, j: INTEGER; sub_type, arg_type, formal_type: TYPE; first_fal: INTEGER; rts: RUN_TIME_SET
         cf: like collecting_formal; cfst: like collecting_formal_sub_type; dynamic_fs: FEATURE_STAMP
         expr: EXPRESSION; formal_live_type: LIVE_TYPE; fal: FORMAL_ARG_LIST
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
                  sub_type := cfst.item(j)
                  fal := cf.item(j)
                  if fal /= Void then
                     formal_type := fal.type_mark(i).resolve_in(sub_type)
                     if formal_type.live_type = Void then
                        if arg_type.live_type /= Void then
                           -- It is the time to actually collect the corresponding LIVE_TYPE:
                           -- (Done in EFFECTIVE_ARG_LIST_N, ASSIGNMENT_ATTEMPT, ASSIGNMENT and CREATE_WRITABLE.)
                           formal_live_type := smart_eiffel.collect_one_type(formal_type, False)
                        end
                     end
                     assignment_handler.collect_force(arg_type, formal_type)
                  else
                     debug ("savannah#43631")
                        error_handler.append(once "{")
                        error_handler.append(sub_type.canonical_type_mark.written_mark)
                        error_handler.append(once "}.")
                        error_handler.append(fs.resolve_static_binding_for(feature_type, sub_type).anonymous_feature(sub_type).names.first.to_string)
                        error_handler.append(once " does not have arguments, but {")
                        error_handler.append(t.canonical_type_mark.written_mark)
                        error_handler.append(once "} does!")
                        error_handler.print_as_warning
                     end
                  end
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

feature {AGENT_INSTRUCTION, AGENT_EXPRESSION}
   to_fake_tuple (type: TYPE): FAKE_TUPLE
      local
         tuple_expression: MANIFEST_TUPLE; tuple_type: TYPE; tuple_type_mark: TUPLE_TYPE_MARK
         eal: EFFECTIVE_ARG_LIST_N; r: like remainder; fc0_1, fc0_2: FUNCTION_CALL_0
         i: INTEGER; feature_name: STRING
      do
         if tuple_expression ?:= first_one then
            tuple_expression ::= first_one
         else
            -- generate the fake tuple using calls to item_1, item_2...
            tuple_type := first_one.resolve_in(type)
            if tuple_type.is_tuple then
               tuple_type_mark ::= tuple_type.canonical_type_mark
               inspect
                  tuple_type_mark.count
               when 0 then
                  check
                     eal = Void
                  end
               when 1 then
                  create fc0_1.make(first_one, create {FEATURE_NAME}.simple_feature_name(once "item_1", first_one.start_position))
                  create eal.make_1(start_position, fc0_1.specialize_in(type))
               when 2 then
                  create fc0_1.make(first_one, create {FEATURE_NAME}.simple_feature_name(once "item_1", first_one.start_position))
                  create fc0_2.make(first_one, create {FEATURE_NAME}.simple_feature_name(once "item_2", first_one.start_position))
                  create eal.make_2(start_position, fc0_1.specialize_in(type), fc0_2.specialize_in(type))
               else
                  create fc0_1.make(first_one, create {FEATURE_NAME}.simple_feature_name(once "item_1", first_one.start_position))
                  create r.with_capacity(tuple_type_mark.count - 1)
                  from
                     i := 2
                  until
                     i > tuple_type_mark.count
                  loop
                     feature_name := once "item_xx"
                     feature_name.copy(once "item_")
                     i.append_in(feature_name)
                     create fc0_2.make(first_one, create {FEATURE_NAME}.simple_feature_name(feature_name, first_one.start_position))
                     r.add_last(fc0_2.specialize_in(type))
                     i := i + 1
                  end
                  create eal.make_n(start_position, fc0_1.specialize_in(type), r)
               end
               create tuple_expression.make(first_one.start_position, eal)
               tuple_expression := tuple_expression
            else
               error_handler.add_position(first_one.start_position)
               error_handler.append(once "Agent calls need a tuple!")
               error_handler.print_as_fatal_error
            end
         end
         create Result.make(tuple_expression)
         Result := Result.specialize_and_check(type)
      end

feature {EFFECTIVE_ARG_LIST, FAKE_TUPLE, CALL_1}
   put (e: EXPRESSION; i: INTEGER)
      do
         if i = 1 then
            first_one := e
         else
            remainder.put(e, i - 2)
         end
      end

feature {EFFECTIVE_ARG_LIST}
   set_first_one (fo: like first_one)
      do
         first_one := fo
      end

   set_remainder (rem: like remainder)
      do
         remainder := rem
      end

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: EFFECTIVE_ARG_LIST_N_VISITOR
      do
         v ::= visitor
         v.visit_effective_arg_list_n(Current)
      end

feature {PROCEDURE_CALL_N}
   create_inline: like Current
      do
         Result := twin
         if remainder /= Void then
            Result.set_remainder(remainder.twin)
         end
      end

feature {EFFECTIVE_ARG_LIST}
   specialize_and_check_basic (t: TYPE; exp: EXPRESSION; formal_type_mark: TYPE_MARK; target_type: TYPE; is_last: BOOLEAN; fal: FORMAL_ARG_LIST): EXPRESSION
         -- `exp' is interpreted in `t', `formal_type_mark' in `target_type'
         -- `is_last` and `fal` are used for implicit tuple as last argument, if need be
      require
         exp.has_been_specialized
      local
         e: EXPRESSION; actual_type, formal_type: TYPE; open_operand: OPEN_OPERAND
      do
         e := exp.specialize_and_check(t)
         formal_type := formal_type_mark.resolve_in(target_type)
         if e.is_void then
            -- Well, this special case for Void because Void has not TYPE. We just need to check that the
            -- `formal_type' is compatible with Void:
            if formal_type.is_expanded then
               error_handler.add_position(exp.start_position)
               error_handler.add_position(formal_type_mark.start_position)
               error_handler.append(once "Cannot pass Void as argument (the formal type is expanded).")
               error_handler.print_as_fatal_error
            else
               Result := e
            end
         elseif {OPEN_OPERAND} ?:= e then
            -- Well, this special case because the open operand needs the FEATURE_STAMP of its corresponding FEATURE_CALL to
            -- compute its type and that this information is being computed. But, do not forget, it is an OPEN_OPERAND and
            -- that type checking will be made during agent launching. So we just have to do nothing:
            open_operand ::= e
            open_operand.update_resolved_memory(t, formal_type)
            Result := open_operand
         else
            actual_type := e.resolve_in(t)
            if is_last and then formal_type.is_tuple and then not actual_type.is_tuple then
               e := synthetize_tuple(target_type, t, fal)
               actual_type := e.resolve_in(t)
            end
            if not actual_type.can_be_assigned_to(formal_type) then
               error_handler.add_position(e.start_position)
               error_handler.add_position(formal_type_mark.start_position)
               error_handler.append(once "Cannot pass ")
               error_handler.add_expression(exp)
               error_handler.append(once " which is of type ")
               error_handler.append(actual_type.name.to_string)
               error_handler.append(once " into formal type ")
               error_handler.append(formal_type.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            end
            Result := assignment_handler.implicit_cast(e, actual_type, formal_type)
         end
      ensure
         Result.has_been_specialized
      end

   specialize_check_count (t, target_type: TYPE; fal: FORMAL_ARG_LIST)
      local
         fal_count: INTEGER
      do
         if fal /= Void then
            fal_count := fal.count
         end
         if count /= fal_count then
            if synthetic_tuple then
               if fal_count = 1 then
                  remainder := Void --| **** lost memory
               else
                  remainder.remove_tail(count - fal_count)
               end
            else
               error_handler.append(once "The feature called has ")
               error_handler.append_integer(fal_count)
               error_handler.append(once " formal argument")
               if fal_count > 1 then
                  error_handler.extend('s')
               end
               error_handler.append(once " while the actual argument list has ")
               error_handler.append_integer(count)
               error_handler.append(once " argument")
               if count > 1 then
                  error_handler.extend('s')
               end
               error_handler.append(once ".")
               error_handler.add_position(fal.start_position)
               error_handler.add_position(start_position)
               error_handler.print_as_fatal_error
            end
         end
      ensure
         fal /= Void implies count = fal.count
         fal = Void implies count = 0
      end

feature {}
   collecting_formal: FAST_ARRAY[FORMAL_ARG_LIST]
      once
         create Result.with_capacity(10)
      end

   collecting_formal_sub_type: FAST_ARRAY[TYPE]
      once
         create Result.with_capacity(10)
      end

   make_1 (sp: POSITION; e: EXPRESSION)
      require
         not sp.is_unknown
         e /= Void
      do
         start_position := sp
         first_one := e
      ensure
         count = 1
         first = e
      end

   make_2 (sp: POSITION; e1, e2: EXPRESSION)
      require
         not sp.is_unknown
         e1 /= Void
         e2 /= Void
      do
         start_position := sp
         first_one := e1
         create remainder.make(1)
         remainder.put(e2, 0)
      ensure
         count = 2
         first = e1
         expression(2) = e2
      end

   make_n (sp: POSITION; fo: like first_one; r: like remainder)
      require
         not sp.is_unknown
         fo /= Void
      do
         start_position := sp
         first_one := fo
         remainder := r
      ensure
         first_one = fo
         remainder = r
      end

   em2: STRING "Bad number of arguments."

invariant
   first_one /= Void

   remainder /= Void implies count = remainder.count + 1

   collecting_formal_sub_type.count = collecting_formal.count

end -- class EFFECTIVE_ARG_LIST_N
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
