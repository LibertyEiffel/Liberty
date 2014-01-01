-- See the Copyright notice at the end of this file.
--
deferred class XMLNS_VALIDATOR
   --
   -- Helps the parser to validate an XMLNS file
   --

feature {XMLNS_PARSER}
   with_attribute (attribute_namespace, attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER) is
         -- Called by the parser to add an attribute of a node BEFORE calling `open_node'
      require
         not attribute_name.is_empty
         not attribute_value.is_empty
      deferred
      end

   is_valid_open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
         -- When the parser reads an opening node
      require
         not node_name.is_empty
      deferred
      end

   is_valid_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
         -- When the parser reads a closing node
      require
         not node_name.is_empty
         current_node.is_equal(node_name)
      deferred
      end

   is_valid_open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
         -- When the parser reads a node that opens and closes immediately (syntax "<node/>")
      require
         not node_name.is_empty
      deferred
      end

   open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
         -- When the parser reads an opening node
      require
         is_valid_open_node(node_namespace, node_name, line, column)
      deferred
      ensure
         current_node.is_equal(node_name)
      end

   close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
         -- When the parser reads a closing node
      require
         is_valid_close_node(node_namespace, node_name, line, column)
      deferred
      end

   open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER) is
         -- When the parser reads a node that opens and closes immediately (syntax "<node/>")
      require
         is_valid_open_close_node(node_namespace, node_name, line, column)
      deferred
      end

   current_node: UNICODE_STRING is
         -- The current node
      deferred
      end

   current_namespace: UNICODE_STRING is
         -- The current namespace
      deferred
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
         -- When the parser reads an '''&entity;'''.
      deferred
      end

   is_valid_data (a_data: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
         -- Called by the parser when the node contains raw data
      require
         not a_data.is_empty
      deferred
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER) is
         -- Called by the parser when the node contains raw data
      require
         not a_data.is_empty
      deferred
      end

   the_end is
         -- Called when the xml is totally parsed; usually it is used to recycle memory resources
      deferred
      end

end -- class XMLNS_VALIDATOR
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
