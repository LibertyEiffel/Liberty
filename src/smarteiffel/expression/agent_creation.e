-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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
   -- See also directely related classes: OPEN_OPERAND and CLOSED_OPERAND.
   --

inherit
   EXPRESSION

creation {EIFFEL_PARSER}
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
         -- inlining of dynamic dipatch (after `inline_dynamic_dispatch_') this can be transformed
         -- accordingly, may be with a COMPOUND or a COMPOUND_EXPRESSION or anything else produced by
         -- inlining or simplify.

   open_operand_list: FAST_ARRAY[OPEN_OPERAND]
         -- If any, the ordered list of OPEN_OPERAND objects. As OPEN_OPERAND objects are never
         -- twinned, `open_operand_list' is always uptodate.

   closed_operand_list: FAST_ARRAY[CLOSED_OPERAND]
         -- If any, the ordered list of CLOSED_ARGUMENT objects which are also immutable objects
         -- (never twinned as OPEN_OPERAND objects are).

   resolved_memory: HASHED_DICTIONARY[TYPE, TYPE]
         -- Because computing of `resolve_in' requires allocating many objects and because it is very
         -- difficult (if not impossible) to compute after inlining of dynamic dispatch, values of
         -- `resolve_in' are cached into `resolved_memory'.

   is_current, is_implicit_current: BOOLEAN is False

   inline_feature: FEATURE_TEXT
         -- non-Void if the agent is an inline agent (useful for pretty)

   extra_bracket_flag: BOOLEAN is False

   declaration_type: TYPE is
      do
         Result := resolve_in(start_position.class_text.declaration_type_of_like_current)
      end

   specialize_in (type: TYPE): like Current is
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         function_call: FUNCTION_CALL
      do
         -- At this step, syntactically, the following forced assignment is correct:
         function_call ::= code
         function_call := function_call.specialize_thru(parent_type, parent_edge, new_type)
         if function_call = code then
            -- No need to notify OPEN_OPERAND objects.
            Result := Current
         else
            Result := twin
            Result.set_code(function_call)
         end
      end

   specialize_2 (type: TYPE): like Current is
      do
         if {FUNCTION_CALL} ?:= code then
            Result := specialize_2_function(type)
         else
            Result := specialize_2_procedure(type)
         end
      end

   has_been_specialized: BOOLEAN is
      do
         Result := code.has_been_specialized
      end

   resolve_in (type: TYPE): TYPE is
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
               result_type := af.result_type.to_static(target_type)
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

   collect (type: TYPE): TYPE is
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

   adapt_for (type: TYPE): like Current is
      local
         c: like code
      do
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

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): like Current is
      local
         c: like code
      do
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

   accept (visitor: AGENT_CREATION_VISITOR) is
      do
         visitor.visit_agent_creation(Current)
      end

   is_void: BOOLEAN is False

   is_writable: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   is_static: BOOLEAN is False

   is_result: BOOLEAN is False

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := False -- Because of memory allocation.
      end

   safety_check (type: TYPE) is
      do
         code.safety_check(type)
      end

   compile_to_c (type: TYPE) is
      local
         i: INTEGER; boost: BOOLEAN; closed_operand: CLOSED_OPERAND
      do
         mold_id_in(type, cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend('(')
         boost := ace.boost
         if not boost then
            cpp.pending_c_function_body.append(once "&ds")
         end
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand := closed_operand_list.item(i)
               if stored_closed_operand(type, closed_operand) then
                  if cpp.pending_c_function_body.last /= '(' then
                     cpp.pending_c_function_body.extend(',')
                  end
                  closed_operand.mapping_c_arg(type)
               end
               i := i + 1
            end
         end
         cpp.pending_c_function_body.extend(')')
      end

   mapping_c_target (type, target_formal_type: TYPE) is
      do
         compile_to_c(type)
      end

   mapping_c_arg (type: TYPE) is
      do
         compile_to_c(type)
      end

   use_current (type: TYPE): BOOLEAN is
      do
         if code /= Void then
            Result := code.use_current(type)
         end
      end

   bracketed_pretty, pretty (indent_level: INTEGER) is
      do
         pretty_printer.keyword(once "agent")
         if inline_feature /= Void then
            inline_feature.inline_agent_pretty(indent_level + 1)
            if original_function_call.arguments /= Void then
               original_function_call.arguments.pretty(indent_level)
            end
         else
            original_function_call.to_expression.pretty(indent_level)
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE) is
      do
         short_printer.hook_or(as_agent, as_agent)
         short_printer.put_character(' ')
         code.to_expression.short(type)
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
      do
         not_yet_implemented
      end

