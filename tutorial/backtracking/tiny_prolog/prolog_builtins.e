class PROLOG_BUILTINS
inherit PROLOG_COMMONS ABSTRACT_BACKTRACKING
creation
	make
feature
	make is 
		do
			init_builtins
		end
feature
	current_term: PROLOG_TERM
	current_compound: PROLOG_COMPOUND
	current_atom: PROLOG_ATOM
	current_functor: PROLOG_FUNCTOR
	current_proc: ROUTINE[like Current, TUPLE[]]
	current_data: LINKED_LIST[LINKED_LIST[PROLOG_TERM]]
feature
	evaluate_current_state is
		local
			atom: PROLOG_ATOM
			compound: PROLOG_COMPOUND
			functor: PROLOG_FUNCTOR
		do
			current_compound ?= current_term
			if current_compound /= Void then
				current_atom := current_compound.atom
				check current_atom /= Void end
			else
				current_atom ?= current_term
			end
			if current_atom = Void then
				-- TODO gerer les exeception de call
				partial_fail
			else
				current_functor.make(current_atom,current_term.arity)
				current_proc := builtins.reference_at(current_functor)
				if current_proc /= Void then
					current_proc.call([Current])
				else
					evaluate_from_database
				end
			end
		end
feature
	evaluate_from_database is
		do
			current_data := database.reference_at(current_functor)
			if current_data = Void then
				partial_fail
			else
				
			end
		end
feature {}
	init_builtins is
		do
			if builtins.is_empty then really_init_builtins end
		end
	really_init_builtins is
		do
			add_bi(once "fail",      0, agent {like Current}.bi_fail)
			add_bi(once "true",      0, agent {like Current}.bi_true)
			add_bi(once "atom",      1, agent {like Current}.bi_atom)
			add_bi(once "integer",   1, agent {like Current}.bi_integer)
			add_bi(once "float",     1, agent {like Current}.bi_float)
			add_bi(once "number",    1, agent {like Current}.bi_number)
			add_bi(once "atomic",    1, agent {like Current}.bi_atomic)
			add_bi(once "compound",  1, agent {like Current}.bi_compound)
			add_bi(once "callable",  1, agent {like Current}.bi_callable)
			add_bi(once "var",       1, agent {like Current}.bi_var)
			add_bi(once "nonvar",    1, agent {like Current}.bi_nonvar)
			add_bi(once "=",         2, agent {like Current}.bi_unify)
			add_bi(once "\=",        2, agent {like Current}.bi_not_unify)
		end
	add_bi(name: STRING; arity: INTEGER; proc: like current_proc) is
		local
			functor: PROLOG_FUNCTOR
		do
			builtins.add(proc,get_functor_by_name(name,arity))
		end
feature {}
	partial_switch(success: BOOLEAN) is
		do
			if success then
				partial_success
			else
				partial_fail
			end
		end
feature {}
	bi_fail is
		do
			partial_fail
		end
	bi_true is
		do
			partial_success
		end
feature {} -- type testing
	bi_atom is
		do
			inspect current_compound.args.first.type
			when type_atom then partial_success
			else partial_fail
			end
		end
	bi_integer is
		do
			inspect current_compound.args.first.type
			when type_integer then partial_success
			else partial_fail
			end
		end
	bi_float is
		do
			inspect current_compound.args.first.type
			when type_float then partial_success
			else partial_fail
			end
		end
	bi_number is
		do
			inspect current_compound.args.first.type
			when type_integer, type_float then partial_success
			else partial_fail
			end
		end
	bi_atomic is
		do
			inspect current_compound.args.first.type
			when type_atom, type_integer, type_float then partial_success
			else partial_fail
			end
		end
	bi_compound is
		do
			inspect current_compound.args.first.type
			when type_compound then partial_success
			else partial_fail
			end
		end
	bi_callable is
		do
			inspect current_compound.args.first.type
			when type_atom, type_compound then partial_success
			else partial_fail
			end
		end
	bi_var is
		do
			inspect current_compound.args.first.type
			when type_var then partial_success
			else partial_fail
			end
		end
	bi_nonvar is
		do
			inspect current_compound.args.first.type
			when type_var then partial_fail
			else partial_success
			end
		end
feature {} -- unification
	bi_unify is
		do
			if unify(current_compound.args.item(0),current_compound.args.item(1)) then
				partial_success
			else
				partial_fail
			end
		end
	bi_not_unify is
		do
			if unify(current_compound.args.item(0),current_compound.args.item(1)) then
				partial_fail
			else
				partial_success
			end
		end


	bi_functor is
		do
		end
	bi_call is
		do
		end
end

