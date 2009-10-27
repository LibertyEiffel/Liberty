-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CONDITIONAL

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	conditions: TRAVERSABLE[LIBERTY_CONDITION] is
		do
			Result := conditions_list
		ensure
			Result = conditions_list
		end

	else_clause: LIBERTY_DEFAULT

feature {LIBERTY_TYPE_BUILDER}
	add_condition (a_condition: LIBERTY_CONDITION) is
		do
			conditions_list.add_last(a_condition)
		ensure
			conditions.last = a_condition
		end

	set_else_clause (a_else_clause: like else_clause) is
		do
			else_clause := a_else_clause
		ensure
			else_clause = a_else_clause
		end

feature {}
	make is
		do
			create {FAST_ARRAY[LIBERTY_CONDITION]}conditions_list.with_capacity(4)
		end

	conditions_list: COLLECTION[LIBERTY_CONDITION]

invariant
	conditions_list /= Void

end
