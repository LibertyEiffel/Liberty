-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_OUTPUT

inherit
   OUTPUT_STREAM

insert
   STRING_FORMATTER

create {LOG_INTERNAL_CONF}
   make

feature {ANY}
   is_connected: BOOLEAN
      do
         Result := output.is_connected and then forward /= Void and then forward.is_connected
      end

   can_disconnect: BOOLEAN False

   disconnect
      do
         check False end
      end

   can_put_character (c: CHARACTER): BOOLEAN
      do
         Result := output.can_put_character(c) and then forward /= Void and then forward.can_put_character(c)
      end

   tag: FIXED_STRING
   format: FIXED_STRING

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         if c = '%N' then
            format_and_print_message
         else
            message.extend(c)
         end
         forward.put_character(c)
      end

   filtered_flush
      do
         -- no, thanks
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         check False end
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
         -- Find the pointer of the terminal stream... Filters do not have pointers of their own
      do
         check False end
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {LOG_LEVEL}
   level_tag: FIXED_STRING
   logger_tag: FIXED_STRING

   set (a_level_tag, a_logger_tag: FIXED_STRING)
      do
         level_tag := a_level_tag
         logger_tag := a_logger_tag
      ensure
         level_tag = a_level_tag
         logger_tag = a_logger_tag
      end

feature {LOGGER}
   output: OUTPUT_STREAM
      do
         Result := output_retriever.item([])
         if Result = Void then
            -- fallback when the system is going down to hell
            Result := std_error
         end
      ensure
         Result /= Void
      end

feature {LOG_INTERNAL_CONF}
   set_format (a_format: ABSTRACT_STRING)
      require
         a_format /= Void
      do
         format := a_format.intern
      ensure
         format.is_equal(a_format)
      end

feature {LOG_LEVEL}
   forward: OUTPUT_STREAM

   set_forward (a_forward: like forward)
      require
         a_forward /= Void
      do
         forward := a_forward
      ensure
         forward = a_forward
      end

feature {}
   put (c: CHARACTER)
      do
         message.extend(c)
      end

   put_item (item: ABSTRACT_STRING)
      do
         message.append(item)
      end

feature {}
   make (a_output_retriever: like output_retriever; a_tag: like tag)
      require
         a_output_retriever /= Void
         a_tag /= Void
      do
         output_retriever := a_output_retriever
         tag := a_tag
         format := default_format
         message := ""
      ensure
         output_retriever = a_output_retriever
         tag = a_tag
      end

   output_retriever: FUNCTION[TUPLE, OUTPUT_STREAM]
   message: STRING

   default_format: FIXED_STRING
      once
         Result := "@C [@t] - @L - @m%N".intern
      end

   format_and_print_message
      local
         i, pid: INTEGER; i18n: I18N; spid: STRING
      do
         time.update
         from
            i := format.lower
         variant
            format.upper - i
         until
            i > format.upper
         loop
            if format.item(i) = '@' then
               if i = format.upper then
                  output.put_character('@')
               else
                  inspect format.item(i + 1)
                  when 'C' then
                     output.put_string(level_tag)
                  when 'L' then
                     output.put_string(logger_tag)
                  when 'T' then
                     output.put_string(tag)
                  when 't' then
                     output.put_string(i18n.locale.localized_time_and_date(time))
                  when 'm' then
                     output.put_string(message)
                  when 'I' then
                     --| **** TODO: cross-platform
                     c_inline_c("_pid = getpid();%N")
                     spid := once ""
                     spid.copy(once "0x")
                     pid.to_hexadecimal_in(spid)
                     output.put_string(spid)
                  when '@' then
                     output.put_character('@')
                  else
                     output.put_character('@')
                     output.put_character(format.item(i + 1))
                  end
                  i := i + 2
               end
            else
               output.put_character(format.item(i))
               i := i + 1
            end
         end
         output.flush
         message.clear_count
      end

   put_two_figure_integer (int: INTEGER)
      require
         int.in_range(0, 99)
      do
         if int < 10 then
            output.put_character('0')
         end
         output.put_integer(int)
      end

   time: TIME

invariant
   output_retriever /= Void
   format /= Void
   message /= Void
   tag /= Void

end -- class LOG_OUTPUT
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
