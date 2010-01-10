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
class LIBERTY_ERROR

insert
	EIFFEL_NODE_HANDLER
	LIBERTY_ERROR_LEVELS

create {LIBERTY_ERRORS}
	make

feature {LIBERTY_ERROR, LIBERTY_ERRORS}
	positions: TRAVERSABLE[LIBERTY_POSITION]
	message: STRING
	previous: LIBERTY_ERROR
	level: INTEGER_8

	is_fatal: BOOLEAN is
		do
			if level < level_error then
				Result := True
			elseif previous /= Void then
				Result := previous.is_fatal
			end
		end

	is_error: BOOLEAN is
		do
			if level <= level_error then
				Result := True
			elseif previous /= Void then
				Result := previous.is_error
			end
		end

feature {LIBERTY_ERRORS}
	emit (stream: OUTPUT_STREAM; threshold: like level) is
			-- May not return.
		require
			stream.is_connected
			filter_only_warnings: threshold >= errors.level_error
		do
			do_emit(stream, threshold)
			if is_fatal then
				sedb_breakpoint
				die_with_code(1)
			end
		ensure
			is_fatal = old is_fatal
			warn_or_die: not is_fatal
		end

feature {LIBERTY_ERROR}
	do_emit (stream: OUTPUT_STREAM; threshold: like level) is
			-- May not return.
		require
			stream.is_connected
			filter_only_warnings: threshold >= errors.level_error
		local
			i: INTEGER
		do
			if previous /= Void then
				previous.do_emit(stream, threshold)
				stream.put_new_line
			end
			if level <= threshold then
				stream.put_string(once "*** ")
				stream.put_string(errors.level_tag(level))
				stream.put_string(once ": ")
				stream.put_line(message)
				from
					i := positions.lower
				until
					i > positions.upper
				loop
					positions.item(i).emit(stream)
					i := i + 1
				end
			end
		end

feature {}
	make (a_level: like level; a_positions: like positions; a_message: like message; a_previous: like Current) is
		require
			a_positions /= Void
			a_message /= Void
			valid_level(a_level)
		do
			positions := a_positions
			message := a_message
			previous := a_previous
			level := a_level
		ensure
			positions = a_positions
			message = a_message
			previous = a_previous
		end

	errors: LIBERTY_ERRORS

invariant
	positions /= Void
	message /= Void

end
