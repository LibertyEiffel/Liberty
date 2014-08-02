class AUX_XML_CONFORMANCE

inherit
   AUX_XML_CALLBACKS
      rename
         data as set_data,
         make as aux_make
      end

create {ANY}
   make

feature {XML_PARSER}
   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER)
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

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
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

   close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         string_pool.recycle(stack.last)
         stack.remove_last
      end

   set_data (a_data: like data; line, column: INTEGER)
      do
         data := a_data
      end

feature {}
   make (a_filename: STRING)
      require
         a_filename /= Void
      do
         base := ""
         type := ""
         uri := ""
         output := ""
         aux_make
         run(a_filename)
      end

   base, type, uri, output: STRING
   data: UNICODE_STRING
   namespace: BOOLEAN

   uri_as_filename: STRING
      local
         i: INTEGER
         url: URL
      do
         create url.relative(urls.last, uri)
         Result := url.out
         from
            from
               i := Result.lower
            until
               Result.item(i) = '/'
            loop
               i := i + 1
            end
         until
            Result.item(i) /= '/'
         loop
            i := i + 1
         end
         Result.remove_head(i - Result.lower - 1)
      end

end
