class TEST_INSERT_UNDERSCORES
insert NAME_CONVERTER
creation test
feature 
	test is
		do
			check
				insert_underscores("CamelCase")~"Camel_Case"
				insert_underscores("Camel_Case")~"Camel_Case"
				insert_underscores("IOChannel")~"IO_Channel"
			end
		end
end -- class TEST_INSERT_UNDERSCORES
