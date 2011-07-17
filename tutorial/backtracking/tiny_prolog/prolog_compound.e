class PROLOG_COMPOUND
inherit PROLOG_TERM redefine arity end
feature
	type: INTEGER is type_compound
	arity is do Result := args.count end
	atom: PROLOG_ATOM
	args: FAST_ARRAY[PROLOG_TERM]
end
