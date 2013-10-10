-- See the Copyright notice at the end of this file.
--
class XML_PARSER
   --
   -- The standard SmartEiffel XML parser. It is able to parse any well-formed WML document, and also can
   -- validate a document containing a DTD.
   --
   -- Note that this parser is not namespace-aware, nor daoes it validate documents using a Schema. Classes
   -- to that avail must be built on top of this parser.
   --
   -- See http://www.w3.org/TR/2006/REC-xml11-20060816/
   --
   -- See also XML_CALLBACKS which is called by this parser when a parsing event occurs.
   --
insert
   XML_PARSER_TOOLS
      redefine
         next, end_of_input
      end

create {ANY}
   connect_to, make

feature {ANY}
   parse (a_callbacks: like callbacks) is
         -- Parse an XML documents by sending parsing events to the given `callbacks'
      require
         is_connected
      local
         pn: like parse_node
      do
         callbacks := a_callbacks
         pn := parse_node(True)
         if validator /= Void then
            validator.the_end
         end
      end

   connect_to (a_url: URL) is
      require
         not is_connected
         a_url.is_connected implies a_url.read
      do
         make
         if not a_url.is_connected and then a_url.can_connect then
            a_url.read_only
            a_url.connect
         end
         if a_url.is_connected then
            check
               a_url.read
            end
            connect_buffer(a_url)
         end
      ensure
         a_url.is_connected implies (a_url = buffer.url and then is_connected)
      end

   disconnect is
      require
         is_connected
      do
         from
         until
            not is_connected
         loop
            disconnect_buffer
         end
      ensure
         not is_connected
      end

   is_connected: BOOLEAN is
      do
         Result := open_buffers /= Void and then not open_buffers.is_empty and then buffer.is_connected
      end

feature {}
   callbacks: XML_CALLBACKS
   url: URL

   set_url (a_url: like url) is
      do
         url := a_url
      end

   parse_node (at_root: BOOLEAN): INTEGER is
         -- True if a node was successfully parsed
      require
         is_connected
      local
         name, entity, entity_value, data, data_blanks, pi_target, pi_data: UNICODE_STRING
         again, done, open, open_close: BOOLEAN; l, c: INTEGER
      do
         from
            again := True
         invariant
            is_connected
         until
            not again or else callbacks.at_error
         loop
            again := False
            skip_blanks
            l := line
            c := column
            from
               data := once U""
               data.clear_count
               data_blanks := once U""
               data_blanks.clear_count
            until
               end_of_input or else skip('<')
            loop
               if is_separator(current_character) then
                  if data.is_empty then
                     data_blanks.add_last(current_character)
                  else
                     data.add_last(current_character)
                  end
               else
                  if not data_blanks.is_empty then
                     data.append_string(data_blanks)
                     data_blanks.clear_count
                  end
                  if current_character = '&'.code then
                     l := line
                     c := column
                     next
                     entity := read_identifier
                     if current_character = ';'.code then
                        if entity.is_equal(once U"lt") then
                           data.add_last('<'.code)
                           next
                        elseif entity.is_equal(once U"gt") then
                           data.add_last('>'.code)
                           next
                        elseif entity.is_equal(once U"amp") then
                           data.add_last('&'.code)
                           next
                        elseif entity.is_equal(once U"apos") then
                           data.add_last('%''.code)
                           next
                        elseif entity.is_equal(once U"quot") then
                           data.add_last('"'.code)
                           next
                        else
                           if validator /= Void then
                              entity_value := validator.entity(entity, l, c)
                              if entity_value = Void then
                                 entity_value := callbacks.entity(entity, l, c)
                              end
                           else
                              entity_value := callbacks.entity(entity, l, c)
                           end
                           if entity_value = Void then
                              callbacks.parse_error(l, c, once "Unknown entity")
                              Result := Parse_error
                           else
                              next
                              connect_buffer_entity_value(entity_value)
                           end
                        end
                     else
                        callbacks.parse_error(l, c, once "Missing ';'")
                        Result := Parse_error
                     end
                  else
                     data.add_last(current_character)
                     next
                  end
               end
            end
            if not data.is_empty then
               if validator /= Void and then not validator.is_valid_data(data, l, c) then
                  callbacks.parse_error(l, c, once "Invalid data")
                  Result := Parse_error
               else
                  if validator /= Void then
                     validator.data(data, l, c)
                  end
                  callbacks.data(data, l, c)
               end
            end
            if Result /= Parse_error then
               if end_of_input then
                  Result := Parse_done
               else
                  if skip('/') then
                     skip_blanks
                     l := line
                     c := column
                     name := read_name
                     if name = Void then
                        callbacks.parse_error(l, c, once "Tag name expected")
                        Result := Parse_error
                     else
                        skip_blanks
                        if not skip('>') then
                           callbacks.parse_error(l, c, once "Missing '>'")
                           Result := Parse_error
                        else
                           if callbacks.current_node.is_equal(name) then
                              if validator = Void then
                                 callbacks.close_node(name, l, c)
                                 Result := Parse_done
                              elseif not validator.is_valid_close_node(name, l, c) then
                                 callbacks.parse_error(l, c, once "Invalid closing tag")
                                 Result := Parse_error
                              else
                                 validator.close_node(name, l, c)
                                 callbacks.close_node(name, l, c)
                                 Result := Parse_done
                              end
                           else
                              callbacks.parse_error(l, c, once "Unexpected closing tag")
                              Result := Parse_error
                           end
                        end
                     end
                  elseif skip('!') then
                     if skip2('-', '-') then
                        from
                        until
                           skip2('-', '-') and then skip('>')
                        loop
                           next
                        end
                        again := True
                     elseif skip_word(once "[CDATA[") then
                        read_cdata
                        again := True
                     elseif at_root and then skip_word(once "DOCTYPE") then
                        read_dtd
                        again := True
                     else
                        callbacks.parse_error(l, c, once "Syntax error")
                        Result := Parse_error
                     end
                  elseif at_root and then skip('?') then
                     skip_blanks
                     if skip_word(once "xml") then
                        from
                        until
                           done
                        loop
                           skip_blanks
                           if skip('?') then
                              if not skip('>') then
                                 callbacks.parse_error(l, c, once "Missing '>'")
                                 Result := Parse_error
                              else
                                 done := True
                              end
                           else
                              Result := parse_attribute(buffer)
                              done := Result = Parse_done
                           end
                        end
                        if Result /= Parse_error then
                           callbacks.xml_header(l, c)
                           again := True
                        end
                     else
                        pi_target := read_identifier
                        pi_data := once U""
                        pi_data.clear_count
                        from
                        until
                           done
                        loop
                           if skip('?') then
                              if skip('>') then
                                 done := True
                              else
                                 pi_data.extend('?'.code)
                              end
                           else
                              pi_data.extend(current_character)
                              next
                           end
                           if end_of_input then
                              done := True
                           end
                        end
                        if not end_of_input then
                           callbacks.processing_instruction(pi_target, pi_data)
                           Result := Parse_done
                        else
                           Result := Parse_error
                        end
                     end
                  else
                     skip_blanks
                     l := line
                     c := column
                     name := read_name
                     if name = Void then
                        callbacks.parse_error(l, c, once "Tag name expected")
                        Result := Parse_error
                     else
                        skip_blanks
                        if skip('>') then
                           if validator /= Void and then not validator.is_valid_open_node(name, l, c) then
                              callbacks.parse_error(l, c, once "Invalid opening tag")
                              Result := Parse_error
                           else
                              if validator /= Void then
                                 validator.open_node(name, l, c)
                              end
                              callbacks.open_node(name, l, c)
                           end
                           Result := parse_children
                        elseif skip2('/', '>') then
                           if validator /= Void and then not validator.is_valid_open_close_node(name, l, c) then
                              callbacks.parse_error(l, c, once "Invalid empty tag")
                              Result := Parse_error
                           else
                              if validator /= Void then
                                 validator.open_close_node(name, l, c)
                              end
                              callbacks.open_close_node(name, l, c)
                           end
                           Result := Parse_again
                        else
                           from
                              Result := parse_attribute(Void)
                              if skip('>') then
                                 done := True
                                 open := True
                              elseif skip2('/', '>') then
                                 done := True
                                 open_close := True
                              else
                                 done := Result /= Parse_again
                              end
                           until
                              done
                           loop
                              Result := parse_attribute(Void)
                              if skip('>') then
                                 done := True
                                 open := True
                              elseif skip2('/', '>') then
                                 done := True
                                 open_close := True
                              else
                                 done := Result /= Parse_again
                              end
                           end
                           if Result /= Parse_error then
                              if open then
                                 if validator /= Void and then not validator.is_valid_open_node(name, l, c) then
                                    callbacks.parse_error(l, c, once "Invalid opening tag")
                                    Result := Parse_error
                                 else
                                    if validator /= Void then
                                       validator.open_node(name, l, c)
                                    end
                                    callbacks.open_node(name, l, c)
                                    Result := parse_children
                                 end
                              elseif open_close then
                                 if validator /= Void and then not validator.is_valid_open_close_node(name, l, c) then
                                    callbacks.parse_error(l, c, once "Invalid empty tag")
                                    Result := Parse_error
                                 else
                                    if validator /= Void then
                                       validator.open_close_node(name, l, c)
                                    end
                                    callbacks.open_close_node(name, l, c)
                                 end
                              end
                           end
                        end
                     end
                  end
               end
            end
         end
         if callbacks.at_error then
            Result := Parse_error
         end
      ensure
         (
         <<Parse_again, Parse_done, Parse_error>>).has(Result)
      end

   read_name: UNICODE_STRING is
      local
         name: UNICODE_STRING
      do
         name := read_identifier
         if name /= Void then
            Result := once U""
            Result.copy(name)
         end
      end

   parse_attribute (a_buffer: UNICODE_PARSER_BUFFER): INTEGER is
         -- if `a_buffer' if not Void and the attribute is "encoding", set the buffer's encoding.
      local
         a, an_attribute, value: UNICODE_STRING; l, c: INTEGER; sa, sv: STRING
      do
         skip_blanks
         l := line
         c := column
         a := read_identifier
         if a = Void then
            Result := Parse_done
         else
            skip_blanks
            if not skip('=') then
               callbacks.parse_error(l, c, once "Missing '='")
               Result := Parse_error
            else
               skip_blanks
               an_attribute := once U""
               an_attribute.copy(a)
               debug
                  sa := an_attribute.as_utf8
               end
               value := read_string
               if value = Void then
                  callbacks.parse_error(l, c, once "Value expected")
                  Result := Parse_error
               else
                  if buffer /= Void then
                     sa := once ""
                     sa.clear_count
                     an_attribute.utf8_encode_in(sa)
                     inspect
                        sa
                     when "encoding" then
                        sv := once ""
                        value.utf8_encode_in(sv)
                        buffer.set_encoding(sv)
                     else
                     end
                  end
                  if validator /= Void then
                     validator.with_attribute(an_attribute, value, l, c)
                  end
                  callbacks.with_attribute(an_attribute, value, l, c)
                  skip_blanks
               end
            end
         end
      end

   parse_children: INTEGER is
      do
         from
            Result := parse_node(False)
         until
            Result /= Parse_again or else callbacks.at_error
         loop
            Result := parse_node(False)
         end
         if callbacks.at_error then
            Result := Parse_error
         elseif Result /= Parse_error then
            Result := Parse_again
         end
      ensure
         (<<Parse_again, Parse_done, Parse_error>>).has(Result)
      end

   read_cdata is
      local
         l, c, s: INTEGER; b: UNICODE_STRING
      do
         l := line
         c := column
         from
            b := once U""
            b.clear_count
         until
            s < 0
         loop
            inspect
               s
            when 0 then
               if current_character = ']'.code then
                  s := 2
               else
                  b.extend('%N'.code)
                  b.extend(current_character)
                  s := 0
               end
            when 2 then
               if current_character = ']'.code then
                  s := 3
               else
                  b.extend(']'.code)
                  b.extend(current_character)
                  s := 0
               end
            when 3 then
               if current_character = '>'.code then
                  s := -1
               else
                  b.append(once U"]]")
                  b.extend(current_character)
                  s := 0
               end
            end
            next
         end
         if validator /= Void and then not validator.is_valid_data(b, l, c) then
            callbacks.parse_error(l, c, once "Invalid CDATA")
         else
            if validator /= Void then
               validator.data(b, l, c)
            end
            callbacks.data(b, l, c)
         end
      end

   read_dtd is
      require
         is_connected
      do
         callbacks.set_validator(dtd_parser.parse(buffer))
         skip_blanks
         if dtd_parser.has_error then
            callbacks.parse_error(line, column, dtd_parser.error_message)
         end
      end

