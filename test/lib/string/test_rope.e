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
			("Rope r is "+r.count.to_string+" characters long%N").print_on(std_output)
			("Rope r is "|r.count.to_string|" characters long%N").print_on(std_output)
			"[
			Warning: using out during ROPEs concatenation produce rubbish: "Foo is "|3.out|" characters long." is outputted as "3oo is 3 characters long."

			]".print_on(std_output)

			-- Testing equality
			check
				r.count = 18
				not ("Failing equality").is_equal("Test-"|"equality")
				("Test-"|"equality").is_equal("Test-"|"equality")
				not ("Failing"|"equality").is_equal("Test-"|"equality")
				("Test"|"-equality").is_equal("Test-equality")
				("Test"|"-equality").is_equal("Test-equ"|"ality")
				not ("Failing-"|"equality").is_equal("equality")
				("Foo is "|foo.count.out|" characters long.").is_equal("Foo is 3 characters long.")
				("Ropes are "|("beutiful".intern)).is_equal("Ropes are beutiful")
				("Ropes are "|("beutiful".intern)).is_equal("Ropes are beutiful".intern)
			end
		end
	r,s: ROPE
	foo: STRING is "Foo"
	i:  ITERATOR[CHARACTER]

	end -- class TEST_ROPE
