class TEST_REPLACING

insert
	EIFFELTEST_TOOLS

creation make

feature
	make is
		local x: ABSTRACT_STRING
		do
			x := "C++ is beautiful".replacing("C++","Eiffel")
			check x ~ "Eiffel is beautiful" end
			x := "C++ is beautiful".replacing("beautiful","too complex")
			check x ~ "C++ is too complex" end
			x := "a robot is a robot!".replacing("robot","person")
			check x ~ "a person is a person!" end
			x:=  "a babau is a fantasy".replacing("ba","ten")
			check x~"a tentenu is a fantasy" end
			-- label_assert("Replacing at beginning","C++ is beautiful".replacing("C++","Eiffel")~"Eiffel is beautiful")
			-- label_assert("Replacing at the end", "C++ is beautiful".replacing("beautiful","too complex")~"C++ is too complex")
			-- label_assert("Replacing two times", "a robot is a robot!".replacing("robot","person")~"a person is a person!")
			-- label_assert("Consecutive replacements", "a babau is a fantasy".replacing("ba","ten")~"a tentenu is a fantasy")
		end

	echo (s: ABSTRACT_STRING) is
		do
			s.print_on(std_output)
		end
end
