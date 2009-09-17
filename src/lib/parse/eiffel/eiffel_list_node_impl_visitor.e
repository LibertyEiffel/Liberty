deferred class EIFFEL_LIST_NODE_IMPL_VISITOR

inherit
	VISITOR

feature {EIFFEL_LIST_NODE_IMPL}
	visit_eiffel_list_node_impl (node: EIFFEL_LIST_NODE_IMPL) is
		require
			node /= Void
		deferred
		end

end