feature {}
   Parse_again: INTEGER is 0

   Parse_done: INTEGER is 1

   Parse_error: INTEGER is -1

feature {}
   next is
      do
         if buffer.end_of_input then
            disconnect_buffer
         end
         buffer.next
      end

   end_of_input: BOOLEAN is
      do
         Result := buffer.end_of_input and then open_buffers.count = 1
      end

feature {}
   buffer: UNICODE_PARSER_BUFFER is
      do
         if not open_buffers.is_empty then
            Result := open_buffers.top
         end
      ensure
         definition: Result = open_buffers.top
      end

   make is
         -- Create a not connected parser
      do
         create open_buffers.make
      end

   dtd_parser: XML_DTD_PARSER is
      once
         create Result.make
      end

   validator: XML_VALIDATOR is
      do
         Result := callbacks.validator
      end

   open_buffers: STACK[UNICODE_PARSER_BUFFER]

   closed_buffers: RECYCLING_POOL[UNICODE_PARSER_BUFFER] is
      once
         create Result.make
      end

   connect_buffer (a_url: URL) is
      local
         buf: like buffer
      do
         if not closed_buffers.is_empty then
            buf := closed_buffers.item
         end
         if buf = Void then
            create buf.connect_to(a_url, Void)
         else
            buf.connect_to(a_url, Void)
         end
         if buf.is_connected then
            check
               a_url = buf.url
            end
            open_buffers.push(buf)
         end
      ensure
         a_url.is_connected implies (
            open_buffers.count = old open_buffers.count + 1
            and then a_url = buffer.url
         )
      end

   connect_buffer_entity_value (entity_value: UNICODE_STRING) is
         --| **** TODO: hunt memory leaks
      require
         entity_value /= Void
      local
         sis: STRING_INPUT_STREAM
      do
         create sis.from_string(entity_value.as_utf8)
         connect_buffer(sis.url)
      end

   disconnect_buffer is
      require
         not open_buffers.is_empty
      do
         buffer.disconnect
         open_buffers.pop
      ensure
         open_buffers.count = old open_buffers.count - 1
         not (old buffer).is_connected
      end

end -- class XML_PARSER
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
