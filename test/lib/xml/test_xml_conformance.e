class TEST_XML_CONFORMANCE

insert
	EIFFELTEST_TOOLS

creation {}
	make

feature {}
	make is
		local
			tester: AUX_XML_CONFORMANCE
			bd: BASIC_DIRECTORY
			path: STRING
		do
			path := once ""
			path.copy(bd.current_working_directory)
			bd.compute_subdirectory_with(path, once "xmlconf")
			path.copy(bd.last_entry)
			bd.compute_file_path_with(path, once "xmlconf.xml")
			path.copy(bd.last_entry)
			create tester.make(path)
			assert(not tester.at_error)
		end

end
