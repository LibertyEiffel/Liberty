class BACKTRACKING_NODE_GLOBALS
	--
	-- common invariant nodes
	--

feature {ANY} -- and/or basics
	the_cut_node: BACKTRACKING_NODE_CUT is
		once
			create Result
		end

	the_true_node: BACKTRACKING_NODE_TRUE is
		once
			create Result
		end

	the_false_node: BACKTRACKING_NODE_FALSE is
		once
			create Result
		end

	the_cut_and_false_node: BACKTRACKING_NODE_CUT_AND_FALSE is
		once
			create Result
		end

end -- class BACKTRACKING_NODE_GLOBALS
