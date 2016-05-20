class TEST_XML_00

insert
   XML2_PARSER
   EIFFELTEST_TOOLS
   FILE_TOOLS
   SYSTEM

create {ANY} test
feature {ANY}
   filename: STRING "test.xml"

   test
      do
         if not file_exts(filename) then
            -- Generating test xml from stdlib.h C header
            execute_command_line(once "make")
         end
         doc:=parse_file(filename)
         label_assert(once "Parsing XML", doc/=Void)
         label_assert(once "Root exts", doc.root/=Void)
         parse(doc.root)
      end

   doc: XML2_DOC

   parse (a_node: XML2_NODE)
      -- Recursively parse `a_node'.
   local child,next: XML2_NODE
   do
      label_assert(once "Name exts", a_node.name/=Void)
      -- if  once " <") until loop end
      from child:=a_node.first until child=Void
      loop
         label_assert(once "Correct parent child relationship",are_parent_and_son(child.parent,child))
         parse(child)
         next:=child.next
         if next/=Void then
            label_assert (once "Correct brotherwood relationship", child=next.prev)
         end
         child:=next
      end
   end

   are_parent_and_son (a_node, another: XML2_NODE): BOOLEAN
      -- Is `a_node' the actual parent of `another'?
   require
      a_node/=Void
      another/=Void
   local child: XML2_NODE
   do
      from child:=a_node.first until Result=True or else child=Void
      loop
         Result := (another=child)
         child  := child.next
      end
   end
end -- TEST_XML_00
