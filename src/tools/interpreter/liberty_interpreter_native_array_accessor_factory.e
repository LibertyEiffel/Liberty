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
class LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY
	--
	-- To retain some efficiency, native arrays of native types directly use the native objects. But they must
	-- be retrieved in a LIBERTY_INTERPRETER_OBJECT at usage time, and stored back.
	--


inherit
	LIBERTY_TYPE_VISITOR

creation {LIBERTY_INTERPRETER_NATIVE_ARRAY}
	make

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY}
	accessor (a_interpreter: like interpreter; a_type: LIBERTY_ACTUAL_TYPE; a_position: like position): LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR is
		do
			interpreter := a_interpreter
			position := a_position
			a_type.accept(Current)
			Result := last_accessor
		end

feature {LIBERTY_UNIVERSE}
	visit_type_any (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_any(?, position), agent store_any)
		end

	visit_type_arguments (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_user_type(?, type, position), agent store_user_type)
		end

	visit_type_platform (type: LIBERTY_ACTUAL_TYPE) is
		do
			check False end
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[POINTER]} last_accessor.make(agent retrieve_pointer(?, position), agent store_pointer)
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_64]} last_accessor.make(agent retrieve_integer_64(?, position), agent store_integer_64)
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_64]} last_accessor.make(agent retrieve_integer_32(?, position), agent store_integer_32)
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_64]} last_accessor.make(agent retrieve_integer_16(?, position), agent store_integer_16)
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_64]} last_accessor.make(agent retrieve_integer_8(?, position), agent store_integer_8)
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_128]} last_accessor.make(agent retrieve_real_64(?, position), agent store_real_64)
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_128]} last_accessor.make(agent retrieve_real_32(?, position), agent store_real_32)
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_128]} last_accessor.make(agent retrieve_real_80(?, position), agent store_real_80)
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_128]} last_accessor.make(agent retrieve_real_128(?, position), agent store_real_128)
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[CHARACTER]} last_accessor.make(agent retrieve_character(?, position), agent store_character)
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_user_type(?, type, position), agent store_user_type)
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[BOOLEAN]} last_accessor.make(agent retrieve_boolean(?, position), agent store_boolean)
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE) is
		do
			check False end
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_tuple(?, position), agent store_tuple)
		end

	visit_type_routine (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_routine(?, position), agent store_routine)
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_procedure(?, position), agent store_procedure)
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_function(?, position), agent store_function)
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_predicate(?, position), agent store_predicate)
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_user_type(?, type, position), agent store_user_type)
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (type: LIBERTY_VOID_TYPE) is
		do
			check False end
		end

feature {}
	make is
		do
		end

	interpreter: LIBERTY_INTERPRETER
	last_accessor: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR
	position: LIBERTY_POSITION

feature {} -- The retrievers
	retrieve_any (item: LIBERTY_INTERPRETER_OBJECT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_pointer (item: POINTER; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[POINTER]} Result.with_item(interpreter, interpreter.universe.type_pointer, item, a_position)
		end

	retrieve_integer_64 (item: INTEGER_64; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} Result.with_item(interpreter, interpreter.universe.type_integer_64, item, a_position)
		end

	retrieve_integer_32 (item: INTEGER_64; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} Result.with_item(interpreter, interpreter.universe.type_integer_32, item, a_position)
		end

	retrieve_integer_16 (item: INTEGER_64; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} Result.with_item(interpreter, interpreter.universe.type_integer_16, item, a_position)
		end

	retrieve_integer_8 (item: INTEGER_64; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} Result.with_item(interpreter, interpreter.universe.type_integer_8, item, a_position)
		end

	retrieve_real_64 (item: REAL_128; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} Result.with_item(interpreter, interpreter.universe.type_real_64, item, a_position)
		end

	retrieve_real_32 (item: REAL_128; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} Result.with_item(interpreter, interpreter.universe.type_real_32, item, a_position)
		end

	retrieve_real_80 (item: REAL_128; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} Result.with_item(interpreter, interpreter.universe.type_real_80, item, a_position)
		end

	retrieve_real_128 (item: REAL_128; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} Result.with_item(interpreter, interpreter.universe.type_real_128, item, a_position)
		end

	retrieve_character (item: CHARACTER; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[CHARACTER]} Result.with_item(interpreter, interpreter.universe.type_character, item, a_position)
		end

	retrieve_boolean (item: BOOLEAN; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_BOOLEAN} Result.with_item(interpreter, interpreter.universe.type_boolean, item, a_position)
		end

	retrieve_tuple (item: LIBERTY_INTERPRETER_OBJECT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_routine (item: LIBERTY_INTERPRETER_AGENT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_procedure (item: LIBERTY_INTERPRETER_AGENT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_function (item: LIBERTY_INTERPRETER_AGENT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_predicate (item: LIBERTY_INTERPRETER_AGENT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_user_type (item: LIBERTY_INTERPRETER_OBJECT; a_type: LIBERTY_ACTUAL_TYPE; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
			if Result = Void then
				Result := interpreter.default_object(a_type, a_position)
			end
		end

feature {} -- The storers
	store_any (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	store_pointer (item: LIBERTY_INTERPRETER_OBJECT): POINTER is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[POINTER]
		do
			o ::= item
			Result := o.item
		end

	store_integer_64 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]
		do
			o ::= item
			Result := o.item
		end

	store_integer_32 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]
		do
			o ::= item
			Result := o.item
		end

	store_integer_16 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]
		do
			o ::= item
			Result := o.item
		end

	store_integer_8 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]
		do
			o ::= item
			Result := o.item
		end

	store_real_64 (item: LIBERTY_INTERPRETER_OBJECT): REAL_128 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]
		do
			o ::= item
			Result := o.item
		end

	store_real_32 (item: LIBERTY_INTERPRETER_OBJECT): REAL_128 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]
		do
			o ::= item
			Result := o.item
		end

	store_real_80 (item: LIBERTY_INTERPRETER_OBJECT): REAL_128 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]
		do
			o ::= item
			Result := o.item
		end

	store_real_128 (item: LIBERTY_INTERPRETER_OBJECT): REAL_128 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]
		do
			o ::= item
			Result := o.item
		end

	store_character (item: LIBERTY_INTERPRETER_OBJECT): CHARACTER is
		local
			o: LIBERTY_INTERPRETER_OBJECT_HASHABLE[CHARACTER]
		do
			o ::= item
			Result := o.item
		end

	store_boolean (item: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: LIBERTY_INTERPRETER_OBJECT_BOOLEAN
		do
			o ::= item
			Result := o.item
		end

	store_tuple (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	store_routine (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_AGENT is
		do
			Result ::= item
		end

	store_procedure (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_AGENT is
		do
			Result ::= item
		end

	store_function (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_AGENT is
		do
			Result ::= item
		end

	store_predicate (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_AGENT is
		do
			Result ::= item
		end

	store_user_type (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY
