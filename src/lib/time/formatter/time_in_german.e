-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TIME_IN_GERMAN
   --
   -- The German format class for class TIME.
   --

inherit
   TIME_FORMATTER

create {ANY}
   default_create, set_time

feature {ANY}
   day_in (buffer: STRING)
      local
         s: STRING
      do
         if short_mode then
            inspect
               time.week_day
            when 0 then
               s := once "So"
            when 1 then
               s := once "Mo"
            when 2 then
               s := once "Di"
            when 3 then
               s := once "Mi"
            when 4 then
               s := once "Do"
            when 5 then
               s := once "Fr"
            when 6 then
               s := once "Sa"
            end
         else
            inspect
               time.week_day
            when 0 then
               s := once "Sonntag"
            when 1 then
               s := once "Montag"
            when 2 then
               s := once "Dienstag"
            when 3 then
               s := once "Mittwoch"
            when 4 then
               s := once "Donnerstag"
            when 5 then
               s := once "Freitag"
            when 6 then
               s := once "Samstag"
            end
         end
         buffer.append(s)
      end

   month_in (buffer: STRING)
      local
         s: STRING
      do
         if short_mode then
            inspect
               time.month
            when 1 then
               s := once "Jan"
            when 2 then
               s := once "Feb"
            when 3 then
               s := once "Mär"
            when 4 then
               s := once "Apr"
            when 5 then
               s := once "Mai"
            when 6 then
               s := once "Jun"
            when 7 then
               s := once "Jul"
            when 8 then
               s := once "Aug"
            when 9 then
               s := once "Sep"
            when 10 then
               s := once "Okt"
            when 11 then
               s := once "Nov"
            when 12 then
               s := once "Dez"
            end
         else
            inspect
               time.month
            when 1 then
               s := once "Januar"
            when 2 then
               s := once "Februar"
            when 3 then
               s := once "März"
            when 4 then
               s := once "April"
            when 5 then
               s := once "Mai"
            when 6 then
               s := once "Juni"
            when 7 then
               s := once "Juli"
            when 8 then
               s := once "August"
            when 9 then
               s := once "September"
            when 10 then
               s := once "Oktober"
            when 11 then
               s := once "November"
            when 12 then
               s := once "Dezember"
            end
         end
         buffer.append(s)
      end

   append_in (buffer: STRING)
      local
         tmp: STRING
      do
         day_in(buffer)
         buffer.extend(',')
         buffer.extend(' ')
         tmp := time.day.to_string
         if 2 > tmp.count then
            tmp.insert_character('0', 1)
         end
         buffer.append_string(tmp)
         buffer.append_character('.')
         buffer.append_character(' ')
         month_in(buffer)
         buffer.append_character(' ')
         if short_mode then
            tmp := (time.year #\\ 100).to_string
            if 2 > tmp.count then
               tmp.insert_character('0', 1)
            end
            buffer.append_string(tmp)
         else
            time.year.append_in(buffer)
         end
         buffer.extend(' ')
         tmp := time.hour.to_string
         if 2 > tmp.count then
            tmp.insert_character('0', 1)
         end
         buffer.append_string(tmp)
         buffer.append_character(':')
         tmp := time.minute.to_string
         if 2 > tmp.count then
            tmp.insert_character('0', 1)
         end
         buffer.append_string(tmp)
         if not short_mode then
            buffer.append_character(':')
            tmp := time.second.to_string
            if 2 > tmp.count then
               tmp.insert_character('0', 1)
            end
            buffer.append_string(tmp)
         end
      end

end -- class TIME_IN_GERMAN
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
