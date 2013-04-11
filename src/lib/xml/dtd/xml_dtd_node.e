class XML_DTD_NODE
   --
   -- A real node read from the XML stream.
   --

insert
   RECYCLABLE

create {XML_DTD_VALIDATOR}
   make

feature {XML_DTD_VALIDATOR, XML_DTD_ELEMENT}
   name: UNICODE_STRING is
      require
         node /= Void
      do
         Result := node.name
      end

   node: XML_DTD_ELEMENT

   parent: XML_DTD_NODE

   children: FAST_ARRAY[XML_DTD_NODE]

   set_node (a_node: like node) is
      do
         node := a_node
      ensure
         node = a_node
      end

   set_parent (a_parent: like parent) is
      require
         not a_parent.fast_has(Current)
      do
         a_parent.add_last(Current)
         parent := a_parent
      end

feature {XML_DTD_NODE, XML_DTD_VALIDATOR}
   valid_index (index: INTEGER): BOOLEAN is
      do
         Result := children.valid_index(index)
      end

   remove (index: INTEGER) is
      require
         valid_index(index)
      do
         children.remove(index)
      end

   add_last (a_node: XML_DTD_NODE) is
      do
         children.add_last(a_node)
      ensure
         not is_empty
      end

   is_empty: BOOLEAN is
      do
         Result := children.is_empty
      end

   count: INTEGER is
      do
         Result := children.count
      end

   fast_has (a_node: XML_DTD_NODE): BOOLEAN is
      do
         Result := children.fast_has(a_node)
      end

   first: XML_DTD_NODE is
      require
         not is_empty
      do
         Result := children.first
      end

   last: XML_DTD_NODE is
      require
         not is_empty
      do
         Result := children.last
      end

   item (index: INTEGER): XML_DTD_NODE is
      require
         valid_index(index)
      do
         Result := children.item(index)
      end

   fast_first_index_of (a_node: XML_DTD_NODE): INTEGER is
      do
         Result := children.fast_first_index_of(a_node)
      end

feature {XML_DTD_VALIDATOR} -- Tree validation
   is_valid_child (explorer: XML_DTD_VALIDATOR; node_name: UNICODE_STRING): BOOLEAN is
      require
         explorer /= Void
         node.is_built
      do
         Result := node.is_valid_child(explorer, node_name, children)
      end

   is_valid_data (explorer: XML_DTD_VALIDATOR; data: UNICODE_STRING): BOOLEAN is
      require
         explorer /= Void
         node.is_built
      do
         Result := node.is_valid_data(explorer, data, children)
      end

feature {RECYCLING_POOL}
   recycle is
      local
         i: INTEGER
      do
         if parent /= Void then
            i := parent.fast_first_index_of(Current)
            check
               parent.valid_index(i)
            end
            parent.remove(i)
            check
               not parent.fast_has(Current)
            end
         end
         parent := Void
      ensure
         (old parent /= Void) implies (not (old parent).fast_has(Current))
         parent = Void
      end

feature {}
   make is
      do
         create children.make(0)
      end

invariant
   children /= Void

end -- class XML_DTD_NODE
