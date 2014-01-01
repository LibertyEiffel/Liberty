-- See the Copyright notice at the end of this file.
--
class XML_DTD_ELEMENT

inherit
   BACKTRACKING_NODE
      redefine
         out_in_tagged_out_memory
      end

insert
   RECYCLABLE
      redefine
         out_in_tagged_out_memory
      end

create {XML_DTD_VALIDATOR}
   make

feature {ANY}
   name: UNICODE_STRING

   out_in_tagged_out_memory is
      do
         tagged_out_memory.extend('<')
         name.utf8_encode_in(tagged_out_memory)
         tagged_out_memory.append(once ": ")
         if structure = Void then
            tagged_out_memory.append(once "unknown")
         else
            structure.fill_tagged_out_memory
         end
         tagged_out_memory.extend('>')
      end

feature {XML_DTD_VALIDATOR}
   build is
         -- Prepare to build the element's structure
      do
         -- remove crumbs from a possibly failed previous build
         building_stack.clear_count
      end

feature {XML_DTD_VALIDATOR, XML_DTD_NODE}
   is_built: BOOLEAN

feature {XML_DTD_VALIDATOR} -- Data validation
   is_valid_attributes (xml_attributes: DICTIONARY[UNICODE_STRING, UNICODE_STRING]): BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := attributes.lower
         until
            not Result or else i > attributes.upper
         loop
            Result := attributes.item(i).is_valid(xml_attributes)
            i := i + 1
         end
      end

feature {XML_DTD_NODE} -- Tree validation
   is_valid_child (explorer: XML_DTD_VALIDATOR; node_name: UNICODE_STRING; children: FAST_ARRAY[XML_DTD_NODE]): BOOLEAN is
      require
         explorer /= Void
         children /= Void
         is_built
      do
         Result := explorer.backtrack_is_valid(children, structure, node_name)
      end

   is_valid_data (explorer: XML_DTD_VALIDATOR; data: UNICODE_STRING; children: FAST_ARRAY[XML_DTD_NODE]): BOOLEAN is
      require
         explorer /= Void
         children /= Void
         is_built
      do
         Result := explorer.backtrack_valid_data(children, structure, data)
      end

feature {ANY} -- Tree structure validation
   explore (explorer: XML_DTD_VALIDATOR) is
      do
         explorer.backtrack_valid_child(Current)
      end

feature {} -- The element's structure
   structure: BACKTRACKING_NODE
         -- the element's structure

   building_stack: FAST_ARRAY[BACKTRACKING_NODE] is
         -- Used when building the element. A once object is enough since we only build one element at a time.
      once
         create Result.make(0)
      end

   build_pop is
      do
         building_stack.remove_last
      end

   build_add (n: BACKTRACKING_NODE) is
      do
         building_stack.add_last(n)
      end

   build_push (n: BACKTRACKING_NODE) is
      do
         building_stack.put(n, building_stack.upper)
      end

   build_top: BACKTRACKING_NODE is
      do
         Result := building_stack.last
      end

feature {XML_DTD_VALIDATOR} -- Building element's structure
   close_fix is
      do
         check
            building_stack.count = 1
         end
         structure := node_and_end(build_top)
         building_stack.remove_last
      ensure
         building_stack.is_empty
      end

   close_exactly_one is
      do
         build_push(node_and_end(build_top))
      end

   close_zero_or_one is
      do
         build_push(zero_or_one_node(build_top))
      end

   close_zero_or_more is
      do
         build_push(zero_or_more_node(build_top))
      end

   close_one_or_more is
      do
         build_push(one_or_more_node(build_top))
      end

   add_list is
      require
         building_stack.count > 1
      local
         l, r: BACKTRACKING_NODE; n: BACKTRACKING_NODE_AND_PAIR
      do
         r := build_top
         build_pop
         l := build_top
         create n.make(l, r)
         build_push(n)
      ensure
         building_stack.count = old building_stack.count - 1
      end

   add_alt is
      require
         building_stack.count > 1
      local
         l, r: BACKTRACKING_NODE; n: BACKTRACKING_NODE_OR_PAIR
      do
         r := build_top
         build_pop
         l := build_top
         create n.make(l, r)
         build_push(n)
      ensure
         building_stack.count = old building_stack.count - 1
      end

   child_pcdata is
      do
         build_add(pcdata_node)
      end

   child_any is
      do
         build_add(any_node)
      end

   child_empty is
      do
         build_add(empty_node)
      end

   child_one_or_more (elt: XML_DTD_ELEMENT) is
      do
         build_add(one_or_more_node(elt))
      end

   child_zero_or_more (elt: XML_DTD_ELEMENT) is
      do
         build_add(zero_or_more_node(elt))
      end

   child_zero_or_one (elt: XML_DTD_ELEMENT) is
      do
         build_add(zero_or_one_node(elt))
      end

   child_exactly_one (elt: XML_DTD_ELEMENT) is
      do
         build_add(node_and_end(elt))
      end

   commit is
      require
         not is_built
      do
         check
            structure /= Void
         end
         is_built := True
      ensure
         is_built
      end

