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
deferred class LIBERTY_TYPE_VISITOR

feature {LIBERTY_UNIVERSE}
	visit_type_any (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_platform (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		deferred
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (type: LIBERTY_VOID_TYPE) is
		deferred
		end

end -- class LIBERTY_TYPE_VISITOR
