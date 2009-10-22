class LIBERTY_LOOP

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	init: TRAVERSABLE[LIBERTY_INSTRUCTION]
	invariant_clause: LIBERTY_INVARIANT
	variant_clause: LIBERTY_EXPRESSION
	expression: LIBERTY_EXPRESSION
	body: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {}
	make (a_init: like init; a_invariant_clause: like invariant_clause; a_variant_clause: like variant_clause; a_expression: like expression; a_body: like body) is
		require
			a_init /= Void
			a_invariant_clause /= Void
			a_variant_clause /= Void
			a_expression /= Void
			a_body /= Void
		do
			init := a_init
			invariant_clause := a_invariant_clause
			variant_clause := a_variant_clause
			expression := a_expression
			body := a_body
		ensure
			init = a_init
			invariant_clause = a_invariant_clause
			variant_clause = a_variant_clause
			expression = a_expression
			body = a_body
		end

invariant
	init /= Void
	invariant_clause /= Void
	variant_clause /= Void
	expression /= Void
	body /= Void

end
