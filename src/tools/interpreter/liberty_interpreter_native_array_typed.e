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
class LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[E_]

inherit
	LIBERTY_INTERPRETER_NATIVE_ARRAY

creation {LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR, LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED, LIBERTY_INTERPRETER}
	make, with_storage

feature {ANY}
	copy (other: like Current) is
		do
			interpreter := other.interpreter
			accessor := other.accessor
			type := other.type
			item_type := other.item_type
			elements := other.elements
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := elements = other.elements
		end

	item (index: INTEGER): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := accessor.retrieve(elements.item(index))
		end

	put (o: LIBERTY_INTERPRETER_OBJECT; index: INTEGER) is
		do
			elements.put(accessor.store(o), index)
		end

	first: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := accessor.retrieve(elements.first)
		end

	last: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := accessor.retrieve(elements.last)
		end

	lower: INTEGER is
		do
			Result := elements.lower
		end

	upper: INTEGER is
		do
			Result := elements.upper
		end

	count: INTEGER is
		do
			Result := elements.count
		end

	is_empty: BOOLEAN is
		do
			Result := elements.is_empty
		end

	new_iterator: ITERATOR[LIBERTY_INTERPRETER_OBJECT] is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ITERATOR[E_]} Result.make(elements.new_iterator, accessor)
		end

	out_in_tagged_out_memory is
		local
			i: INTEGER
		do
			tagged_out_memory.extend('{')
			tagged_out_memory.append(type.full_name)
			tagged_out_memory.extend('[')
			from
				i := elements.lower
			until
				i > elements.upper
			loop
				if i > elements.lower then
					tagged_out_memory.append(once ", ")
				end
				if elements.item(i) = Void then
					tagged_out_memory.append(once "Void")
				else
					elements.item(i).out_in_tagged_out_memory
				end
				i := i + 1
			end
			tagged_out_memory.append(once "]}")
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		local
			e: E_; i: INTEGER
		do
			o.put_character('[')
			o.put_new_line
			from
				i := lower
			until
				i > upper
			loop
				e := elements.item(i)
				interpreter.object_printer.put_indent(o, indent + 1)
				interpreter.object_printer.show_stack(o, accessor.retrieve(e), indent + 1)
				i := i + 1
			end
			interpreter.object_printer.put_indent(o, indent)
			o.put_character(']')
			o.put_new_line
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS}
	builtin_element_sizeof: INTEGER is
		do
			not_yet_implemented
		end

	builtin_calloc (capacity: INTEGER; a_position: LIBERTY_POSITION): like Current is
		do
			create Result.make(interpreter, type, item_type, capacity, a_position)
		end

	builtin_slice_copy (at: INTEGER; src: like Current; src_min, src_max: INTEGER) is
		local
			i, j: INTEGER
		do
			from
				i := src_min
				j := at
			until
				i > src_max
			loop
				put(src.item(i), j)
				i := i + 1
				j := j + 1
			end
		end

feature {}
	make (a_interpreter: like interpreter; a_type: like type; a_item_type: like item_type; a_capacity: INTEGER; a_position: like position) is
		require
			a_interpreter /= Void
			a_type /= Void
			a_item_type /= Void
			a_capacity >= 0
			a_position /= Void
		do
			interpreter := a_interpreter
			type := a_type
			item_type := a_item_type
			position := a_position
			create elements.make(a_capacity)
			accessor ::= accessor_factory.accessor(a_interpreter, a_item_type, a_position)
		ensure
			interpreter = a_interpreter
			type = a_type
			item_type = a_item_type
			position = a_position
		end

	with_storage (a_interpreter: like interpreter; a_type: like type; a_item_type: like item_type; a_elements: TRAVERSABLE[E_]; a_position: like position) is
		require
			a_interpreter /= Void
			a_elements /= Void
			a_position /= Void
		local
			i: INTEGER
		do
			interpreter := a_interpreter
			type := a_type
			item_type := a_item_type
			position := a_position
			create elements.make(a_elements.upper - a_elements.lower + 1)
			from
				i := a_elements.lower
			until
				i > a_elements.upper
			loop
				elements.put(a_elements.item(i), i)
				i := i + 1
			end
			accessor ::= accessor_factory.accessor(a_interpreter, item_type, a_position)
		ensure
			interpreter = a_interpreter
			type = a_type
			item_type = a_item_type
			position = a_position
		end

	expanded_twin: like Current is
		do
			Result := twin
		end

	accessor_factory: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY is
		once
			create Result.make
		end

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED}
	accessor: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[E_]

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED, LIBERTY_INTERPRETER_OBJECT_PRINTER}
	elements: FAST_ARRAY[E_]

invariant
	elements /= Void
	accessor /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED
