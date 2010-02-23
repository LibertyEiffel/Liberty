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
class LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[E_]

inherit
	LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR

creation {LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY}
	make

feature {LIBERTY_INTERPRETER_NATIVE_ARRAY}
	retrieve (item: E_): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := retriever.item([item])
		end

	store (item: LIBERTY_INTERPRETER_OBJECT): E_ is
		do
			Result := storer.item([item])
		end

feature {}
	make (a_retriever: like retriever; a_storer: like storer) is
		require
			a_retriever /= Void
			a_storer /= Void
		do
			retriever := a_retriever
			storer := a_storer
		ensure
			retriever = a_retriever
			storer = a_storer
		end

	retriever: FUNCTION[TUPLE[E_], LIBERTY_INTERPRETER_OBJECT]
	storer: FUNCTION[TUPLE[LIBERTY_INTERPRETER_OBJECT], E_]

invariant
	retriever /= Void
	storer /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED
