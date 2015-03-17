-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_SEMANTICS_BUILDER

insert
   LIBERTY_BUILDER_TOOLS
   LIBERTY_ARRAY_MANIFEST_CONSTANTS

feature {ANY}
   instruction (inst: LIBERTY_AST_INSTRUCTION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSTRUCTION
      require
         inst /= Void
         local_context /= Void
      local
         assignment_or_call: LIBERTY_AST_ASSIGNMENT_OR_CALL
      do
         inspect
            inst.instruction.name
         when "Assignment_Or_Call" then
            assignment_or_call ::= inst.instruction
            if assignment_or_call.is_assignment then
               Result := instruction_assignment(assignment_or_call, local_context)
            else
               Result := instruction_call(assignment_or_call, local_context)
            end
         when "If_Then_Else" then
            Result := instruction_ifthenelse(inst.instruction, local_context)
         when "Inspect" then
            Result := instruction_inspect(inst.instruction, local_context)
         when "Loop" then
            Result := instruction_loop(inst.instruction, local_context)
         when "Check" then
            Result := instruction_check(inst.instruction, local_context)
         when "Debug" then
            Result := instruction_debug(inst.instruction, local_context)
         when "Creation", "Old_Creation" then
            Result := instruction_creation(inst.instruction, local_context)
         when "Retry" then
            Result := instruction_retry(inst.instruction, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression (exp: LIBERTY_AST_EXPRESSION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_array then
            Result := expression_array(exp.array, local_context)
         else
            Result := expression_no_array(exp.no_array, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

feature {} -- Instructions
   empty_instruction: LIBERTY_EMPTY
      once
         create Result.make
      end

   compound (insts: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSTRUCTION
      require
         insts /= Void
         local_context /= Void
      local
         i, n: INTEGER; inst: LIBERTY_AST_INSTRUCTION
         instructions: COLLECTION[LIBERTY_INSTRUCTION]
         pos: LIBERTY_POSITION
      do
         n := insts.count
         inspect
            n
         when 0 then
            Result := empty_instruction
         when 1 then
            inst ::= insts.first
            Result := instruction(inst, local_context)
         else
            create {FAST_ARRAY[LIBERTY_INSTRUCTION]} instructions.with_capacity(n)
            from
               i := insts.lower
            until
               i > insts.upper
            loop
               inst ::= insts.item(i)
               instructions.add_last(instruction(inst, local_context))
               i := i + 1
            end
            pos := instructions.first.position
            create {LIBERTY_COMPOUND} Result.make(instructions, pos)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   instruction_assignment (a_assignment: LIBERTY_AST_ASSIGNMENT_OR_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_ASSIGNMENT
      require
         a_assignment.is_assignment
      local
         w: LIBERTY_WRITABLE
         exp: LIBERTY_EXPRESSION
      do
         w := writable(a_assignment.writable, local_context)
         exp := expression(a_assignment.expression, local_context)
         if a_assignment.is_regular_assignment then
            create {LIBERTY_ASSIGNMENT_REGULAR} Result.make(w, exp, w.position)
         elseif a_assignment.is_forced_assignment then
            create {LIBERTY_ASSIGNMENT_FORCED} Result.make(w, exp, w.position)
         elseif a_assignment.is_assignment_attempt then
            create {LIBERTY_ASSIGNMENT_ATTEMPT} Result.make(w, exp, w.position)
         else
            check False end
         end
      end

   instruction_call (a_call: LIBERTY_AST_ASSIGNMENT_OR_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSTRUCTION
      require
         a_call.is_call
      local
         tgt: LIBERTY_EXPRESSION
         fe: LIBERTY_FEATURE_ENTITY
         fa: COLLECTION[LIBERTY_EXPRESSION]
         r10: LIBERTY_AST_R10
      do
         r10 := a_call.r10
         if r10.is_empty then
            Result := implicit_feature_call_instruction(a_call.target, local_context)
         else
            from
               tgt := target_or_implicit_feature_call_expression(a_call.target, local_context)
            until
               errors.has_error or else Result /= Void
            loop
               fe ::= entity(tgt.result_type, r10.feature_name.image.image.intern, errors.semantics_position(r10.feature_name.image.index, ast, file), Void)
               fa := actuals(r10.actuals, local_context)
               r10 := r10.remainder
               if r10.is_empty then
                  Result := create_instruction_call(tgt, fe, fa, tgt.position, local_context)
               else
                  tgt := create_expression_call(tgt, fe, fa, tgt.position, local_context)
               end
            end
         end
         check
            errors.has_error or else r10.is_empty
         end
      end

   instruction_ifthenelse (a_cond: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CONDITIONAL
      require
         a_cond /= Void
         {LIBERTY_AST_IF_THEN_ELSE} ?:= a_cond
      local
         ifthenelse: LIBERTY_AST_IF_THEN_ELSE
         ifthen: LIBERTY_AST_IF
         conditional: LIBERTY_CONDITIONAL
         i: INTEGER
      do
         ifthenelse ::= a_cond
         create conditional.make(semantics_position_at(ifthenelse.then_clause.node_at(0)))
         conditional.add_condition(condition(ifthenelse.then_clause, local_context))
         from
            i := ifthenelse.elseif_list.lower
         until
            i > ifthenelse.elseif_list.upper
         loop
            ifthen ::= ifthenelse.elseif_list.item(i)
            conditional.add_condition(condition(ifthen, local_context))
            i := i + 1
         end
         conditional.set_else_clause(else_clause(ifthenelse.else_clause, local_context))
         Result := conditional
      end

   condition (a_if: LIBERTY_AST_IF; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CONDITION
      do
         create Result.make(expression(a_if.expression, local_context), compound(a_if.instructions, local_context),
                            semantics_position_at(a_if.node_at(0)))
      end

   else_clause (a_else: LIBERTY_AST_ELSE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_DEFAULT
      do
         if not a_else.is_empty then
            create Result.make(compound(a_else.list, local_context),
                               semantics_position_at(a_else.node_at(0)))
         end
      end

   instruction_inspect (a_inspect: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSPECT
      require
         a_inspect /= Void
         {LIBERTY_AST_INSPECT} ?:= a_inspect
      local
         inspct: LIBERTY_AST_INSPECT
         insp: LIBERTY_INSPECT
         i: INTEGER
      do
         inspct ::= a_inspect
         create insp.make(expression(inspct.expression, local_context), semantics_position_at(inspct.node_at(0)))
         from
            i := inspct.when_list.lower
         until
            i > inspct.when_list.upper
         loop
            insp.add_clause(inspect_clause(inspct.when_list.item(i), local_context))
            i := i + 1
         end
         insp.set_else_clause(else_clause(inspct.else_clause, local_context))
         Result := insp
      end

   inspect_clause (a_clause: EIFFEL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSPECT_CLAUSE
      require
         {LIBERTY_AST_WHEN} ?:= a_clause
      local
         when_clause: LIBERTY_AST_WHEN
         when_slice: LIBERTY_AST_WHEN_SLICE
         i: INTEGER
         low, up: LIBERTY_EXPRESSION
      do
         when_clause ::= a_clause
         create Result.make(compound(when_clause.instructions, local_context), semantics_position_at(when_clause.node_at(0)))
         from
            i := when_clause.when_slices.lower
         until
            i > when_clause.when_slices.upper
         loop
            when_slice ::= when_clause.when_slices.item(i)
            low := when_value(when_slice.low_value, local_context)
            if when_slice.has_up_value then
               up := when_value(when_slice.up_value, local_context)
            else
               up := Void
            end
            Result.add_value(create {LIBERTY_INSPECT_SLICE}.make(low, up, low.position))
            i := i + 1
         end
      end

   when_value (value: LIBERTY_AST_WHEN_VALUE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         e: LIBERTY_FEATURE_ENTITY; entity_name: LIBERTY_AST_ENTITY_NAME; name: FIXED_STRING
      do
         if value.is_number then
            Result := number(value.number.image)
         elseif value.is_character then
            Result := character(value.character.image)
         elseif value.is_string then
            create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, native_array_of_character, decoded_string(value.string), True, semantics_position_at(value.node_at(0)))
         elseif value.is_entity_name then
            entity_name := value.entity_name
            name := entity_name.image.image.intern
            -- may be a local or a parameter of a regular feature name
            if local_context.is_local(name) then
               create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.local_var(name), errors.semantics_position(entity_name.image.index, ast, file))
            elseif local_context.is_parameter(name) then
               create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.parameter(name), errors.semantics_position(entity_name.image.index, ast, file))
            else
               e := feature_entity(type, create {LIBERTY_FEATURE_NAME}.make_regular(name, errors.semantics_position(entity_name.image.index, ast, file)))
               Result := create_implicit_expression_call(e, empty_actuals, errors.semantics_position(entity_name.image.index, ast, file))
            end
         else
            check False end
         end
      ensure
         Result /= Void
      end

   instruction_loop (a_loop: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_LOOP
      require
         a_loop /= Void
         {LIBERTY_AST_LOOP} ?:= a_loop
      local
         l00p: LIBERTY_AST_LOOP
         init, body: like compound
         exp, var: LIBERTY_EXPRESSION
         variant_clause: LIBERTY_VARIANT
         invariant_clause: LIBERTY_INVARIANT
      do
         l00p ::= a_loop
         init := compound(l00p.from_clause.instructions, local_context)
         invariant_clause := loop_invariant(l00p.invariant_clause, local_context)
         if l00p.variant_clause.has_expression then
            var := expression(l00p.variant_clause.expression, local_context)
            create variant_clause.make(var)
         end
         exp := expression(l00p.expression, local_context)
         body := compound(l00p.instructions, local_context)
         create Result.make(init, invariant_clause, variant_clause, exp, body, init.position)
      end

   loop_invariant (invariant_clause: LIBERTY_AST_INVARIANT; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INVARIANT
      require
         invariant_clause /= Void
         local_context /= Void
      local
         assertions: COLLECTION[LIBERTY_ASSERTION]
      do
         assertions := feature_assertions(invariant_clause, local_context)
         if not errors.has_error then
            create Result.make(assertions)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   instruction_check (a_check: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CHECK_INSTRUCTION
      require
         a_check /= Void
         {LIBERTY_AST_CHECK} ?:= a_check
      local
         chk: LIBERTY_AST_CHECK; ck: LIBERTY_CHECK
      do
         chk ::= a_check
         create ck.make(feature_assertions(chk, local_context))
         create Result.make(ck, semantics_position_at(chk.node_at(0)))
      end

   instruction_debug (a_debug: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_DEBUG
      require
         a_debug /= Void
         {LIBERTY_AST_DEBUG} ?:= a_debug
      local
         dbg: LIBERTY_AST_DEBUG
         keys: COLLECTION[FIXED_STRING]; inst: like compound
         i: INTEGER
      do
         dbg ::= a_debug
         if dbg.debug_keys.list_count = 0 then
            keys := empty_debug_keys
         else
            create {FAST_ARRAY[FIXED_STRING]} keys.with_capacity(dbg.debug_keys.list_count)
            from
               i := dbg.debug_keys.list_lower
            until
               i > dbg.debug_keys.list_upper
            loop
               keys.add_last(decoded_string(dbg.debug_keys.list_item(i)).intern)
               i := i + 1
            end
         end
         inst := compound(dbg.instructions, local_context)
         create Result.make(keys, inst, semantics_position_at(dbg.node_at(0)))
      ensure
         Result /= Void
      end

   empty_debug_keys: COLLECTION[FIXED_STRING]
      once
         create {FAST_ARRAY[FIXED_STRING]} Result.with_capacity(0)
      end

   instruction_creation (a_creation: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CREATION_INSTRUCTION
      require
         a_creation /= Void
         {LIBERTY_AST_CREATION} ?:= a_creation
      local
         creat: LIBERTY_AST_CREATION
         w: LIBERTY_WRITABLE
         creation_type: LIBERTY_TYPE
         fe: LIBERTY_FEATURE_ENTITY
         fa: COLLECTION[LIBERTY_EXPRESSION]
      do
         creat ::= a_creation
         w := writable(creat.writable, local_context)
         if creat.has_type_definition then
            creation_type := type_lookup.resolver.type(creat.type_definition)
         else
            creation_type := w.result_type
         end
         if creat.has_creation_feature_call then
            fe := feature_entity(creation_type, create {LIBERTY_FEATURE_NAME}.make_regular(creat.creation_feature_name.image.image.intern, errors.semantics_position(creat.creation_feature_name.image.index, ast, file)))
            fa := actuals(creat.creation_feature_actuals, local_context)
         else
            fe := feature_entity(creation_type, default_create_name)
            fa := empty_actuals
         end
         create Result.make(w, creation_type, fe, fa, semantics_position_at(creat.node_at(0)))
      end

   default_create_name: LIBERTY_FEATURE_NAME
      once
         create Result.make_regular("default_create".intern, errors.unknown_position)
      end

   instruction_retry (a_retry: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_RETRY
      require
         a_retry /= Void
         {LIBERTY_AST_RETRY} ?:= a_retry
      local
         re: LIBERTY_AST_RETRY
      do
         re ::= a_retry
         Result := local_context.retry_instruction(semantics_position_at(re.node_at(0)))
      end

feature {} -- Entities and writables
   writable (a_writable: LIBERTY_AST_WRITABLE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_WRITABLE
      local
         name: FIXED_STRING
      do
         if a_writable.is_result then
            Result := local_context.result_entity
         else
            name := a_writable.entity_name.image.image.intern
            if local_context.is_local(name) then
               Result := local_context.local_var(name)
            elseif local_context.is_parameter(name) then
               --|*** TODO: error! (not writable)
               not_yet_implemented
            else
               Result := feature_writable(name, errors.semantics_position(a_writable.entity_name.image.index, ast, file))
            end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   entity (target_type: LIBERTY_TYPE; a_entity_name: FIXED_STRING; a_position: LIBERTY_POSITION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_ENTITY
      require
         a_entity_name /= Void
         (target_type = Void) /= (local_context = Void)
      do
         if local_context = Void then
            Result := feature_entity(target_type, create {LIBERTY_FEATURE_NAME}.make_regular(a_entity_name, a_position))
         else
            if a_entity_name.is_equal(once "Current") then
               Result := current_entity
            elseif a_entity_name.is_equal(once "Result") then
               Result := local_context.result_entity
            elseif local_context.is_local(a_entity_name) then
               Result := local_context.local_var(a_entity_name)
            elseif local_context.is_parameter(a_entity_name) then
               Result := local_context.parameter(a_entity_name)
            else
               Result := feature_entity(type, create {LIBERTY_FEATURE_NAME}.make_regular(a_entity_name, a_position))
            end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   implicit_feature_call_instruction (a_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INSTRUCTION
      local
         e: LIBERTY_FEATURE_ENTITY; entity_name: LIBERTY_AST_ENTITY_NAME; name: FIXED_STRING
         definition_context: LIBERTY_FEATURE_DEFINITION_CONTEXT
      do
         if a_target.is_current then
            --| TODO: error
            not_yet_implemented
         elseif a_target.is_result then
            --| TODO: error
            not_yet_implemented
         elseif a_target.is_implicit_feature_call then
            entity_name := a_target.implicit_feature_name
            name := entity_name.image.image.intern
            -- may be a local or a parameter of a regular feature name
            if local_context.is_local(name) then
               --| TODO: error
               not_yet_implemented
            elseif local_context.is_parameter(name) then
               --| TODO: error
               not_yet_implemented
            else
               e := feature_entity(type, create {LIBERTY_FEATURE_NAME}.make_regular(name, errors.semantics_position(entity_name.image.index, ast, file)))
               Result := create_implicit_instruction_call(e, actuals(a_target.actuals, local_context), errors.semantics_position(entity_name.image.index, ast, file))
            end
         elseif a_target.is_precursor then
            definition_context ::= local_context
            Result := instruction_call_on_precursor(a_target, definition_context)
         elseif a_target.is_parenthesized_expression then
            --| TODO: error
            not_yet_implemented
         else
            check False end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   instruction_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT): LIBERTY_PRECURSOR_INSTRUCTION
      require
         a_precursor_target.is_precursor
      deferred
      end

   target_or_implicit_feature_call_expression (a_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         e: LIBERTY_FEATURE_ENTITY; entity_name: LIBERTY_AST_ENTITY_NAME; name: FIXED_STRING
         definition_context: LIBERTY_FEATURE_DEFINITION_CONTEXT
      do
         if a_target.is_current then
            create {LIBERTY_ENTITY_EXPRESSION} Result.make(current_entity, semantics_position_at(a_target.node_at(0)))
         elseif a_target.is_result then
            create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.result_entity, semantics_position_at(a_target.node_at(0)))
         elseif a_target.is_manifest_or_type_test then
            Result := typed_manifest_or_type_test(a_target.manifest_or_type_test, local_context)
         elseif a_target.is_implicit_feature_call then
            entity_name := a_target.implicit_feature_name
            name := entity_name.image.image.intern
            -- may be a local or a parameter of a regular feature name
            if local_context.is_local(name) then
               create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.local_var(name), errors.semantics_position(entity_name.image.index, ast, file))
               --| TODO: check no actuals
            elseif local_context.is_parameter(name) then
               create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.parameter(name), errors.semantics_position(entity_name.image.index, ast, file))
               --| TODO: check no actuals
            else
               e := feature_entity(type, create {LIBERTY_FEATURE_NAME}.make_regular(name, errors.semantics_position(entity_name.image.index, ast, file)))
               Result := create_implicit_expression_call(e, actuals(a_target.actuals, local_context), errors.semantics_position(entity_name.image.index, ast, file))
            end
         elseif a_target.is_precursor then
            definition_context ::= local_context
            Result := expression_call_on_precursor(a_target, definition_context)
         elseif a_target.is_parenthesized_expression then
            Result := expression(a_target.parenthesized_expression, local_context)
         else
            check False end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT): LIBERTY_PRECURSOR_EXPRESSION
      require
         a_precursor_target.is_precursor
      deferred
      end

   feature_writable (name: FIXED_STRING; position: LIBERTY_POSITION): LIBERTY_WRITABLE_FEATURE
      require
         name = name.intern
      do
         Result := feature_writables.reference_at(name)
         if Result = Void then
            create {LIBERTY_WRITABLE_FEATURE} Result.make(feature_entity(type, create {LIBERTY_FEATURE_NAME}.make_regular(name, position)), position)
            feature_writables.put(Result, name)
            torch.burn
         end
      ensure
         Result.name = name
      end

   feature_entity (target_type: LIBERTY_TYPE; name: LIBERTY_FEATURE_NAME): LIBERTY_FEATURE_ENTITY
      require
         name /= Void
      do
         create {LIBERTY_FEATURE_ENTITY} Result.make(name, target_type)
      ensure
         Result.feature_name.is_equal(name)
      end

   current_entity: LIBERTY_CURRENT
      deferred
      ensure
         Result /= Void
      end

   feature_writables: DICTIONARY[LIBERTY_WRITABLE_FEATURE, FIXED_STRING]

feature {} -- Expressions
   actuals (a_actuals: LIBERTY_AST_ACTUALS; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): COLLECTION[LIBERTY_EXPRESSION]
      local
         i: INTEGER
         act: LIBERTY_AST_ACTUAL
      do
         if a_actuals.list_count= 0 then
            Result := empty_actuals
         else
            create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.with_capacity(a_actuals.list_count)
            from
               i := a_actuals.list_lower
            until
               i > a_actuals.list_upper
            loop
               act := a_actuals.list_item(i)
               if act.is_expression then
                  Result.add_last(expression(act.expression, local_context))
               else
                  check act.is_ref_to_entity end
                  Result.add_last(create {LIBERTY_ENTITY_REFERENCE}.make(universe.type_pointer,
                                                                         entity(Void, act.ref_entity_name.image.image.intern, errors.semantics_position(act.ref_entity_name.image.index, ast, file), local_context),
                                                                         semantics_position_at(act.node_at(0))))
               end
               i := i + 1
            end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   empty_actuals: COLLECTION[LIBERTY_EXPRESSION]
      once
         create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.make(0)
      end

   expression_array (array: LIBERTY_AST_ARRAY; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_ARRAY_MANIFEST
      require
         array /= Void
         local_context /= Void
      local
         i: INTEGER; content: COLLECTION[LIBERTY_EXPRESSION]; separators: COLLECTION[LIBERTY_ARRAY_MANIFEST_SEPARATOR]
         exp: LIBERTY_AST_EXPRESSION; t: LIBERTY_TYPE
         expr: LIBERTY_EXPRESSION
      do
         create {FAST_ARRAY[LIBERTY_EXPRESSION]} content.with_capacity(array.content.count)
         create {FAST_ARRAY[LIBERTY_ARRAY_MANIFEST_SEPARATOR]} separators.with_capacity(array.content.count)
         from
            i := array.content.lower
         invariant
            content.count = separators.count
         variant
            array.content.count - content.count
         until
            i > array.content.upper or else errors.has_error
         loop
            exp ::= array.content.item(i)
            expr := expression(exp, local_context)
            if not errors.has_error then
               content.add_last(expr)
               separators.add_last(expression_separator(exp))
            end
            i := i + 1
         end
         if not errors.has_error then
            t := common_conformant_type(content)
            create Result.make_array(t, content, separators, semantics_position_at(array.node_at(0)))
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   common_conformant_type (a_contents: COLLECTION[LIBERTY_EXPRESSION]): LIBERTY_TYPE
      local
         i: INTEGER
      do
         if a_contents.is_empty then
            Result := universe.type_any
         else
            from
               Result := a_contents.first.result_type
               i := a_contents.lower + 1
            until
               i > a_contents.upper
            loop
               Result := a_contents.item(i).result_type.known_type.common_conformant_parent_with(Result.known_type)
               if Result = Void then
                  --| *** TODO fatal error
                  not_yet_implemented
               end
               i := i + 1
            end
         end
      ensure
         no_common_parent_is_fatal: Result /= Void
      end

   expression_no_array (exp: LIBERTY_AST_EXPRESSION_NO_ARRAY; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_1(exp.binary_expression, local_context)
         else
            Result := expression_1(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_1 (exp1: LIBERTY_AST_EXP1; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp1.is_binary then
            left := binary_expression_1(exp1.left_binary, local_context)
         else
            left := expression_1(exp1.left_expression, local_context)
         end
         right := expression_1(exp1.right_expression, local_context)

         if exp1.is_implies then
            create {LIBERTY_IMPLIES} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp1.operator1))
         end
      end

   expression_1 (exp: LIBERTY_AST_E1; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_2(exp.binary_expression, local_context)
         else
            Result := expression_2(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_2 (exp2: LIBERTY_AST_EXP2; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp2.is_binary then
            left := binary_expression_2(exp2.left_binary, local_context)
         else
            left := expression_2(exp2.left_expression, local_context)
         end
         right := expression_2(exp2.right_expression, local_context)

         if exp2.is_or_else then
            create {LIBERTY_OR_ELSE} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp2.operator1))
         elseif exp2.is_or then
            create {LIBERTY_OR} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp2.operator1))
         elseif exp2.is_xor then
            create {LIBERTY_XOR} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp2.operator1))
         end
      end

   expression_2 (exp: LIBERTY_AST_E2; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_3(exp.binary_expression, local_context)
         else
            Result := expression_3(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_3 (exp3: LIBERTY_AST_EXP3; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp3.is_binary then
            left := binary_expression_3(exp3.left_binary, local_context)
         else
            left := expression_3(exp3.left_expression, local_context)
         end
         right := expression_3(exp3.right_expression, local_context)

         if exp3.is_and_then then
            create {LIBERTY_AND_THEN} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp3.operator1))
         elseif exp3.is_and then
            create {LIBERTY_AND} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp3.operator1))
         end
      end

   expression_3 (exp: LIBERTY_AST_E3; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_4(exp.binary_expression, local_context)
         else
            Result := expression_4(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_4 (exp4: LIBERTY_AST_EXP4; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp4.is_binary then
            left := binary_expression_4(exp4.left_binary, local_context)
         else
            left := expression_4(exp4.left_expression, local_context)
         end
         right := expression_4(exp4.right_expression, local_context)

         if exp4.is_eq then
            create {LIBERTY_EQUALS} Result.make(left, right, universe.type_boolean, image_semantics_position_at(exp4.operator1))
         elseif exp4.is_ne then
            create {LIBERTY_NOT_EQUALS} Result.make(left, right, universe.type_boolean, image_semantics_position_at(exp4.operator1))
         elseif exp4.is_le then
            create {LIBERTY_LESS_OR_EQUAL} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp4.operator1))
         elseif exp4.is_lt then
            create {LIBERTY_LESS_THAN} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp4.operator1))
         elseif exp4.is_ge then
            create {LIBERTY_GREATER_OR_EQUAL} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp4.operator1))
         elseif exp4.is_gt then
            create {LIBERTY_GREATER_THAN} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp4.operator1))
         end
      end

   expression_4 (exp: LIBERTY_AST_E4; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_5(exp.binary_expression, local_context)
         else
            Result := expression_5(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_5 (exp5: LIBERTY_AST_EXP5; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp5.is_binary then
            left := binary_expression_5(exp5.left_binary, local_context)
         else
            left := expression_5(exp5.left_expression, local_context)
         end
         right := expression_5(exp5.right_expression, local_context)

         if exp5.is_plus then
            create {LIBERTY_ADD} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp5.operator1))
         elseif exp5.is_minus then
            create {LIBERTY_SUBTRACT} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp5.operator1))
         end
      end

   expression_5 (exp: LIBERTY_AST_E5; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         if exp.is_binary_expression then
            Result := binary_expression_6(exp.binary_expression, local_context)
         else
            Result := expression_6(exp.simple_expression, local_context)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   binary_expression_6 (exp6: LIBERTY_AST_EXP6; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         left, right: LIBERTY_EXPRESSION
      do
         if exp6.is_binary then
            left := binary_expression_6(exp6.left_binary, local_context)
         else
            left := expression_6(exp6.left_expression, local_context)
         end
         right := expression_6(exp6.right_expression, local_context)

         if exp6.is_times then
            create {LIBERTY_TIMES} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp6.operator1))
         elseif exp6.is_divide then
            create {LIBERTY_DIVIDE} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp6.operator1))
         elseif exp6.is_int_divide then
            create {LIBERTY_INT_DIVIDE} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp6.operator1))
         elseif exp6.is_int_remainder then
            create {LIBERTY_INT_REMAINDER} Result.make(left, right, agent feature_entity, image_semantics_position_at(exp6.operator1))
         end
      end

   expression_6 (exp: LIBERTY_AST_E6; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         exp /= Void
         local_context /= Void
      do
         Result := expression_7(exp.e7, exp.r7, local_context)
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_7 (e7: LIBERTY_AST_E7; r7: LIBERTY_AST_R7; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      do
         Result := expression_8(e7.e8, e7.r8, local_context)
         if r7.is_power then
            create {LIBERTY_POWER} Result.make(Result, expression_7(r7.expression, r7.remainder, local_context), agent feature_entity, Result.position)
         end
      end

   expression_8 (e8: LIBERTY_AST_E8; r8: LIBERTY_AST_R8; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         fn: LIBERTY_FEATURE_NAME
      do
         if e8.has_prefix_operator then
            inspect
               e8.prefix_operator.name.out
            when "KW +" then
               create {LIBERTY_POSITIVE} Result.make(expression_8(e8.prefixed_expression, r8, local_context), agent feature_entity, semantics_position_at(e8.prefix_operator))
            when "KW -" then
               create {LIBERTY_NEGATIVE} Result.make(expression_8(e8.prefixed_expression, r8, local_context), agent feature_entity, semantics_position_at(e8.prefix_operator))
            when "KW not" then
               create {LIBERTY_NOT} Result.make(expression_8(e8.prefixed_expression, r8, local_context), agent feature_entity, semantics_position_at(e8.prefix_operator))
            else
               create fn.make_prefix(e8.prefix_operator.image.image.intern, errors.semantics_position(e8.prefix_operator.image.index, ast, file))
               Result := expression_8(e8.prefixed_expression, r8, local_context)
               create {LIBERTY_PREFIX_OPERATOR} Result.make(Result, feature_entity(Result.result_type, fn), semantics_position_at(e8.prefix_operator))
            end
         else
            Result := expression_9(e8.e9, local_context)
         end
         if r8.is_free_operator then
            create fn.make_infix(r8.free_operator.image.image.intern, errors.semantics_position(r8.free_operator.image.index, ast, file))
            create {LIBERTY_INFIX_OPERATOR} Result.make(Result, expression_8(r8.expression, r8.remainder, local_context), feature_entity(Result.result_type, fn), Result.position)
         end
      end

   expression_9 (e9: LIBERTY_AST_E9; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      do
         Result := expression_10(e9.e10, local_context)
         if e9.has_old then
            create {LIBERTY_OLD} Result.make(Result, semantics_position_at(e9.node_at(0)))
         end
      end

   expression_10 (e10: LIBERTY_AST_E10; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      local
         exp: LIBERTY_EXPRESSION; agent_expression: LIBERTY_CALL_EXPRESSION
      do
         if e10.is_call then
            Result := expression_call(e10.call, local_context)
         elseif e10.is_tuple then
            Result := expression_tuple(e10.tuple_actuals, local_context, semantics_position_at(e10.node_at(0)))
         elseif e10.is_open_argument then
            create {LIBERTY_OPEN_ARGUMENT} Result.make(semantics_position_at(e10.node_at(0)))
         elseif e10.is_inline_agent then
            Result := expression_inline_agent(e10.inline_agent_signature, e10.inline_agent_definition, e10.inline_agent_actuals, local_context)
         elseif e10.is_agent_creation then
            exp := expression(e10.agent_creation_expression, local_context)
            if not agent_expression ?:= exp then
               --|*** TODO: error: not a call
               not_yet_implemented
            end
            agent_expression ::= exp
            create {LIBERTY_AGENT} Result.make(agent_expression, semantics_position_at(e10.node_at(0)))
         elseif e10.is_creation_expression then
            Result := expression_creation(e10.creation_expression, local_context)
         elseif e10.is_void then
            create {LIBERTY_VOID} Result.make(semantics_position_at(e10.node_at(0)))
         else
            check False end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_creation (a_creation: LIBERTY_AST_CREATION_EXPRESSION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         a_creation /= Void
      local
         entity_type: LIBERTY_TYPE
         creation_type: LIBERTY_ACTUAL_TYPE
         tgt: LIBERTY_EXPRESSION
         fe: LIBERTY_FEATURE_ENTITY
         fa: COLLECTION[LIBERTY_EXPRESSION]
      do
         entity_type := type_lookup.resolver.type(a_creation.type_definition)
         if creation_type ?:= entity_type then
            creation_type ::= entity_type
            if a_creation.r10.is_empty then
               fe := feature_entity(creation_type, default_create_name)
               fa := empty_actuals
               create {LIBERTY_CREATION_EXPRESSION} Result.make(creation_type, fe, fa, semantics_position_at(a_creation.node_at(0)))
            else
               fe := feature_entity(creation_type, create {LIBERTY_FEATURE_NAME}.make_regular(a_creation.r10.feature_name.image.image.intern, errors.semantics_position(a_creation.r10.feature_name.image.index, ast, file)))
               fa := actuals(a_creation.r10.actuals, local_context)
               create {LIBERTY_CREATION_EXPRESSION} tgt.make(creation_type, fe, fa, semantics_position_at(a_creation.node_at(0)))
               Result := expression_remainder(tgt, a_creation.r10.remainder, local_context)
            end
         else
            --|*** TODO: error: no anchor in creation type
            not_yet_implemented
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_call (a_call: LIBERTY_AST_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         a_call /= Void
      do
         if a_call.is_call then
            Result := target_or_implicit_feature_call_expression(a_call.call_target, local_context)
            Result := expression_remainder(Result, a_call.call_r10, local_context)
         else
            check
               a_call.is_assignment_test
            end
            create {LIBERTY_ASSIGNMENT_TEST} Result.test_entity(entity(Void, a_call.assignment_test_entity_name.image.image.intern, errors.semantics_position(a_call.assignment_test_entity_name.image.index, ast, file), local_context),
                                                                expression(a_call.assignment_test_expression, local_context),
                                                                universe.type_boolean, semantics_position_at(a_call.assignment_test_entity_name))
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_remainder (a_target: LIBERTY_EXPRESSION; a_remainder: LIBERTY_AST_R10; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         a_target /= Void
         a_remainder /= Void
      local
         tgt: LIBERTY_EXPRESSION
         fe: LIBERTY_FEATURE_ENTITY
         fa: COLLECTION[LIBERTY_EXPRESSION]
      do
         -- We may derecursivate this thing (algorithm similar to `instruction_call')
         -- but I guess modern compilers are smart enough to do that anyway :-)
         if not errors.has_error then
            if a_remainder.is_empty then
               Result := a_target
            else
               fe ::= entity(a_target.result_type, a_remainder.feature_name.image.image.intern, errors.semantics_position(a_remainder.feature_name.image.index, ast, file), Void)
               fa := actuals(a_remainder.actuals, local_context)
               tgt := create_expression_call(a_target, fe, fa, a_target.position, local_context) --|*** or semantics_position_at(a_remainder.node_at(0)) ??
               Result := expression_remainder(tgt, a_remainder.remainder, local_context)
            end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   expression_inline_agent (a_signature: LIBERTY_AST_AGENT_SIGNATURE; a_definition: LIBERTY_AST_ROUTINE_DEFINITION; a_actuals: LIBERTY_AST_ACTUALS; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_INLINE_AGENT
      local
         routine_execution: LIBERTY_AST_ROUTINE_EXECUTION
         do_block: LIBERTY_AST_DO_BLOCK
         comp: LIBERTY_INSTRUCTION
         closure_context: LIBERTY_INLINE_AGENT_CONTEXT
         result_type: LIBERTY_TYPE
         type_resolver: LIBERTY_TYPE_RESOLVER_IN_INLINE_AGENT
      do
         routine_execution := a_definition.execution
         if not routine_execution.is_regular then
            --|*** TODO: error: an inline agent must be regular
            not_yet_implemented
         end
         do_block := routine_execution.do_block
         if do_block.is_deferred then
            --|*** TODO: error: an inline agent cannot be deferred
            not_yet_implemented
         elseif do_block.is_attribute then
            --|*** TODO: error: an inline agent cannot be an attribute
            not_yet_implemented
         elseif do_block.is_once then
            --|*** TODO: error: an inline agent cannot be once (technical limitation, to be removed)
            not_yet_implemented
         end
         if not a_definition.rescue_block.is_empty then
            --|*** TODO
            not_yet_implemented
         end

         create closure_context.make(local_context)
         if a_signature.has_return_type then
            result_type := type_lookup.resolver.type(a_signature.return_type)
            closure_context.set_result_type(result_type)
         end
         create type_resolver.make(closure_context)
         type_lookup.push(type_resolver)

         if a_signature.has_parameters then
            list_parameters(a_signature.parameters, closure_context)
         end
         list_locals(routine_execution.local_block, closure_context)
         comp := compound(do_block.list, closure_context)

         if not errors.has_error then
            create Result.make(comp, actuals(a_actuals, local_context), closure_context)
         end

         type_lookup.pop
      end

   expression_tuple (a_tuple: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; a_position: LIBERTY_POSITION): LIBERTY_TUPLE
      local
         exp: LIBERTY_AST_ACTUAL
         expr: LIBERTY_EXPRESSION
         expressions: COLLECTION[LIBERTY_EXPRESSION]
         exp_types: COLLECTION[LIBERTY_TYPE]
         i: INTEGER
      do
         if a_tuple = Void then
            create {FAST_ARRAY[LIBERTY_EXPRESSION]} expressions.with_capacity(0)
            create {FAST_ARRAY[LIBERTY_TYPE]} exp_types.with_capacity(0)
         else
            from
               create {FAST_ARRAY[LIBERTY_EXPRESSION]} expressions.with_capacity(a_tuple.count)
               create {FAST_ARRAY[LIBERTY_TYPE]} exp_types.with_capacity(a_tuple.count)
               i := a_tuple.lower
            until
               errors.has_error or else i > a_tuple.upper
            loop
               exp ::= a_tuple.item(i)
               if exp.is_expression then
                  expr := expression(exp.expression, local_context)
               else
                  --| "$entity" expressions
                  not_yet_implemented
               end
               if not errors.has_error then
                  expressions.add_last(expr)
                  exp_types.add_last(expr.result_type)
               end
               i := i + 1
            end
         end
         if not errors.has_error then
            create Result.make(universe.type_tuple(exp_types, a_position), expressions, a_position)
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   typed_manifest_or_type_test (constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_EXPRESSION
      require
         constant /= Void
         local_context /= Void
      local
         openarg: LIBERTY_OPEN_ARGUMENT
         entity_type: LIBERTY_TYPE
         actual_type: LIBERTY_ACTUAL_TYPE
      do
         if constant.is_assignment_test then
            entity_type := type_lookup.resolver.type(constant.assignment_test_type)
            if actual_type ?:= entity_type then
               actual_type ::= entity_type
               create {LIBERTY_ASSIGNMENT_TEST} Result.test_type(actual_type,
                                                                 expression(constant.assignment_test_expression, local_context),
                                                                 universe.type_boolean, semantics_position_at(constant.node_at(0)))
            else
               --|*** TODO: error: cannot use an anchor for assignment test
               not_yet_implemented
            end
         elseif constant.is_typed_open_argument then
            create openarg.make(semantics_position_at(constant.node_at(0)))
            openarg.set_result_type(type_lookup.resolver.type(constant.open_argument_type))
            Result := openarg
         elseif constant.is_number then
            Result := number(constant.number.image)
         elseif constant.is_true then
            create {LIBERTY_BOOLEAN_MANIFEST} Result.make(universe.type_boolean, True, semantics_position_at(constant.node_at(0)))
         elseif constant.is_false then
            create {LIBERTY_BOOLEAN_MANIFEST} Result.make(universe.type_boolean, False, semantics_position_at(constant.node_at(0)))
         elseif constant.is_character then
            Result := character(constant.character.image)
         elseif constant.is_string then
            create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, native_array_of_character, decoded_string(constant.string), False, semantics_position_at(constant.node_at(0)))
         elseif constant.is_once_string then
            create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, native_array_of_character, decoded_string(constant.string), True, semantics_position_at(constant.node_at(0)))
         elseif constant.is_number_typed_manifest then
            entity_type := type_lookup.resolver.type(constant.typed_manifest_type)
            if actual_type ?:= entity_type then
               actual_type ::= entity_type
               Result := number_typed_manifest(actual_type,
                                               constant.typed_manifest_number.image)
            else
               --|*** TODO: error: cannot use an anchor for array type definition
               not_yet_implemented
            end
         elseif constant.is_string_typed_manifest then
            entity_type := type_lookup.resolver.type(constant.typed_manifest_type)
            if actual_type ?:= entity_type then
               actual_type ::= entity_type
               create {LIBERTY_STRING_TYPED_MANIFEST} Result.make(actual_type,
                                                                  decoded_string(constant.typed_manifest_string), semantics_position_at(constant.node_at(0)))
            else
               --|*** TODO: error: cannot use an anchor for array type definition
               not_yet_implemented
            end
         elseif constant.is_array_typed_manifest then
            entity_type := type_lookup.resolver.type(constant.typed_manifest_type)
            if actual_type ?:= entity_type then
               actual_type ::= entity_type
               Result := array_typed_manifest(actual_type,
                                              constant.typed_manifest_array_parameters, constant.typed_manifest_array,
                                              local_context, semantics_position_at(constant.node_at(0)))
            else
               --|*** TODO: error: cannot use an anchor for array type definition
               not_yet_implemented
            end
         else
            check False end
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   number (number_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION
      require
         ({TYPED_EIFFEL_IMAGE[INTEGER_64]} ?:= number_image)
            or else ({TYPED_EIFFEL_IMAGE[REAL]} ?:= number_image)
      local
         i: TYPED_EIFFEL_IMAGE[INTEGER_64]
         r: TYPED_EIFFEL_IMAGE[REAL]
         i64: INTEGER_64
      do
         -- That's not pretty! but doing without all those type tests would incur big changes and code
         -- duplication in the eiffel parser :-/
         if i ?:= number_image then
            i ::= number_image
            i64 := i.decoded
            if i64.fit_integer_8 then
               create {LIBERTY_INTEGER_8_MANIFEST} Result.make(universe.type_integer_8, i64.to_integer_8, image_semantics_position_at(number_image))
            elseif i64.fit_integer_16 then
               create {LIBERTY_INTEGER_16_MANIFEST} Result.make(universe.type_integer_16, i64.to_integer_16, image_semantics_position_at(number_image))
            elseif i64.fit_integer_32 then
               create {LIBERTY_INTEGER_32_MANIFEST} Result.make(universe.type_integer_32, i64.to_integer_32, image_semantics_position_at(number_image))
            else
               create {LIBERTY_INTEGER_64_MANIFEST} Result.make(universe.type_integer_64, i64, image_semantics_position_at(number_image))
            end
         else
            check
               r ?:= number_image
            end
            r ::= number_image
            create {LIBERTY_REAL_MANIFEST} Result.make(universe.type_real, r.decoded, image_semantics_position_at(number_image))
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   character (character_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION
      require
         {TYPED_EIFFEL_IMAGE[CHARACTER]} ?:= character_image
      local
         c: TYPED_EIFFEL_IMAGE[CHARACTER]
      do
         c ::= character_image
         create {LIBERTY_CHARACTER_MANIFEST} Result.make(universe.type_character, c.decoded, image_semantics_position_at(character_image))
      ensure
         not errors.has_error implies Result /= Void
      end

   number_typed_manifest (manifest_type: LIBERTY_ACTUAL_TYPE; number_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION
      require
         ({TYPED_EIFFEL_IMAGE[INTEGER_64]} ?:= number_image)
            or else ({TYPED_EIFFEL_IMAGE[REAL]} ?:= number_image)
      local
         i: TYPED_EIFFEL_IMAGE[INTEGER_64]
         r: TYPED_EIFFEL_IMAGE[REAL]
      do
         if i ?:= number_image then
            i ::= number_image
            create {LIBERTY_INTEGER_TYPED_MANIFEST} Result.make(manifest_type, i.decoded, image_semantics_position_at(number_image))
         else
            check
               r ?:= number_image
            end
            r ::= number_image
            create {LIBERTY_REAL_TYPED_MANIFEST} Result.make(manifest_type, r.decoded, image_semantics_position_at(number_image))
         end
      ensure
         not errors.has_error implies Result /= Void
      end

   array_typed_manifest (manifest_type: LIBERTY_ACTUAL_TYPE; array_parameters: EIFFEL_LIST_NODE; array: LIBERTY_AST_ARRAY;
      local_context: LIBERTY_FEATURE_LOCAL_CONTEXT;
      a_position: LIBERTY_POSITION): LIBERTY_ARRAY_MANIFEST
      require
         local_context /= Void
      local
         i: INTEGER; ena: LIBERTY_AST_EXPRESSION_NO_ARRAY; exp: LIBERTY_AST_EXPRESSION
      do
         manifest_type.set_has_manifest_array
         create Result.make(manifest_type, a_position)
         from
            i := array_parameters.lower
         until
            i > array_parameters.upper
         loop
            ena ::= array_parameters.item(i)
            Result.add_parameter(expression_no_array(ena, local_context))
            i := i + 1
         end
         from
            i := array.content.lower
         until
            i > array.content.upper
         loop
            exp ::= array.content.item(i)
            Result.add_content(expression(exp, local_context), expression_separator(exp))
            i := i + 1
         end
      ensure
         not errors.has_error implies Result /= Void
      end

feature {}
   list_parameters (parameters: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT)
      local
         i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
         typedef: LIBERTY_TYPE; parameter: LIBERTY_PARAMETER
      do
         if not parameters.is_empty then
            from
               i := parameters.lower
            until
               i > parameters.upper
            loop
               declaration ::= parameters.item(i)
               typedef := type_lookup.resolver.type(declaration.type_definition)
               if typedef /= Void then
                  from
                     j := declaration.variables.lower
                  until
                     j > declaration.variables.upper
                  loop
                     variable ::= declaration.variables.item(j)
                     create parameter.make(variable.variable.image.image.intern, typedef, errors.semantics_position(variable.variable.image.index, ast, file))
                     local_context.add_parameter(parameter)
                     j := j + 1
                  end
               end
               i := i + 1
            end
         end
      end

   list_locals (locals: LIBERTY_AST_LOCAL_BLOCK; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT)
      local
         i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
         typedef: LIBERTY_TYPE; localdef: LIBERTY_LOCAL
      do
         if locals.list_count > 0 then
            from
               i := locals.list_lower
            until
               i > locals.list_upper
            loop
               declaration := locals.list_item(i)
               typedef := type_lookup.resolver.type(declaration.type_definition)
               if typedef /= Void then
                  from
                     j := declaration.variables.lower
                  until
                     j > declaration.variables.upper
                  loop
                     variable ::= declaration.variables.item(j)
                     create localdef.make(variable.variable.image.image.intern, typedef, errors.semantics_position(variable.variable.image.index, ast, file))
                     local_context.add_local(localdef)
                     j := j + 1
                  end
               end
               i := i + 1
            end
         end
      end

feature {}
   create_instruction_call (a_target: LIBERTY_EXPRESSION; a_entity: LIBERTY_FEATURE_ENTITY; a_actuals: COLLECTION[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CALL_INSTRUCTION
      do
         create Result.make(a_target, a_entity, a_actuals, a_position)
      end

   create_implicit_instruction_call (a_entity: LIBERTY_FEATURE_ENTITY; a_actuals: COLLECTION[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_CALL_INSTRUCTION
      do
         create Result.implicit_current(a_entity, a_actuals, a_position)
      end

   create_expression_call (a_target: LIBERTY_EXPRESSION; a_entity: LIBERTY_FEATURE_ENTITY; a_actuals: COLLECTION[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_CALL_EXPRESSION
      do
         create Result.make(a_target, a_entity, a_actuals, a_position)
      end

   create_implicit_expression_call (a_entity: LIBERTY_FEATURE_ENTITY; a_actuals: COLLECTION[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_CALL_EXPRESSION
      do
         create Result.implicit_current(a_entity, a_actuals, a_position)
      end

feature {} -- Assertions
   empty_feature_assertions: COLLECTION[LIBERTY_ASSERTION]
      once
         create {FAST_ARRAY[LIBERTY_ASSERTION]} Result.with_capacity(0)
      end

   feature_assertions (assertions: LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): COLLECTION[LIBERTY_ASSERTION]
      require
         assertions /= Void
         local_context /= Void
      local
         i: INTEGER; assertion: LIBERTY_AST_ASSERTION
         tag: FIXED_STRING; exp: LIBERTY_EXPRESSION
      do
         if assertions.list_count = 0 then
            Result := empty_feature_assertions
         else
            create {FAST_ARRAY[LIBERTY_ASSERTION]} Result.with_capacity(assertions.list_count)
            from
               i := assertions.list_lower
            until
               errors.has_error or else i > assertions.list_upper
            loop
               assertion := assertions.list_item(i)
               if assertion.expression.has_expression then
                  if assertion.tag.has_tag then
                     tag := assertion.tag.tag.image.image.intern
                  else
                     tag := Void
                  end
                  if assertion.expression.has_expression then
                     exp := expression(assertion.expression.expression, local_context)
                     Result.add_last(create {LIBERTY_ASSERTION}.make(tag, exp))
                  end
               end
               i := i + 1
            end
         end
      end

feature {}
   type: LIBERTY_ACTUAL_TYPE
      deferred
      ensure
         Result /= Void
      end

   native_array_of_character: LIBERTY_ACTUAL_TYPE
      once
         Result := universe.type_native_array({FAST_ARRAY[LIBERTY_ACTUAL_TYPE] << universe.type_character >> }, errors.unknown_position)
      end

end -- class LIBERTY_SEMANTICS_BUILDER
