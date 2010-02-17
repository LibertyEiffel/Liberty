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

creation {LIBERTY_INTERPRETER_OBJECT_CREATOR}
	make

feature {ANY}
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
		ensure
			Result.name = a_attribute_name
		end

feature {LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		local
			i: INTEGER
		do
			put_indent(o, indent)
			o.put_character('{')
			o.put_string(type.full_name)
			o.put_string(once " [")
			o.put_new_line
			from
				i := attributes.lower
			until
				i > attributes.upper
			loop
				put_indent(o, indent + 1)
				o.put_string(attributes.key(i))
				o.put_string(once " = ")
				attributes.item(i).show_stack(o, indent + 1)
				i := i + 1
			end
			put_indent(o, indent)
			o.put_line(once "] }"
		end

feature {}
	make (a_type: like type) is
		require
			a_type /= Void
		do
			type := a_type
			create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} attributes.with_capacity(2)
		ensure
			type = a_type
		end

	attributes: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]

invariant
	attributes /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_STRUCTURE