feature {} -- Multiplicity helpers
   one_or_more_node (a_node: BACKTRACKING_NODE): BACKTRACKING_NODE is
      local
         a: BACKTRACKING_NODE_AND_PAIR; b: BACKTRACKING_NODE_OR_TRUE
      do
         create b.make(a_node) -- a
         create a.make(a_node, b)
         b.set_node(a)
         Result := a
      end

   zero_or_more_node (a_node: BACKTRACKING_NODE): BACKTRACKING_NODE is
      local
         a: BACKTRACKING_NODE_AND_PAIR; b: BACKTRACKING_NODE_OR_TRUE
      do
         create b.make(a_node) -- a
         create a.make(a_node, b)
         b.set_node(a)
         Result := b
      end

   zero_or_one_node (a_node: BACKTRACKING_NODE): BACKTRACKING_NODE is
      do
         create {BACKTRACKING_NODE_OR_TRUE} Result.make(a_node)
      end

   node_and_end (a_node: BACKTRACKING_NODE): BACKTRACKING_NODE is
      do
         create {BACKTRACKING_NODE_AND_PAIR} Result.make(a_node, end_node)
      end

feature {} -- Special nodes
   any_node: XML_DTD_ANY_NODE is
      once
         create Result.make
      end

   empty_node: XML_DTD_EMPTY_NODE is
      once
         create Result.make
      end

   end_node: XML_DTD_END_NODE is
      once
         create Result.make
      end

   pcdata_node: XML_DTD_PCDATA_NODE is
      once
         create Result.make
      end

feature {XML_DTD_VALIDATOR} -- Adding attributes
   attributes: HASHED_DICTIONARY[XML_DTD_ATTRIBUTE, UNICODE_STRING]

   current_attribute: XML_DTD_ATTRIBUTE

   building_attlist: BOOLEAN is
      do
         Result := current_attribute /= Void
      end

   adding_attlist (attribute_name: UNICODE_STRING): BOOLEAN is
      do
         Result := current_attribute /= Void and then current_attribute.name.is_equal(attribute_name)
      ensure
         Result implies building_attlist
      end

   has_attlist (attribute_name: UNICODE_STRING): BOOLEAN is
      do
         Result := attributes.has(attribute_name)
      end

   add_attlist (attribute_name: UNICODE_STRING) is
      require
         not has_attlist(attribute_name)
         not building_attlist
      local
         att: XML_DTD_ATTRIBUTE
      do
         if attributes_pool.is_empty then
            create att.make(attribute_name)
         else
            att := attributes_pool.item
            att.make(attribute_name)
         end
         current_attribute := att
      ensure
         building_attlist
      end

   commit_attlist (attribute_name: UNICODE_STRING) is
      require
         adding_attlist(attribute_name)
      do
         attributes.add(current_attribute, current_attribute.name)
         current_attribute := Void
      ensure
         not building_attlist
      end

   attlist_list_value (value: UNICODE_STRING) is
      require
         building_attlist
      do
         current_attribute.list_value(value)
      end

   attlist_cdata is
      require
         building_attlist
      do
         current_attribute.cdata
      end

   attlist_id is
      require
         building_attlist
      do
         current_attribute.id
      end

   attlist_idref is
      require
         building_attlist
      do
         current_attribute.idref
      end

   attlist_idrefs is
      require
         building_attlist
      do
         current_attribute.idrefs
      end

   attlist_nmtoken is
      require
         building_attlist
      do
         current_attribute.nmtoken
      end

   attlist_nmtokens is
      require
         building_attlist
      do
         current_attribute.nmtokens
      end

   attlist_entity is
      require
         building_attlist
      do
         current_attribute.entity
      end

   attlist_entities is
      require
         building_attlist
      do
         current_attribute.entities
      end

   attlist_notation is
      require
         building_attlist
      do
         current_attribute.notation
      end

   attlist_required is
      require
         building_attlist
      do
         current_attribute.required
      end

   attlist_implied is
      require
         building_attlist
      do
         current_attribute.implied
      end

   attlist_valid_fixed (value: UNICODE_STRING): BOOLEAN is
      require
         building_attlist
      do
         Result := current_attribute.valid_fixed_value(value)
      end

   attlist_fixed (value: UNICODE_STRING) is
      require
         building_attlist
         attlist_valid_fixed(value)
      do
         current_attribute.fixed(value)
      end

   attlist_default_value (value: UNICODE_STRING) is
      require
         building_attlist
      do
         current_attribute.default_value(value)
      end

feature {XML_DTD_VALIDATOR} -- Constructor
   make (a_name: like name) is
      require
         not a_name.is_empty
      do
         is_built := False
         structure := Void
         -- the element's proper attributes:
         name := a_name
         if attributes = Void then
            create attributes.make
         else
            attributes.clear_count
         end
         current_attribute := Void
      ensure
         not is_built
         structure = Void
         name = a_name
         attributes.is_empty
         current_attribute = Void
      end

feature {RECYCLING_POOL}
   recycle is
      do
         is_built := False
         structure := Void
         current_attribute := Void
         recycle_attributes
      ensure
         not is_built
         structure = Void
         current_attribute = Void
      end

feature {} -- Memory management
   attributes_pool: RECYCLING_POOL[XML_DTD_ATTRIBUTE] is
      once
         create Result.make
      end

   recycle_attributes is
      local
         i: INTEGER
      do
         from
            i := attributes.lower
         until
            i > attributes.upper
         loop
            attributes_pool.recycle(attributes.item(i))
            i := i + 1
         end
         attributes.clear_count
      ensure
         attributes.is_empty
      end

invariant
   not name.is_empty
   attributes /= Void

end -- class XML_DTD_ELEMENT
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
