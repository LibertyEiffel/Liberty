-- See the Copyright notice at the end of this file.
--
class XMLNS_PARSER
   --
   -- A namespace-aware XML parser
   --

inherit
   XML_CALLBACKS
      rename
         validator as xml_validator
         set_validator as set_xml_validator
      end

insert
   XML_NAMESPACES

create {ANY}
   connect_to, make

feature {ANY}
   parse (a_callbacks: XMLNS_CALLBACKS)
         -- Parse an XML documents by sending parsing events to the given `callbacks'
      require
         is_connected
      do
         callbacks := a_callbacks
         parser.parse(Current)
         if validator /= Void then
            validator.the_end
         end
      end

   connect_to (a_url: URL)
         -- Connect to the given XML document
      require
         not is_connected
         a_url.is_connected implies a_url.read
      do
         make
         parser.connect_to(a_url)
      end

   disconnect
      require
         is_connected
      do
         parser.disconnect
      ensure
         not is_connected
      end

   is_connected: BOOLEAN
      do
         Result := parser.is_connected
      end

   line: INTEGER
      do
         Result := parser.line
      end

   column: INTEGER
      do
         Result := parser.column
      end

feature {}
   make
         -- Create a not connected parser
      do
         if parser = Void then -- this test is useful when called from `connect_to'
            create parser.make
            create namespaces.make(0)
         else
            from
            until
               namespaces.is_empty
            loop
               old_namespaces(namespaces.last)
               namespaces.remove_last
            end
         end
         attributes_for_new_node := False
      end

   parser: XML_PARSER

   callbacks: XMLNS_CALLBACKS

feature {XML_NAMESPACES}
   set_validator (a_validator: XMLNS_VALIDATOR)
      do
         callbacks.set_validator(a_validator)
      end

   validator: XMLNS_VALIDATOR
      do
         Result := callbacks.validator
      end

feature {XML_PARSER}
   with_attribute (attribute_name: UNICODE_STRING; attribute_value: UNICODE_STRING; l, c: INTEGER)
      do
         if not attributes_for_new_node then
            namespaces.add_last(new_namespaces)
            attributes_for_new_node := True
         end
         if attribute_name.has_prefix(once U"xml") then
            xml_attribute(attribute_name, attribute_value, l, c)
         else
            split_namespace(attribute_name, l, c)
            if not at_error then
               if validator /= Void then
                  validator.with_attribute(namespace, name, attribute_value, l, c)
               end
               callbacks.with_attribute(namespace, name, attribute_value, l, c)
            end
         end
      end

   open_node (node_name: UNICODE_STRING; l, c: INTEGER)
      do
         if attributes_for_new_node then
            attributes_for_new_node := False
         else
            namespaces.add_last(new_namespaces)
         end
         split_namespace(node_name, l, c)
         if not at_error then
            if validator = Void then
               callbacks.open_node(namespace, name, l, c)
            elseif validator.is_valid_open_node(namespace, name, l, c) then
               validator.open_node(namespace, name, l, c)
               callbacks.open_node(namespace, name, l, c)
            else
               parse_error(l, c, once "Invalid opening tag")
            end
         end
      end

   close_node (node_name: UNICODE_STRING; l, c: INTEGER)
      do
         split_namespace(node_name, l, c)
         if not at_error then
            if validator = Void then
               callbacks.close_node(namespace, name, l, c)
            elseif validator.is_valid_close_node(namespace, name, l, c) then
               validator.close_node(namespace, name, l, c)
               callbacks.close_node(namespace, name, l, c)
            else
               parse_error(l, c, once "Invalid closing tag")
            end
            old_namespaces(namespaces.last)
            namespaces.remove_last
         end
      end

   open_close_node (node_name: UNICODE_STRING; l, c: INTEGER)
      local
         local_namespaces: BOOLEAN
      do
         if attributes_for_new_node then
            attributes_for_new_node := False
            local_namespaces := True
         end
         split_namespace(node_name, l, c)
         if not at_error then
            if validator = Void then
               callbacks.open_close_node(namespace, name, l, c)
            elseif validator.is_valid_open_close_node(namespace, name, l, c) then
               validator.open_close_node(namespace, name, l, c)
               callbacks.open_close_node(namespace, name, l, c)
            else
               parse_error(l, c, once "Invalid empty tag")
            end
            if local_namespaces then
               old_namespaces(namespaces.last)
               namespaces.remove_last
            end
         end
      end

   xml_header (l, c: INTEGER)
      do
         callbacks.xml_header(l, c)
      end

   processing_instruction (a_target, a_data: UNICODE_STRING)
      do
         callbacks.processing_instruction(a_target, a_data)
      end

   entity (a_entity: UNICODE_STRING; l, c: INTEGER): UNICODE_STRING
      do
         if validator = Void then
            Result := callbacks.entity(a_entity, l, c)
         else
            Result := validator.entity(a_entity, l, c)
            if Result = Void then
               Result := callbacks.entity(a_entity, l, c)
            end
         end
      end

   current_node: UNICODE_STRING
      local
         ns, cn: UNICODE_STRING
      do
         cn := callbacks.current_node
         if cn /= Void then
            Result := once U""
            ns := callbacks.current_namespace
            if ns = Void or else ns.is_empty then -- Void only when at error
               Result.copy(cn)
            else
               Result.copy(find_namespace_ref(ns))
               Result.extend(':'.code)
               Result.append(cn)
            end
         end
      end

   data (a_data: UNICODE_STRING; l, c: INTEGER)
      do
         if validator = Void then
            callbacks.data(a_data, l, c)
         elseif validator.is_valid_data(a_data, l, c) then
            validator.data(a_data, l, c)
            callbacks.data(a_data, l, c)
         else
            parse_error(l, c, once "Invalid data")
         end
      end

   parse_error (l, c: INTEGER; message: STRING)
      do
         callbacks.parse_error(l, c, message)
      end

   at_error: BOOLEAN
      do
         Result := callbacks.at_error
      end

