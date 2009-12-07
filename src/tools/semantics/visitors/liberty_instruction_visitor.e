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
deferred class LIBERTY_INSTRUCTION_VISITOR

inherit
	LIBERTY_ASSIGNMENT_ATTEMPT_VISITOR
	LIBERTY_ASSIGNMENT_VISITOR
	LIBERTY_ASSIGNMENT_FORCED_VISITOR
	LIBERTY_ASSIGNMENT_REGULAR_VISITOR
	LIBERTY_CALL_INSTRUCTION_VISITOR
	LIBERTY_CHECK_INSTRUCTION_VISITOR
	LIBERTY_COMPOUND_VISITOR
	LIBERTY_CONDITIONAL_VISITOR
	LIBERTY_CONDITION_VISITOR
	LIBERTY_CREATION_INSTRUCTION_VISITOR
	LIBERTY_DEBUG_VISITOR
	LIBERTY_DEFAULT_VISITOR
	LIBERTY_EMPTY_VISITOR
	LIBERTY_INSPECT_CLAUSE_VISITOR
	LIBERTY_INSPECT_VISITOR
	LIBERTY_INSPECT_SLICE_VISITOR
	LIBERTY_LOOP_VISITOR
	LIBERTY_PRECURSOR_INSTRUCTION_VISITOR
	LIBERTY_RETRY_VISITOR

end -- class LIBERTY_INSTRUCTION_VISITOR
