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
class LIBERTY_INTERPRETER_FEATURE_CALL

inherit
	LIBERTY_FEATURE_VISITOR

insert
	LIBERTY_TAGS

creation {LIBERTY_INTERPRETER}
	make, make_precursor

feature {ANY}
	name: FIXED_STRING
	target: LIBERTY_INTERPRETER_OBJECT
	parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]

feature {LIBERTY_INTERPRETER}
	call is
		do
			check_invariant
			check_precondition
			prepare_postcondition
			bound_feature.accept(Current)
			check_postcondition
			check_invariant
		end

feature {LIBERTY_INTERPRETER, LIBERTY_INTERPRETER_INSTRUCTIONS, LIBERTY_INTERPRETER_EXPRESSIONS}
	returned_object: LIBERTY_INTERPRETER_OBJECT

	set_returned_object (a_returned_object: like returned_object) is
		do
			returned_object := a_returned_object
		ensure
			returned_object = a_returned_object
		end

	local_static_type (local_name: FIXED_STRING): LIBERTY_ACTUAL_TYPE is
		do
			Result := local_types.reference_at(local_name)
		end

	set_local (local_name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			local_map.put(value, local_name)
		end

	returned_static_type: LIBERTY_ACTUAL_TYPE

	writable_feature_static_type (feature_name: LIBERTY_FEATURE_NAME): LIBERTY_ACTUAL_TYPE is
		do
			Result := target.type.feature_definition(feature_name).result_type.actual_type
		end

	set_writable_feature (a_name: LIBERTY_FEATURE_NAME; a_value: LIBERTY_INTERPRETER_OBJECT) is
		local
			struct: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
		do
			struct ::= target
			struct.put_attribute(a_name.name, a_value)
		end

	raised_exception: LIBERTY_INTERPRETER_EXCEPTION

	raise (a_exception: like raised_exception) is
		do
			raised_exception := a_exception
		ensure
			raised_exception = a_exception
		end

feature {LIBERTY_INTERPRETER}
	show_stack (o: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			o.put_string(once "Feature {")
			o.put_string(target.type.full_name)
			o.put_string(once "}.")
			o.put_line(name)
			o.put_new_line
			o.put_string(once "Current = ")
			target.show_stack(o, 0)
			if returned_object /= Void then
				o.put_new_line
				o.put_string(once "Result = ")
				returned_object.show_stack(o, 0)
			end
			if not parameter_map.is_empty then
				o.put_new_line
				o.put_line(once "Parameters:")
				from
					i := parameter_map.lower
				until
					i > parameter_map.upper
				loop
					o.put_new_line
					o.put_string(parameter_map.key(i))
					o.put_string(once " = ")
					parameters.item(i).show_stack(o, 0)
					i := i + 1
				end
			end
			if not local_map.is_empty then
				o.put_new_line
				o.put_line(once "Locals:")
				from
					i := local_map.lower
				until
					i > local_map.upper
				loop
					o.put_new_line
					o.put_string(local_map.key(i))
					o.put_string(once " = ")
					local_map.item(i).show_stack(o, 0)
					i := i + 1
				end
			end
		end

feature {LIBERTY_FEATURE_ATTRIBUTE}
	visit_liberty_feature_attribute (v: LIBERTY_FEATURE_ATTRIBUTE) is
		local
			t: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
		do
			if t ?:= target then
				t ::= target
				if not t.has_attribute(name) then
					interpreter.fatal_error("No such attribute: " + name)
				end
				returned_object := t.attribute_object(name)
			else
				--|*** TODO: not good. Native objects may have attributes too (e.g. string)
				interpreter.fatal_error("No such attribute: " + name)
			end
		end

feature {LIBERTY_FEATURE_CONSTANT}
	visit_liberty_feature_constant (v: LIBERTY_FEATURE_CONSTANT) is
		do
			v.expression.accept(interpreter.expressions)
			returned_object := interpreter.expressions.last_eval
		end

feature {LIBERTY_FEATURE_DEFERRED}
	visit_liberty_feature_deferred (v: LIBERTY_FEATURE_DEFERRED) is
		do
			interpreter.fatal_error("Deferred feature called")
		end

feature {LIBERTY_FEATURE_DO}
	visit_liberty_feature_do (v: LIBERTY_FEATURE_DO) is
		do
			prepare_local_maps(v)
			v.block_instruction.accept(interpreter.instructions)
		end

feature {LIBERTY_FEATURE_EXTERNAL}
	visit_liberty_feature_external (v: LIBERTY_FEATURE_EXTERNAL) is
		do
			not_yet_implemented
		end

feature {LIBERTY_FEATURE_ONCE}
	visit_liberty_feature_once (v: LIBERTY_FEATURE_ONCE) is
		local
			once_value_ref: LIBERTY_TAG_REF[LIBERTY_INTERPRETER_OBJECT]
		do
			if once_value_ref.is_set(v) then
				returned_object := once_value_ref.value(v)
			else
				prepare_local_maps(v)
				v.block_instruction.accept(interpreter.instructions)
				once_value_ref.add(returned_object, v)
			end
		end

feature {LIBERTY_FEATURE_REDEFINED}
	visit_liberty_feature_redefined (v: LIBERTY_FEATURE_REDEFINED) is
		do
			v.redefined_feature.accept(Current)
		end

feature {LIBERTY_FEATURE_UNIQUE}
	visit_liberty_feature_unique (v: LIBERTY_FEATURE_UNIQUE) is
		do
			not_yet_implemented
		end

feature {}
	make (a_interpreter: like interpreter; a_target: like target; a_feature_definition: LIBERTY_FEATURE_DEFINITION; a_parameters: like parameters) is
		require
			a_interpreter /= Void
			a_target /= Void
			a_feature_definition /= Void
			a_parameters /= Void
		do
			name := a_feature_definition.feature_name.full_name
			interpreter := a_interpreter
			target := a_target
			parameters := a_parameters
			bound_feature := a_feature_definition.the_feature.bound(a_target.type)
			if bound_feature.result_type /= Void then
				returned_static_type := bound_feature.result_type.actual_type
			end

			create {ARRAY_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_EXPRESSION]} old_values.with_capacity(0)
		ensure
			interpreter = a_interpreter
			target = a_target
			parameters = a_parameters
		end

	make_precursor (a_interpreter: like interpreter; a_target: like target; a_precursor: LIBERTY_FEATURE; a_parameters: like parameters) is
		require
			a_interpreter /= Void
			a_target /= Void
			a_parameters /= Void
		do
			name := name_precursor
			interpreter := a_interpreter
			target := a_target
			parameters := a_parameters
			bound_feature := a_precursor
			if bound_feature.result_type /= Void then
				returned_static_type := bound_feature.result_type.actual_type
			end

			create {ARRAY_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_EXPRESSION]} old_values.with_capacity(0)
		ensure
			interpreter = a_interpreter
			target = a_target
			parameters = a_parameters
		end

	name_precursor: FIXED_STRING is
		once
			Result := "Precursor".intern
		end

	interpreter: LIBERTY_INTERPRETER
	bound_feature: LIBERTY_FEATURE

	parameter_types: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]
	parameter_map: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

	local_types: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]
	local_map: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

	empty_types: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING] is
		once
			create {AVL_DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]} Result.make
		end

	empty_map: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING] is
		once
			create {AVL_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} Result.make
		end

	prepare_local_maps (f: LIBERTY_FEATURE_ROUTINE) is
		local
			i: INTEGER; p: LIBERTY_PARAMETER; l: LIBERTY_LOCAL
		do
			if f.parameters.count /= parameters.count then
				interpreter.fatal_error("Bad number of arguments: expected " + f.parameters.count.out
												+ " but got " + parameters.count.out)
			end
			if parameters.is_empty then
				parameter_types := empty_types
				parameter_map := empty_map
			else
				check
					f.parameters.lower = parameters.lower
				end
				create {HASHED_DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]} parameter_types.with_capacity(parameters.count)
				create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} parameter_map.with_capacity(parameters.count)
				from
					i := parameters.lower
				until
					i > parameters.upper
				loop
					p := f.parameters.item(i)
					parameter_types.add(p.result_type.actual_type, p.name)
					parameter_map.add(parameters.item(i), p.name)
					i := i + 1
				end
			end

			if f.locals.is_empty then
				local_types := empty_types
				local_map := empty_map
			else
				create {HASHED_DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]} local_types.with_capacity(f.locals.count)
				create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} local_map.with_capacity(f.locals.count)
				from
					i := f.locals.lower
				until
					i > f.locals.upper
				loop
					l := f.locals.item(i)
					local_types.add(l.result_type.actual_type, l.name)
					local_map.add(Void, l.name)
					i := i + 1
				end
			end
		ensure
			parameter_types /= Void
			parameter_map /= Void
			local_types /= Void
			local_map /= Void
		end

