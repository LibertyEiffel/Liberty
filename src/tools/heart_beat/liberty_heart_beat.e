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
expanded class LIBERTY_HEART_BEAT
--
-- Allows that the compiler is still progressing. Useful to avoid staying stuck in an infinite loop.
--

feature {ANY}
	beat is
		do
			debug
				std_output.put_line("--------  <3        <3        <3        <3  --------")
			end
			heart_beat_count.increment
		end

	count: LIBERTY_HEART_BEAT_COUNT is
		do
			debug
				std_output.put_line("--------  <3  -------- MEMO: " + heart_beat_count.value.out)
			end
			Result.set(heart_beat_count.value)
		end

	is_alive (a_count: like count): BOOLEAN is
		do
			Result := heart_beat_count.value > a_count.count
			debug
				std_output.put_line("--------  <3  -------- ALIVE: " + heart_beat_count.value.out + " vs. " + a_count.count.out + " => " + Result.out)
			end
		end

feature {}
	heart_beat_count: COUNTER is
		once
			create Result
		end

end -- class LIBERTY_HEART_BEAT
