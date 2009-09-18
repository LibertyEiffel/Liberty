class LIBERTY_FEATURE

inherit
	LIBERTY_ENTITY
		redefine
			copy
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	clients: TRAVERSABLE[LIBERTY_TYPE]
	is_frozen: BOOLEAN

	name: STRING
	result_type: LIBERTY_TYPE is
		do
			Result := definition.result_type
		end

	parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
		do
			Result := definition.parameters
		end

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

feature {ANY}
	copy (other: like Current) is
			-- deep-copies all attributes except the name and frozen status
		do
			clients := other.clients.twin
			-- TODO
		end

feature {LIBERTY_TYPE_BUILDER}
	set_frozen is
		do
			is_frozen := True
		ensure
			is_frozen
		end

	name_set: BOOLEAN is
		do
			Result := name_type /= 0
		ensure
			Result implies (is_regular or is_prefix or is_infix)
			Result implies name /= Void
		end

	set_name (a_name: like name) is
		require
			not name_set
			a_name /= Void
		do
			name_type := regular_name
			name := a_name
		ensure
			is_regular
			name = a_name
		end

	set_prefix_name (a_name: like name) is
		require
			not name_set
			a_name /= Void
		do
			name_type := prefix_name
			name := a_name
		ensure
			is_prefix
			name = a_name
		end

	set_infix_name (a_name: like name) is
		require
			not name_set
			a_name /= Void
		do
			name_type := infix_name
			name := a_name
		ensure
			is_infix
			name = a_name
		end

	set_obsolete (a_obsolete: like obsolete_message) is
		require
			obsolete_message /= Void
		do
			obsolete_message := a_obsolete
		ensure
			is_obsolete
			obsolete_message = a_obsolete
		end

	set_definition (a_definition: like definition) is
		do
			definition := a_definition
		ensure
			definition = a_definition
		end

feature {}
	make (a_clients: like clients) is
		require
			a_clients /= Void
		do
			clients := a_clients
		ensure
			clients = a_clients
		end

	regular_name: INTEGER is 1
	prefix_name: INTEGER is 2
	infix_name: INTEGER is 3

	name_type: INTEGER

	definition: LIBERTY_FEATURE_DEFINITION

invariant
	clients /= Void

end
