class AUX_XML_TESTER

inherit
   AUX_XML_CALLBACKS

create {AUX_XML_CONFORMANCE}
   valid, not_well_formed, invalid, error

feature {XML_PARSER}
   with_attribute (attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER)
      do
         -- ignored
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
      local
         n: UNICODE_STRING
      do
         n := string_twin(node_name)
         stack.add_last(n)
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER)
      do
         string_pool.recycle(stack.last)
         stack.remove_last
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER)
      do
         -- ignored
      end

feature {ANY}
   as_expected: BOOLEAN

feature {}
   valid (a_filename: STRING)
         -- Test a valid XML file
      do
         make
         run(a_filename)
         as_expected := not at_error
      end

   not_well_formed (a_filename: STRING)
         -- Test a not-well-formed XML file
      do
         make
         run(a_filename)
         as_expected := at_error
      end

   invalid (a_filename: STRING)
         -- Test an invalid XML file
      do
         make
         run(a_filename)
         as_expected := at_error
      end

   error (a_filename: STRING)
         -- Test an XML file with an OPTIONAL error (either there is no error or the reported error must be
         -- conform to the expected one)
      do
         make
         run(a_filename)
         as_expected := True
      end

end
