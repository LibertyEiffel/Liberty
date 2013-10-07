class EXAMPLE_HTTP_CLIENT
   --
   -- Some ideas and first draft of this class kindly provided by Serge [mailto:se@sir.nensi.net]
   --

insert
   PROTOCOLS

create {ANY}
   make

feature {}
   proxy: HTTP_PROXY

   make is
      local
         url: URL
      do
         --proxy.set_url(create {URL}.set_url("http://my-proxy.net/"))
         create url.absolute("http://noc.nensi.net/se/test.xml")
         test_socket(url)
      end

   test_socket (url: URL) is
      local
         input: INPUT_STREAM; tree: XML_TREE; version: STRING
      do
         url.set_error_handler(agent std_error.put_line)
         url.connect
         if url.is_connected then
            input := url.input
            create tree.with_error_handler(input, agent error)
            version := tree.attribute_at(once "version")
            if version /= Void then
               io.put_string(once "XML version: ")
               io.put_string(version)
               io.put_new_line
            end

            display_node(tree.root, 0)
            url.disconnect
         else
            std_error.put_line("URL not connected!")
         end
      end

   display_node (node: XML_NODE; indent: INTEGER) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > indent
         loop
            io.put_string(once "  ")
            i := i + 1
         end
         io.put_string(node.name)
         if node.attributes_count > 0 then
            io.put_character('(')
            from
               i := 1
            until
               i > node.attributes_count
            loop
               if i > 1 then
                  io.put_string(once ", ")
               end
               -- if
               io.put_string(node.attribute_name(i))
               io.put_character('=')
               io.put_string(node.attribute_value(i))
               i := i + 1
            end

            io.put_character(')')
         end

         io.put_new_line
         from
            i := 1
         until
            i > node.children_count
         loop
            display_node(node.child(i), indent + 1)
            i := i + 1
         end
      end

   error (line, column: INTEGER) is
      do
         std_error.put_string("Error at ")
         std_error.put_integer(line)
         std_error.put_string(", ")
         std_error.put_integer(column)
         std_error.put_string("!%N")
         die_with_code(1)
      end

end -- class EXAMPLE_HTTP_CLIENT
