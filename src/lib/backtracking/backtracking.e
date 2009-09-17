deferred class BACKTRACKING
	--
	-- This class is intended to explore structures that matches the and/or
	-- graph of BACKTRACKING_NODE. The alternatives have a context that is
	-- gotten and restored throught features 'get_context' and 'restore_context'.
	--
	-- See tutorial/backtracking for examples.
	--
	-- The instances of the BACKTRACKING childs are typically
	-- used through lines like the following ones that enumerate the
	-- solutions:
	--
	--         from
	--            set_current_node(root)
	--            search_first
	--         until
	--            is_off
	--         loop
	--            ... -- do something
	--            search_next
	--         end
	--
	-- These features are declared to be bound to ANY but dont hesitate to
	-- change the type of the context to what your context is.
	--

inherit
	ABSTRACT_BACKTRACKING

insert
	BACKTRACKING_GLOBALS

feature {ANY}
	set_current_node (node: like current_node) is
			-- Set the next node of the BACKTRACKING_NODE graph to be evaluated.
		do
			current_node := node
		ensure
			definition: current_node = node
		end

	push_and (node: BACKTRACKING_NODE) is
			-- Pushes 'node' in front of the continuation path.
		require
			node_not_void: node /= Void
		local
			sequence: BACKTRACKING_SEQUENCE
		do
			sequence := pool_of_sequence.get_instance
			sequence.set_next(node)
			push_sequence(sequence)
		end

	push_and_list (list: BACKTRACKING_NODE_AND_LIST) is
			-- Pushes 'list' in front of the continuation path.
		require
			list_not_void: list /= Void
		local
			sequence: BACKTRACKING_SEQUENCE_LIST
		do
			sequence := pool_of_sequence_list.get_instance
			sequence.set_list(list)
			push_sequence(sequence)
		end

	push_or (node: BACKTRACKING_NODE) is
			-- Pushes 'node' in front of the possible alternatives.
		require
			node_not_void: node /= Void
		local
			alternative: BACKTRACKING_ALTERNATIVE
		do
			alternative := pool_of_alternative.get_instance
			alternative.set_next(node)
			push_alternative(alternative)
		end

	push_or_list (list: BACKTRACKING_NODE_OR_LIST) is
			-- Pushes 'list' in front of the possible alternatives.
		require
			list_not_void: list /= Void
		local
			alternative: BACKTRACKING_ALTERNATIVE_LIST
		do
			alternative := pool_of_alternative_list.get_instance
			alternative.set_list(list)
			push_alternative(alternative)
		end

feature {} -- internal
	current_node: BACKTRACKING_NODE
			-- Current node of the BACKTRACKING_NODE graph to be evaluated.

	evaluate_current_state is
			-- That feature is called to evaluate the current state
		do
			current_node.explore(Current)
		end

end -- class BACKTRACKING
