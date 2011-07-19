expanded class PROLOG_FUNCTOR
inherit
	COMPARABLE
	HASHABLE
feature
	name: PROLOG_ATOM
	arity: INTEGER
	infix "<"(other: like Current): BOOLEAN is
		do
			Result := name < other.name
			if not result and not other.name < name then
				Result := arity < other.arity
			end
		end
	hash_code: INTEGER is
		do
			Result := (name.hash_code * arity) & 0x7FFFFFFF
		end
end

