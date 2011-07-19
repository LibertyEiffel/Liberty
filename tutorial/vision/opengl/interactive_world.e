class INTERACTIVE_WORLD

inherit
	WORLD

creation {ANY}
	make_interactive

feature {}
	make_interactive (p: like parent; end_of_program: PROCEDURE[ANY, TUPLE]) is
		do
			make(p)
			when_left_clicked(end_of_program)
		end
	
end
