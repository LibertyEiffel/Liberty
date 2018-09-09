-- See the Copyright notice at the end of this file.
--
class XMLNS_TREE
   --
   -- DOM-like namespace-aware representation of an XML document
   --
   -- See also XMLNS_PARSER, XML_TREE
   --

inherit
   XMLNS_CALLBACKS

create {ANY}
   make, with_error_handler

feature {ANY}
   root: XMLNS_COMPOSITE_NODE
         -- The root of the tree

   attribute_at (a_attribute_name: UNICODE_STRING): UNICODE_STRING
         -- Usually to recover the "version" or "encoding" attributes
      do
         Result := tree_attributes.reference_at(a_attribute_name)
      end

   set_processing_instruction (target: UNICODE_STRING; processor: PROCEDURE[TUPLE[UNICODE_STRING]])
      require
         target /= Void
         processor /= Void
      local
         processors: FAST_ARRAY[PROCEDURE[TUPLE[UNICODE_STRING]]]
      do
         processors := processing_instructions.reference_at(target)
         if processors = Void then
            create processors.make(0)
            processing_instructions.add(processors, target.twin)
         end
         processors.add_last(processor)
      end

feature {}
   attributes: HASHED_DICTIONARY[HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING], UNICODE_STRING]
   no_namespace_attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

   tree_attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

   open_nodes: STACK[XMLNS_COMPOSITE_NODE]

   processing_instructions: HASHED_DICTIONARY[FAST_ARRAY[PROCEDURE[TUPLE[UNICODE_STRING]]], UNICODE_STRING]
      once
         create Result.make
      end

feature {XMLNS_PARSER}
   with_attribute (attribute_namespace, attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; line, column: INTEGER)
      do
         attributes_for(attribute_namespace).put(attribute_value.twin, attribute_name.twin)
      end

   open_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER)
      local
         node: XMLNS_COMPOSITE_NODE; i, j: INTEGER; att: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]; ns: UNICODE_STRING
      do
         if node_namespace = Void then
            node := new_node(Void, node_name.twin, line, column)
         else
            node := new_node(node_namespace.twin, node_name.twin, line, column)
         end
         from
            i := attributes.lower
         until
            i > attributes.upper
         loop
            ns := attributes.key(i)
            att := attributes.item(i)
            from
               j := att.lower
            until
               j > att.upper
            loop
               node.set_attribute(ns, att.key(j), att.item(j))
               j := j + 1
            end
            i := i + 1
         end
         from
            j := no_namespace_attributes.lower
         until
            j > no_namespace_attributes.upper
         loop
            node.set_attribute(Void, no_namespace_attributes.key(j), no_namespace_attributes.item(j))
            j := j + 1
         end
         clear_attributes
         open_nodes.push(node)
      end

   close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER)
      local
         node: XMLNS_COMPOSITE_NODE
      do
         node := open_nodes.top
         open_nodes.pop
         if open_nodes.is_empty then
            root := node
         else
            open_nodes.top.add_child(node)
         end
      end

   open_close_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER)
      do
         open_node(node_namespace, node_name, line, column)
         close_node(node_namespace, node_name, line, column)
      end

   xml_header (line, column: INTEGER)
      do
         check
            tree_attributes.is_empty
         end
         tree_attributes.copy(attributes_for(once U""))
         clear_attributes
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
      local
         processors: FAST_ARRAY[PROCEDURE[TUPLE[UNICODE_STRING]]]; i: INTEGER
      do
         processors := processing_instructions.reference_at(a_target)
         if processors /= Void then
            from
               i := processors.lower
            until
               i > processors.upper
            loop
               processors.item(i).call([a_data])
               i := i + 1
            end
         end
      end

   current_node: UNICODE_STRING
      do
         if not open_nodes.is_empty then
            Result := open_nodes.top.name
         end
      end

   current_namespace: UNICODE_STRING
      do
         if not open_nodes.is_empty then
            Result := open_nodes.top.namespace
         end
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING
      do
         -- The default tree does not recognize any other entity than XML defaults.
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER)
      local
         d: XMLNS_DATA_NODE
      do
         create d.make(a_data.twin, line, column)
         open_nodes.top.add_child(d)
      end

   parse_error (line, column: INTEGER; message: STRING)
      do
         at_error := True
         if error_handler /= Void then
            error_handler.call([line, column, message])
         else
            std_error.put_string(message)
            std_error.put_string(" at line ")
            std_error.put_integer(line)
            std_error.put_string(", column ")
            std_error.put_integer(column)
            std_error.put_new_line
            die_with_code(1)
         end
      end

   at_error: BOOLEAN

feature {}
   error_handler: PROCEDURE[TUPLE[INTEGER, INTEGER, STRING]]

   make (url: URL)
         -- read the xml tree at the given `url'
      require
         url.is_connected implies url.read
      do
         create attributes.make
         create no_namespace_attributes.make
         create tree_attributes.make
         create open_nodes.make
         parser.connect_to(url)
         parser.parse(Current)
         parser.disconnect
      end

   with_error_handler (url: URL; a_error_handler: like error_handler)
      do
         error_handler := a_error_handler
         make(url)
      end

   new_node (node_namespace, node_name: UNICODE_STRING; line, column: INTEGER): XMLNS_COMPOSITE_NODE
      do
         create Result.make(node_namespace, node_name, line, column)
      end

   parser: XMLNS_PARSER
      once
         create Result.make
      end

feature {} -- Memory management
   unused_attributes: FAST_ARRAY[WEAK_REFERENCE[HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]]]
      once
         create Result.make(0)
      end

   new_attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
      local
         i: INTEGER
      do
         from
            i := unused_attributes.upper
         until
            Result /= Void or else i < unused_attributes.lower
         loop
            Result := unused_attributes.item(i).item
            i := i - 1
         end
         if Result = Void then
            create Result.make
         else
            Result.clear_count
         end
      ensure
         Result.is_empty
      end

   old_attributes (a_attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING])
      local
         i: INTEGER; done: BOOLEAN; wr: WEAK_REFERENCE[HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]]
      do
         from
            i := unused_attributes.lower
         until
            done or else i > unused_attributes.upper
         loop
            wr := unused_attributes.item(i)
            if wr.item = Void then
               wr.set_item(a_attributes)
               done := True
            end
            i := i + 1
         end
         if not done then
            create wr.set_item(a_attributes)
            unused_attributes.add_last(wr)
         end
      end

   attributes_for (namespace: UNICODE_STRING): HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
      do
         if namespace = Void then
            Result := no_namespace_attributes
         else
            Result := attributes.reference_at(namespace)
            if Result = Void then
               Result := new_attributes
               attributes.add(Result, namespace.twin)
            end
         end
      ensure
         Result /= Void
         namespace /= Void implies attributes.fast_occurrences(Result) = 1
         namespace = Void implies Result = no_namespace_attributes
      end

   clear_attributes
      local
         i: INTEGER
      do
         from
            i := attributes.lower
         until
            i > attributes.upper
         loop
            old_attributes(attributes.item(i))
            i := i + 1
         end
         attributes.clear_count
         no_namespace_attributes.clear_count
      ensure
         attributes.is_empty
         no_namespace_attributes.is_empty
      end

end -- class XMLNS_TREE
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
