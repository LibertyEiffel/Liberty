note
   description:
      "extended I/O"
   status:
      "See notice at end of class"
   author:
      "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>"
   version:
      "$Revision$"
   last_modification:
      "$Date$"
class AUX_UW01EXTRA_IO

create {ANY}
   make

feature {ANY}
   make
         -- make new object
      do
         create {AUX_UW01PREFERRED_LANGUAGE} language
      end

feature {ANY} -- Input
   read_string (prompt: STRING)
         -- print `prompt' and get a string
      require
         valid_prompt: prompt /= Void
      do
         io.put_string(prompt)
         io.read_line
         last_string := io.last_string
         last_string.right_adjust
         last_string.left_adjust
      ensure
         last_string /= Void
      end

   read_yes_no (prompt: STRING)
         -- print `prompt' and get a string to
         -- `last_string' and also set `last_boolean'
      require
         valid_prompt: prompt /= Void
      local
         input: CHARACTER
      do
         from
         until
            input = language.yes_character or else input = language.no_character
         loop
            read_string(prompt)
            if last_string.count > 0 then
               input := last_string.item(1)
            end
         end
         last_boolean := input = language.yes_character
      ensure
         last_string /= Void
      end -- read_string

   last_string: STRING

   last_boolean: BOOLEAN

feature {ANY} -- Output
   print_multi (objects: ARRAY[STRING])
         -- print all elements in `objects' as string
      local
         i: INTEGER
      do
         from
            i := objects.lower
         until
            i > objects.upper
         loop
            io.put_string(objects.item(i).out)
            i := i + 1
         end
      end

feature {}
   language: AUX_UW01LANGUAGE -- language to use

invariant
   good_language: language /= Void

end -- class AUX_UW01EXTRA_IO
-- Copyright (C) 1998-2022: by Ulrich Windl
-- Copyright (C) 1998-2022: by Klinikum der Universität Regensburg,
--      D-93042 Regensburg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
