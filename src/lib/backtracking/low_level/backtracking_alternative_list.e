class BACKTRACKING_ALTERNATIVE_LIST
	--
	-- An alternative of a list of nodes.
	--

inherit
	ABSTRACT_BACKTRACKING_ALTERNATIVE
		rename pool as pool_of_alternative_list
		end

insert
	BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
	list: BACKTRACKING_NODE_OR_LIST
			-- Iterator on the next item of the list.

	set_list (value: BACKTRACKING_NODE_OR_LIST) is
		require
			value_not_void: value /= Void
		do
			list := value
		ensure
			definition: list = value
			list_not_void: list /= Void
		end

feature {ABSTRACT_BACKTRACKING}
	next_alternative (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'list.node' now.
			explorer.set_current_node(list.node)
			-- Iterate
			list := list.next
			if list /= Void then
				-- Alternative is still on, continue it.
				explorer.continue_alternative
			else
				-- Alternative is off, remove it.
				explorer.pop_alternative
			end
		end

end -- class BACKTRACKING_ALTERNATIVE_LIST
