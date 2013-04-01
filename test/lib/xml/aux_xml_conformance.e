class AUX_XML_CONFORMANCE

inherit
   XML_CALLBACKS
      rename
         data as set_data
      end

insert
   EIFFELTEST_TOOLS
   AUX_XML_STRINGS

creation {ANY}
   make

feature {XML_PARSER}
   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER) is
      do
         inspect
            attribute_name.as_utf8
         when "PROFILE" then
            std_output.put_line(attribute_value.as_utf8)
         when "xml:base" then
            base.copy(attribute_value.as_utf8)
         when "TYPE" then
            type.copy(attribute_value.as_utf8)
         when "SECTIONS" then
            std_output.put_string(once "Sections ")
            std_output.put_line(attribute_value.as_utf8)
         when "ID" then
            -- what for?
         when "URI" then
            uri.copy(attribute_value.as_utf8)
         when "OUTPUT" then
            output.copy(attribute_value.as_utf8)
         when "NAMESPACE" then
            inspect
               attribute_value.as_utf8
            when "yes" then
               namespace := True
            else
               namespace := False
            end
         else
            -- ignored
         end
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      local
         tester: AUX_XML_TESTER
         n: like node_name
      do
         n := string_twin(node_name)
         stack.add_last(n)
         inspect
            n.as_utf8
         when "TESTSUITE" then
         when "TESTCASES" then
         when "TESTCASE" then
         when "TEST" then
            inspect
               type
            when "valid" then
               create tester.valid(uri_as_filename)
            when "not-wf" then
               create tester.not_well_formed(uri_as_filename)
            when "invalid" then
               create tester.invalid(uri_as_filename)
            when "error" then
               create tester.error(uri_as_filename)
            end
            label_assert(data.as_utf8, tester.as_expected)
         else
            -- ignored
         end
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

   set_data (a_data: like data; line, column: INTEGER) is
      do
         data := a_data
      end

   parse_error (line, column: INTEGER; message: STRING) is
      do
         error_message := once ""
         error_message.copy(message)
         error_message.append(once " at line ")
         line.append_in(error_message)
         error_message.append(once ", column ")
         column.append_in(error_message)
         error_message.append(once " in ")
         error_message.append(filename)
         error_message.append(once " or an included file.")
         std_output.put_line(error_message)
         label_assert(once "Parse error", False)
      ensure then
         error_message /= Void
      end

feature {ANY}
   error_message: STRING

   at_error: BOOLEAN is
      do
         Result := error_message /= Void
      end

feature {}
   make (a_filename: like filename) is
      require
         a_filename /= Void
      local
         p: XML_PARSER; u: STRING; url: URL
      do
         filename := a_filename
         create base.make_empty
         create type.make_empty
         create uri.make_empty
         create output.make_empty
         create stack.make(0)
         u := once "file://"
         u.append(a_filename)
         create url.absolute(u)
         url.connect
         label_assert(once "File must exist: " + a_filename, url.is_connected)
         create p.connect_to(url)
         p.parse(Current)
         url.disconnect
      end

   filename: STRING
   base, type, uri, output: STRING
   data: UNICODE_STRING
   namespace: BOOLEAN

   stack: FAST_ARRAY[UNICODE_STRING]

   uri_as_filename: STRING is
      local
         i, j: INTEGER; p: STRING
         bd: BASIC_DIRECTORY
      do
         Result := once ""
         p := once ""
         bd.compute_parent_directory_of(filename)
         Result.copy(bd.last_entry)
         from
            j := 1
            i := uri.first_index_of('/')
         until
            not p.valid_index(i) or else Result.is_empty
         loop
            p.copy(uri)
            p.shrink(j, i)
            bd.compute_subdirectory_with(Result, p)
            Result.copy(bd.last_entry)
            j := i + 1
            i := uri.index_of('/', j)
         end
         p.copy(uri)
         p.shrink(j, p.upper)
         bd.compute_file_path_with(Result, p)
         Result.copy(bd.last_entry)
      end

invariant
   filename /= Void

end
