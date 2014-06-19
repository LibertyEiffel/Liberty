class TEST_INTERNALS_01

insert
   INTERNALS_HANDLER
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         int: INTERNALS
         type_attribute_name, type_attribute_generator, type_attribute_generating_type: STRING
         type_attribute_is_expanded: BOOLEAN
      do
         int := to_internals

         type_attribute_name := int.type_attribute_name(1)
         type_attribute_generator := int.type_attribute_generator(1)
         type_attribute_generating_type := int.type_attribute_generating_type(1)
         type_attribute_is_expanded := int.type_attribute_is_expanded(1)

         assert(int.type_attribute_count = 1)
         assert("assertion_level".same_as(type_attribute_name))
         assert("INTEGER_32".same_as(type_attribute_generator))
         assert("INTEGER_32".same_as(type_attribute_generating_type))
         assert(type_attribute_is_expanded)
      end

end
