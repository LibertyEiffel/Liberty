class LIBERTY_CONDITION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	expression: LIBERTY_EXPRESSION

	instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]

feature {}
	make (a_expression: like expression; a_instructions: like instructions) is
		require
			a_expression /= Void
			a_instructions /= Void
		do
			expression := a_expression
			instructions := a_instructions
		ensure
			expression = a_expression
			instructions = a_instructions
		end

invariant
	expression /= Void
	instructions /= Void

end