feature {}
   namespace: UNICODE_STRING
         -- set by `split_namespace'

   name: UNICODE_STRING
         -- set by `split_namespace'

   split_namespace (a_name: UNICODE_STRING; l, c: INTEGER)
         -- Sets `namespace' and `name' according to the given name, splitting at the first colon (':'). If
         -- there is no colon, `namespace' is Void and `name' contains the full given name. Otherwise
         -- `namespace' contains the URI of the namespace and `name' contains the part of the given name after
         -- the first colon.
      local
         i: INTEGER; ns: UNICODE_STRING; error: STRING
      do
         name := once U""
         i := a_name.first_index_of(':'.code)
         if a_name.valid_index(i) then
            ns := once U""
            ns.copy_substring(a_name, 1, i - 1)
            name.copy_substring(a_name, i + 1, a_name.upper)
            namespace := find_namespace(ns)
            if namespace = Void then
               error := once ""
               error.copy(once "Unknown namespace prefix: ")
               ns.utf8_encode_in(error)
               parse_error(l, c, error)
            end
         else
            name.copy(a_name)
            namespace := Void
         end
      end

   namespaces: FAST_ARRAY[BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]]
         -- The known namespaces

   xml_attribute (attribute_name, attribute_value: UNICODE_STRING; l, c: INTEGER)
      require
         attribute_name /= Void
      local
         old_value, ns: UNICODE_STRING; error: STRING
         action: PROCEDURE[TUPLE[XMLNS_PARSER, UNICODE_STRING]]
      do
         if attribute_name.is_equal(once U"xmlns") then
            ns := once U""
            check
               ns.is_empty
            end
         elseif attribute_name.has_prefix(once U"xmlns:") then
            ns := once U""
            ns.copy_substring(attribute_name, 7, attribute_name.upper)
         end
         if ns /= Void then
            action := namespace_actions.reference_at(attribute_value)
            if action /= Void then
               action.call([Current, ns])
            end
            old_value := namespaces.last.reference_at(ns)
            if old_value /= Void then
               string_recycle(namespaces.last.key_at(old_value))
               string_recycle(old_value)
               namespaces.last.remove(ns)
            end
            namespaces.last.add(string_twin(attribute_value), string_twin(ns))
            check
               find_namespace(ns).is_equal(attribute_value)
            end
         else
            error := once ""
            error.copy(once "Bad namespace prefix (must not begin by %"xml%") for attribute: %"")
            attribute_name.utf8_encode_in(error)
            error.extend('"')
            parse_error(l, c, error)
         end
      end

   find_namespace (a_namespace_ref: UNICODE_STRING): UNICODE_STRING
      local
         i: INTEGER
      do
         from
            i := namespaces.upper
         until
            Result /= Void or else i < namespaces.lower
         loop
            Result := namespaces.item(i).reference_at(a_namespace_ref)
            i := i - 1
         end
      end

   find_namespace_ref (a_namespace: UNICODE_STRING): UNICODE_STRING
      local
         i: INTEGER; ns: BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
      do
         from
            i := namespaces.upper
         until
            Result /= Void or else i < namespaces.lower
         loop
            ns := namespaces.item(i)
            if ns.has_value(a_namespace) then
               Result := ns.key_at(a_namespace)
            end
            i := i - 1
         end
      end

   attributes_for_new_node: BOOLEAN

feature {} -- Memory management
   unused_namespaces: FAST_ARRAY[WEAK_REFERENCE[BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]]]
      once
         create Result.make(0)
      end

   new_namespaces: BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
      local
         i: INTEGER
      do
         from
            i := unused_namespaces.upper
         until
            Result /= Void or else i < unused_namespaces.lower
         loop
            Result := unused_namespaces.item(i).item
            if Result /= Void then
               unused_namespaces.item(i).set_item(Void)
               Result.clear_count
            end
            i := i - 1
         end
         if Result = Void then
            create {HASHED_BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]} Result.make
         end
      ensure
         Result.is_empty
      end

   old_namespaces (a_namespaces: BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING])
      local
         i: INTEGER; done: BOOLEAN; wr: WEAK_REFERENCE[BIJECTIVE_DICTIONARY[UNICODE_STRING, UNICODE_STRING]]; k, v: UNICODE_STRING
      do
         from
            i := a_namespaces.lower
         until
            a_namespaces.is_empty
         loop
            k := a_namespaces.key(i)
            v := a_namespaces.item(i)
            a_namespaces.remove(k)
            string_recycle(k)
            string_recycle(v)
         end
         from
            i := unused_namespaces.lower
         until
            done or else i > unused_namespaces.upper
         loop
            wr := unused_namespaces.item(i)
            if wr.item = Void then
               wr.set_item(a_namespaces)
               done := True
            end
            i := i + 1
         end
         if not done then
            create wr.set_item(a_namespaces)
            unused_namespaces.add_last(wr)
         end
      end

   string_pool: RECYCLING_POOL[UNICODE_STRING]
      once
         create Result.make
      end

   string_twin (unicode: UNICODE_STRING): UNICODE_STRING
      require
         unicode /= Void
      do
         if string_pool.is_empty then
            Result := unicode.twin
         else
            Result := string_pool.item
            Result.copy(unicode)
         end
      ensure
         Result.is_equal(unicode)
      end

   string_recycle (unicode: UNICODE_STRING)
      do
         string_pool.recycle(unicode)
      end

end -- class XMLNS_PARSER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
