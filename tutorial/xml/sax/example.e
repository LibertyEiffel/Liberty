class EXAMPLE
   --
   -- Use the event-oriented interface
   --

inherit
   XML_CALLBACKS

insert
   ARGUMENTS

create {}
   make

feature {}
   parser: XML_PARSER

   make
      local
         in: URL
      do
         create in.absolute("file://" + argument(1))

         -- connect the parser
         create parser.connect_to(in)

         -- create the nodes stack (current_node must be correctly
         -- implemented because the contracts check that)
         create nodes.make

         -- parse the flow. Everything else is handled by the
         -- parser that calls back the following features.
         parser.parse(Current)

         -- then disconnect
         parser.disconnect

         if at_error then
            die_with_code(1)
         end
      end

feature {XML_PARSER}
   nodes: STACK[UNICODE_STRING]

   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER)
      do
         io.put_string(once "with attribute: ")
         io.put_unicode_string(attribute_name)
         io.put_string(once "='")
         io.put_unicode_string(attribute_value)
         io.put_string(once "' at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_new_line
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         io.put_string(once "open node %"")
         io.put_unicode_string(node_name)
         io.put_string(once "%" at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_new_line
         nodes.push(node_name)
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         io.put_string(once "close node %"")
         io.put_unicode_string(node_name)
         io.put_string(once "%" at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_new_line
         nodes.pop
      end

   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         io.put_string(once "open and close node %"")
         io.put_unicode_string(node_name)
         io.put_string(once "%" at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_new_line
      end

   xml_header (line, column: INTEGER)
      do
         io.put_string(once "that's the XML header at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_new_line
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
      do
         io.put_string(once "a processing instruction: target is %"")
         io.put_unicode_string(a_target)
         io.put_string(once "%", data is %"")
         io.put_unicode_string(a_data)
         io.put_string(once "%"")
      end

   current_node: UNICODE_STRING
      do
         if not nodes.is_empty then
            Result := nodes.top
         end
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING
      do -- no entity recognized
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER)
      do
         io.put_string(once "data at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_string(once ":%N")
         io.put_unicode_string(a_data)
         io.put_string(once "%N.%N")
      end

   parse_error (line, column: INTEGER; message: STRING)
      do
         at_error := True -- that's useless since we die, but respect the postcondition anyway ;-)
         io.put_string(once "error at ")
         io.put_integer(line)
         io.put_string(once ", ")
         io.put_integer(column)
         io.put_string(once "!%N")
         io.put_line(message)
         sedb_breakpoint
      end

   at_error: BOOLEAN

   open_entity_url (a_entity: UNICODE_STRING; a_url: URL)
      do
         io.put_string(once "open entity url &")
         io.put_string(a_entity.as_utf8)
         io.put_string(once ": ")
         io.put_line(a_url.out)
      end

   close_entity_url (a_entity: UNICODE_STRING; a_url: URL)
      do
         io.put_string(once "close entity url &")
         io.put_string(a_entity.as_utf8)
         io.put_string(once ": ")
         io.put_line(a_url.out)
      end

end -- class EXAMPLE
