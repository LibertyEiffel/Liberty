-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PARSE_TERMINAL[C_ -> PARSE_CONTEXT]
   --
   -- A terminal meant to be put in a PARSE_TABLE.
   --

inherit
   PARSE_ATOM[C_]
      redefine
         out_in_tagged_out_memory
      end

insert
   LOGGING
      redefine
         out_in_tagged_out_memory
      end

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "TERMINAL")
      end

   is_coherent: BOOLEAN True

feature {PARSE_TABLE}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      do
         if action = Void and then terminal_builder /= Void then
            action := agent call_terminal_builder(terminal_builder, ?)
         end
      end

feature {PARSER_FACET}
   parse (context: C_): TRISTATE
      local
         memo: INTEGER; image: PARSER_IMAGE
         parse_action: PARSE_ACTION; error_message: STRING
      do
         memo := context.buffer.memo
         image := parser.item([context.buffer]) -- should clear the mark when necessary
         if image /= Void then
            create parse_action.make(agent call_action(image))
            debug ("parse")
               log.trace.put_string(once "%T==>%Tterminal ")
               print_error_position(log.trace, context.buffer)
               log.trace.put_character(' ')
               log.trace.put_character('"')
               log.trace.put_string(name)
               log.trace.put_string(once "%": ")
               log.trace.put_line(image.out)
               parse_action.set_name(once "Shift %"" + name + once "%": " + image.out)
            end
            context.actions.add_last(parse_action)
            Result := yes
         else
            if context.buffer.marked then
               -- The buffer end was reached while reading the image, a good sign that maybe the text could
               -- have continued (note that the mark is cleared by the keyword `parser' when judicious)
               Result := maybe
            else
               Result := no
            end
            error_message := "*** %""
            error_message.append(name)
            error_message.append(once "%" expected")
            add_error_position(error_message, context.buffer)
            context.buffer.set_last_error_message(error_message)
            debug ("parse")
               log.trace.put_string(once "** Expected terminal %"")
               log.trace.put_string(name)
               log.trace.put_string(once "%" ")
               print_error_position(log.trace, context.buffer)
               log.trace.put_new_line
            end
            context.buffer.restore(memo)
         end
      end

feature {}
   make (a_parser: like parser; a_action: like action)
         -- `a_parser' is used to parse the input buffer; it must return Void if the terminal cannot be
         -- parsed, or a STRING containing the corresponding image that will be passed to the `action' if the
         -- terminal is reduced.
      require
         a_parser /= Void
      do
         parser := a_parser
         action := a_action
      ensure
         parser = a_parser
         action = a_action
      end

   parser: FUNCTION[TUPLE[MINI_PARSER_BUFFER], PARSER_IMAGE]

   action: PROCEDURE[TUPLE[PARSER_IMAGE]]

   call_action (image: PARSER_IMAGE)
      require
         action /= Void
         image /= Void
      do
         action.call([image])
      end

   call_terminal_builder (terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]; image: PARSER_IMAGE)
      do
         terminal_builder.call([name, image])
      end

invariant
   parser /= Void

end -- class PARSE_TERMINAL
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
