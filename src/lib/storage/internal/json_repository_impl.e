-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class JSON_REPOSITORY_IMPL[O_ -> STORABLE]

inherit
   REPOSITORY_IMPL[O_]
      redefine
         make
      end

insert
   JSON_HANDLER

feature {} -- Implementation of update
   last_line: INTEGER
   last_column: INTEGER

   do_update (in_stream: INPUT_STREAM) is
      local
         text: JSON_TEXT
      do
         text := parser.parse_json_text(in_stream)
         if text /= Void then
            not_yet_implemented
            -- set last_line and last_column
         end
      end

   parser: JSON_PARSER

feature {} -- Default transient objects
   register_transient_objects is
      do
         transient.register(to_internals, once "Repository")
      end

   unregister_transient_objects is
      do
         transient.unregister(once "Repository")
      end

feature {}
   frozen version: STRING is "1"

   make is
      do
         if parser = Void then
            create parser.make(agent fire_update_error)
         end
         Precursor
      end

invariant
   parser /= Void

end -- class JSON_REPOSITORY_IMPL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
