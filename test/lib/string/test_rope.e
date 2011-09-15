class TEST_ROPE
insert EIFFELTEST_TOOLS
creation make
feature
	make is 
		-- Main testing
	local outcome: STRING; ss: STRING_OUTPUT_STREAM
	do
		create outcome.make_empty
		create ss.connect_to(outcome)
		r:="A-"|"rope"|"-is-beutiful"
		r.print_on(ss)
		assert(outcome~"A-rope-is-beutiful")

		outcome.clear_count
		from i:=r.new_iterator; i.start; until i.is_off
		loop ss.put_character(i.item) i.next
		end

		assert(outcome~"A-rope-is-beutiful")
		assert(r.count=18)

		outcome.clear_count;
		("The rope «"+r+"» does not have spaces.").print_on(ss)
		assert(outcome~"The rope «A-rope-is-beutiful» does not have spaces.")

		outcome.clear_count;
		("The rope «"|r|"» does not have spaces.").print_on(ss)
		assert(outcome~"The rope «A-rope-is-beutiful» does not have spaces.")

		outcome.clear_count;
		("Foo is "|(3.out)|" characters long%N").print_on(ss)
		assert(outcome~"Foo is 3 characters long%N")

		label_assert("not string ~ rope",not ("Failing equality").is_equal("Test-"|"equality"))
		label_assert("string ~ rope", ("Test-"|"equality").is_equal("Test-"|"equality"))
		label_assert("not rope ~ rope", not ("Failing"|"equality").is_equal("Test-"|"equality"))
		label_assert("rope ~ rope",("Test"|"-equality").is_equal("Test-equality"))
		label_assert("rope ~ another rope",("Test"|"-equality").is_equal("Test-equ"|"ality"))
		label_assert("not rope ~ string", not ("Failing-"|"equality").is_equal("equality"))
		label_assert("ropes with count",("Foo is "|foo.count.out|" characters long.").is_equal("Foo is 3 characters long."))
		label_assert("rope made with constats and string ",(foo|" is "|foo.count.out|" characters long.").is_equal("Foo is 3 characters long."))

		label_assert("rope with intern string",("Ropes are "|("beutiful".intern)).is_equal("Ropes are beutiful"))
		label_assert("rope.intern ~ rope ",("Ropes are "|("beutiful".intern)).is_equal("Ropes are beutiful".intern))
	end
	r,s: ROPE
	foo: STRING is "Foo"
	i:  ITERATOR[CHARACTER]

end -- class TEST_ROPE
