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
expanded class LIBERTY_ENLIGHTENING_THE_WORLD
--
-- Allows to ensure that the compiler is still progressing. Useful to avoid staying stuck in an infinite loop.
--

insert
   LOGGING

feature {ANY}
   burn is
      do
         torch.increment
         debug
            log.trace.put_string(once "FLAME: ")
            log.trace.put_integer(torch.value)
            log.trace.put_new_line
         end
      end

   flame: LIBERTY_FLAME is
      do
         Result.set(torch.value)
      end

   still_burns (a_flame: like flame): BOOLEAN is
      do
         Result := torch.value > a_flame.light
      end

feature {}
   torch: COUNTER is
      once
         create Result
      end

end -- class LIBERTY_ENLIGHTENING_THE_WORLD
