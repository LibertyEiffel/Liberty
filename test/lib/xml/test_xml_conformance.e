class TEST_XML_CONFORMANCE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         tester: AUX_XML_CONFORMANCE
         bd: BASIC_DIRECTORY
         path: STRING
      do
         path := once ""
         path.make_from_string(bd.current_working_directory)
         bd.compute_subdirectory_with(path, once "eiffeltest")
         path.make_from_string(bd.last_entry)
         bd.compute_subdirectory_with(path, once "data")
         path.make_from_string(bd.last_entry)
         bd.compute_file_path_with(path, once "xmlconf.xml")
         path.make_from_string(bd.last_entry)
         create tester.make(path)
         assert(not tester.at_error)
      end

end
