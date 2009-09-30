class LIBERTY_FEATURE_DEFINITION

inherit
	LIBERTY_ENTITY
		redefine
			copy
		end

creation {LIBERTY_TYPE_BUILDER}
	as_regular, as_prefix, as_infix

feature {ANY}
	name: STRING
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN

	is_regular: BOOLEAN is
		do
			Result := name_type = regular_name
		end

	is_prefix: BOOLEAN is
		do
			Result := name_type = prefix_name
		end

	is_infix: BOOLEAN is
		do
			Result := name_type = infix_name
		end

	obsolete_message: STRING

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	rename_regular (a_name: like name) is
		do
			name_type := regular_name
			name := a_name
		ensure
			is_regular
			name = a_name
		end

	rename_prefix (a_name: like name) is
		do
			name_type := prefix_name
			name := a_name
		ensure
			is_prefix
			name = a_name
		end

	rename_infix (a_name: like name) is
		do
			name_type := infix_name
			name := a_name
		ensure
			is_infix
			name = a_name
		end

	set_clients (a_clients: like clients) is
		require
			a_clients /= Void
		do
			clients := a_clients
		ensure
			clients = a_clients
		end

feature {}
	common_make (a_name: like name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			name := a_name
			clients := a_clients
			is_frozen := a_frozen
		ensure
			name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

	as_regular (a_name: like name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			name_type := regular_name
			common_make(a_name, a_clients, a_frozen)
		ensure
			is_regular
			name = a_name
			clients = a_clientd
			is_frozen = a_frozen
		end

	as_prefix (a_name: like name; a_clients: like clients; a_frozen: like is_frozen) is
		require
			a_name /= Void
			a_clients /= Void
		do
			name_type := prefix_name
			common_make(a_name, a_clients, a_frozen)
		ensure
			is_prefix
			name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

	as_infix (a_name: like name; a_clients: like clients) is
		require
			a_name /= Void
			a_clients /= Void
		do
			name_type := infix_name
			common_make(a_name, a_clients, a_frozen)
		ensure
			is_infix
			name = a_name
			clients = a_clients
			is_frozen = a_frozen
		end

	set_obsolete (a_obsolete: like obsolete_message) is
		do
			obsolete_message := a_obsolete
		ensure
			a_obsolete /= Void implies is_obsolete
			obsolete_message = a_obsolete
		end

	regular_name: INTEGER_8 is 1
	prefix_name: INTEGER_8 is 2
	infix_name: INTEGER_8 is 3

	name_type: INTEGER_8

invariant
	name /= Void
	name_type /= 0
	clients /= Void

end
