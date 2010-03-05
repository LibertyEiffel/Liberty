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
class LIBERTY_INTERPRETER_OBJECT_STRUCTURE

inherit
	LIBERTY_INTERPRETER_OBJECT

creation {LIBERTY_INTERPRETER_OBJECT_CREATOR, LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
	make

creation {LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
	with_attributes

feature {ANY}
	is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			is_equal_feature: LIBERTY_FEATURE_DEFINITION
			expanded_equal: LIBERTY_INTERPRETER_OBJECT_BOOLEAN
		do
			if other.is_void then
				-- Obviously this object is not Void.
			elseif type = other.type then
				if type.is_expanded then
					is_equal_feature := type.feature_definition(is_equal_feature_name)
					expanded_equal ::= interpreter.item_feature(Current, is_equal_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << other >> }, position)
					Result := expanded_equal.item
				else
					Result := Current = other
				end
			end
		end

	put_attribute (a_attribute_name: FIXED_STRING; a_attribute: LIBERTY_INTERPRETER_OBJECT) is
		require
			a_attribute /= Void
		do
			attributes.put(a_attribute, a_attribute_name)
		ensure
			attribute_object(a_attribute_name) = a_attribute
		end

	del_attribute (a_attribute_name: FIXED_STRING) is
		require
			a_attribute_name /= Void
		do
		ensure
			not has_attribute(a_attribute_name)
		end

	has_attribute (a_attribute_name: FIXED_STRING): BOOLEAN is
		require
			a_attribute_name /= Void
		do
			Result := attributes.fast_has(a_attribute_name)
		end

	attribute_object (a_attribute_name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		require
			a_attribute_name /= Void
		do
			Result := attributes.fast_at(a_attribute_name)
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
	builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			source: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
			i: INTEGER
		do
			if other.type /= type then
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			else
				source ::= other
				Result := attributes.count = source.attributes.count
				from
					i := source.attributes.lower
				until
					not Result or else i > source.attributes.upper
				loop
					-- That "and then" expression may look funny but it ensures that both structures have exactly
					-- the same keys.
					Result := attributes.item(i).is_equal(source.attributes.at(attributes.key(i)))
						and then source.attributes.item(i).is_equal(attributes.at(source.attributes.key(i)))
					i := i + 1
				end
			end
		end

	builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		do
			Result := builtin_is_equal(other)
		end

	builtin_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		local
			source: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
			i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
		do
			if other.type /= type then
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			else
				source ::= other
				attributes.clear_count
				from
					i := source.attributes.lower
				until
					i > source.attributes.upper
				loop
					o := source.attributes.item(i).storage_twin
					attributes.put(o, source.attributes.key(i))
					i := i + 1
				end
			end
		end

	builtin_twin (a_position: LIBERTY_POSITION): like Current is
		local
			copy_feature: LIBERTY_FEATURE_DEFINITION
		do
			Result ::= interpreter.new_object(type, a_position)
			copy_feature := type.feature_definition(copy_feature_name)
			interpreter.call_feature(Result, copy_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << Current >> }, a_position)
		end

	builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		do
			builtin_copy(other)
		end

	builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
		local
			copy_feature: LIBERTY_FEATURE_DEFINITION
		do
			Result ::= interpreter.new_object(type, a_position)
			copy_feature := type.feature_definition(standard_copy_feature_name)
			interpreter.call_feature(Result, copy_feature, {FAST_ARRAY[LIBERTY_EXPRESSION] << Current >> }, a_position)
		end

feature {LIBERTY_INTERPRETER_OBJECT}
	do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
			att: like attributes
		do
			Result := deep_twin_memory.reference_at(Current)
			if Result = Void then
				create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} att.with_capacity(attributes.capacity)
				from
					i := attributes.lower
				until
					i > attributes.upper
				loop
					o := attributes.item(i).do_deep_twin(deep_twin_memory, a_position)
					att.put(o, attributes.key(i))
					i := i + 1
				end
				create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE} Result.with_attributes(interpreter, type, att, a_position)
				deep_twin_memory.put(Result, Current)
			end
		end

	do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]): BOOLEAN is
		local
			i: INTEGER; o: LIBERTY_INTERPRETER_OBJECT
			compared: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
		do
			if deep_equal_memory.fast_has(Current) then
				Result := True
			elseif object.type /= type then
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + object.type.full_name)
			elseif compared ?:= object then -- may be Void!
				compared ::= object
				Result := attributes.count = compared.attributes.count
				from
					i := attributes.lower
				until
					not Result or else i > attributes.upper
				loop
					o := compared.attributes.reference_at(attributes.key(i))
					Result := o /= Void and then attributes.item(i).do_deep_equal(o, deep_equal_memory)
					i := i + 1
				end
			end
			deep_equal_memory.fast_add(Current)
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		local
			i: INTEGER
		do
			o.put_character('{')
			o.put_string(type.full_name)
			o.put_string(once " [")
			o.put_new_line
			from
				i := attributes.lower
			until
				i > attributes.upper
			loop
				interpreter.object_printer.put_indent(o, indent + 1)
				o.put_string(attributes.key(i))
				o.put_string(once " = ")
				interpreter.object_printer.print_object(o, attributes.item(i), indent + 1)
				i := i + 1
			end
			interpreter.object_printer.put_indent(o, indent)
			o.put_line(once "] }")
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
			create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} attributes.with_capacity(2)
		ensure
			interpreter = a_interpreter
			type = a_type
			position = a_position
		end

	with_attributes (a_interpreter: like interpreter; a_type: like type; a_attributes: like attributes; a_position: like position) is
		require
			a_interpreter /= Void
			a_type /= Void
			a_attributes /= Void
			a_position /= Void
		do
			interpreter := a_interpreter
			type := a_type
			attributes := a_attributes
			position := a_position
		ensure
			interpreter = a_interpreter
			type = a_type
			attributes = a_attributes
			position = a_position
		end

feature {LIBERTY_INTERPRETER_OBJECT_STRUCTURE}
	attributes: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

feature {}
	expanded_is_equal (other: like Current): BOOLEAN is
		require
			other.type = type
			type.is_expanded
		local
			i: INTEGER; name: FIXED_STRING
		do
			if attributes.count = other.attributes.count then
				from
					Result := True
					i := attributes.lower
				until
					not Result or else i > attributes.upper
				loop
					name := attributes.key(i)
					Result := other.attributes.fast_has(name) and then attributes.item(i).is_equal(other.attributes.fast_at(name))
					i := i + 1
				end
			end
		end

	expanded_twin: like Current is
		local
			i: INTEGER
		do
			create Result.make(interpreter, type, position)
			from
				i := attributes.lower
			until
				i > attributes.upper
			loop
				Result.put_attribute(attributes.key(i), attributes.item(i).storage_twin)
				i := i + 1
			end
		end

	copy_feature_name: LIBERTY_FEATURE_NAME is
		once
			create Result.make("copy".intern)
		end

	standard_copy_feature_name: LIBERTY_FEATURE_NAME is
		once
			create Result.make("standard_copy".intern)
		end

	is_equal_feature_name: LIBERTY_FEATURE_NAME is
		once
			create Result.make("is_equal".intern)
		end

invariant
	attributes /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_STRUCTURE
