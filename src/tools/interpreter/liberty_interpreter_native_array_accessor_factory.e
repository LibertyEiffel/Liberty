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
	accessor (a_interpreter: like interpreter; a_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR is
		do
			interpreter := a_interpreter
			a_type.accept(Current)
			Result := last_accessor
		end

feature {LIBERTY_UNIVERSE}
	visit_type_any (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_any, agent store_any)
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[POINTER]} last_accessor.make(agent retrieve_pointer, agent store_pointer)
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_64]} last_accessor.make(agent retrieve_integer_64, agent store_integer_64)
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_32]} last_accessor.make(agent retrieve_integer_32, agent store_integer_32)
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_16]} last_accessor.make(agent retrieve_integer_16, agent store_integer_16)
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[INTEGER_8]} last_accessor.make(agent retrieve_integer_8, agent store_integer_8)
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_64]} last_accessor.make(agent retrieve_real_64, agent store_real_64)
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_32]} last_accessor.make(agent retrieve_real_32, agent store_real_32)
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_80]} last_accessor.make(agent retrieve_real_80, agent store_real_80)
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[REAL_128]} last_accessor.make(agent retrieve_real_128, agent store_real_128)
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[CHARACTER]} last_accessor.make(agent retrieve_character, agent store_character)
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_user_type, agent store_user_type)
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[BOOLEAN]} last_accessor.make(agent retrieve_boolean, agent store_boolean)
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE) is
		do
			check False end
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[TUPLE]} last_accessor.make(agent retrieve_tuple, agent store_tuple)
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_procedure, agent store_procedure)
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_function, agent store_function)
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_AGENT]} last_accessor.make(agent retrieve_predicate, agent store_predicate)
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE) is
		do
			create {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[LIBERTY_INTERPRETER_OBJECT]} last_accessor.make(agent retrieve_user_type, agent store_user_type)
		end

feature {}
	make is
		do
		end

	interpreter: LIBERTY_INTERPRETER
	last_accessor: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR

feature {} -- The retrievers
	retrieve_any (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_pointer (item: POINTER): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[POINTER]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_integer_64 (item: INTEGER_64): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_integer_32 (item: INTEGER_32): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_32]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_integer_16 (item: INTEGER_16): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_16]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_integer_8 (item: INTEGER_8): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_8]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_real_64 (item: REAL_64): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_64]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_real_32 (item: REAL_32): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_32]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_real_80 (item: REAL_80): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_80]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_real_128 (item: REAL_128): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_character (item: CHARACTER): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_boolean (item: BOOLEAN): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]} Result.with_item(interpreter, interpreter.universe.type_boolean, item)
		end

	retrieve_tuple (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_procedure (item: LIBERTY_INTERPRETER_AGENT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_function (item: LIBERTY_INTERPRETER_AGENT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_predicate (item: LIBERTY_INTERPRETER_AGENT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	retrieve_user_type (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

feature {} -- The storers
	store_any (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
		end

	store_pointer (item: LIBERTY_INTERPRETER_OBJECT): POINTER is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[POINTER]
		do
			o ::= item
			Result := o.item
		end

	store_integer_64 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			o ::= item
			Result := o.item
		end

	store_integer_32 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_32 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_32]
		do
			o ::= item
			Result := o.item
		end

	store_integer_16 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_16 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_16]
		do
			o ::= item
			Result := o.item
		end

	store_integer_8 (item: LIBERTY_INTERPRETER_OBJECT): INTEGER_8 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_8]
		do
			o ::= item
			Result := o.item
		end

	store_real_64 (item: LIBERTY_INTERPRETER_OBJECT): REAL_64 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_64]
		do
			o ::= item
			Result := o.item
		end

	store_real_32 (item: LIBERTY_INTERPRETER_OBJECT): REAL_32 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_32]
		do
			o ::= item
			Result := o.item
		end

	store_real_80 (item: LIBERTY_INTERPRETER_OBJECT): REAL_80 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_80]
		do
			o ::= item
			Result := o.item
		end

	store_real_128 (item: LIBERTY_INTERPRETER_OBJECT): REAL_128 is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128]
		do
			o ::= item
			Result := o.item
		end

	store_character (item: LIBERTY_INTERPRETER_OBJECT): CHARACTER is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]
		do
			o ::= item
			Result := o.item
		end

	store_boolean (item: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		local
			o: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
		do
			o ::= item
			Result := o.item
		end

	store_tuple (item: LIBERTY_INTERPRETER_OBJECT): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := item
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
