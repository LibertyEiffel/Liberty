-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_FILE_OPTIONS

create {LOG_INTERNAL_CONF}
   file, console

feature {LOG_INTERNAL_CONF}
   retriever: FUNCTION[TUPLE, OUTPUT_STREAM]
      do
         Result := agent retrieve
      end

   rotated (condition: PREDICATE[TUPLE[FILE_STREAM]]; retention: INTEGER_64; on_error: PROCEDURE[TUPLE[STRING]])
      require
         condition /= Void
      do
         if file_path = Void then
            on_error.call([output_name + ": 'rotated' not allowed on console"])
         elseif option_rotated then
            on_error.call([output_name + ": only one 'rotated' statement allowed"])
         else
            create {LOG_FILE_ROTATED} option.make(option, condition, retention)
            option_rotated := True
         end
      end

   zipped (command: FIXED_STRING; on_error: PROCEDURE[TUPLE[STRING]])
      require
         command /= Void
      do
         if file_path = Void then
            on_error.call([output_name + ": 'zipped' not allowed on console"])
         elseif option_zipped then
            on_error.call([output_name + ": only one 'zipped' statement allowed"])
         elseif not option_rotated then
            on_error.call([output_name + ": the 'zipped' statement must follow a 'rotated' statement"])
         else
            create {LOG_FILE_ZIPPED} option.make(option, command)
            option_zipped := True
         end
      end

   is_connected: BOOLEAN
      do
         Result := stream.is_connected
      end

feature {}
   file (a_output_name: like output_name; a_file_path: like file_path)
      require
         a_output_name /= Void
         a_file_path /= Void
      do
         output_name := a_output_name
         file_path := a_file_path
         create {TEXT_FILE_WRITE} stream.connect_for_appending_to(a_file_path)
         do_at_exit(agent do if stream.is_connected then stream.disconnect end end)
         create {LOG_FILE_PASS_THROUGH} option.make
      ensure
         output_name = a_output_name
         file_path = a_file_path
         --stream.is_connected implies stream.path = a_file_path
      end

   console (a_output_name: like output_name)
      require
         a_output_name /= Void
      do
         output_name := a_output_name
         stream := std_output
         create {LOG_FILE_PASS_THROUGH} option.make
      ensure
         output_name = a_output_name
         file_path = Void
         stream = std_output
      end

   retrieve: OUTPUT_STREAM
      local
         s: STREAM
      do
         -- the stream may not be connected at shutdown (last GC collect)
         if stream.is_connected then
            -- because FILE_STREAM and OUTPUT_STREAM are in parallel hierarchies
            -- (they don't inherit from each other)
            -- ... but we know the stream is always an output one, don't we :-)
            s := option.retrieve(stream)
            stream ::= s
            Result ::= s
         end
      end

   option_rotated: BOOLEAN
   option_zipped: BOOLEAN

   option: LOG_FILE_OPTION
   stream: OUTPUT_STREAM

   output_name: FIXED_STRING
   file_path: STRING

invariant
   stream /= Void
   option /= Void

   output_name /= Void

end -- class LOG_FILE_OPTIONS
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