feature {}
   specialize_2_function (type: TYPE): like Current is
      require
         {FUNCTION_CALL} ?:= code
      local
         function_call, fc: FUNCTION_CALL; procedure_call: PROCEDURE_CALL; arguments: EFFECTIVE_ARG_LIST
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; target_type: TYPE
      do
         function_call ::= code
         -- Well, the `function_call' will be checked during `specialize_2', so we have to
         -- prepare the trap:
         smart_eiffel.set_agent_creation_error_trap(Current)
         function_call ::= function_call.specialize_2(type)
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
      end

   specialize_2_procedure (type: TYPE): like Current is
      require
         {PROCEDURE_CALL} ?:= code
      local
         procedure_call, pc: PROCEDURE_CALL; arguments: EFFECTIVE_ARG_LIST
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; target_type: TYPE
      do
         procedure_call ::= code
         -- Well, the `procedure_call' will be checked during `specialize_2', so we have to
         -- prepare the trap:
         smart_eiffel.set_agent_creation_error_trap(Current)
         procedure_call ::= procedure_call.specialize_2(type)
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
      end

feature {AGENT_POOL}
   mold_id_in (type: TYPE; buffer: STRING) is
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

   same_mold_id_as (other: like Current): BOOLEAN is
      do
         Result := start_position = other.start_position
      end

   c_define_function (type: TYPE; mold_id: STRING; integer_mold_id: INTEGER) is
      local
         boost: BOOLEAN; agent_type, agent_result, t: TYPE; tm: TYPE_MARK;   i: INTEGER
         expression: EXPRESSION; compound_expression: COMPOUND_EXPRESSION
         open_operand: OPEN_OPERAND; closed_operand: CLOSED_OPERAND
      do
         boost := ace.boost
         agent_type := c_define_type(type, boost, mold_id, integer_mold_id)
         agent_result := agent_type.agent_result

         -- The agent launcher function:
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "%N/*agent launcher*/")
         if agent_result /= Void then
            agent_result.canonical_type_mark.c_type_for_result_in(cpp.pending_c_function_signature)
         else
            cpp.pending_c_function_signature.append(once "void")
         end
         cpp.pending_c_function_signature.append(once " _")
         cpp.pending_c_function_signature.append(mold_id)
         cpp.pending_c_function_signature.extend('(')
         if not boost then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller,")
         end
         if ace.profile then
            cpp.pending_c_function_signature.append(once "se_local_profile_t*parent_profile,")
         end
         cpp.pending_c_function_signature.append(once "se_")
         cpp.pending_c_function_signature.append(mold_id)
         cpp.pending_c_function_signature.append(once "*u")
         if open_operand_list /= Void then
            from
               i := open_operand_list.lower
            until
               i > open_operand_list.upper
            loop
               open_operand := open_operand_list.item(i)
               cpp.pending_c_function_signature.extend(',')
               tm := open_operand.resolve_in(type).canonical_type_mark
               tm.c_type_for_result_in(cpp.pending_c_function_signature)
               cpp.pending_c_function_signature.extend(' ')
               open_operand.c_name_in(cpp.pending_c_function_signature)
               i := i + 1
            end
         end
         cpp.pending_c_function_signature.extend(')')
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand := closed_operand_list.item(i)
               if stored_closed_operand(type, closed_operand) then
                  tm := closed_operand.resolve_in(type).canonical_type_mark
                  tm.c_type_for_result_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.extend(' ')
                  closed_operand.c_name_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once "=(u->")
                  closed_operand.c_name_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ");%N")
               end
               i := i + 1
            end
         end
         if not boost then
            cpp.pending_c_function_body.append(
               once "static se_frame_descriptor fd={%"Agent launcher%",0,0,%"%",1};%N")
         end
         if ace.profile then
            smart_eiffel.local_profile
         end
         if not boost then
            cpp.pending_c_function_body.append(once "[
               se_dump_stack ds;
               ds.fd=&fd;
               ds.current=NULL;
               ds.p=(caller->p);
               ds.caller=caller;
               ds.exception_origin=NULL;
               ds.locals=NULL;

               ]")
         end
         -- Calling the actual one:
         if ace.profile then
            smart_eiffel.start_profile_agent_creation(Current)
         end
         set_inside_agent_launcher_flag(True)
         if agent_result /= Void then
            if {COMPOUND_EXPRESSION} ?:= code then
               compound_expression ::= code
               compound_expression.compound_compile_to_c(type)
               expression := compound_expression.last.to_expression
            else
               expression ::= code
            end
            cpp.pending_c_function_body.append(once "u->R=")
            expression.compile_to_c(type)
            cpp.pending_c_function_body.append(once ";%N")
         elseif code /= Void then
            code.to_instruction.compile_to_c(type)
         end
         set_inside_agent_launcher_flag(False)
         if ace.profile then
            smart_eiffel.stop_profile
         end
         if agent_result /= Void then
            cpp.pending_c_function_body.append(once "return u->R;%N")
         end
         cpp.dump_pending_c_function(False)

         -- The agent creation function:
         cpp.prepare_c_function
         cpp.pending_c_function_signature.append(once "/*agent creation*/T0*")
         cpp.pending_c_function_signature.append(mold_id)
         cpp.pending_c_function_signature.extend('(')
         if not boost then
            cpp.pending_c_function_signature.append(once "se_dump_stack*caller")
         end
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand := closed_operand_list.item(i)
               if stored_closed_operand(type, closed_operand) then
                  if cpp.pending_c_function_signature.last /= '(' then
                     cpp.pending_c_function_signature.extend(',')
                  end
                  tm := closed_operand.resolve_in(type).canonical_type_mark
                  tm.c_type_for_result_in(cpp.pending_c_function_signature)
                  cpp.pending_c_function_signature.extend(' ')
                  closed_operand.c_name_in(cpp.pending_c_function_signature)
               end
               i := i + 1
            end
         end
         if cpp.pending_c_function_signature.last = '(' then
            cpp.pending_c_function_signature.append(once "void")
         end
         cpp.pending_c_function_signature.extend(')')
         cpp.pending_c_function_body.append(once "se_")
         cpp.pending_c_function_body.append(mold_id)
         cpp.pending_c_function_body.append(once "*u=(void*)new_agent(")
         agent_type.id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ");%Nu->creation_mold_id=")
         integer_mold_id.append_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.append(once ";%Nu->afp=_")
         cpp.pending_c_function_body.append(mold_id)
         cpp.pending_c_function_body.append(once ";%N")
         if is_equal_used_in(agent_type) then
            cpp.pending_c_function_body.append(once "u->eq=")
            is_equal_mold_id_in(type, cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(once ";%N")
         end
         if not gc_handler.is_off then
            cpp.pending_c_function_body.append(once "u->gc_mark_agent_mold=gc_mark_")
            cpp.pending_c_function_body.append(mold_id)
            cpp.pending_c_function_body.append(once ";%N")
         end
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand := closed_operand_list.item(i)
               if stored_closed_operand(type, closed_operand) then
                  cpp.pending_c_function_body.append(once "u->")
                  closed_operand.c_name_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.extend('=')
                  closed_operand.c_name_in(cpp.pending_c_function_body)
                  cpp.pending_c_function_body.append(once ";%N")
               end
               i := i + 1
            end
         end
         cpp.pending_c_function_body.append(once "return((T0*)u);%N")
         cpp.dump_pending_c_function(True)

         -- The gc_mark_MOLD_ID function:
         if not gc_handler.is_off then
            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "void gc_mark_")
            cpp.pending_c_function_signature.append(mold_id)
            cpp.pending_c_function_signature.append(once "(se_")
            cpp.pending_c_function_signature.append(mold_id)
            cpp.pending_c_function_signature.append(once "*u)")

            cpp.pending_c_function_body.append(once "gc_agent*gcu=(gc_agent*)u;%N%
                             %if (gcu->header.flag==FSOH_UNMARKED){%N%
                             %gcu->header.flag=FSOH_MARKED;%N")

            if closed_operand_list /= Void then
               from
                  i := closed_operand_list.lower
               until
                  i > closed_operand_list.upper
               loop
                  closed_operand := closed_operand_list.item(i)
                  if stored_closed_operand(type, closed_operand) then
                     t := closed_operand.resolve_in(type)
                     if t.is_reference then
                        cpp.pending_c_function_body.append(once "gc_mark(u->")
                        closed_operand.c_name_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once ");%N")
                     elseif t.need_gc_mark_function then
                        t.canonical_type_mark.gc_mark_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "(&(u->")
                        closed_operand.c_name_in(cpp.pending_c_function_body)
                        cpp.pending_c_function_body.append(once "));%N")
                     end
                  end
                  i := i + 1
               end
            end
            cpp.pending_c_function_body.append(once "}%N")
            cpp.dump_pending_c_function(True)
         end
         if is_equal_used_in(agent_type) then
            -- The is_equal function:
            is_equal_c_define_function(type)
         end
      end

