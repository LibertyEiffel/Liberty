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
deferred class LIBERTY_INTERPRETER_OBJECT_NATIVE[E_]

inherit
	LIBERTY_INTERPRETER_OBJECT

feature {ANY}
	is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: like Current
		do
			if other.is_void then
				-- Obviously this object is not Void.
			else
				o ::= other
				Result := item = o.item
			end
		end

	item: E_

	set_item (a_item: like item) is
		do
			item := a_item
		ensure
			item = a_item
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
	builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				Result := item.is_equal(o.item)
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				Result := item.is_equal(o.item)
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				item := o.item
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_twin (a_position: LIBERTY_POSITION): like Current is
		do
			Result := storage_twin
		end

	builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				item := o.item
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
		do
			Result := storage_twin
		end

feature {LIBERTY_INTERPRETER_OBJECT}
	do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := storage_twin
		end

	do_deep_equal (other: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]): BOOLEAN is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				Result := item.is_equal(o.item)
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		do
			item.print_on(o)
			o.put_new_line
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

	with_item (a_interpreter: like interpreter; a_type: like type; a_item: like item; a_position: like position) is
		require
			a_interpreter /= Void
			a_type /= Void
			a_position /= Void
		do
			make(a_interpreter, a_type, a_position)
			item := a_item
		ensure
			interpreter = a_interpreter
			type = a_type
			item = a_item
			position = a_position
		end

invariant
	item_is_expanded: item /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_NATIVE
