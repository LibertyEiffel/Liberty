expanded class XML_DTD_MEMORY

feature {} -- Memory management
   dtd_validators_pool: RECYCLING_POOL[XML_DTD_VALIDATOR] is
      do
         create Result.make
      end

   new_dtd_validator (root_node_name: UNICODE_STRING): XML_DTD_VALIDATOR is
      do
         if dtd_validators_pool.is_empty then
            create Result.make(root_node_name)
         else
            Result := dtd_validators_pool.item
            Result.make(root_node_name)
         end
      ensure
         Result /= Void
         Result.root_name = root_node_name
      end

   recycle_dtd_validator (a_validator: XML_DTD_VALIDATOR) is
      do
         dtd_validators_pool.recycle(a_validator)
      end

end