feature {LIBERTY_INTERPRETER}
	has_old_value (a_expression: LIBERTY_EXPRESSION): BOOLEAN is
		do
			Result := old_values.fast_has(a_expression)
		end

	old_value (a_expression: LIBERTY_EXPRESSION): LIBERTY_INTERPRETER_OBJECT is
		require
			has_old_value(a_expression)
		do
			Result := old_values.fast_at(a_expression)
		end

	add_old_value (a_expression: LIBERTY_EXPRESSION; a_value: LIBERTY_INTERPRETER_OBJECT) is
		do
			old_values.add(a_value, a_expression)
		ensure
			old_value(a_expression) = a_value
		end

feature {}
	check_invariant is
		do
			interpreter.assertions.validate(target.type.the_invariant, once "Invariant")
		end

	check_precondition is
		do
			interpreter.assertions.validate(bound_feature.precondition, once "Precondition")
		end

	prepare_postcondition is
		do
			interpreter.assertions.gather_old(bound_feature.postcondition)
		end

	check_postcondition is
		do
			interpreter.assertions.validate(bound_feature.postcondition, once "Postcondition")
		end

	old_values: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_EXPRESSION]

invariant
	interpreter /= Void
	parameters /= Void
	target /= Void
	name /= Void

end -- class LIBERTY_INTERPRETER_FEATURE_CALL
