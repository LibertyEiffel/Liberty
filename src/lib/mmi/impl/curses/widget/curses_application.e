-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURSES_APPLICATION

inherit
   UI_TYPED_BRIDGE_APPLICATION[CURSES_JOB, CURSES_WINDOW]

insert
   CURSES_ITEM[UI_APPLICATION]
      redefine
         make
      end
   LOGGING

create {CURSES_JOB}
   make

feature {ANY}
   idle_timeout: INTEGER
      local
         val: JSON_VALUE
         num: JSON_NUMBER
      do
         val := conf.item(once "idle_timeout")
         if val /= Void then
            if num ?:= val then
               num ::= val
               Result := num.to_integer.to_integer_32
               if Result <= 0 then
                  log.warning.put_line(once "invalid (null or negative) idle timeout, using default")
                  Result := 1000
               end
            else
               log.warning.put_line(once "invalid (not an integer) idle timeout, using default")
               Result := 1000
            end
         else
            log.warning.put_line(once "invalid (not set) idle timeout, using default")
            Result := 1000
         end
         log.info.put_line(once "idle timeout: #(1)" # &Result)
      ensure
         Result > 0
      end

feature {CURSES_JOB}
   start: BOOLEAN
      do
         log.trace.put_line(once "start")
         if windows.for_all(agent (a_window: CURSES_WINDOW): BOOLEAN
                            do
                               Result := a_window.start
                            end)
         then
            Result := True
         else
            log.error.put_line(once "Could not start windows")
         end
      end

   key_pressed (code: INTEGER)
      local
         win: CURSES_WINDOW
      do
         log.trace.put_line(once "key pressed: #(1)" # &code)
         win := windows.fast_reference_at(current_window)
         if not win.key_pressed(code) then
            log.error.put_line(once "Could send key_pressed to window: #(1) (key pressed: #(2))" # win.id # &code)
         end
      end

   resized
      do
         log.trace.put_line(once "resized")
         if not windows.for_all(agent (a_window: CURSES_WINDOW): BOOLEAN
                                do
                                   Result := a_window.resized
                                end)
         then
            log.error.put_line(once "Could not resize windows")
         end
      end

feature {UI_APPLICATION}
   add (a_window: CURSES_WINDOW)
      do
         windows.add(a_window, a_window.id)
      end

feature {}
   conf_section: STRING "curses"

   make (a_ui: like ui)
      local
         str: JSON_STRING
      do
         Precursor(a_ui)
         create windows.make
         str ::= conf.item(once "start")
         current_window := str.string.as_utf8.intern
      end

   windows: HASHED_DICTIONARY[CURSES_WINDOW, FIXED_STRING]

   current_window: FIXED_STRING

invariant
   windows /= Void
   current_window.intern = current_window

end -- class CURSES_APPLICATION
--
-- Copyright (C) 2012-2017: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
