class TEST_STRING

insert
	EIFFELTEST_TOOLS

creation make

feature
	make is
		do
			echo("a string%N")
			echo("a fixed string%N".intern)
		end

	echo (s: ABSTRACT_STRING) is
		do
			s.print_on(std_output)
		end
end
