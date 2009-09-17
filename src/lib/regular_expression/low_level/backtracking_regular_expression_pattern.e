expanded class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
	--
	-- Class for backtracking (compiled) regular expressions pattern.
	--

feature {ANY}
	group_count: INTEGER
			-- The count of groups of the regular expression.

	is_valid: BOOLEAN is
			-- Is the current pattern valid?
		do
			Result := root /= Void
		end

feature {BACKTRACKING_REGULAR_EXPRESSION}
	root: BACKTRACKING_NODE
			-- The root item.

feature {BACKTRACKING_REGULAR_EXPRESSION_BUILDER}
	make (top: like root; grpcnt: INTEGER) is
			-- Initializing
		require
			top_not_void: top /= Void
		do
			root := top
			group_count := grpcnt
		ensure
			definition: root = top and group_count = grpcnt
			valid: is_valid
		end

end -- class BACKTRACKING_REGULAR_EXPRESSION_PATTERN
