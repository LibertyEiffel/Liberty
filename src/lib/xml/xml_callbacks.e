-- See the Copyright notice at the end of this file.
--
deferred class XML_CALLBACKS
   --
   -- Catch parsing events sent by the XML parser.
   --
   -- '''Caveat:''' expect those features to always receive the same UNICODE_STRING object with different
   -- values. You should take care of twinning the object if you want to keep it.
   --
   -- See also XML_PARSER
   --

feature {XML_PARSER}
   set_validator (a_validator: like validator)
         -- Sets a validator for this XML file. The parser uses it when setting a DTD, but you may use it too
         -- to implement other validators (such as an XML Schema).
      require
         validator = Void
         a_validator /= Void
      do
         validator := a_validator
      ensure
         validator = a_validator
      end

   validator: XML_VALIDATOR
         -- The XML validator for this file (DTD, XML Schema...)

   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER)
         -- Called by the parser to add an attribute of a node BEFORE calling `open_node'
      require
         not attribute_name.is_empty
         attribute_value /= Void
      deferred
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER)
         -- When the parser reads an opening node
      require
         not node_name.is_empty
      deferred
      ensure
         not at_error implies current_node.is_equal(node_name)
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER)
         -- When the parser reads a closing node
      require
         not node_name.is_empty
         current_node.is_equal(node_name)
      deferred
      end

   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER)
         -- When the parser reads a node that opens and closes immediately (syntax "<node/>")
      require
         not node_name.is_empty
      deferred
      end

   xml_header (line, column: INTEGER)
         -- Called by the parser if a "<?xml ... ?>" header is read.
         -- Note that with_attribute may have been called first (usually with the version and encoding
         -- attributes)
      deferred
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
         -- Called by the parser if a "<?...?>" processing instruction is read.
      deferred
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING
         -- Called by the parser when an '''&entity;''' is found. Note that standard XML attributes (''lt'',
         -- ''gt'', ''amp'', ''apos'' and ''quot'') are automatically handled and not given to this feature
         -- (they cannot be bypassed).
         -- Returns Void if the entity is not recognized.
      deferred
      end

   open_entity_url (a_entity: UNICODE_STRING; a_url: URL)
         -- Called by the parser when the entity triggers the reading of another stream (i.e. a SYSTEM or
         -- PUBLIC entity)
      require
         a_url /= Void
      deferred
      end

   close_entity_url (a_entity: UNICODE_STRING; a_url: URL)
         -- Called by the parser when the stream triggered by `open_entity_url' is disconnected
      require
         a_url /= Void
      deferred
      end

   current_node: UNICODE_STRING
         -- The current node
      deferred
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER)
         -- Called by the parser when the node contains raw data
      require
         not a_data.is_empty
      deferred
      end

   parse_error (line, column: INTEGER; message: STRING)
         -- Called by the parser if there is an error
      require
         message /= Void
      deferred
      ensure
         at_error
      end

   at_error: BOOLEAN
         -- True if there was at least an error
      deferred
      end

end -- class XML_CALLBACKS
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
