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
class LIBERTY_UNKNOWN_POSITION

inherit
   LIBERTY_POSITION
      redefine
         emit
      end

insert
   EIFFEL_NODE_HANDLER

create {LIBERTY_ERRORS}
   make

feature {ANY}
   is_unknown: BOOLEAN True

feature {LIBERTY_ERROR}
   emit (stream: OUTPUT_STREAM)
      do
         stream.put_line(once "Unknown position")
      end

feature {}
   make
      do
         file := unknown_file
      end

   source: STRING ""

   unknown_file: FIXED_STRING
      once
         Result := "Unknown file".intern
      end

end
