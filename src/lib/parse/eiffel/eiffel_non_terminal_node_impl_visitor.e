deferred class EIFFEL_NON_TERMINAL_NODE_IMPL_VISITOR

inherit
	VISITOR

feature {EIFFEL_NON_TERMINAL_NODE_IMPL}
	visit_eiffel_non_terminal_node_impl (node: EIFFEL_NON_TERMINAL_NODE_IMPL) is
		require
			node /= Void
		deferred
		end

end
