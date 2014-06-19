class EXAMPLE
   --
   -- Very simple example to start with STORABLEs.
   -- Here you will learn how to store/retrieve two STRINGs in an xml file.
   --

create {ANY}
   make

feature {}
   repository_name: STRING "my_repository.xml"

   xml_repository: XML_FILE_REPOSITORY[STRING]
      -- One can store several STRINGs in that `xml_repository'.

   make
      local
         string_1, string_2: STRING
      do
         string_1 := "foo the long string"
         string_2 := "bar"

         std_output.put_string("Saving objects to the repository %"" + repository_name + "%"...%N")
         -- Creation of a new empty repository:
         create xml_repository.connect_to(repository_name)
         -- Storing first STRING into the repository:
         xml_repository.put(string_1, "string 1")
         -- Storing second STRING into the repository:
         xml_repository.put(string_2, "string 2")
         -- Save or overwrite the repository on the disk:
         xml_repository.commit
         -- Forget `string_1' and `string_2':
         string_1 := Void
         string_2 := Void

         std_output.put_string("Retrieve STRINGs from the repository %"" + repository_name + "%"...%N")
         -- Reload in RAM memory the previously saved repository:
         -- (Note that this step is obviously useless in normal
         -- cases; but here we want a clean new object)

         create xml_repository.connect_to(repository_name)
         -- Retrieve the first STRING saved under the name "string 1":
         string_1 := xml_repository.at("string 1")
         -- Retrieve the second STRING saved under the name "string 2":

         string_2 := xml_repository.at("string 2")

         std_output.put_string("string_1 = %"" + string_1 + "%" string_2 = %"" + string_2 + "%"%N")

         std_output.put_string("Curious may have a look at %"" + repository_name + "%" text file.%N")
      end

end -- class EXAMPLE
