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
	next: LIBERTY_ERROR
	level: INTEGER_8

	set_next (a_next: like next) is
		require
			a_next /= Void
			a_next /= Current
		do
			if next /= Void then
				next.set_next(a_next)
			else
				next := a_next
			end
		ensure
			last = a_next
		end

	last: like next is
		do
			if next = Void then
				Result := Current
			else
				Result := next.last
			end
		ensure
			Result /= Void
		end

	is_fatal: BOOLEAN is
		do
			if level < level_error then
				Result := True
			elseif next /= Void then
				Result := next.is_fatal
			end
		end

	is_error: BOOLEAN is
		do
			if level <= level_error then
				Result := True
			elseif next /= Void then
				Result := next.is_error
			end
		end

feature {LIBERTY_ERRORS}
	emit (stream: OUTPUT_STREAM; threshold: like level) is
			-- May not return.
		require
			filter_only_warnings: threshold > errors.level_error
		do
			do_emit(stream, threshold)
			if is_fatal then
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
			filter_only_warnings: threshold > errors.level_error
		local
			i: INTEGER
		do
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

			if next /= Void then
				stream.put_new_line
				next.do_emit(stream, threshold)
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
			if a_previous /= Void then
				a_previous.set_next(Current)
			end
			level := a_level
		ensure
			positions = a_positions
			message = a_message
			a_previous /= Void implies a_previous.last = Current
		end

	errors: LIBERTY_ERRORS

invariant
	positions /= Void
	message /= Void

end
