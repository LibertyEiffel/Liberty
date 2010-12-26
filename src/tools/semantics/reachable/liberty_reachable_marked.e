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
deferred class LIBERTY_REACHABLE_MARKED
   --
   -- A reachable marker which keeps a "reachable" status
   --

insert
   LIBERTY_REACHABLE

feature {ANY} -- The "reachable" property
   frozen is_reachable: BOOLEAN is
      do
         Result := reachable_mark > 0
      ensure
         once_reachable_always_reachable: reachable_memory implies Result
      end

feature {LIBERTY_REACHABLE}
   mark_reachable_code (mark: like reachable_mark) is
      require
         mark > 0
      deferred
      ensure
         reachable_mark >= mark
         is_reachable: ensure_is_reachable
      end

feature {} -- Contract implementation: check the "once reachable, always reachable" behaviour
   frozen ensure_is_reachable: BOOLEAN is
      do
         reachable_memory := True
         Result := is_reachable
      end

   reachable_memory: BOOLEAN
   reachable_mark: INTEGER

end -- class LIBERTY_REACHABLE_MARKED
