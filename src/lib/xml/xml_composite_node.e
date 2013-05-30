-- See the Copyright notice at the end of this file.
--
class XML_COMPOSITE_NODE
   --
   -- A named node containing children
   --

inherit
   XML_NODE

create {ANY}
   make

feature {ANY}
   name: UNICODE_STRING
         -- The name of the node

   attribute_name (index: INTEGER): UNICODE_STRING is
         -- The name of the i'th attribute
      require
         index.in_range(1, attributes_count)
      do
         Result := attributes.key(index)
      end

   attribute_value (index: INTEGER): UNICODE_STRING is
         -- The value of the i'th attribute
      require
         index.in_range(1, attributes_count)
      do
         Result := attributes.item(index)
      end

   attribute_at (a_attribute_name: UNICODE_STRING): UNICODE_STRING is
         -- The value of the attribute given by its name; Void if not set
      do
         Result := attributes.reference_at(a_attribute_name)
      end

   attributes_count: INTEGER is
         -- The number of attributes
      do
         Result := attributes.count
      end

   child (index: INTEGER): XML_NODE is
         -- The i'th child
      require
         index.in_range(1, children_count)
      do
         Result := children.item(index - 1)
      end

   children_count: INTEGER is
         -- The number of children
      do
         Result := children.count
      end

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: XML_NODE_VISITOR
      do
         v ::= visitor
         v.visit_composite_node(Current)
      end

feature {XML_TREE}
   set_attribute (a_attribute_name, a_attribute_value: UNICODE_STRING) is
      require
         a_attribute_name /= Void
         a_attribute_value /= Void
      do
         attributes.add(a_attribute_value, a_attribute_name)
      ensure
         attribute_at(a_attribute_name) = a_attribute_value
      end

   add_child (node: XML_NODE) is
      require
         node /= Void
         node.parent = Void
      do
         children.add_last(node)
         node.set_parent(Current)
      ensure
         node.parent = Current
         child(children_count) = node
      end

feature {}
   children: FAST_ARRAY[XML_NODE]

   attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

   make (a_name: like name; a_line: like line; a_column: like column) is
      require
         a_line > 0
         a_column > 0
      do
         name := a_name
         line := a_line
         column := a_column
         create attributes.make
         create children.make(0)
      end

invariant
   name /= Void

end -- class XML_COMPOSITE_NODE
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
