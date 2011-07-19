class PROLOG_COMMONS
feature
	type_atom, type_integer, type_float, type_compound, type_var: INTEGER is unique
	builtins: AVL_DICTIONARY[ROUTINE[ANY,TUPLE[]],PROLOG_FUNCTOR] is
		once
			create Result
		end
	atoms: HASHED_DICTIONARY[PROLOG_ATOM,STRING] is
		once
			create Result
		end
	get_functor_by_name(name: STRING; arity: INTEGER): PROLOG_FUNCTOR is
		do
			Result := get_functor_by_atom(get_atom_by_name(name),arity)
		end
	get_functor_by_atom(atom: PROLOG_ATOM; arity: INTEGER): PROLOG_FUNCTOR is
		do
			create Result.make(atom,arity)
		end
	get_atom_by_name(name: STRING): PROLOG_FUNCTOR is
		do
			Result := atoms.reference_at(name)
			if Result = Void then
				create Result.make(name.twin)
				atoms.add(Result,Result.name)
			end
		end
end

