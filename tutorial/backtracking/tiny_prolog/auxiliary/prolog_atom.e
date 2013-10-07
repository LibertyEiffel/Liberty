class PROLOG_ATOM
inherit
	COMPARABLE
	HASHABLE
	PROLOG_TERM
feature
	type: INTEGER is type_atom
	name: STRING
	infix "<"(other: like Current): BOOLEAN is
		do
			Result := name < other.name
		end
	hash_code: INTEGER is
		do
			Result := name.hash_code
		end
end
