class EXAMPLE
   --
   -- Simple example to start with STORABLEs.
   -- Here you will learn how to store/retrieve two ARRAYs in an xml file.
   --

create {ANY}
   make

feature {}
   xml_repository: XML_FILE_REPOSITORY[ARRAY[STRING]]
      -- One can store several ARRAY[STRING] in that `xml_repository'.

   make
      local
         array_1, array_2: ARRAY[STRING]
      do
         if (create {FILE_TOOLS}).file_exists(repository_name) then
            std_output.put_string("Retrieve ARRAYs from the repository %"" + repository_name + "%"...%N")
            create xml_repository.connect_to(repository_name)
            array_1 := xml_repository.at("array_1")
            array_2 := xml_repository.at("array_2")
            display("array_1", array_1)
            display("array_2", array_2)
            -- In order to execute the else branch for the next run:
            (create {FILE_TOOLS}).delete(repository_name)
            std_output.put_string("Repository %"" + repository_name + "%" deleted.%N")
         else
            std_output.put_string("Saving objects to the repository %"" + repository_name + "%"...%N")
            create xml_repository.connect_to(repository_name)
            xml_repository.put(
            <<"foo", "bar">>, "array_1")
            xml_repository.put(
            <<"bar", "foo">>, "array_2")
            xml_repository.commit
            std_output.put_string("Curious may have a look at %"" + repository_name + "%" text file.%N")
         end
      end

   repository_name: STRING "my_repository.xml"

   display (name: STRING; array: ARRAY[STRING])
      local
         i: INTEGER
      do
         std_output.put_string(name + " = << ")
         from
            i := array.lower
         until
            i > array.upper
         loop
            std_output.put_string(array.item(i) + " ")
            i := i + 1
         end

         std_output.put_string(">>%N")
      end

end -- class EXAMPLE