feature {AGENT_CREATION}
   set_code (c: like code) is
      require
         c /= Void
      do
         code := c
      ensure
         code = c
      end

feature {}
   make (sp: like start_position; function_call: like original_function_call; a_inline_feature: like inline_feature) is
      require
         not sp.is_unknown
         function_call /= Void
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
      end

   c_define_type (type: TYPE; boost: BOOLEAN; mold_id: STRING; integer_mold_id: INTEGER): TYPE is
         -- The Result is the `agent_type'.
      require
         boost = ace.boost
         not cpp.pending_c_function
      local
         i: INTEGER; agent_type, agent_result: TYPE; closed_operand: CLOSED_OPERAND; tm: TYPE_MARK
      do
         agent_type := resolve_in(type)
         Result := agent_type
         cpp.out_h_buffer.copy(once "typedef struct _se_")
         cpp.out_h_buffer.append(mold_id)
         cpp.out_h_buffer.append(once " se_")
         cpp.out_h_buffer.append(mold_id)
         cpp.out_h_buffer.append(once ";%Nstruct _se_")
         cpp.out_h_buffer.append(mold_id)
         cpp.out_h_buffer.append(once "{Tid id;%Nint creation_mold_id;%N")
         agent_result := agent_type.agent_result
         if agent_result = Void then
            cpp.out_h_buffer.append(once "void")
         else
            agent_result.canonical_type_mark.c_type_for_result_in(cpp.out_h_buffer)
         end
         cpp.out_h_buffer.append(once "(*afp)(")
         if not boost then
            cpp.out_h_buffer.append(once "se_dump_stack*,")
         end
         if ace.profile then
            cpp.out_h_buffer.append(once "se_local_profile_t*,")
         end
         cpp.out_h_buffer.append(once "se_")
         cpp.out_h_buffer.append(mold_id)
         cpp.out_h_buffer.extend('*')
         if open_operand_list /= Void then
            from
               i := open_operand_list.lower
            until
               i > open_operand_list.upper
            loop
               cpp.out_h_buffer.extend(',')
               tm := open_operand_list.item(i).resolve_in(type).canonical_type_mark
               tm.c_type_for_result_in(cpp.out_h_buffer)
               i := i + 1
            end
         end
         cpp.out_h_buffer.append(once ");%N")
         if not gc_handler.is_off then
            cpp.out_h_buffer.append(once "[
                 void(*gc_mark_agent_mold)(se_
                 ]")
            cpp.out_h_buffer.append(mold_id)
            cpp.out_h_buffer.append(once "*);%N")
         end
         cpp.out_h_buffer.append(once "[
              int (*eq)(se_agent*,se_agent*);

              ]")
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               closed_operand := closed_operand_list.item(i)
               if stored_closed_operand(type, closed_operand) then
                  tm := closed_operand.resolve_in(type).canonical_type_mark
                  tm.c_type_for_result_in(cpp.out_h_buffer)
                  cpp.out_h_buffer.extend(' ')
                  closed_operand.c_name_in(cpp.out_h_buffer)
                  cpp.out_h_buffer.extend(';')
               end
               i := i + 1
            end
         end
         if agent_result /= Void then
            agent_result.canonical_type_mark.c_type_for_argument_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once " R;")
         end
         cpp.out_h_buffer.append(once "};%N")
         cpp.write_out_h_buffer
         if is_equal_used_in(agent_type) then
            is_equal_c_define_type_for(type)
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
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

feature {AGENT_CREATION}
   omitted_open_arguments_update (omitted_arguments: EFFECTIVE_ARG_LIST) is
      require
         omitted_arguments.count >= 1
      local
         i: INTEGER; open_operand: OPEN_OPERAND
--         function_call: FUNCTION_CALL; procedure_call: PROCEDURE_CALL
      do
--         error_handler.add_position(start_position)
--         error_handler.append("Please consider writing an explicit open argument list for your agent%
--                              %creation. Replace your code with: ")
--         if {FUNCTION_CALL} ?:= code then
--            function_call ::= code
--            error_handler.add_expression(function_call)
--         else
--            error_handler.append("%N")
--            procedure_call ::= code
--            error_handler.add_instruction(procedure_call)
--         end
--         error_handler.print_as_warning
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
      end

feature {}
   stored_closed_operand (type: TYPE; closed_operand: CLOSED_OPERAND): BOOLEAN is
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

   set_inside_agent_launcher_flag (flag_value: BOOLEAN) is
      local
         i: INTEGER
      do
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.upper
            until
               i < closed_operand_list.lower
            loop
               closed_operand_list.item(i).set_inside_agent_launcher_flag(flag_value)
               i := i - 1
            end
         end
      end

   is_equal_used_in (agent_type: TYPE): BOOLEAN is
         -- Because it is quite uncommon to use `is_equal' between two agents, this feature make it
         -- easy to skip the corresponding runtime support.
      require
         agent_type.is_agent
      do
         Result := agent_type.live_type.collected(any_is_equal_fs)
      end

   is_equal_mold_id_in (type: TYPE; buffer: STRING) is
      local
         i: INTEGER
      do
         buffer.append(once "agent_eq")
         if closed_operand_list /= Void then
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               buffer.extend('_')
               closed_operand_list.item(i).resolve_in(type).id.append_in(buffer)
               i := i + 1
            end
         end
         buffer.extend('_')
         original_function_call.feature_name.mapping_c_in(buffer)
      end

   is_equal_c_define_type_for (type: TYPE) is
         -- An alias type just to allow simple type casts.
      local
         i: INTEGER; expression: EXPRESSION; is_equal_mold_id: STRING
      do
         is_equal_mold_id := "... once unique buffer ..."
         is_equal_mold_id.clear_count
         is_equal_mold_id_in(type, is_equal_mold_id)
         if not is_equal_type_generated.has(is_equal_mold_id) then
            is_equal_type_generated.add(is_equal_mold_id.twin)
            cpp.out_h_buffer.copy(once "typedef struct _se_")
            cpp.out_h_buffer.append(is_equal_mold_id)
            cpp.out_h_buffer.append(once " se_")
            cpp.out_h_buffer.append(is_equal_mold_id)
            cpp.out_h_buffer.append(once ";%Nstruct _se_")
            cpp.out_h_buffer.append(is_equal_mold_id)
            cpp.out_h_buffer.append(once "{Tid id;%Nint creation_mold_id;%N")
            cpp.out_h_buffer.append(once "void*afp;%N")
            if not gc_handler.is_off then
               cpp.out_h_buffer.append(once "void*gc_mark_agent_mold;%N")
            end
            cpp.out_h_buffer.append(once "void*eq;%N")
            from
               i := closed_operand_list.lower
            until
               i > closed_operand_list.upper
            loop
               expression := closed_operand_list.item(i)
               if expression.is_void then
                  cpp.out_h_buffer.append(once "T0*")
               else
                  expression.resolve_in(type).canonical_type_mark.c_type_for_result_in(cpp.out_h_buffer)
               end
               cpp.out_h_buffer.append(once " c")
               i.append_in(cpp.out_h_buffer)
               cpp.out_h_buffer.extend(';')
               i := i + 1
            end
            cpp.out_h_buffer.append(once "};%N")
            cpp.write_out_h_buffer
         end
      end

   is_equal_c_define_function (type: TYPE) is
      local
         i: INTEGER; closed_operand: CLOSED_OPERAND; t: TYPE; is_equal_mold_id: STRING
      do
         is_equal_mold_id := "... once unique buffer ..."
         is_equal_mold_id.clear_count
         is_equal_mold_id_in(type, is_equal_mold_id)
         if not is_equal_function_generated.has(is_equal_mold_id) then
            is_equal_function_generated.add(is_equal_mold_id.twin)
            cpp.prepare_c_function
            cpp.pending_c_function_signature.append(once "/*agent is_equal*/int ")
            cpp.pending_c_function_signature.append(is_equal_mold_id)
            cpp.pending_c_function_signature.append(once "(se_agent*u1, se_agent*u2)")

            cpp.pending_c_function_body.append(once "int R=1;%Nse_")
            cpp.pending_c_function_body.append(is_equal_mold_id)
            cpp.pending_c_function_body.append(once "*a1=(se_")
            cpp.pending_c_function_body.append(is_equal_mold_id)
            cpp.pending_c_function_body.append(once "*)u1;%Nse_")
            cpp.pending_c_function_body.append(is_equal_mold_id)
            cpp.pending_c_function_body.append(once "*a2=(se_")
            cpp.pending_c_function_body.append(is_equal_mold_id)
            cpp.pending_c_function_body.append(once "*)u2;%N")
            if closed_operand_list /= Void then
               from
                  i := closed_operand_list.lower
               until
                  i > closed_operand_list.upper
               loop
                  closed_operand := closed_operand_list.item(i)
                  t := closed_operand.resolve_in(type)
                  cpp.pending_c_function_body.append(once "R&=")
                  if t.is_user_expanded and then t.canonical_type_mark.need_c_struct then
                     cpp.pending_c_function_body.append(once "se_cmpT")
                     t.id.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "(&(a1->c")
                     i.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "),&(a2->c")
                     i.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "))")
                  else
                     cpp.pending_c_function_body.append(once "a1->c")
                     i.append_in(cpp.pending_c_function_body)
                     cpp.pending_c_function_body.append(once "==a2->c")
                     i.append_in(cpp.pending_c_function_body)
                  end
                  cpp.pending_c_function_body.append(once ";%N")
                  i := i + 1
               end
            end
            cpp.pending_c_function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

   is_equal_function_generated: HASHED_SET[STRING] is
      once
         create Result.make
      end

   is_equal_type_generated: HASHED_SET[STRING] is
      once
         create Result.make
      end

invariant
   not start_position.is_unknown

end -- class AGENT_CREATION
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
