class LIBERTY_CLIENTS

inherit
	LIBERTY_AST_CLIENT_VISITOR

create {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_AST_CLIENT}
	visit_liberty_ast_client (v: LIBERTY_AST_CLIENT) is
		do
			clients.add_last(universe.get_type_from_client(v))
		end

feature {}
	make (a_origin: like origin; a_clients: TRAVERSABLE[LIBERTY_AST_CLASS_NAME]; a_universe: like universe) is
		require
			a_clients /= Void
			a_universe /= Void
		local
			i: INTEGER
		do
			universe := a_universe
			create {FAST_ARRAY[LIBERTY_TYPE]}clients.with_capacity(clients.count)
			from
				i := a_clients.lower
			until
				i > a_clients.upper
			loop
				a_clients.item(i).accept(Current)
				i := i + 1
			end
		ensure
			clients.count = a_clients.count
		end

	origin: LIBERTY_TYPE
	clients: COLLECTION[LIBERTY_TYPE]
	universe: LIBERTY_UNIVERSE

end
