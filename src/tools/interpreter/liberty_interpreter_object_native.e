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
class LIBERTY_INTERPRETER_OBJECT_NATIVE[E_]

inherit
	LIBERTY_INTERPRETER_OBJECT

creation {LIBERTY_INTERPRETER_OBJECT_CREATOR, LIBERTY_INTERPRETER_OBJECT_NATIVE, LIBERTY_INTERPRETER_EXPRESSIONS}
	make, with_item

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			Result := item = other.item
		end

	item: E_

	set_item (a_item: like item) is
		do
			item := a_item
		ensure
			item = a_item
		end

feature {LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		do
			put_indent(o, indent)
			if item = Void then
				o.put_string(once "Void")
			else
				item.print_on(o)
			end
			o.put_new_line
		end

feature {}
	make (a_interpreter: like interpreter; a_type: like type) is
		require
			a_interpreter /= Void
			a_type /= Void
		do
			interpreter := a_interpreter
			type := a_type
		ensure
			interpreter = a_interpreter
			type = a_type
		end

	with_item (a_interpreter: like interpreter; a_type: like type; a_item: like item) is
		require
			a_interpreter /= Void
			a_type /= Void
		do
			make(a_interpreter, a_type)
			item := a_item
		ensure
			interpreter = a_interpreter
			type = a_type
			item = a_item
		end

	expanded_twin: like Current is
		do
			create Result.with_item(interpreter, type, item)
		end

end -- class LIBERTY_INTERPRETER_OBJECT_NATIVE
