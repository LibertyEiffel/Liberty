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

creation {LIBERTY_INTERPRETER_OBJECT_CREATOR}
	make

feature {ANY}
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
	make (a_type: like type) is
		require
			a_type /= Void
		do
			type := a_type
			create {HASHED_DICTIONARY[LIBERTY_INTERPRETER_OBJECT, FIXED_STRING]} attributes.with_capacity(2)
		ensure
			type = a_type
		end

end -- class LIBERTY_INTERPRETER_OBJECT_NATIVE
