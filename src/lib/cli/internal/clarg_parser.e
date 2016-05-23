-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class CLARG_PARSER

insert
   ARGUMENTS
      redefine
         out_in_tagged_out_memory
      end
   CLARG_OPTIONS
      redefine
         out_in_tagged_out_memory
      end

feature {ANY}
   name: FIXED_STRING
   usage: FIXED_STRING
   index: INTEGER
   is_mandatory: BOOLEAN

   is_set: BOOLEAN
      deferred
      end

   force_index (a_index: like index)
      do
         index := a_index
      ensure
         index = a_index
      end

   is_optional: BOOLEAN
      do
         Result := not is_mandatory and then not is_positional
      end

   is_positional: BOOLEAN
      do
         Result := short = Void and then long = Void
      end

   can_be_mandatory: BOOLEAN True

   can_be_optional: BOOLEAN
      do
         Result := is_optional
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(name)
      end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
   parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      do
         if is_positional then
            Result := parse_positional(context)
         else
            if short /= Void then
               Result := parse_short(context)
            end
            if not is_set and then long /= Void then
               Result := context
               if Result.is_short then
                  Result.set_index(Result.short_index)
               end
               Result := parse_long(Result)
            end
         end
      end

   usage_summary (stream: OUTPUT_STREAM)
      do
         if not is_mandatory then
            stream.put_character('{')
         end
         if short /= Void then
            if long /= Void then
               stream.put_character('(')
               put_short(stream)
               stream.put_character('|')
               put_long(stream)
               stream.put_character(')')
            else
               put_short(stream)
            end
            stream.put_character(' ')
         elseif long /= Void then
            put_long(stream)
            stream.put_character(' ')
         end
         stream.put_character('<')
         stream.put_string(name)
         stream.put_character('>')
         if not is_mandatory then
            stream.put_character('}')
         end
         detailed := False
      end

   usage_details (stream: OUTPUT_STREAM)
      do
         if not detailed then
            usage_summary(stream)
            stream.put_character(':')
            stream.put_character(' ')
            if usage /= Void then
               stream.put_string(usage)
            else
               stream.put_string(once "Set the ")
               stream.put_string(name)
               stream.put_character('.')
            end
            if is_mandatory then
               stream.put_string(once " (mandatory)")
            end
            stream.put_new_line
            detailed := True
         end
      end

   set_mandatory (parent_option: like Current; enable: BOOLEAN)
      do
         parent := parent_option
         is_mandatory := enable
      end

   is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN
      deferred
      end

feature {} -- parsing
   parse_positional (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      require
         is_positional
      local
         data: STRING
      do
         Result := context
         if context.is_short then
            context.set_index(context.short_index)
         end
         if argument_count >= context.index then
            if index = 0 or else index = context.index then
               data := argument(context.index)
               if is_valid_data(data) then
                  set_data_(context, data)
                  Result.set_index(context.index + 1)
               end
            end
         end
      end

   parse_short (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      require
         not is_positional
         short /= Void
      local
         data: STRING
      do
         Result := context
         if argument_count >= context.index then
            if context.is_short then
               if argument_count >= context.short_index and then is_short(argument(context.index), context.short_option_index) then
                  data := argument(context.short_index)
                  if is_valid_data(data) then
                     set_data_(context, data)
                     Result.set_index(context.index)
                     Result.set_short(context.short_index + 1, context.short_option_index + 1)
                  else
                     Result := Result.default
                  end
               elseif argument_count > context.short_index and then is_short(argument(context.short_index), 1) then
                  data := argument(context.short_index + 1)
                  if is_valid_data(data) then
                     set_data_(context, data)
                     Result.set_index(context.short_index + 1)
                     Result.set_short(context.short_index + 2, 2)
                  else
                     Result := Result.default
                  end
               end
            elseif is_short(argument(context.index), 1) and then argument_count > context.index then
               data := argument(context.index + 1)
               if is_valid_data(data) then
                  set_data_(context, data)
                  Result.set_index(context.index)
                  Result.set_short(context.index + 2, 2)
               else
                  Result := Result.default
               end
            end
         end
      end

   parse_long (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT
      require
         not is_positional
         long /= Void
      local
         arg, data: STRING
      do
         Result := context
         if argument_count >= context.index then
            arg := argument(context.index)
            if is_long(arg) and then argument_count > context.index then
               data := argument(context.index + 1)
               if is_valid_data(data) then
                  set_data_(context, data)
                  Result.set_index(context.index + 2)
               else
                  Result := Result.default
               end
            elseif is_long_equal(arg) then
               data := long_equal_pattern.named_group_value(arg, once "value")
               if is_valid_data(data) then
                  set_data_(context, data)
                  Result.set_index(context.index + 1)
               else
                  Result := Result.default
               end
            end
         end
      end

feature {CLARG_PARSER}
   set_data_ (context: COMMAND_LINE_CONTEXT; data: STRING)
      require
         is_valid_data(data)
         parent /= Void implies parent.is_valid_data(data)
      do
         set_data(context, data)
         if parent /= Void then
            parent.set_data_(context, data)
         end
      end

   is_valid_data (data: STRING): BOOLEAN
      deferred
      end

feature {}
   set_data (context: COMMAND_LINE_CONTEXT; data: STRING)
      require
         is_valid_data(data)
      deferred
      ensure
         is_set_at(context)
      end

feature {}
   optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING)
      require
         a_short /= Void implies a_short.count = 1
         a_short /= Void or else a_long /= Void
         a_name /= Void
      do
         if a_short /= Void then
            short := a_short.intern
         end
         if a_long /= Void then
            long := a_long.intern
         end
         name := a_name.intern
         if a_usage /= Void then
            usage := a_usage.intern
         end
      ensure
         is_optional
         a_short /= Void implies short.is_equal(a_short)
         a_long /= Void implies long.is_equal(a_long)
         name.is_equal(a_name)
         a_usage /= Void implies usage.is_equal(a_usage)
      end

   positional (a_name, a_usage: ABSTRACT_STRING)
      require
         a_name /= Void
      do
         name := a_name.intern
         if a_usage /= Void then
            usage := a_usage.intern
         end
         is_mandatory := True
      ensure
         is_positional
         is_mandatory
         name.is_equal(a_name)
         a_usage /= Void implies usage.is_equal(a_usage)
      end

   parent: like Current

feature {}
   detailed: BOOLEAN

invariant
   short /= Void implies short.count = 1

end -- class CLARG_PARSER
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
