class EXAMPLE_HTTP_CLIENT
   --
   -- Some ideas and first draft of this class kindly provided by Serge [mailto:se@sir.nensi.net]
   --

inherit
   XML_NODE_VISITOR
      undefine
         default_create
      end

insert
   PROTOCOLS

create {ANY}
   make

feature {}
   proxy: HTTP_PROXY

   make
      do
         test_socket(create {URL}.absolute("http://noc.nensi.net/se/test.xml"))
         --| --8<--| TODO |--8<--
         --| test_socket(create {URL}.absolute("http://et.liberty-eiffel.org/Liberty/tutorial/xml/sax/example.xml"))
         --| -->8------------>8--
      end

   test_socket (url: URL)
      local
         input: INPUT_STREAM; tree: XML_TREE; version: UNICODE_STRING
      do
         url.set_error_handler(agent (err: STRING) do std_error.put_line("**** Error: #(1)" # err) end (?))
         url.connect
         if url.is_connected then
            input := url.input
            create tree.with_error_handler(input.url, agent error(?, ?))
            version := tree.attribute_at(once U"version")
            if version /= Void then
               io.put_string(once "XML version: ")
               io.put_string(version.as_utf8)
               io.put_new_line
            end

            check
               indent = 0
            end
            tree.root.accept(Current)
            url.disconnect
         else
            std_error.put_line("URL not connected!")
         end
      end

   error (line, column: INTEGER)
      do
         std_error.put_string("Error at ")
         std_error.put_integer(line)
         std_error.put_string(", ")
         std_error.put_integer(column)
         std_error.put_string("!%N")
         die_with_code(1)
      end

feature {XML_COMPOSITE_NODE}
   visit_composite_node (node: XML_COMPOSITE_NODE)
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
         io.put_string(node.name.as_utf8)
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
               io.put_string(node.attribute_name(i).as_utf8)
               io.put_character('=')
               io.put_string(node.attribute_value(i).as_utf8)
               i := i + 1
            end

            io.put_character(')')
         end

         io.put_new_line
         indent := indent + 1
         from
            i := 1
         until
            i > node.children_count
         loop
            node.child(i).accept(Current)
            i := i + 1
         end
         indent := indent - 1
      end

feature {XML_DATA_NODE}
   visit_data_node (node: XML_DATA_NODE)
      do
      end

feature {}
   indent: INTEGER

end -- class EXAMPLE_HTTP_CLIENT
