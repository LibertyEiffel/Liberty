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
class LIBERTY_INTERPRETER_AGENT

inherit
   LIBERTY_INTERPRETER_OBJECT

create {LIBERTY_INTERPRETER_OBJECT_CREATOR}
   make

feature {ANY}
   type: LIBERTY_ACTUAL_TYPE
   call: LIBERTY_CALL_EXPRESSION
   arguments: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]
   creation_target: LIBERTY_INTERPRETER_OBJECT

   hash_code: INTEGER is
      do
         Result := to_pointer.hash_code
      end

   is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
      do
         Result := other = Current
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT is
      do
         not_yet_implemented
      end

feature {LIBERTY_INTERPRETER}
   set_call (a_target: like creation_target; a_call: like call; args: like arguments) is
      require
         call = Void
         a_call.is_agent_call
         args.count = a_call.actuals.count
      do
         if a_call.target = Void then
            creation_target := a_target
         else
            a_call.target.accept(interpreter.expressions)
            creation_target := interpreter.expressions.eval_as_target
         end
         call := a_call
         arguments := args
      ensure
         call = a_call
         arguments = args
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_FUNCTION_BUILTINS}
   item_agent (parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]; call_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      local
         target, real_target: LIBERTY_INTERPRETER_OBJECT
         args: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]
      do
         if call.target = Void then
            real_target := creation_target
            args := unpack_tuple_and_closed(parameters, call_position, False)
         else
            call.target.accept(interpreter.expressions)
            target := interpreter.expressions.eval_as_target
            real_target := unpack_target(target, parameters, call_position)
            args := unpack_tuple_and_closed(parameters, call_position, target.is_open)
         end
         Result := interpreter.item_feature(real_target, call.entity.feature_definition, args, call_position)
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ROUTINE_BUILTINS}
   call_agent (parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]; call_position: LIBERTY_POSITION) is
      local
         lost_object: LIBERTY_INTERPRETER_OBJECT
      do
         -- Because the `call' feature of a routine may call a function; in that case the result is lost
         -- (temporary because of SmartEiffel)
         --
         -- ECMA instead sets the `last_result' attribute of ROUTINE; but how the hell is `last_result'
         -- typed?? (seems not to be specified)
         --
         lost_object := item_agent(parameters, call_position)
      end

feature {}
   unpack_target (target: LIBERTY_INTERPRETER_OBJECT; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]; call_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      local
         tuple: LIBERTY_INTERPRETER_TUPLE
      do
         check
            parameters.count = 1
            tuple ?:= parameters.first
         end
         if target.is_open then
            tuple ::= parameters.first
            Result := tuple.first
         else
            Result := target
         end
      end

   unpack_tuple_and_closed (parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]; call_position: LIBERTY_POSITION; target_is_open: BOOLEAN): TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT] is
      local
         tuple: LIBERTY_INTERPRETER_TUPLE
         tuple_index: INTEGER
         arg: LIBERTY_INTERPRETER_OBJECT
         i: INTEGER
         args: FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]
      do
         check
            parameters.count = 1
            tuple ?:= parameters.first
         end
         tuple ::= parameters.first
         tuple_index := tuple.lower
         if target_is_open then
            tuple_index := tuple_index + 1
         end
         if arguments.count = 0 then
            Result := tuple
         else
            create args.with_capacity(arguments.count)
            Result := args
            from
               i := arguments.lower
            until
               i > arguments.upper
            loop
               arg := arguments.item(i)
               if arg.is_open then
                  arg := tuple.item(tuple_index)
                  check
                     arg.type.is_conform_to(arguments.item(i).type)
                  end
                  tuple_index := tuple_index + 1
               end
               check
                  not arg.is_open
               end
               args.add_last(arg)
               i := i + 1
            end
         end
      end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
   builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      do
         not_yet_implemented
      end

   builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
      do
         not_yet_implemented
      end

   builtin_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
      do
         not_yet_implemented
      end

   builtin_twin (a_position: LIBERTY_POSITION): like Current is
      do
         not_yet_implemented
      end

   builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
      do
         not_yet_implemented
      end

   builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
      do
         not_yet_implemented
      end

feature {LIBERTY_INTERPRETER_OBJECT}
   do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
      do
         not_yet_implemented
      end

   do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): BOOLEAN is
      do
         not_yet_implemented
      end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
   show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
      do
         o.put_string(once "agent {")
         o.put_string(call.entity.target_type.known_type.full_name)
         o.put_string(once "}.")
         o.put_line(call.entity.feature_name.full_name)
      end

feature {}
   expanded_twin: like Current is
      do
         check False end
      end

feature {}
   make (a_interpreter: like interpreter; a_type: like type; a_position: like position) is
      require
         a_interpreter /= Void
         a_type /= Void
         a_position /= Void
      do
         interpreter := a_interpreter
         type := a_type
         position := a_position
      ensure
         interpreter = a_interpreter
         type = a_type
         position = a_position
      end

invariant
   call /= Void implies call.is_agent_call
   call /= Void implies arguments /= Void
   call /= Void implies creation_target /= Void

end -- class LIBERTY_INTERPRETER_AGENT
