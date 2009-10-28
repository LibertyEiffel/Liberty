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
expanded class LIBERTY_ERRORS

insert
	LIBERTY_ERROR_LEVELS

feature {ANY}
	set_error_threshold (a_threshold: INTEGER_8) is
		require
			valid_level(a_threshold)
		do
			threshold_memory.set_item(a_threshold)
		ensure
			threshold = a_threshold
		end

	threshold: INTEGER_8 is
		do
			Result := threshold_memory.item
		end

feature {ANY} -- Errors
	last_error: LIBERTY_ERROR is
		do
			Result := last_error_memory.item
		end

	has_error: BOOLEAN is
		do
			if last_error /= Void then
				Result := last_error.is_error
			end
		end

	has_warning_or_error: BOOLEAN is
		do
			Result := last_error /= Void
		end

	set (level: INTEGER_8; message: STRING) is
		require
			valid_level(level)
		do
			last_error_memory.set_item(create {LIBERTY_ERROR}.make(level, positions.twin, message, last_error))
			if level < level_error then
				emit
			end
		ensure
			fatal_means_die: level >= level_error
		end

	emit is
		require
			has_warning_or_error
		do
			last_error.emit(threshold)
			last_error_memory.set_item(Void)
		ensure
			not has_warning_or_error
			dead_if_fatal: not old (last_error.is_fatal)
		end

	emit_syntax_error (error: PARSE_ERROR; code: STRING) is
			-- utility method that adds all the syntax errors and emit as a fatal error
		local
			e: PARSE_ERROR
		do
			from
				e := error
			until
				e = Void
			loop
				add_position(syntax_position(e.index, code))
				set(level_error, e.message)
				e := e.next
			end
			emit
			die_with_code(1)
		ensure
			syntax_error_is_death: False
		end

feature {ANY} -- Error positions
	has_positions: BOOLEAN is
		do
			Result := not positions.is_empty
		end

	syntax_position (a_index: INTEGER; a_source: STRING): LIBERTY_SYNTAX_POSITION is
		require
			a_index.in_range(a_source.lower, a_source.upper)
		do
			create Result.make(a_index, a_source)
		ensure
			Result /= Void
		end

	semantics_position (a_index: INTEGER; a_ast: LIBERTY_AST_CLASS): LIBERTY_SEMANTICS_POSITION is
		require
			a_index > 0
			a_ast /= Void
		do
			create Result.make(a_index, a_ast)
		ensure
			Result /= Void
		end

	add_position (a_position: LIBERTY_POSITION) is
		require
			a_position /= Void
		do
			positions.add_last(a_position)
		ensure
			has_positions
		end

	cancel_positions is
		do
			positions.clear_count
		ensure
			not has_positions
		end

feature {}
	last_error_memory: REFERENCE[LIBERTY_ERROR] is
		once
			create Result
		end

	positions: COLLECTION[LIBERTY_POSITION] is
		once
			create {FAST_ARRAY[LIBERTY_POSITION]} Result.with_capacity(4)
		end

	threshold_memory: REFERENCE[INTEGER_8] is
		once
			create Result.set_item(level_error)
		end

end
