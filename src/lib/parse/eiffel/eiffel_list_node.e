deferred class EIFFEL_LIST_NODE

inherit
	EIFFEL_NODE

insert
	TRAVERSABLE[EIFFEL_NODE]

feature {ANY}
	frozen new_iterator: ITERATOR[EIFFEL_NODE] is
		do
			check
				dont_use_this: False
			end
		end

feature {EIFFEL_GRAMMAR}
	add (a_child: like item) is
		deferred
		ensure
			count = old count + 1
			first = a_child -- because the grammer is right-recursive the last child is added first
		end

end -- class EIFFEL_LIST_NODE
