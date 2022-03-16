-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class TIME_IN_FRENCH
   --
   -- The French format class for class TIME.
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
               s := once "Dim"
            when 1 then
               s := once "Lun"
            when 2 then
               s := once "Mar"
            when 3 then
               s := once "Mer"
            when 4 then
               s := once "Jeu"
            when 5 then
               s := once "Ven"
            when 6 then
               s := once "Sam"
            end
         else
            inspect
               time.week_day
            when 0 then
               s := once "Dimanche"
            when 1 then
               s := once "Lundi"
            when 2 then
               s := once "Mardi"
            when 3 then
               s := once "Mercredi"
            when 4 then
               s := once "Jeudi"
            when 5 then
               s := once "Vendredi"
            when 6 then
               s := once "Samedi"
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
               s := once "Fev"
            when 3 then
               s := once "Mar"
            when 4 then
               s := once "Avr"
            when 5 then
               s := once "Mai"
            when 6 then
               s := once "Juin"
            when 7 then
               s := once "Juil"
            when 8 then
               s := once "Aout"
            when 9 then
               s := once "Sept"
            when 10 then
               s := once "Oct"
            when 11 then
               s := once "Nov"
            when 12 then
               s := once "Dec"
            end
         else
            inspect
               time.month
            when 1 then
               s := once "Janvier"
            when 2 then
               s := once "Fevrier"
            when 3 then
               s := once "Mars"
            when 4 then
               s := once "Avril"
            when 5 then
               s := once "Mai"
            when 6 then
               s := once "Juin"
            when 7 then
               s := once "Juillet"
            when 8 then
               s := once "Aout"
            when 9 then
               s := once "Septembre"
            when 10 then
               s := once "Octobre"
            when 11 then
               s := once "Novembre"
            when 12 then
               s := once "Decembre"
            end
         end
         buffer.append(s)
      end

   append_in (buffer: STRING)
      do
         day_in(buffer)
         buffer.extend(' ')
         time.day.append_in(buffer)
         buffer.extend(' ')
         month_in(buffer)
         buffer.extend(' ')
         if short_mode then
            (time.year #\\ 100).append_in(buffer)
         else
            time.year.append_in(buffer)
         end
         buffer.extend(' ')
         time.hour.append_in(buffer)
         buffer.extend('h')
         time.minute.append_in(buffer)
         buffer.extend('m')
         if not short_mode then
            time.second.append_in(buffer)
            buffer.extend('s')
         end
      end

end -- class TIME_IN_FRENCH
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
