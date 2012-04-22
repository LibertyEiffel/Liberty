class TEST_INTERNALS_01
inherit INTERNALS_HANDLER
insert EIFFELTEST_TOOLS
creation  make
feature 
	make is
		local
			int: INTERNALS
		do
			int := to_internals;
			("Attribute ##(1) '#(2)': #(3) (#(4), expanded: #(5))%N" 
			# &1 # int.type_attribute_name(1) 
			# int.type_attribute_generator(1) 
			# int.type_attribute_generating_type(1)
			# &int.type_attribute_is_expanded(1)
			).print_on(std_output)
			
			assert(int.type_attribute_count=1)
			assert(int.type_attribute_name(1)~"i")
			assert(int.type_attribute_generator(1)~"INTEGER_32")
			assert(int.type_attribute_generating_type(1)~"INTEGER_32")
			assert(int.type_attribute_is_expanded(1)=True)
		end

	i: INTEGER_32

end
