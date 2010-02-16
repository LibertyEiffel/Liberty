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
	make

feature{LIBERTY_INTERPRETER}
	call is
		local
			bound_feature: LIBERTY_FEATURE
		do
			bound_feature := feature_definition.the_feature.bound(target.type)
			returned_static_type := result_type
			bound_feature.accept(Current)
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

	set_writable_feature (name: LIBERTY_FEATURE_NAME; value: LIBERTY_INTERPRETER_OBJECT) is
		local
			struct: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
		do
			struct ::= target
			struct.put_attribute(name.name, value)
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
			o.put_line(name.name)
			o.put_new_line
			o.put_string(once "Current = ")
			target.show_stack(o, 0)
			if returned_object /= Void then
				o.put_new_line
				o.put_string(once "Result = ")
				returned_object.show_stack(o, 0)
			end
			if not parameters.is_empty then
				o.put_new_line
				o.put_line(once "Parameters:")
				from
					i := parameters.lower
				until
					i > parameters.upper
				loop
					o.put_new_line
					o.put_string(parameters.key(i))
					o.put_string(once " = ")
					parameters.item(i).show_stack(o, 0)
					i := i + 1
				end
			end
			if not locals.is_empty then
				o.put_new_line
				o.put_line(once "Locals:")
				from
					i := locals.lower
				until
					i > locals.upper
				loop
					o.put_new_line
					o.put_string(locals.key(i))
					o.put_string(once " = ")
					locals.item(i).show_stack(o, 0)
					i := i + 1
				end
			end
		end

feature {LIBERTY_FEATURE_ATTRIBUTE}
	visit_liberty_feature_attribute (v: LIBERTY_FEATURE_ATTRIBUTE) is
		do
			if not target.has_attribute(name.name) then
				interpreter.fatal_error("No such attribute: " + name.name)
			end
			returned_object := target.attribute_object(name.name)
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
			once_value: LIBERTY_TYPED_TAG[LIBERTY_INTERPRETER_OBJECT]
		do
			if once_value_ref.is_set(v) then
				once_value ::= once_value_ref.value(v)
				returned_object := once_value.value
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
	make (a_interpreter: like interpreter; a_target: like target; a_feature_definition: like feature_definition; a_parameters: like parameters) is
		require
			a_interpreter /= Void
			a_target /= Void
			a_feature_definition /= Void
			a_parameters /= Void
		do
			interpreter := a_interpreter
			target := a_target
			feature_definition := a_feature_definition
			parameters := a_parameters
		ensure
			interpreter = a_interpreter
			target = a_target
			feature_definition = a_feature_definition
			parameters = a_parameters
		end

	interpreter: LIBERTY_INTERPRETER
	target: LIBERTY_INTERPRETER_OBJECT
	feature_definition: LIBERTY_FEATURE_DEFINITION
	parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]

	parameter_map: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]
	local_map: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

	parameter_types: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]
	local_types: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]

	prepare_local_maps (f: LIBERTY_FEATURE_ROUTINE) is
		local
			i: INTEGER; p: LIBERTY_PARAMETER; l: LIBERTY_LOCAL
		do
			if f.parameters.count /= parameters.count then
				interpreter.fatal_error("Bad number of arguments: expected " + f.parameters.count.out
												+ " but got " + parameters.count)
			end
			check
				f.parameters.lower = parameters.lower
			end
			create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} parameter_map.with_capacity(parameters.count)
			create {HASHED_DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]} parameter_types.with_capacity(parameters.count)
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				p := f.parameters.item(i)
				parameter_types.add(p.type, p.name)
				parameter_map.add(Void, p.name)
				i := i + 1
			end

			create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} local_map.with_capacity(locals.count)
			create {HASHED_DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]} local_types.with_capacity(locals.count)
			from
				i := f.locals.lower
			until
				i > f.locals.upper
			loop
				l := f.locals.item(i)
				local_types.add(l.type, l.name)
				local_map.add(Void, l.name)
				i := i + 1
			end
		ensure
			parameter_types /= Void
			parameter_map /= Void
			local_types /= Void
			local_map /= Void
		end

invariant
	interpreter /= Void
	parameters /= Void
	target /= Void
	name /= Void

end -- class LIBERTY_INTERPRETER_FEATURE_CALL
