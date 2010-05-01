class TEST_FIXED
	-- Stress fixed strings obtained from C, to discover eventual memory leaks or double freeing of memory.
insert
	MEMORY
	EXCEPTIONS
creation make
feature
	make is
		local i: INTEGER; mem_usage: INTEGER
		do
			mem_usage := allocated_bytes
			n.times(agent  is do
				n.times (agent is do
					create foo.from_external(foo_ptr)
					end)
				full_collect
			end)
			print ("Memory usage for "+(n*n).out+" allocation: "+(allocated_bytes-mem_usage).out+" bytes.%N") 
		end
	n: INTEGER_32 is 8000
	foo: FIXED_STRING
	foo_ptr: POINTER is
		external "C inline"
		alias "[
			"my-const-string"
			]"
		end
end -- class TEST_FIXED 
