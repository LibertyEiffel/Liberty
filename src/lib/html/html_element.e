-- See the Copyright notice at the end of this file.
--
deferred class HTML_ELEMENT

feature {ANY}
   parent: HTML_NODE

   to_string: STRING is
      do
         Result := ""
         append_in(Result, False)
      end

   append_in (buffer: STRING; stop_at_dot: BOOLEAN) is
      local
         stopped: BOOLEAN
      do
         stopped := really_append_in(buffer, stop_at_dot, stopped)
      end

   to_html_stream (html: HTML_OUTPUT_STREAM; stop_at_dot: BOOLEAN) is
      local
         stopped: BOOLEAN
      do
         stopped := really_to_html_stream(html, stop_at_dot, stopped)
      end

feature {HTML_ELEMENT}
   really_append_in (buffer: STRING; stop_at_dot, stopped: BOOLEAN): BOOLEAN is
      require
         stopped implies stop_at_dot
      deferred
      ensure
         Result implies stop_at_dot
      end

   really_to_html_stream (html: HTML_OUTPUT_STREAM; stop_at_dot, stopped: BOOLEAN): BOOLEAN is
      require
         stopped implies stop_at_dot
      deferred
      ensure
         Result implies stop_at_dot
      end

end -- class HTML_ELEMENT
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
