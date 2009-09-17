class BACKTRACKING_SEQUENCE_LIST
	--
	-- A sequence of a list of nodes.
	--

inherit
	ABSTRACT_BACKTRACKING_SEQUENCE
		rename pool as pool_of_sequence_list
		end

insert
	BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
	list: BACKTRACKING_NODE_AND_LIST
			-- Iterator on the next item of the list.

	set_list (value: BACKTRACKING_NODE_AND_LIST) is
		require
			value_not_void: value /= Void
		do
			list := value
		ensure
			definition: list = value
			list_not_void: list /= Void
		end

feature {ABSTRACT_BACKTRACKING}
	next_sequence (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'list.node' now.
			explorer.set_current_node(list.node)
			list := list.next
			if list = Void then
				-- Sequence is off, remove it.
				explorer.pop_sequence
			end
		end

end -- class BACKTRACKING_SEQUENCE_LIST
