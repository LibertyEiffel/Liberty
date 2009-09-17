deferred class EIFFEL_TERMINAL_NODE_IMPL_VISITOR

inherit
	VISITOR

feature {EIFFEL_TERMINAL_NODE_IMPL}
	visit_eiffel_terminal_node_impl (node: EIFFEL_TERMINAL_NODE_IMPL) is
		require
			node /= Void
		deferred
		end

end
