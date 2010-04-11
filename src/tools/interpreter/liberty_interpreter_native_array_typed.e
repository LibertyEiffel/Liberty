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
		redefine
			hash_code
		end

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

	is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: like Current
		do
			if other.is_void then
				interpreter.fatal_error("Unexpected Void parameter")
			else
				o ::= other
				Result := elements = o.elements
			end
		end

	hash_code: INTEGER is
		do
			Result := elements.to_pointer.hash_code
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
				elements.item(i).out_in_tagged_out_memory
				i := i + 1
			end
			tagged_out_memory.append(once "]}")
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
	builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			i: INTEGER
			o: like Current
		do
			if type = other.type then
				o ::= other
				from
					Result := count = o.count
					i := lower
				until
					i > upper or else not Result
				loop
					Result := elements.item(i).is_equal(o.elements.item(i))
					i := i + 1
				end
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		do
			Result := builtin_is_equal(other)
		end

	builtin_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		local
			o: like Current
		do
			if type = other.type then
				o ::= other
				elements := o.elements
			else
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + other.type.full_name)
			end
		end

	builtin_twin (a_position: LIBERTY_POSITION): like Current is
		do
			create Result.with_storage(interpreter, type, item_type, elements.twin, a_position)
		end

	builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT) is
		do
			builtin_copy(other)
		end

	builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
		do
			create Result.with_storage(interpreter, type, item_type, elements.twin, a_position)
		end

feature {LIBERTY_INTERPRETER_OBJECT}
	do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			i: INTEGER; elements_twin: like elements
		do
			Result := deep_twin_memory.reference_at(Current)
			if Result = Void then
				create elements_twin.make(elements.capacity)
				from
					i := elements.lower
				until
					i > elements.upper
				loop
					put(item(i).do_deep_twin(deep_twin_memory, a_position), i)
					i := i + 1
				end
				create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[E_]} Result.with_storage(interpreter, type, item_type, elements_twin, a_position)
				deep_twin_memory.put(Result, Current)
			end
		end

	do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]): BOOLEAN is
		local
			i: INTEGER
			na: LIBERTY_INTERPRETER_NATIVE_ARRAY
		do
			if deep_equal_memory.fast_has(Current) then
				Result := True
			elseif object.type /= type then
				interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + object.type.full_name)
			elseif na ?:= object then -- may be Void!
				na ::= object
				if na.item_type /= item_type then
					interpreter.fatal_error("Type mismatch: expected " + type.full_name + ", but got " + object.type.full_name)
				else
					Result := count = na.count
					from
						i := lower
					until
						not Result or else i > upper
					loop
						Result := item(i).do_deep_equal(na.item(i), deep_equal_memory)
						i := i + 1
					end
				end
			end
			deep_equal_memory.fast_add(Current)
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		local
			e: E_; i: INTEGER
		do
			o.put_character('<')
			o.put_character('<')
			o.put_new_line
			from
				i := lower
			until
				i > 16 or else i > upper
			loop
				e := elements.item(i)
				interpreter.object_printer.put_indent(o, indent + 1)
				interpreter.object_printer.print_object(o, accessor.retrieve(e), indent + 1)
				i := i + 1
			end
			if upper > 16 then
				interpreter.object_printer.put_indent(o, indent + 1)
				o.put_line(once ". . .")
			end
			interpreter.object_printer.put_indent(o, indent)
			o.put_character('>')
			o.put_character('>')
			o.put_new_line
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS}
	builtin_element_sizeof: INTEGER is
		do
			not_yet_implemented
		end

	builtin_calloc (capacity: INTEGER; a_position: LIBERTY_POSITION): like Current is
		do
			create Result.make(interpreter, type, item_type, default_pointer, capacity, a_position)
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
	make (a_interpreter: like interpreter; a_type: like type; a_item_type: like item_type; a_storage: POINTER; a_capacity: INTEGER; a_position: like position) is
		require
			a_interpreter /= Void
			a_type /= Void
			a_item_type /= Void
			a_capacity >= 0
			a_position /= Void
			a_storage.is_not_null implies a_capacity > 0
		do
			interpreter := a_interpreter
			type := a_type
			item_type := a_item_type
			position := a_position
			if a_storage.is_null then
				create elements.make(a_capacity)
			else
				create elements.from_external(a_storage, a_capacity)
			end
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
			create elements.make(a_elements.count)
			from
				i := a_elements.lower
			until
				i > a_elements.upper
			loop
				elements.put(a_elements.item(i), i + elements.lower - a_elements.lower)
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

feature {LIBERTY_INTERPRETER_TO_EXTERNAL}
	to_external: POINTER is
		do
			Result := elements.to_external
		end

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR}
	from_external (a_external: POINTER; a_capacity: INTEGER) is
		do
			elements.from_external(a_external, a_capacity)
		end

invariant
	elements /= Void
	accessor /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED
