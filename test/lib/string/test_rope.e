class TEST_ROPE
creation make
feature
	make is 
		do
			r:="A-"|"rope"|"-is-beutiful"
			-- r.print_on(std_output)
			from i:=r.new_iterator; i.start; until i.is_off
			loop	
				std_output.put_character(i.item)
				i.next
			end
			std_output.put_new_line;
			("Rope r is "+r.count.out+" characters long%N").print_on(std_output)
			("Rope r is "|r.count.out|" characters long%N").print_on(std_output)
			-- Testing equality
			check
				r.count = 18
				(("Failing equality").is_equal("Test-"|"equality"))=False
				(("Test-"|"equality").is_equal("Test-"|"equality"))=True
				(("Failing"|"equality").is_equal("Test-"|"equality"))=False
				(("Test"|"-equality").is_equal("Test-equality"))=True
				(("Test"|"-equality").is_equal("Test-equ"|"ality"))=True
				(("Failing-"|"equality").is_equal("equality"))=False
			end
			-- TODO: Testing comparisons.
		end
	r,s: ROPE
	i:  ITERATOR[CHARACTER]

	end -- class TEST_ROPE
