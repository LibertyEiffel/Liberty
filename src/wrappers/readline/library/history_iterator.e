class HISTORY_ITERATOR

inherit
   ITERATOR[HISTORY_ENTRY]

insert
   HISTORY_EXTERNALS

create {READ_LINE_HISTORY}
   make

feature {ANY}
   start
      do
         index := history.lower
      end

   item: HISTORY_ENTRY
      do
         Result := history.item(index)
      end

   next
      do
         index := index + 1
      end

   is_off: BOOLEAN
      do
         Result := index > history.upper
      end

feature {ANY}
   generation: INTEGER
      do
         Result := history.generation
      end

   iterable_generation: INTEGER

feature {}
   history: READ_LINE_HISTORY
   index: INTEGER

   make (hist: READ_LINE_HISTORY)
      do
         history := hist
         iterable_generation := hist.generation
         start
      end

end

-- Liberty Eiffel wrappers for GNU readline library Copyright (C) 2010-2022: ,2012,2013 Paolo Redaelli, Cyril Adrian 
-- 
-- The GNU C Library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
-- 
-- The GNU C Library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the GNU C Library; if not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
-- 02110-1301 USA

