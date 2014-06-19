class EXAMPLE1
   --
   -- This simple example just uses XML_TREE.
   --
   -- See EXAMPLE2 on how to extend XML_TREE to add validation features.
   --

inherit
   XML_NODE_VISITOR

insert
   ARGUMENTS

create {}
   make

feature {}
   make
      local
         in: TEXT_FILE_READ; tree: XML_TREE; version: UNICODE_STRING
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

            check
               indent = 0
            end
            tree.root.accept(Current)
         end
      end

   indent: INTEGER

feature {XML_DATA_NODE}
   visit_data_node (node: XML_DATA_NODE)
      do -- data not displayed in this example
      end

feature {XML_COMPOSITE_NODE}
   visit_composite_node (node: XML_COMPOSITE_NODE)
      local
         i, start_indent: INTEGER
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
               io.put_string(node.attribute_name(i).as_utf8)
               io.put_character('=')
               io.put_string(node.attribute_value(i).as_utf8)
               i := i + 1
            end

            io.put_character(')')
         end

         io.put_new_line
         from
            start_indent := indent
            indent := start_indent + 1
            i := 1
         invariant
            indent = start_indent + 1
         until
            i > node.children_count
         loop
            node.child(i).accept(Current)
            i := i + 1
         end

         indent := start_indent
      end

   error (line, column: INTEGER)
      do
         std_error.put_string(once "Error at ")
         std_error.put_integer(line)
         std_error.put_string(once ", ")
         std_error.put_integer(column)
         std_error.put_string(once "!%N")
         die_with_code(1)
      end

end -- class EXAMPLE1
