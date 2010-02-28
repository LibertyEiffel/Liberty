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

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			if type = other.type then
				if type.is_expanded then
					Result := expanded_is_equal(other)
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
				interpreter.object_printer.show_stack(o, attributes.item(i), indent + 1)
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

invariant
	attributes /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_STRUCTURE
