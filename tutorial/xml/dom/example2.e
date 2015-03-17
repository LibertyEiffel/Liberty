class EXAMPLE2
   --
   -- This example is a bit more complex since it uses a subclass of XML_TREE to provide some validation.
   --

inherit
   EXAMPLE1
      redefine make
      end

create {}
   make

feature {}
   make
      local
         in: TEXT_FILE_READ; tree: MY_VALIDATING_TREE; version: UNICODE_STRING
      do
         if argument_count = 0 then
            std_error.put_line(once "Usage: #(1) <file.xml>" # command_name)
            die_with_code(1)
         end
         -- first create the stream
         create in.connect_to(argument(1))
         if in.is_connected then
            -- then create the tree
            create tree.with_error_handler(in.url, agent error(?, ?))
            -- now display the results
            version := tree.attribute_at(once U"version")
            if version /= Void then
               io.put_string(once "XML version: ")
               io.put_string(version.as_utf8)
               io.put_new_line
            end

            tree.root.accept(Current)
         end
      end

end -- class EXAMPLE2
