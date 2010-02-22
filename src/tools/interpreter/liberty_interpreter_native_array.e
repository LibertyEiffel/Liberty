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
class LIBERTY_INTERPRETER_NATIVE_ARRAY[E_]

inherit
	LIBERTY_INTERPRETER_OBJECT
		export {LIBERTY_INTERPRETER_NATIVE_ARRAY}
			interpreter
		undefine
			out_in_tagged_out_memory
		redefine
			copy
		end
	TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]
		undefine
			out_in_tagged_out_memory
		redefine
			copy, is_equal
		end

creation {LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR, LIBERTY_INTERPRETER_EXPRESSIONS}
	make, with_storage

feature {ANY}
	item_type: LIBERTY_ACTUAL_TYPE

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

	copy (other: like Current) is
		local
			i: INTEGER
		do
			interpreter := other.interpreter
			accessor := other.accessor
			type := other.type
			item_type := other.item_type
			create elements.with_capacity(other.count)
			from
				i := other.lower
			until
				i > other.upper
			loop
				add_last(other.item(i).storage_twin)
				i := i + 1
			end
		end

	item (index: INTEGER): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := accessor.retrieve(elements.item(index))
		end

	put (o: LIBERTY_INTERPRETER_OBJECT; index: INTEGER) is
		require
			valid_index(index)
		do
			elements.put(accessor.store(o), index)
		end

	add_last (o: LIBERTY_INTERPRETER_OBJECT) is
		do
			elements.add_last(accessor.store(o))
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

feature {LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		local
			e: E_; i: INTEGER
		do
			put_indent(o, indent)
			o.put_character('[')
			from
				i := lower
			until
				i > upper
			loop
				e := elements.item(i)
				if i > lower then
					o.put_string(once ", ")
				end
				if e = Void then
					o.put_string(once "Void")
				else
					e.print_on(o)
				end
				i := i + 1
			end
			o.put_character(']')
			o.put_new_line
		end

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY}
	accessor: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[E_]

feature {}
	make (a_interpreter: like interpreter; a_type: like type; a_item_type: like item_type; a_capacity: INTEGER) is
		require
			a_interpreter /= Void
			a_type /= Void
			a_item_type /= Void
			a_capacity >= 0
		do
			interpreter := a_interpreter
			type := a_type
			item_type := item_type
			create elements.with_capacity(a_capacity)
			accessor ::= accessor_factory.accessor(a_interpreter, item_type)
		ensure
			interpreter = a_interpreter
			type = a_type
			item_type = a_item_type
		end

	with_storage (a_interpreter: like interpreter; a_type: like type; a_item_type: like item_type; a_elements: TRAVERSABLE[E_]) is
		require
			a_interpreter /= Void
			a_elements /= Void
		local
			i: INTEGER
		do
			interpreter := a_interpreter
			type := a_type
			item_type := a_item_type
			create elements.with_capacity(a_elements.upper - a_elements.lower + 1)
			from
				i := a_elements.lower
			until
				i > a_elements.upper
			loop
				elements.add_last(a_elements.item(i))
				i := i + 1
			end
			accessor ::= accessor_factory.accessor(a_interpreter, item_type)
		ensure
			interpreter = a_interpreter
			type = a_type
			item_type = a_item_type
		end

	expanded_twin: like Current is
		do
			Result := twin
		end

	accessor_factory: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY is
		once
			create Result.make
		end

	elements: FAST_ARRAY[E_]

invariant
	elements /= Void
	accessor /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY
