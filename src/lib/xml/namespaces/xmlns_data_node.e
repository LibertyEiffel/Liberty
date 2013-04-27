class XMLNS_DATA_NODE
   --
   -- A node in an XMLNS_TREE
   --

inherit
   XMLNS_NODE

create {XMLNS_TREE}
   make

feature {ANY}
   data: UNICODE_STRING
         -- Data in the node, if there is some.

feature {}
   make (a_data: like data; a_line: like line; a_column: like column) is
      require
         a_data /= Void
         a_line > 0
         a_column > 0
      do
         data := a_data
         line := a_line
         column := a_column
      end

invariant
   data /= Void

end -- class XMLNS_DATA_NODE
