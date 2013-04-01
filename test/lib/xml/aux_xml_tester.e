class AUX_XML_TESTER

inherit
   XML_CALLBACKS

insert
   EIFFELTEST_TOOLS
   AUX_XML_STRINGS

creation {AUX_XML_CONFORMANCE}
   valid, not_well_formed, invalid, error

feature {XML_PARSER}
   with_attribute (attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER) is
      do
         -- ignored
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      local
         n: UNICODE_STRING
      do
         n := string_twin(node_name)
         stack.add_last(n)
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      do
         string_pool.recycle(stack.last)
         stack.remove_last
      end

   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      do
         -- ignored
      end

   xml_header (line, column: INTEGER) is
      do
         -- ignored
      end

   processing_instruction (a_target, a_data: UNICODE_STRING) is
      do
         -- ignored
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
      do
         -- ignored
      end

   current_node: UNICODE_STRING is
      do
         if not stack.is_empty then
            Result := stack.last
         end
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER) is
      do
         -- ignored
      end

   parse_error (line, column: INTEGER; message: like error_message) is
      do
         error_message := once ""
         error_message.copy(message)
         error_message.append(once " at line ")
         line.append_in(error_message)
         error_message.append(once ", column ")
         column.append_in(error_message)
      ensure then
         error_message /= Void
      end

   at_error: BOOLEAN is
      do
         Result := error_message /= Void
      end

feature {ANY}
   error_message: STRING
   as_expected: BOOLEAN

feature {}
   make (a_filename: STRING) is
      require
         a_filename /= Void
      local
         p: XML_PARSER; u: STRING; url: URL
      do
         std_output.put_line(a_filename)
         create stack.make(0)
         u := once "file://" + a_filename
         create url.absolute(u)
         url.connect
         label_assert(once "File must exist: " + a_filename, url.is_connected)
         create p.connect_to(url)
         p.parse(Current)
         url.disconnect
      end

   valid (a_filename: STRING) is
         -- Test a valid XML file
      do
         make(a_filename)
         as_expected := not at_error
      end

   not_well_formed (a_filename: STRING) is
         -- Test a not-well-formed XML file
      do
         make(a_filename)
         as_expected := at_error
      end

   invalid (a_filename: STRING) is
         -- Test an invalid XML file
      do
         make(a_filename)
         as_expected := at_error
      end

   error (a_filename: STRING) is
         -- Test an XML file with an OPTIONAL error (either there is no error or the reported error must be
         -- conform to the expected one)
      do
         make(a_filename)
         as_expected := True
      end

   stack: FAST_ARRAY[UNICODE_STRING]

end
