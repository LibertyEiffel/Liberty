class LIBERTY_AST_INDEXING

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	indexing_clause: EIFFEL_LIST_NODE is
		require
			count > 0
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	valid_index (index: INTEGER): BOOLEAN is
		do
			Result := count > 0 and then indexing_clause.valid_index(index)
		end

	count: INTEGER is
		do
			Result := count > 0 and then indexing_clause.count
		end

	lower: INTEGER is
		do
			if count > 0 then
				Result := indexing_clause.lower
			end
		end

	upper: INTEGER is
		do
			if count > 0 then
				Result := indexing_clause.upper
			else
				Result := -1
			end
		end

	name (index: INTEGER): STRING is
		require
			valid_index(index)
		local
			c: LIBERTY_AST_INDEXING_CLAUSE
		do
			c ::= indexing_clause.item(index)
			Result := c.entity_name.image
		end

	string (index: INTEGER): STRING is
		require
			valid_index(index)
		local
			c: LIBERTY_AST_INDEXING_CLAUSE
		do
			c ::= indexing_clause.item(index)
			Result := c.string.image
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Indexing"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 0, 2 >> }
		end

end
