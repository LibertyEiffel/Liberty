-- See the Copyright notice at the end of this file.
--
class XML_DTD_VALIDATOR
   --
   -- Helps the parser to validate an XML file using a DTD
   --

inherit
   XML_VALIDATOR
   BACKTRACKING
      rename
         current_node as backtrack_node,
         set_current_node as set_backtrack_node
      end

insert
   XML_DTD_MEMORY
   RECYCLABLE

create {XML_DTD_MEMORY}
   make

feature {XML_PARSER}
   attributes: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

   root: XML_DTD_NODE

   point: XML_DTD_NODE

   with_attribute (attribute_name, attribute_value: UNICODE_STRING; line, column: INTEGER) is
      do
         attributes.add(new_string(attribute_value), new_string(attribute_name))
      end

   is_valid_open_node (node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
      do
         if point = Void then
            Result := root_element.name.is_equal(node_name)
         else
            Result := point.is_valid_child(Current, node_name)
         end
         if not Result then
            sedb_breakpoint
            Result := point.is_valid_child(Current, node_name)
         end
         if Result then
            Result := get_element(node_name).is_valid_attributes(attributes)
         end
      end

   is_valid_close_node (node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
      do
         if point = Void then
            -- not valid!
         else
            Result := point.name.is_equal(node_name)
               and then point.is_valid_child(Current, Void)
         end
      end

   is_valid_open_close_node (node_name: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
      do
         Result := is_valid_open_node(node_name, line, column)
      end

   current_node: UNICODE_STRING is
      do
         if point /= Void then
            Result := point.name
         end
      end

   open_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      local
         e: XML_DTD_ELEMENT
      do
         clear_attributes
         e := elements.at(node_name)
         point := new_node(e, point)
         if root = Void then
            root := point
         end
      end

   close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      local
         p: like point
      do
         p := point.parent
         if p = Void then
            check
               root = point
            end
            free_node(root)
            root := Void
         end
         point := p
      end

   open_close_node (node_name: UNICODE_STRING; line, column: INTEGER) is
      do
         open_node(node_name, line, column)
         close_node(node_name, line, column)
      end

   entity (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
      do
         Result := entities.reference_at(a_entity)
      end

   entity_url (a_entity: UNICODE_STRING; line, column: INTEGER): UNICODE_STRING is
         -- When the parser reads an '''&entity;'''. Returns the entity URL if it is a SYSTEM entity.
      do
         Result := entity_urls.reference_at(a_entity)
      end

   is_valid_data (a_data: UNICODE_STRING; line, column: INTEGER): BOOLEAN is
      do
         if point /= Void then
            Result := point.is_valid_data(Current, a_data)
         end
      end

   data (a_data: UNICODE_STRING; line, column: INTEGER) is
      do
         -- DTD does not validate data, so we don't keep it
      end

   the_end is
      do
         recycle_dtd_validator(Current)
      end

feature {} -- Nodes management, for validation
   nodes_pool: RECYCLING_POOL[XML_DTD_NODE] is
      once
         create Result.make
      end

   new_node (node: XML_DTD_ELEMENT; parent: XML_DTD_NODE): XML_DTD_NODE is
      do
         if nodes_pool.is_empty then
            create Result.make
         else
            Result := nodes_pool.item
         end
         check
            Result.parent = Void
         end
         Result.set_node(node)
         if parent /= Void then
            Result.set_parent(parent)
         end
      ensure
         Result.is_empty
         Result.node = node
         Result.parent = parent
      end

   free_node (a_node: XML_DTD_NODE) is
      local
         node: XML_DTD_NODE
      do
         from
         until
            a_node.is_empty
         loop
            node := a_node.last
            free_node(node)
            check
               not a_node.fast_has(node)
            end
         end
         nodes_pool.recycle(a_node)
      end

feature {} -- Attributes string management
   clear_attributes is
      local
         key, item: UNICODE_STRING
      do
         from
         until
            attributes.is_empty
         loop
            key := attributes.key(attributes.lower)
            item := attributes.item(attributes.lower)
            attributes.fast_remove(key)
            free_string(key)
            free_string(item)
         end
      end

feature {XML_DTD_PARSER}
   parse_done is
         -- Called when done parsing the DTD
      do
         debug
            io.put_string(root_element.out)
            io.put_new_line
         end
      end

feature {XML_DTD_PARSER} -- <!ELEMENT . . .>
   elements: HASHED_DICTIONARY[XML_DTD_ELEMENT, UNICODE_STRING]

   current_element: XML_DTD_ELEMENT

   element_built (element_name: UNICODE_STRING): BOOLEAN is
      do
         Result := get_element(element_name).is_built
      end

   adding_element (element_name: UNICODE_STRING): BOOLEAN is
      do
         Result := current_element /= Void and then current_element.name.is_equal(element_name)
      ensure
         Result implies not element_built(element_name)
         Result implies building_element
      end

   building_element: BOOLEAN is
      do
         Result := current_element /= Void
      end

   add_element (element_name: UNICODE_STRING) is
      require
         not element_built(element_name)
         not building_element
      do
         current_element := get_element(element_name)
         current_element.build
      ensure
         adding_element(element_name)
      end

   commit_element (element_name: UNICODE_STRING) is
      require
         adding_element(element_name)
      do
         current_element.commit
         current_element := Void
      ensure
         element_built(element_name)
         not building_element
      end

   close_fix is
      require
         building_element
      do
         current_element.close_fix
      end

   close_exactly_one is
      require
         building_element
      do
         current_element.close_exactly_one
      end

   close_zero_or_one is
      require
         building_element
      do
         current_element.close_zero_or_one
      end

   close_zero_or_more is
      require
         building_element
      do
         current_element.close_zero_or_more
      end

   close_one_or_more is
      require
         building_element
      do
         current_element.close_one_or_more
      end

   add_list is
      require
         building_element
      do
         current_element.add_list
      end

   add_alt is
      require
         building_element
      do
         current_element.add_alt
      end

   child_pcdata is
      require
         building_element
      do
         current_element.child_pcdata
      end

   child_any is
      require
         building_element
      do
         current_element.child_any
      end

   child_empty is
      require
         building_element
      do
         current_element.child_empty
      end

   child_one_or_more (node: UNICODE_STRING) is
      require
         building_element
      do
         current_element.child_one_or_more(get_element(node))
      end

   child_zero_or_more (node: UNICODE_STRING) is
      require
         building_element
      do
         current_element.child_zero_or_more(get_element(node))
      end

   child_zero_or_one (node: UNICODE_STRING) is
      require
         building_element
      do
         current_element.child_zero_or_one(get_element(node))
      end

   child_exactly_one (node: UNICODE_STRING) is
      require
         building_element
      do
         current_element.child_exactly_one(get_element(node))
      end

feature {}
   root_element: XML_DTD_ELEMENT is
      do
         Result := get_element(root_name)
      end

   get_element (element_name: UNICODE_STRING): XML_DTD_ELEMENT is
      local
         eltname: UNICODE_STRING
      do
         Result := elements.reference_at(element_name)
         if Result = Void then
            eltname := element_name.twin
            if elements_pool.is_empty then
               create Result.make(eltname)
            else
               Result := elements_pool.item
               Result.make(eltname)
            end
            elements.add(Result, eltname)
         end
      ensure
         Result.name.is_equal(element_name)
      end

   elements_pool: RECYCLING_POOL[XML_DTD_ELEMENT] is
      once
         create Result.make
      end

feature {XML_DTD_PARSER} -- <!ATTLIST . . .>
   attlist_element: XML_DTD_ELEMENT

   building_attlist: BOOLEAN is
      do
         Result := attlist_element /= Void
         check
            Result implies attlist_element.building_attlist
         end
      end

   has_attlist (element_name, attribute_name: UNICODE_STRING): BOOLEAN is
      local
         elt: XML_DTD_ELEMENT
      do
         elt := elements.reference_at(element_name)
         if elt /= Void then
            Result := elt.has_attlist(attribute_name)
         end
      ensure
         Result implies building_attlist
      end

   adding_attlist (element_name, attribute_name: UNICODE_STRING): BOOLEAN is
      do
         Result := attlist_element /= Void and then attlist_element.name.is_equal(element_name) and then attlist_element.adding_attlist(attribute_name)
      ensure
         Result implies building_attlist
      end

   add_attlist (element_name, attribute_name: UNICODE_STRING) is
      require
         element_built(element_name)
         not building_element
         not building_attlist
      do
         attlist_element := elements.at(element_name)
         attlist_element.add_attlist(attribute_name)
      ensure
         building_attlist
      end

   commit_attlist (element_name, attribute_name: UNICODE_STRING) is
      require
         adding_attlist(element_name, attribute_name)
      do
         attlist_element.commit_attlist(attribute_name)
         attlist_element := Void
      ensure
         not building_attlist
      end

   addlist_list_value (value: UNICODE_STRING) is
      require
         building_attlist
      do
         attlist_element.attlist_list_value(value)
      end

   attlist_cdata is
      require
         building_attlist
      do
         attlist_element.attlist_cdata
      end

   attlist_id is
      require
         building_attlist
      do
         attlist_element.attlist_id
      end

   attlist_idref is
      require
         building_attlist
      do
         attlist_element.attlist_idref
      end

   attlist_idrefs is
      require
         building_attlist
      do
         attlist_element.attlist_idrefs
      end

   attlist_nmtoken is
      require
         building_attlist
      do
         attlist_element.attlist_nmtoken
      end

   attlist_nmtokens is
      require
         building_attlist
      do
         attlist_element.attlist_nmtokens
      end

   attlist_entity is
      require
         building_attlist
      do
         attlist_element.attlist_entity
      end

   attlist_entities is
      require
         building_attlist
      do
         attlist_element.attlist_entities
      end

   attlist_notation is
      require
         building_attlist
      do
         attlist_element.attlist_notation
      end

   attlist_required is
      require
         building_attlist
      do
         attlist_element.attlist_required
      end

   attlist_implied is
      require
         building_attlist
      do
         attlist_element.attlist_implied
      end

   attlist_valid_fixed (value: UNICODE_STRING): BOOLEAN is
      require
         building_attlist
      do
         Result := attlist_element.attlist_valid_fixed(value)
      end

   attlist_fixed (value: UNICODE_STRING) is
      require
         building_attlist
         attlist_valid_fixed(value)
      do
         attlist_element.attlist_fixed(value)
      end

   attlist_default_value (value: UNICODE_STRING) is
      require
         building_attlist
      do
         attlist_element.attlist_default_value(value)
      end

feature {XML_DTD_PARSER} -- <!ENTITY . . .>
   entities: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]
   entity_urls: HASHED_DICTIONARY[UNICODE_STRING, UNICODE_STRING]

   has_entity (entity_name: UNICODE_STRING): BOOLEAN is
      do
         Result := entities.has(entity_name)
      end

   add_entity (entity_name, entity_value, entity__url: UNICODE_STRING) is
      require
         not has_entity(entity_name)
      do
         entities.add(entity_value, entity_name)
         if entity__url /= Void then
            entity_urls.add(entity__url, entity_name)
         end
      ensure
         has_entity(entity_name)
         entity(entity_name, 0, 0) = entity_value
         entity_url(entity_name, 0, 0) = entity__url
      end

feature {XML_DTD_ELEMENT}
   backtrack_valid_data (a_children: FAST_ARRAY[XML_DTD_NODE]; a_node: like backtrack_node; a_data: like backtrack_pcdata): BOOLEAN is
      require
         a_node /= Void
      do
         set_backtrack_node(a_node)
         backtrack_pcdata := a_data
         backtrack_children := a_children
         backtrack_index := a_children.lower
         backtrack_next := once U"__#PCDATA__"
         backtrack_ok := False
         search_first
         Result := backtrack_ok
      end

   backtrack_is_valid (a_children: like backtrack_children; a_node: like backtrack_node; a_next: like backtrack_next): BOOLEAN is
      require
         a_node /= Void
         --| `a_next' can be Void, it means we are trying to close the node
      do
         set_backtrack_node(a_node)
         backtrack_pcdata := Void
         backtrack_children := a_children
         backtrack_index := a_children.lower
         backtrack_next := a_next
         backtrack_ok := False
         search_first
         Result := backtrack_ok
      end

feature {XML_DTD_ELEMENT}
   backtrack_valid_child (n: XML_DTD_ELEMENT) is
      require
         n /= Void
      do
         if backtrack_children.valid_index(backtrack_index) then
            if n = backtrack_children.item(backtrack_index).node then
               backtrack_index := backtrack_index + 1
               continue
            else
               backtrack
            end
         else
            if backtrack_next /= Void and then n.name.is_equal(backtrack_next) then
               backtrack_ok := True
               stop_search_loop := True
            else
               backtrack
            end
         end
      end

feature {XML_DTD_PCDATA_NODE}
   backtrack_valid_pcdata is
      do
         if backtrack_children.valid_index(backtrack_index) then
            backtrack_index := backtrack_index + 1
            continue
         else
            if backtrack_next = Void or else backtrack_pcdata /= Void then
               backtrack_ok := True
               stop_search_loop := True
            else
               backtrack
            end
         end
      end

feature {XML_DTD_ANY_NODE}
   backtrack_valid_any is
      do
         backtrack_ok := True
         stop_search_loop := True
      end

feature {XML_DTD_EMPTY_NODE}
   backtrack_valid_empty is
      do
         if backtrack_children.is_empty then
            backtrack_ok := True
            stop_search_loop := True
         else
            backtrack
         end
      end

feature {XML_DTD_END_NODE}
   backtrack_valid_end is
      do
         if backtrack_children.valid_index(backtrack_index) or else backtrack_next /= Void then
            backtrack
         else
            backtrack_ok := True
            stop_search_loop := True
         end
      end

feature {} -- Backtracking internals
   backtrack_pcdata: UNICODE_STRING
   backtrack_children: FAST_ARRAY[XML_DTD_NODE]
   backtrack_index: INTEGER
   backtrack_ok: BOOLEAN
   backtrack_next: UNICODE_STRING
   context: FAST_ARRAY[INTEGER]

   context_clear is
      do
         context.clear_count
      end

   context_push is
      do
         context.add_last(backtrack_index)
      end

   context_restore is
      do
         backtrack_index := context.last
      end

   context_restore_and_pop is
      do
         context_restore
         context_cut
      end

   context_cut is
      do
         context.remove_last
      end

feature {XML_DTD_MEMORY}
   root_name: UNICODE_STRING

   make (root_node_name: like root_name) is
      require
         not root_node_name.is_empty
      do
         root_name := root_node_name
         if attributes = Void then
            create attributes.make
            create elements.make
            create entities.make
            create entity_urls.make
            create context.make(0)
         end
      ensure
         root_name = root_node_name
      end

feature {RECYCLING_POOL}
   recycle is
      do
         attributes.clear_count
         recycle_elements
         entities.clear_count
         recycle_entity_urls
         context.clear_count
      end

feature {}
   recycle_elements is
      local
         i: INTEGER
      do
         from
            i := elements.lower
         until
            i > elements.upper
         loop
            elements_pool.recycle(elements.item(i))
            i := i + 1
         end
         elements.clear_count
      ensure
         elements.is_empty
      end

   recycle_entity_urls is
      local
         i: INTEGER
      do
         from
            i := entity_urls.lower
         until
            i > entity_urls.upper
         loop
            free_string(entity_urls.item(i))
            i := i + 1
         end
         entity_urls.clear_count
      ensure
         entity_urls.is_empty
      end

invariant
   not root_name.is_empty

end -- class XML_DTD_VALIDATOR
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
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
