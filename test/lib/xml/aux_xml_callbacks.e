deferred class AUX_XML_CALLBACKS

inherit
   XML_CALLBACKS

insert
   EIFFELTEST_TOOLS
   AUX_XML_STRINGS

feature {ANY}
   at_error: BOOLEAN

feature {XML_PARSER}
   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER)
         -- When the parser reads a node that opens and closes immediately (syntax "<node/>")
      do
         open_node(node_name, line, column)
         close_node(node_name, line, column)
      end

   xml_header (line, column: INTEGER)
      do
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
      do
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING
      do
      end

   open_entity_url (a_entity: UNICODE_STRING; a_url: URL)
      do
         urls.add_last(a_url)
      end

   close_entity_url (a_entity: UNICODE_STRING; a_url: URL)
      do
         assert(not urls.is_empty and then urls.last.is_equal(a_url))
         urls.remove_last
      end

   current_node: UNICODE_STRING
      do
         Result := stack.last
      end

   parse_error (line, column: INTEGER; message: STRING)
         -- Called by the parser if there is an error
      do
         at_error := True
      end

feature {}
   stack: FAST_ARRAY[UNICODE_STRING]
   urls: FAST_ARRAY[URL]

   make
      do
         create stack.with_capacity(32)
         create urls.with_capacity(2)
      end

   run (a_filename: STRING)
      require
         a_filename /= Void
      local
         url: URL; xml_parser: XML_PARSER
         url_string: STRING
         bd: BASIC_DIRECTORY
      do
         bd.compute_absolute_file_path_with(a_filename)
         url_string := once ""
         url_string.copy(once "file://")
         url_string.append(bd.last_entry)
         url := new_url(url_string)
         if not url.can_connect then
            std_error.put_line("Cannot connect: " + a_filename)
            die_with_code(1)
         end
         url.connect
         if not url.is_connected then
            std_error.put_line("Connection failed: " + a_filename)
            die_with_code(1)
         end
         xml_parser := new_xml_parser
         xml_parser.connect_to(url)
         if not xml_parser.is_connected then
            std_error.put_line("Could not connect XML parser: " + a_filename)
            die_with_code(1)
         end
         xml_parser.parse(Current)
         xml_parser.disconnect
         check
            not url.is_connected
         end
         xml_parser_pool.add_last(xml_parser)
         url_pool.add_last(url)
      end

   url_pool: FAST_ARRAY[URL]
      once
         create Result.with_capacity(2)
      ensure
         Result.for_all(agent(url: URL): BOOLEAN then not url.is_connected end (?))
      end

   new_url (string: STRING): URL
      do
         if url_pool.is_empty then
            create Result.absolute(string)
         else
            Result := url_pool.last
            url_pool.remove_last
            Result.absolute(string)
         end
      ensure
         not Result.is_connected
         Result.is_equal(create {URL}.absolute(string))
      end

   xml_parser_pool: FAST_ARRAY[XML_PARSER]
      once
         create Result.with_capacity(2)
      ensure
         Result.for_all(agent(xp: XML_PARSER): BOOLEAN then not xp.is_connected end (?))
      end

   new_xml_parser: XML_PARSER
      do
         if xml_parser_pool.is_empty then
            create Result.make
         else
            Result := xml_parser_pool.last
            xml_parser_pool.remove_last
         end
      ensure
         not Result.is_connected
      end

end
