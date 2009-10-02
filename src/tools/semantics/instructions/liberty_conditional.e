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

	default: LIBERTY_DEFAULT

feature {LIBERTY_TYPE_BUILDER}
	add_condition (a_condition: LIBERTY_CONDITION) is
		do
			conditions_list.add_last(a_condition)
		ensure
			conditions.last = a_condition
		end

	set_default (a_default: like default) is
		do
			default := a_default
		ensure
			default = a_default
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
