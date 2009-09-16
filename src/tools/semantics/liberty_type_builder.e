class LIBERTY_TYPE_BUILDER

inherit
	EIFFEL_LIST_NODE_IMPL_VISITOR
	LIBERTY_AST_CLASS_VISITOR
	LIBERTY_AST_CLASS_HEADER_VISITOR
	LIBERTY_AST_OBSOLETE_VISITOR

create {LIBERTY_TYPE}
	make

feature {LIBERTY_TYPE}
	check_and_initialize (a_type: LIBERTY_TYPE; a_universe: like universe): LIBERTY_ERROR is
		do
			type := a_type
			universe := a_universe
			a_type.ast.accept(Current)
			Result := last_error
		end

feature {EIFFEL_LIST_NODE_IMPL}
	visit_eiffel_list_node_impl (node: EIFFEL_LIST_NODE_IMPL) is
		local
			i: INTEGER
		do
			from
				i := node.lower
			until
				i > node.upper
			loop
				node.item(i).accept(Current)
				i := i + 1
			end
		end

feature {LIBERTY_AST_CLASS}
	visit_liberty_ast_class (v: LIBERTY_AST_CLASS) is
		do
			v.class_header.accept(Current)
			v.obsolete_clause.accept(Current)
			v.features.accept(Current)
			v.inherit_clause.accept(Current)
			v.insert_clause.accept(Current)
			v.creations.accept(Current)
			v.invariant_clause.accept(Current)
		end

feature {LIBERTY_AST_CLASS_HEADER}
	visit_liberty_ast_class_header (v: LIBERTY_AST_CLASS_HEADER) is
		do
			v.class_marker.accept(Current)
			v.class_name.accept(Current)
			v.type_parameters.accept(Current)
			v.indexing_clause.accept(Current)
		end

feature {LIBERTY_AST_OBSOLETE}
	visit_liberty_ast_obsolete (v: LIBERTY_AST_OBSOLETE) is
		local
			string: LIBERTY_AST_STRING
		do
			if v.count > 0 then
				string := v.string
				type.set_obsolete(decoded_string(string))
			end
		end

feature {LIBERTY_AST_FEATURE}
	visit_liberty_ast_feature (v: LIBERTY_AST_FEATURE) is
		do
			create last_clients.make(v.clients, universe)
			v.definition_list.accept(Current)
		end

feature {}
	decoded_string (image: LIBERTY_AST_STRING): STRING is
		local
			img: TYPED_EIFFEL_IMAGE[STRING]
		do
			img ::= image.image
			Result := img.decoded
		end

feature {}
	make is
		do
		end

	type: LIBERTY_TYPE
	last_error: LIBERTY_ERROR
	last_clients: LIBERTY_CLIENTS
	universe: LIBERTY_UNIVERSE

end
