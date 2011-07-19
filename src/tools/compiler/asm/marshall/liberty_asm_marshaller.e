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
expanded class LIBERTY_ASM_MARSHALLER

feature {ANY}
   read (a_stream: INPUT_STREAM): TUPLE[LIBERTY_ASM_SYSTEM, FIXED_STRING] is
      require
         a_stream /= Void
      local
         reader: LIBERTY_ASM_READER
         no_error: FIXED_STRING
      do
         create reader.read(a_stream)
         if reader.error /= Void then
            Result := [reader.system, reader.error.intern]
         else
            Result := [reader.system, no_error]
         end
      end

   write (a_stream: OUTPUT_STREAM; a_system: LIBERTY_ASM_SYSTEM) is
      require
         a_stream /= Void
         a_system /= Void
      local
         writer: LIBERTY_ASM_WRITER
      do
         create writer.write(a_stream, a_system)
      end

end -- class LIBERTY_ASM_MARSHALLER
