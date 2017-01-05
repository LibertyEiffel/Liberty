-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_CREATION
   --
   -- An Eiffel agent is a delayed call. Such an Eiffel object include a feature call with closed or
   -- open arguments (or closed or open target as well). An AGENT_CREATION object is the notation to
   -- create the agent (i.e. the feature is not launched yet, see also AGENT_EXPRESSION).
   --
   -- Examples of AGENT_CREATION:
   --          agent my_array.add_last(?)         -- The target is closed and the argument is open.
   --          agent {ARRAY[INTEGER]}.add_last(1) -- The target is open and the argument is closed.
   --          agent {ARRAY[INTEGER]}.add_last(?) -- Both the target and the argument are open.
   --          agent {ARRAY[INTEGER]}.add_last    -- A short-hand for the previous notation.
   --          agent my_array.put(?, 3)           -- Only the second argument is open.
   --          agent my_array.put(3, ?)           -- Only the first argument is open.
   --          agent {ARRAY[INTEGER]}.put         -- Target and all arguments are open.
   --
   -- See also directly related classes: OPEN_OPERAND and CLOSED_OPERAND.
   --

inherit
   EXPRESSION

create {EIFFEL_PARSER}
   make

feature {ANY}
   start_position: POSITION
         -- Of the first letter of the mandatory "agent" keyword (obviously provided by the
         -- `eiffel_parser').

   original_function_call: FUNCTION_CALL
         -- The one provided by the `eiffel_parser' (the syntactical information). Indeed, the
         -- parser cannot know about the result type of the delayed call, thus, the parser is always
         -- creating a FUNCTION_CALL. This `original_function_call' attribute is always kept unchanged
         -- in order to allow `pretty' at any step (or any mode) of the compilation process.

   code: CODE
         -- Initialized with `original_function_call', the `code' will be more and more specialized as
         -- the compilation process is going on. Syntactically, it is always a FUNCTION_CALL. Then, it
         -- can be transformed into a PROCEDURE_CALL, as soon as the target is resolved. Finally, after
         -- inlining of dynamic dispatch (after `inline_dynamic_dispatch_') this can be transformed
         -- accordingly, may be with a COMPOUND or a COMPOUND_EXPRESSION or anything else produced by
         -- inlining or simplify.

   open_operand_list: FAST_ARRAY[OPEN_OPERAND]
         -- If any, the ordered list of OPEN_OPERAND objects. As OPEN_OPERAND objects are never
         -- twinned, `open_operand_list' is always up-to-date.

   closed_operand_list: FAST_ARRAY[CLOSED_OPERAND]
         -- If any, the ordered list of CLOSED_ARGUMENT objects which are also immutable objects
         -- (never twinned as OPEN_OPERAND objects are).

   resolved_memory: HASHED_DICTIONARY[TYPE, TYPE]
         -- Because computing of `resolve_in' requires allocating many objects and because it is very
         -- difficult (if not impossible) to compute after inlining of dynamic dispatch, values of
         -- `resolve_in' are cached into `resolved_memory'.

   context_features: HASHED_DICTIONARY[ANONYMOUS_FEATURE, TYPE]
         -- The containing feature for each type

   is_current, is_implicit_current: BOOLEAN False

   inline_feature: FEATURE_TEXT
         -- non-Void if the agent is an inline agent (useful for pretty, also for closure parts)

   extra_bracket_flag: BOOLEAN False

   declaration_type: TYPE
      do
         Result := resolve_in(start_position.class_text.declaration_type_of_like_current)
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   feature_stamp: FEATURE_STAMP
         -- useful for the interpreter

   has_omitted_open_arguments: BOOLEAN

   specialize_in (type: TYPE): like Current
      local
         function_call: FUNCTION_CALL
      do
         -- At this step, syntactically, the following forced assignment is correct:
         function_call ::= code
         function_call := function_call.specialize_in(type)
         if function_call = code then
            -- No need to notify OPEN_OPERAND objects.
            Result := Current
         else
            Result := twin
            Result.set_code(function_call)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         i: INTEGER; o1, o2: OPEN_OPERAND; l: like open_operand_list
         c: like code
      do
         Result := Current
         if open_operand_list /= Void then
            from
               i := open_operand_list.lower
            until
               o1 /= o2 or else i > open_operand_list.upper
            loop
               o1 := open_operand_list.item(i)
               o2 := o1.specialize_thru(parent_type, parent_edge, new_type)
               i := i + 1
            end
            if o1 = o2 then
               check Result = Current end
            else
               from
                  Result := twin
                  l := open_operand_list
                  Result.set_open_operand_list(l)
                  l.put(o2, i - 1)
               until
                  i > l.upper
               loop
                  l.put(l.item(i).specialize_thru(parent_type, parent_edge, new_type), i)
                  i := i + 1
               end
            end
         end

         c := code.specialize_thru(parent_type, parent_edge, new_type)
         if c = code then
            -- No need to notify OPEN_OPERAND objects.
         else
            if Result = Current then
               Result := twin
            end
            Result.set_code(c)
         end
      end

   specialize_and_check (type: TYPE): like Current
      do
         if {FUNCTION_CALL} ?:= code then
            Result := specialize_and_check_function(type)
         else
            Result := specialize_and_check_procedure(type)
         end
      end

   has_been_specialized: BOOLEAN
      do
         Result := code.has_been_specialized
      end

   resolve_in (type: TYPE): TYPE
      local
         function_call: FUNCTION_CALL
         open_type_list: ARRAY[TYPE_MARK]; af: ANONYMOUS_FEATURE; target_type: TYPE
         i: INTEGER; open_tuple, result_type: TYPE_MARK
      do
         if resolved_memory /= Void then
            Result := resolved_memory.reference_at(type)
         end
         if Result = Void then
            if open_operand_list = Void then
               create {EMPTY_TUPLE_TYPE_MARK} open_tuple.make(start_position)
            else
               create open_type_list.with_capacity(4, 1)
               from
                  i := open_operand_list.lower
               until
                  i > open_operand_list.upper
               loop
                  open_type_list.add_last(open_operand_list.item(i).resolve_in(type).canonical_type_mark)
                  i := i + 1
               end
               create {NON_EMPTY_TUPLE_TYPE_MARK} open_tuple.make(start_position, open_type_list)
            end
            check
               open_tuple.is_static
            end
            if {PROCEDURE_CALL} ?:= code then
               create {AGENT_TYPE_MARK} result_type.procedure(start_position, open_tuple)
            else
               function_call ::= code
               target_type := function_call.target.resolve_in(type)
               af := function_call.feature_stamp.anonymous_feature(target_type)
               result_type := af.result_type.to_static(target_type, False)
               if result_type.is_boolean then
                  create {AGENT_TYPE_MARK} result_type.predicate(start_position, open_tuple)
               else
                  create {AGENT_TYPE_MARK} result_type.function(start_position, open_tuple, result_type)
               end
            end
            Result := result_type.type
            if resolved_memory = Void then
               create resolved_memory.make
            end
            resolved_memory.put(Result, type)
         end
      end

   collect (type: TYPE): TYPE
      local
         dummy: TYPE
      do
         if code /= Void then
            dummy := code.collect(type)
         end
         Result := resolve_in(type)
         smart_eiffel.collect_create(Result)
         agent_pool.agent_creation_collect(type, Current, Result)
      end

   adapt_for (type: TYPE): like Current
      local
         c: like code
      do
         if has_omitted_open_arguments then
            warn_omitted_open_arguments
         end
         if context_features = Void then
            create context_features.make
         end
         context_features.put(smart_eiffel.context_feature, type)
         if code = Void then
            Result := Current
         else
            c := code.adapt_for(type)
            if c = code then
               Result := Current
            else
               Result := twin
               Result.set_code(c)
            end
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): like Current
      local
         c: like code
      do
         if has_omitted_open_arguments then
            -- If there is a warning at simplify time, then emit it first before simplifying the code.
            warn_omitted_open_arguments
         end
         if code = Void then
            -- After `simplify' the code can become Void in the case of an empty
            -- procedure called.
            Result := Current
         else
            c := code.simplify(type)
            if c = code then
               Result := Current
            else
               Result := twin
               Result.set_code(c)
            end
         end
      end

   accept (visitor: AGENT_CREATION_VISITOR)
      do
         visitor.visit_agent_creation(Current)
      end

   is_void: BOOLEAN False

   is_writable: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := False -- Because of memory allocation.
      end

   safety_check (type: TYPE)
      do
         code.safety_check(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         if code /= Void then
            Result := code.use_current(type)
         end
      end

   bracketed_pretty, pretty (indent_level: INTEGER)
      do
         pretty_printer.keyword(once "agent")
         if inline_feature /= Void then
            inline_feature.inline_agent_pretty(indent_level + 1)
            if original_function_call.arguments /= Void then
               original_function_call.arguments.pretty(indent_level)
            end
         else
            original_function_call.pretty(indent_level)
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE)
      do
         short_printer.hook_or(as_agent, as_agent)
         short_printer.put_character(' ')
         code.to_expression.short(type)
      end

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

feature {}
   specialize_and_check_function (type: TYPE): like Current
      require
         {FUNCTION_CALL} ?:= code
      local
         function_call, fc: FUNCTION_CALL; procedure_call: PROCEDURE_CALL; arguments: EFFECTIVE_ARG_LIST
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; target_type: TYPE
      do
         function_call ::= code
         -- Well, the `function_call' will be checked during `specialize_and_check', so we have to
         -- prepare the trap:
         smart_eiffel.set_agent_creation_error_trap(Current)
         function_call ::= function_call.specialize_and_check(type)
         smart_eiffel.clear_agent_creation_error_trap(Current)
         -- Now, we trust only the `feature_stamp' to create the new `code':
         fs := function_call.feature_stamp
         target_type := function_call.target.resolve_in(type)
         af := fs.anonymous_feature(target_type)
         if af.result_type = Void then
            -- Well, the `function_call' is actually a `procedure_call':
            if af.arguments = Void then
               create {PROCEDURE_CALL_0} procedure_call.make(function_call.target,
                                                             function_call.feature_name)
               procedure_call.set_feature_stamp(fs)
               Result := twin
               Result.set_code(procedure_call)
            elseif af.arguments.count = 1 then
               if function_call.arguments /= Void then
                  create {PROCEDURE_CALL_1} procedure_call.make(function_call.target,
                                                                function_call.feature_name,
                                                                function_call.arguments)
                  procedure_call.set_feature_stamp(fs)
                  Result := twin
                  Result.set_code(procedure_call)
               else
                  arguments := af.arguments.omitted_open_arguments(type, target_type, function_call.start_position)
                  create {PROCEDURE_CALL_1} procedure_call.make(function_call.target,
                                                                function_call.feature_name,
                                                                arguments)
                  procedure_call.set_feature_stamp(fs)
                  Result := twin
                  Result.set_code(procedure_call)
                  Result.omitted_open_arguments_update(arguments)
               end
            elseif function_call.arguments /= Void then
               create {PROCEDURE_CALL_N} procedure_call.make(function_call.target,
                                                             function_call.feature_name,
                                                             function_call.arguments)
               procedure_call.set_feature_stamp(fs)
               Result := twin
               Result.set_code(procedure_call)
            else
               arguments := af.arguments.omitted_open_arguments(type, target_type, function_call.start_position)
               create {PROCEDURE_CALL_N} procedure_call.make(function_call.target,
                                                             function_call.feature_name,
                                                             arguments)
               procedure_call.set_feature_stamp(fs)
               Result := twin
               Result.set_code(procedure_call)
               Result.omitted_open_arguments_update(arguments)
            end
         elseif af.arguments = Void then
            if function_call = code then
               Result := Current
            else
               Result := twin
               Result.set_code(function_call)
            end
         elseif af.arguments.count = 1 then
            if function_call.arguments = Void then
               arguments := af.arguments.omitted_open_arguments(type, target_type, function_call.start_position)
               create {FUNCTION_CALL_1} fc.make(function_call.target,
                                                function_call.feature_name,
                                                arguments)
               fc.set_feature_stamp(function_call.feature_stamp)
               Result := twin
               Result.set_code(fc)
               Result.omitted_open_arguments_update(arguments)
            elseif code = function_call then
               -- Well, good luck.
               Result := Current
            else
               Result := twin
               Result.set_code(function_call)
            end
         elseif function_call.arguments = Void then
            arguments := af.arguments.omitted_open_arguments(type, target_type, function_call.start_position)
            create {FUNCTION_CALL_N} fc.make(function_call.target,
                                             function_call.feature_name,
                                             arguments)
            fc.set_feature_stamp(function_call.feature_stamp)
            Result := twin
            Result.set_code(fc)
            Result.omitted_open_arguments_update(arguments)
         elseif code = function_call then
            -- Well, good luck.
            Result := Current
         else
            Result := twin
            Result.set_code(function_call)
         end
         Result.set_feature_stamp(fs)
      end

   specialize_and_check_procedure (type: TYPE): like Current
      require
         {PROCEDURE_CALL} ?:= code
      local
         procedure_call, pc: PROCEDURE_CALL; arguments: EFFECTIVE_ARG_LIST
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; target_type: TYPE
      do
         procedure_call ::= code
         -- Well, the `procedure_call' will be checked during `specialize_and_check', so we have to
         -- prepare the trap:
         smart_eiffel.set_agent_creation_error_trap(Current)
         procedure_call ::= procedure_call.specialize_and_check(type)
         smart_eiffel.clear_agent_creation_error_trap(Current)
         -- Now, we trust only the `feature_stamp' to create the new `code':
         fs := procedure_call.feature_stamp
         target_type := procedure_call.target.resolve_in(type)
         af := fs.anonymous_feature(target_type)
         check
            af.result_type = Void
         end
         -- Well, the `function_call' is actually a `procedure_call':
         if af.arguments = Void then
            if procedure_call = code then
               Result := Current
            else
               Result := twin
               Result.set_code(procedure_call)
            end
         elseif af.arguments.count = 1 then
            if procedure_call.arguments = Void then
               arguments := af.arguments.omitted_open_arguments(type, target_type, procedure_call.start_position)
               create {PROCEDURE_CALL_1} pc.make(procedure_call.target,
                                                procedure_call.feature_name,
                                                arguments)
               pc.set_feature_stamp(procedure_call.feature_stamp)
               Result := twin
               Result.set_code(pc)
               Result.omitted_open_arguments_update(arguments)
            elseif code = procedure_call then
               -- Well, good luck.
               Result := Current
            else
               Result := twin
               Result.set_code(procedure_call)
            end
         elseif procedure_call.arguments = Void then
            arguments := af.arguments.omitted_open_arguments(type, target_type, procedure_call.start_position)
            create {PROCEDURE_CALL_N} pc.make(procedure_call.target,
                                             procedure_call.feature_name,
                                             arguments)
            pc.set_feature_stamp(procedure_call.feature_stamp)
            Result := twin
            Result.set_code(pc)
            Result.omitted_open_arguments_update(arguments)
         elseif code = procedure_call then
            -- Well, good luck.
            Result := Current
         else
            Result := twin
            Result.set_code(procedure_call)
         end
         Result.set_feature_stamp(fs)
      end

feature {ANY}
   mold_id_in (type: TYPE; buffer: STRING)
         -- Identify the corresponding AGENT_CREATION function.
      do
         buffer.append(once "agenT")
         type.id.append_in(buffer)
         buffer.extend('f')
         start_position.class_text.id.append_in(buffer)
         buffer.extend('l')
         start_position.line.append_in(buffer)
         buffer.extend('c')
         start_position.column.append_in(buffer)
      end

   same_mold_id_as (other: like Current): BOOLEAN
      do
         Result := start_position = other.start_position
      end

feature {AGENT_CREATION}
   set_code (c: like code)
      require
         c /= Void
      do
         code := c
      ensure
         code = c
      end

   set_feature_stamp (fs: like feature_stamp)
      require
         fs /= Void
      do
         feature_stamp := fs
      ensure
         feature_stamp = fs
      end

   set_open_operand_list (l: like open_operand_list)
      require
         l.count = open_operand_list.count
      do
         open_operand_list := l
      end

feature {}
   make (sp: like start_position; function_call: like original_function_call; a_inline_feature: like inline_feature)
      require
         not sp.is_unknown
         function_call /= Void
         a_inline_feature /= Void implies a_inline_feature.is_inline_agent
      local
         rank, i, max_capacity: INTEGER; open_operand: OPEN_OPERAND; arguments: EFFECTIVE_ARG_LIST
         expression: EXPRESSION; closed_operand: CLOSED_OPERAND
      do
         start_position := sp
         original_function_call := function_call
         code := function_call
         inline_feature := a_inline_feature
         -- Notifying OPEN_OPERAND objects with their `rank':
         arguments := function_call.arguments
         if arguments /= Void then
            max_capacity := arguments.count + 1
         end
         expression := function_call.target
         if {OPEN_OPERAND} ?:= expression then
            open_operand ::= expression
            open_operand.set_rank(-1)
            create open_operand_list.with_capacity(max_capacity)
            open_operand_list.add_last(open_operand)
         else
            create closed_operand.make(-1, expression)
            function_call.set_target(closed_operand)
            create closed_operand_list.with_capacity(max_capacity)
            closed_operand_list.add_last(closed_operand)
         end
         if arguments /= Void then
            from
               rank := 1
               i := arguments.lower
            until
               i > arguments.upper
            loop
               expression := arguments.item(i)
               if {OPEN_OPERAND} ?:= expression then
                  open_operand ::= expression
                  open_operand.set_rank(i)
                  if open_operand_list = Void then
                     create open_operand_list.with_capacity(max_capacity)
                  end
                  open_operand_list.add_last(open_operand)
               else
                  create closed_operand.make(rank, expression)
                  arguments.replace_item(i, closed_operand)
                  if closed_operand_list = Void then
                     create closed_operand_list.with_capacity(max_capacity)
                  end
                  closed_operand_list.add_last(closed_operand)
               end
               rank := rank + 1
               i := i + 1
            end
         end
      ensure
         start_position = sp
         code = function_call
         inline_feature = a_inline_feature
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         c: like code; ac: like Current; i: INTEGER
      do
         if code = Void then
            code_accumulator.current_context.add_last(Current)
         else
            if closed_operand_list /= Void then
               from
                  i := closed_operand_list.lower
               until
                  i > closed_operand_list.upper
               loop
                  closed_operand_list.item(i).inline_dynamic_dispatch_(code_accumulator, type)
                  i := i + 1
               end
            end
            set_inside_agent_launcher_flag(True)
            code_accumulator.open_new_context
            code.inline_dynamic_dispatch_(code_accumulator, type)
            c := code_accumulator.current_context_to_code
            code_accumulator.close_current_context
            if c = code then
               code_accumulator.current_context.add_last(Current)
            else
               ac := twin
               ac.set_code(c)
               code_accumulator.current_context.add_last(ac)
            end
            set_inside_agent_launcher_flag(False)
         end
      end

feature {}
   warn_omitted_open_arguments
      require
         has_omitted_open_arguments
      local
      do
         error_handler.add_position(start_position)
         error_handler.append(once "Please consider writing an explicit open argument list for your agent %
                                   %creation.")
         if inline_feature = Void then
            error_handler.append(once " Replace your code with:%N%N      agent ")
            error_handler.add_raw_code(code)
         end
         error_handler.print_as_warning

         has_omitted_open_arguments := False
      ensure
         print_only_once: not has_omitted_open_arguments
      end

feature {AGENT_CREATION}
   omitted_open_arguments_update (omitted_arguments: EFFECTIVE_ARG_LIST)
      require
         omitted_arguments.count >= 1
      local
         i: INTEGER; open_operand: OPEN_OPERAND
      do
         has_omitted_open_arguments := True
         if open_operand_list = Void then
            create open_operand_list.with_capacity(omitted_arguments.count)
         end
         from
            i := omitted_arguments.lower
         until
            i > omitted_arguments.upper
         loop
            open_operand ::= omitted_arguments.item(i)
            open_operand_list.add_last(open_operand)
            i := i + 1
         end
      ensure
         has_omitted_open_arguments
      end

feature {ANY}
   stored_closed_operand (type: TYPE; closed_operand: CLOSED_OPERAND): BOOLEAN
         -- Is the `closed_operand' stored inside the agent memory.
      require
         closed_operand /= Void
      do
         if closed_operand.is_static then
            -- No need to store this static value.
         elseif code = Void and then closed_operand.side_effect_free(type) then
            -- No need to store this value.
         elseif closed_operand.is_current and then ace.boost and then not code.use_current(type) then
            -- No need to pass that value which is probably not defined at all.
         else
            Result := True
         end
      end

   is_equal_used_in (agent_type: TYPE): BOOLEAN
         -- Because it is quite uncommon to use `is_equal' between two agents, this feature make it
         -- easy to skip the corresponding runtime support.
      require
         agent_type.is_agent
      do
         Result := agent_type.live_type.collected(any_is_equal_fs)
      end

feature {C_LIVE_TYPE_COMPILER}
   set_inside_agent_launcher_flag (flag_value: BOOLEAN)
      local
         i: INTEGER
      do
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand_list.item(i).set_inside_agent_launcher_flag(flag_value)
               i := i + 1
            end
         end
      end

invariant
   not start_position.is_unknown
   inline_feature /= Void implies inline_feature.is_inline_agent

end -- class AGENT_CREATION
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
