class TEST_ROPE
insert
    EIFFELTEST_TOOLS

create {}
    make

feature {}
    make
        local
            a,b: STRING
            r: ROPE
            ai, ri:  ITERATOR[CHARACTER]
            outcome: STRING; ss: STRING_OUTPUT_STREAM
        do
            a:="A-"+"rope"+"-is-beautiful"
            r:="A-"|"rope"|"-is-beautiful"

            assert(a.count = r.count)
            assert(a.is_equal(r))
            assert(r.is_equal(a))

            from
                ai := a.new_iterator; ai.start
                ri := r.new_iterator; ri.start
            until
                ai.is_off or else ri.is_off
            loop
                assert(ai.item = ri.item)
                ai.next; ri.next
            end
            assert(ai.is_off and then ri.is_off)

            create outcome.make_empty
            create ss.connect_to(outcome)
            r.print_on(ss)
            assert(outcome~"A-rope-is-beautiful")

            outcome.clear_count
            from ri:=r.new_iterator; ri.start; until ri.is_off
            loop ss.put_character(ri.item); ri.next
            end

            assert(outcome~"A-rope-is-beautiful")
            assert(r.count=19)

            assert(not r.has(' '))
            assert(r.has('-'))
            assert(not r.valid_index(r.first_index_of(' ')))
            assert(r.valid_index(r.first_index_of('-')))

            outcome.clear_count;
            ("The rope «"+r+"» does not have spaces.").print_on(ss)
            assert(outcome~"The rope «A-rope-is-beautiful» does not have spaces.")

            outcome.clear_count;
            ("The rope «"|r|"» does not have spaces.").print_on(ss)
            assert(outcome~"The rope «A-rope-is-beautiful» does not have spaces.")

            outcome.clear_count;
            ("Foo is "|(3.out)|" characters long%N").print_on(ss)
            assert(outcome~"Foo is 3 characters long%N")

            assert(("Rope r is "+r.count.to_string+" characters long.").is_equal("Rope r is 19 characters long."))
            assert(("Rope r is "|r.count.to_string|" characters long.").is_equal("Rope r is 19 characters long."))
            assert(("Rope r is "| &r.count        |" characters long.").is_equal("Rope r is 19 characters long."))
            assert(not ("Failing equality").is_equal("Test-"|"equality"))
            assert(("Test-"|"equality").is_equal("Test-"|"equality"))
            assert(not ("Failing"|"equality").is_equal("Test-"|"equality"))
            assert(("Test"|"-equality").is_equal("Test-equality"))
            assert(("Test"|"-equality").is_equal("Test-equ"|"ality"))
            assert(not ("Failing-"|"equality").is_equal("equality"))
            assert(("Foo is "|foo.count.out|" characters long.").is_equal("Foo is 3 characters long."))
            assert(("Foo is "| &foo.count  |" characters long.").is_equal("Foo is 3 characters long."))
            assert(("Ropes are "|("beautiful".intern)).is_equal("Ropes are beautiful"))
            assert(("Ropes are "|("beautiful".intern)).is_equal("Ropes are beautiful".intern))


            -- Test mutable ROPEs
            a := "Eiffel"
            b := "beautiful"
            r := a|" is "|b
            assert(r.is_equal("Eiffel is beautiful"))
            a.prepend("Liberty")
            assert(r.is_equal("LibertyEiffel is beautiful"))
            b.append(" programming language.")
            assert(r.is_equal("LibertyEiffel is beautiful programming language."))
            b.prepend("a ")
            assert(r.is_equal("LibertyEiffel is a beautiful programming language."))
        end

        foo: STRING "Foo"

    end -- class TEST_ROPE
